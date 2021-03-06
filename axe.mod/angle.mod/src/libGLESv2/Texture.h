//
// Copyright (c) 2002-2013 The ANGLE Project Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

// Texture.h: Defines the abstract gl::Texture class and its concrete derived
// classes Texture2D and TextureCubeMap. Implements GL texture objects and
// related functionality. [OpenGL ES 2.0.24] section 3.7 page 63.

#ifndef LIBGLESV2_TEXTURE_H_
#define LIBGLESV2_TEXTURE_H_

#include "common/debug.h"
#include "common/RefCountObject.h"
#include "libGLESv2/angletypes.h"
#include "libGLESv2/constants.h"
#include "libGLESv2/renderer/TextureImpl.h"
#include "libGLESv2/Caps.h"

#include "angle_gl.h"

#include <vector>

namespace egl
{
class Surface;
}

namespace rx
{
class TextureStorageInterface;
class RenderTarget;
class Image;
}

namespace gl
{
class Framebuffer;
class FramebufferAttachment;
struct ImageIndex;

bool IsMipmapFiltered(const gl::SamplerState &samplerState);

class Texture : public RefCountObject
{
  public:
    Texture(rx::TextureImpl *impl, GLuint id, GLenum target);

    virtual ~Texture();

    GLenum getTarget() const;

    const SamplerState &getSamplerState() const { return mSamplerState; }
    SamplerState &getSamplerState() { return mSamplerState; }
    void getSamplerStateWithNativeOffset(SamplerState *sampler);

    void setUsage(GLenum usage);
    GLenum getUsage() const;

    GLint getBaseLevelWidth() const;
    GLint getBaseLevelHeight() const;
    GLint getBaseLevelDepth() const;
    GLenum getBaseLevelInternalFormat() const;

    GLsizei getWidth(const ImageIndex &index) const;
    GLsizei getHeight(const ImageIndex &index) const;
    GLenum getInternalFormat(const ImageIndex &index) const;
    GLenum getActualFormat(const ImageIndex &index) const;

    virtual bool isSamplerComplete(const SamplerState &samplerState, const TextureCapsMap &textureCaps, const Extensions &extensions, int clientVersion) const = 0;

    rx::TextureStorageInterface *getNativeTexture();

    virtual void generateMipmaps();
    virtual void copySubImage(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height, Framebuffer *source);

    unsigned int getTextureSerial();

    bool isImmutable() const;
    int immutableLevelCount();

    rx::TextureImpl *getImplementation() { return mTexture; }
    const rx::TextureImpl *getImplementation() const { return mTexture; }

    static const GLuint INCOMPLETE_TEXTURE_ID = static_cast<GLuint>(-1);   // Every texture takes an id at creation time. The value is arbitrary because it is never registered with the resource manager.

  protected:
    int mipLevels() const;

    rx::TextureImpl *mTexture;

    SamplerState mSamplerState;
    GLenum mUsage;

    bool mImmutable;

    GLenum mTarget;

    const rx::Image *getBaseLevelImage() const;

    // TODO: move these to TextureD3D
    friend class TextureAttachment;
    rx::RenderTarget *getRenderTarget(const ImageIndex &index);
    unsigned int getRenderTargetSerial(const ImageIndex &index);

  private:
    DISALLOW_COPY_AND_ASSIGN(Texture);
};

class Texture2D : public Texture
{
  public:
    Texture2D(rx::TextureImpl *impl, GLuint id);

    virtual ~Texture2D();

    GLsizei getWidth(GLint level) const;
    GLsizei getHeight(GLint level) const;
    GLenum getInternalFormat(GLint level) const;
    GLenum getActualFormat(GLint level) const;
    bool isCompressed(GLint level) const;
    bool isDepth(GLint level) const;

    void setImage(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setCompressedImage(GLint level, GLenum format, GLsizei width, GLsizei height, GLsizei imageSize, const void *pixels);
    void subImage(GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void subImageCompressed(GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *pixels);
    void copyImage(GLint level, GLenum format, GLint x, GLint y, GLsizei width, GLsizei height, Framebuffer *source);
    void storage(GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);

    virtual bool isSamplerComplete(const SamplerState &samplerState, const TextureCapsMap &textureCaps, const Extensions &extensions, int clientVersion) const;
    virtual void bindTexImage(egl::Surface *surface);
    virtual void releaseTexImage();

    virtual void generateMipmaps();

  private:
    DISALLOW_COPY_AND_ASSIGN(Texture2D);

    bool isMipmapComplete() const;
    bool isLevelComplete(int level) const;

    egl::Surface *mSurface;
};

class TextureCubeMap : public Texture
{
  public:
    TextureCubeMap(rx::TextureImpl *impl, GLuint id);

    virtual ~TextureCubeMap();

    GLsizei getWidth(GLenum target, GLint level) const;
    GLsizei getHeight(GLenum target, GLint level) const;
    GLenum getInternalFormat(GLenum target, GLint level) const;
    GLenum getActualFormat(GLenum target, GLint level) const;
    bool isCompressed(GLenum target, GLint level) const;
    bool isDepth(GLenum target, GLint level) const;

    void setImagePosX(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setImageNegX(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setImagePosY(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setImageNegY(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setImagePosZ(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setImageNegZ(GLint level, GLsizei width, GLsizei height, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);

    void setCompressedImage(GLenum target, GLint level, GLenum format, GLsizei width, GLsizei height, GLsizei imageSize, const void *pixels);

    void subImage(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void subImageCompressed(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *pixels);
    void copyImage(GLenum target, GLint level, GLenum format, GLint x, GLint y, GLsizei width, GLsizei height, Framebuffer *source);
    void storage(GLsizei levels, GLenum internalformat, GLsizei size);

    virtual bool isSamplerComplete(const SamplerState &samplerState, const TextureCapsMap &textureCaps, const Extensions &extensions, int clientVersion) const;

    bool isCubeComplete() const;

    static int targetToLayerIndex(GLenum target);
    static GLenum layerIndexToTarget(GLint layer);

  private:
    DISALLOW_COPY_AND_ASSIGN(TextureCubeMap);

    bool isMipmapComplete() const;
    bool isFaceLevelComplete(int faceIndex, int level) const;
};

class Texture3D : public Texture
{
  public:
    Texture3D(rx::TextureImpl *impl, GLuint id);

    virtual ~Texture3D();

    GLsizei getWidth(GLint level) const;
    GLsizei getHeight(GLint level) const;
    GLsizei getDepth(GLint level) const;
    GLenum getInternalFormat(GLint level) const;
    GLenum getActualFormat(GLint level) const;
    bool isCompressed(GLint level) const;
    bool isDepth(GLint level) const;

    void setImage(GLint level, GLsizei width, GLsizei height, GLsizei depth, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setCompressedImage(GLint level, GLenum format, GLsizei width, GLsizei height, GLsizei depth, GLsizei imageSize, const void *pixels);
    void subImage(GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void subImageCompressed(GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *pixels);
    void storage(GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);

    virtual bool isSamplerComplete(const SamplerState &samplerState, const TextureCapsMap &textureCaps, const Extensions &extensions, int clientVersion) const;

  private:
    DISALLOW_COPY_AND_ASSIGN(Texture3D);

    bool isMipmapComplete() const;
    bool isLevelComplete(int level) const;
};

class Texture2DArray : public Texture
{
  public:
    Texture2DArray(rx::TextureImpl *impl, GLuint id);

    virtual ~Texture2DArray();

    GLsizei getWidth(GLint level) const;
    GLsizei getHeight(GLint level) const;
    GLsizei getLayers(GLint level) const;
    GLenum getInternalFormat(GLint level) const;
    GLenum getActualFormat(GLint level) const;
    bool isCompressed(GLint level) const;
    bool isDepth(GLint level) const;

    void setImage(GLint level, GLsizei width, GLsizei height, GLsizei depth, GLenum internalFormat, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void setCompressedImage(GLint level, GLenum format, GLsizei width, GLsizei height, GLsizei depth, GLsizei imageSize, const void *pixels);
    void subImage(GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const PixelUnpackState &unpack, const void *pixels);
    void subImageCompressed(GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *pixels);
    void storage(GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);

    virtual bool isSamplerComplete(const SamplerState &samplerState, const TextureCapsMap &textureCaps, const Extensions &extensions, int clientVersion) const;

  private:
    DISALLOW_COPY_AND_ASSIGN(Texture2DArray);

    bool isMipmapComplete() const;
    bool isLevelComplete(int level) const;
};

struct ImageIndex
{
    GLenum type;
    GLint mipIndex;
    GLint layerIndex;

    ImageIndex(const ImageIndex &other)
        : type(other.type),
          mipIndex(other.mipIndex),
          layerIndex(other.layerIndex)
    {}

    ImageIndex &operator=(const ImageIndex &other)
    {
        type = other.type;
        mipIndex = other.mipIndex;
        layerIndex = other.layerIndex;
        return *this;
    }

    static ImageIndex Make2D(GLint mipIndex)
    {
        return ImageIndex(GL_TEXTURE_2D, mipIndex, 0);
    }

    static ImageIndex MakeCube(GLenum target, GLint mipIndex)
    {
        return ImageIndex(target, mipIndex, TextureCubeMap::targetToLayerIndex(target));
    }

    static ImageIndex Make2DArray(GLint mipIndex, GLint layerIndex)
    {
        return ImageIndex(GL_TEXTURE_2D_ARRAY, mipIndex, layerIndex);
    }

    static ImageIndex Make3D(GLint mipIndex, GLint layerIndex = 0)
    {
        return ImageIndex(GL_TEXTURE_3D, mipIndex, layerIndex);
    }

  private:
      ImageIndex(GLenum typeIn, GLint mipIndexIn, GLint layerIndexIn)
        : type(typeIn),
          mipIndex(mipIndexIn),
          layerIndex(layerIndexIn)
    {}
};

}

#endif   // LIBGLESV2_TEXTURE_H_
