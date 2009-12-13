
Strict

ModuleInfo "CC_OPTS: -fexceptions" 
ModuleInfo "CC_OPTS: -DOT_LIBRARY_STATIC"
ModuleInfo "CC_OPTS: -DOSG_LIBRARY_STATIC"
?Win32
ModuleInfo "CC_OPTS: -D_GLIBCXX_USE_WCHAR_T"
?

Import "include/*.h"
Import "../../pub.mod/freetype.mod/include/*.h"
Import "../../axe.mod/jasper.mod/*.h"
'Import "../../pub.mod/libjpeg.mod/*.h"
Import "../../pub.mod/libpng.mod/*.h"
Import "../../pub.mod/zlib.mod/*.h"

' OpenThreads

Import "src/OpenThreads/common/Atomic.cpp"
Import "src/OpenThreads/common/Version.cpp"
?win32
Import "src/OpenThreads/win32/WIN32Condition.cpp"
Import "src/OpenThreads/win32/Win32Mutex.cpp"
Import "src/OpenThreads/win32/Win32Thread.cpp"
Import "src/OpenThreads/win32/Win32ThreadBarrier.cpp"
?
?Linux
Import "src/OpenThreads/pthreads/PThread.cpp"
Import "src/OpenThreads/pthreads/PThreadBarrier.cpp"
Import "src/OpenThreads/pthreads/PThreadCondition.cpp"
Import "src/OpenThreads/pthreads/PThreadMutex.cpp"
?

' OpenSourceGraph

Import "src/osg/Array.cpp"
Import "src/osg/AlphaFunc.cpp"
Import "src/osg/AnimationPath.cpp"
Import "src/osg/ApplicationUsage.cpp"
Import "src/osg/ArgumentParser.cpp"
Import "src/osg/AutoTransform.cpp"
Import "src/osg/Billboard.cpp"
Import "src/osg/BlendColor.cpp"
Import "src/osg/BlendEquation.cpp"
Import "src/osg/BlendFunc.cpp"
Import "src/osg/BufferObject.cpp"
Import "src/osg/Camera.cpp"
Import "src/osg/CameraView.cpp"
Import "src/osg/ClampColor.cpp"
Import "src/osg/ClearNode.cpp"
Import "src/osg/ClipNode.cpp"
Import "src/osg/ClipPlane.cpp"
Import "src/osg/ClusterCullingCallback.cpp"
Import "src/osg/CollectOccludersVisitor.cpp"
Import "src/osg/ColorMask.cpp"
Import "src/osg/ColorMatrix.cpp"
Import "src/osg/ComputeBoundsVisitor.cpp"
Import "src/osg/ConvexPlanarOccluder.cpp"
Import "src/osg/ConvexPlanarPolygon.cpp"
Import "src/osg/CoordinateSystemNode.cpp"
Import "src/osg/CopyOp.cpp"
Import "src/osg/CullFace.cpp"
Import "src/osg/CullingSet.cpp"
Import "src/osg/CullSettings.cpp"
Import "src/osg/CullStack.cpp"
Import "src/osg/DeleteHandler.cpp"
Import "src/osg/Depth.cpp"
Import "src/osg/DisplaySettings.cpp"
Import "src/osg/Drawable.cpp"
Import "src/osg/DrawPixels.cpp"
Import "src/osg/dxtctool.cpp"
Import "src/osg/Fog.cpp"
Import "src/osg/FragmentProgram.cpp"
Import "src/osg/FrameBufferObject.cpp"
Import "src/osg/FrameStamp.cpp"
Import "src/osg/FrontFace.cpp"
Import "src/osg/Geode.cpp"
Import "src/osg/Geometry.cpp"
Import "src/osg/GL2Extensions.cpp"
Import "src/osg/GLExtensions.cpp"
Import "src/osg/GLObjects.cpp"
Import "src/osg/GraphicsContext.cpp"
Import "src/osg/GraphicsThread.cpp"
Import "src/osg/Group.cpp"
Import "src/osg/Hint.cpp"
Import "src/osg/Image.cpp"
Import "src/osg/ImageSequence.cpp"
Import "src/osg/ImageStream.cpp"
Import "src/osg/ImageUtils.cpp"
Import "src/osg/KdTree.cpp"
Import "src/osg/Light.cpp"
Import "src/osg/LightModel.cpp"
Import "src/osg/LightSource.cpp"
Import "src/osg/LineSegment.cpp"
Import "src/osg/LineStipple.cpp"
Import "src/osg/LineWidth.cpp"
Import "src/osg/LOD.cpp"
Import "src/osg/LogicOp.cpp"
Import "src/osg/Material.cpp"
Import "src/osg/Math.cpp"
Import "src/osg/Matrixd.cpp"
Import "src/osg/MatrixDecomposition.cpp"
Import "src/osg/Matrixf.cpp"
'# We don't build this one
'# Import "Matrix_implementation.cpp"
Import "src/osg/MatrixTransform.cpp"
Import "src/osg/Multisample.cpp"
Import "src/osg/NodeCallback.cpp"
Import "src/osg/Node.cpp"
Import "src/osg/NodeTrackerCallback.cpp"
Import "src/osg/NodeVisitor.cpp"
Import "src/osg/Notify.cpp"
Import "src/osg/Object.cpp"
Import "src/osg/OccluderNode.cpp"
Import "src/osg/OcclusionQueryNode.cpp"
Import "src/osg/OperationThread.cpp"
Import "src/osg/PagedLOD.cpp"
Import "src/osg/Point.cpp"
Import "src/osg/PointSprite.cpp"
Import "src/osg/PolygonMode.cpp"
Import "src/osg/PolygonOffset.cpp"
Import "src/osg/PolygonStipple.cpp"
Import "src/osg/PositionAttitudeTransform.cpp"
Import "src/osg/PrimitiveSet.cpp"
Import "src/osg/Program.cpp"
Import "src/osg/Projection.cpp"
Import "src/osg/ProxyNode.cpp"
Import "src/osg/Quat.cpp"
Import "src/osg/Referenced.cpp"
Import "src/osg/Scissor.cpp"
Import "src/osg/Sequence.cpp"
Import "src/osg/ShadeModel.cpp"
Import "src/osg/Shader.cpp"
Import "src/osg/ShadowVolumeOccluder.cpp"
Import "src/osg/Shape.cpp"
Import "src/osg/ShapeDrawable.cpp"
Import "src/osg/StateAttribute.cpp"
Import "src/osg/State.cpp"
Import "src/osg/StateSet.cpp"
Import "src/osg/Stats.cpp"
Import "src/osg/Stencil.cpp"
Import "src/osg/StencilTwoSided.cpp"
Import "src/osg/Switch.cpp"
Import "src/osg/TexEnvCombine.cpp"
Import "src/osg/TexEnv.cpp"
Import "src/osg/TexEnvFilter.cpp"
Import "src/osg/TexGen.cpp"
Import "src/osg/TexGenNode.cpp"
Import "src/osg/TexMat.cpp"
Import "src/osg/Texture1D.cpp"
Import "src/osg/Texture2DArray.cpp"
Import "src/osg/Texture2D.cpp"
Import "src/osg/Texture3D.cpp"
Import "src/osg/Texture.cpp"
Import "src/osg/TextureCubeMap.cpp"
Import "src/osg/TextureRectangle.cpp"
Import "src/osg/Timer.cpp"
Import "src/osg/TransferFunction.cpp"
Import "src/osg/Transform.cpp"
Import "src/osg/Uniform.cpp"
Import "src/osg/Version.cpp"
Import "src/osg/VertexProgram.cpp"
Import "src/osg/View.cpp"
Import "src/osg/Viewport.cpp"

Import "src/osgAnimation/Animation.cpp"
Import "src/osgAnimation/AnimationManager.cpp"
Import "src/osgAnimation/AnimationManagerBase.cpp"
Import "src/osgAnimation/BasicAnimationManager.cpp"
Import "src/osgAnimation/Bone.cpp"
Import "src/osgAnimation/Channel.cpp"
Import "src/osgAnimation/RigGeometry.cpp"
Import "src/osgAnimation/Skeleton.cpp"
Import "src/osgAnimation/Target.cpp"
Import "src/osgAnimation/Timeline.cpp"
Import "src/osgAnimation/TimelineAnimationManager.cpp"
Import "src/osgAnimation/UpdateCallback.cpp"
Import "src/osgAnimation/VertexInfluence.cpp"

Import "src/osgDB/Archive.cpp"
Import "src/osgDB/AuthenticationMap.cpp"
Import "src/osgDB/ConvertUTF.cpp"
Import "src/osgDB/DatabasePager.cpp"
Import "src/osgDB/DotOsgWrapper.cpp"
Import "src/osgDB/DynamicLibrary.cpp"
Import "src/osgDB/Field.cpp"
Import "src/osgDB/FieldReader.cpp"
Import "src/osgDB/FieldReaderIterator.cpp"
Import "src/osgDB/FileCache.cpp"
Import "src/osgDB/FileNameUtils.cpp"
Import "src/osgDB/FileUtils.cpp"
Import "src/osgDB/fstream.cpp"
Import "src/osgDB/ImageOptions.cpp"
Import "src/osgDB/ImagePager.cpp"
Import "src/osgDB/Input.cpp"
Import "src/osgDB/Output.cpp"
Import "src/osgDB/PluginQuery.cpp"
Import "src/osgDB/ReaderWriter.cpp"
Import "src/osgDB/ReadFile.cpp"
Import "src/osgDB/Registry.cpp"
Import "src/osgDB/SharedStateManager.cpp"
Import "src/osgDB/Version.cpp"
Import "src/osgDB/WriteFile.cpp"

Import "src/osgFX/AnisotropicLighting.cpp"
Import "src/osgFX/BumpMapping.cpp"
Import "src/osgFX/Cartoon.cpp"
Import "src/osgFX/Effect.cpp"
Import "src/osgFX/MultiTextureControl.cpp"
Import "src/osgFX/Registry.cpp"
Import "src/osgFX/Scribe.cpp"
Import "src/osgFX/SpecularHighlights.cpp"
Import "src/osgFX/Technique.cpp"
Import "src/osgFX/Validator.cpp"
Import "src/osgFX/Version.cpp"

Import "src/osgGA/AnimationPathManipulator.cpp"
Import "src/osgGA/CameraViewSwitchManipulator.cpp"
Import "src/osgGA/DriveManipulator.cpp"
Import "src/osgGA/EventQueue.cpp"
Import "src/osgGA/EventVisitor.cpp"
Import "src/osgGA/FlightManipulator.cpp"
Import "src/osgGA/GUIEventAdapter.cpp"
Import "src/osgGA/GUIEventHandler.cpp"
Import "src/osgGA/KeySwitchMatrixManipulator.cpp"
Import "src/osgGA/MatrixManipulator.cpp"
Import "src/osgGA/NodeTrackerManipulator.cpp"
Import "src/osgGA/StateSetManipulator.cpp"
Import "src/osgGA/TerrainManipulator.cpp"
Import "src/osgGA/TrackballManipulator.cpp"
Import "src/osgGA/UFOManipulator.cpp"
Import "src/osgGA/Version.cpp"

Import "src/osgIntrospection/ConstructorInfo.cpp"
Import "src/osgIntrospection/CustomAttributeProvider.cpp"
Import "src/osgIntrospection/DefaultReflectors.cpp"
Import "src/osgIntrospection/MethodInfo.cpp"
Import "src/osgIntrospection/PropertyInfo.cpp"
Import "src/osgIntrospection/Reflection.cpp"
Import "src/osgIntrospection/Reflector.cpp"
Import "src/osgIntrospection/Type.cpp"
Import "src/osgIntrospection/Utility.cpp"
Import "src/osgIntrospection/Value.cpp"
Import "src/osgIntrospection/Version.cpp"

Import "src/osgManipulator/AntiSquish.cpp"
Import "src/osgManipulator/Command.cpp"
Import "src/osgManipulator/CommandManager.cpp"
Import "src/osgManipulator/Constraint.cpp"
Import "src/osgManipulator/Dragger.cpp"
Import "src/osgManipulator/Projector.cpp"
Import "src/osgManipulator/RotateCylinderDragger.cpp"
Import "src/osgManipulator/RotateSphereDragger.cpp"
Import "src/osgManipulator/Scale1DDragger.cpp"
Import "src/osgManipulator/Scale2DDragger.cpp"
Import "src/osgManipulator/ScaleAxisDragger.cpp"
Import "src/osgManipulator/Selection.cpp"
Import "src/osgManipulator/TabBoxDragger.cpp"
Import "src/osgManipulator/TabPlaneDragger.cpp"
Import "src/osgManipulator/TabPlaneTrackballDragger.cpp"
Import "src/osgManipulator/TrackballDragger.cpp"
Import "src/osgManipulator/Translate1DDragger.cpp"
Import "src/osgManipulator/Translate2DDragger.cpp"
Import "src/osgManipulator/TranslateAxisDragger.cpp"
Import "src/osgManipulator/TranslatePlaneDragger.cpp"
Import "src/osgManipulator/Version.cpp"

Import "src/osgParticle/ConnectedParticleSystem.cpp"
Import "src/osgParticle/Emitter.cpp"
Import "src/osgParticle/ExplosionDebrisEffect.cpp"
Import "src/osgParticle/ExplosionEffect.cpp"
Import "src/osgParticle/FireEffect.cpp"
Import "src/osgParticle/FluidFrictionOperator.cpp"
Import "src/osgParticle/FluidProgram.cpp"
Import "src/osgParticle/ModularEmitter.cpp"
Import "src/osgParticle/ModularProgram.cpp"
Import "src/osgParticle/MultiSegmentPlacer.cpp"
Import "src/osgParticle/Particle.cpp"
Import "src/osgParticle/ParticleEffect.cpp"
Import "src/osgParticle/ParticleProcessor.cpp"
Import "src/osgParticle/ParticleSystem.cpp"
Import "src/osgParticle/ParticleSystemUpdater.cpp"
Import "src/osgParticle/PrecipitationEffect.cpp"
Import "src/osgParticle/Program.cpp"
Import "src/osgParticle/SmokeEffect.cpp"
Import "src/osgParticle/SmokeTrailEffect.cpp"
Import "src/osgParticle/Version.cpp"

Import "src/osgShadow/ConvexPolyhedron.cpp"
Import "src/osgShadow/DebugShadowMap.cpp"
Import "src/osgShadow/LightSpacePerspectiveShadowMap.cpp"
Import "src/osgShadow/MinimalCullBoundsShadowMap.cpp"
Import "src/osgShadow/MinimalDrawBoundsShadowMap.cpp"
Import "src/osgShadow/MinimalShadowMap.cpp"
Import "src/osgShadow/OccluderGeometry.cpp"
Import "src/osgShadow/ParallelSplitShadowMap.cpp"
Import "src/osgShadow/ShadowedScene.cpp"
Import "src/osgShadow/ShadowMap.cpp"
Import "src/osgShadow/ShadowTechnique.cpp"
Import "src/osgShadow/ShadowTexture.cpp"
Import "src/osgShadow/ShadowVolume.cpp"
Import "src/osgShadow/SoftShadowMap.cpp"
Import "src/osgShadow/StandardShadowMap.cpp"
Import "src/osgShadow/Version.cpp"
Import "src/osgShadow/ViewDependentShadowTechnique.cpp"

Import "src/osgSim/BlinkSequence.cpp"
Import "src/osgSim/ColorRange.cpp"
Import "src/osgSim/DOFTransform.cpp"
Import "src/osgSim/ElevationSlice.cpp"
Import "src/osgSim/HeightAboveTerrain.cpp"
Import "src/osgSim/Impostor.cpp"
Import "src/osgSim/ImpostorSprite.cpp"
Import "src/osgSim/InsertImpostorsVisitor.cpp"
Import "src/osgSim/LightPoint.cpp"
Import "src/osgSim/LightPointDrawable.cpp"
Import "src/osgSim/LightPointNode.cpp"
Import "src/osgSim/LightPointSpriteDrawable.cpp"
Import "src/osgSim/LineOfSight.cpp"
Import "src/osgSim/MultiSwitch.cpp"
Import "src/osgSim/OverlayNode.cpp"
Import "src/osgSim/ScalarBar.cpp"
Import "src/osgSim/ScalarsToColors.cpp"
Import "src/osgSim/Sector.cpp"
Import "src/osgSim/ShapeAttribute.cpp"
Import "src/osgSim/SphereSegment.cpp"
Import "src/osgSim/Version.cpp"
Import "src/osgSim/VisibilityGroup.cpp"

Import "src/osgTerrain/GeometryTechnique.cpp"
Import "src/osgTerrain/Layer.cpp"
Import "src/osgTerrain/Locator.cpp"
Import "src/osgTerrain/Terrain.cpp"
Import "src/osgTerrain/TerrainTechnique.cpp"
Import "src/osgTerrain/TerrainTile.cpp"
Import "src/osgTerrain/Version.cpp"

Import "src/osgText/DefaultFont.cpp"
Import "src/osgText/FadeText.cpp"
Import "src/osgText/Font.cpp"
Import "src/osgText/Font3D.cpp"
Import "src/osgText/String.cpp"
Import "src/osgText/Text.cpp"
Import "src/osgText/Text3D.cpp"
Import "src/osgText/TextBase.cpp"
Import "src/osgText/Version.cpp"

Import "src/osgUtil/CubeMapGenerator.cpp"
Import "src/osgUtil/CullVisitor.cpp"
Import "src/osgUtil/DelaunayTriangulator.cpp"
Import "src/osgUtil/DisplayRequirementsVisitor.cpp"
Import "src/osgUtil/DrawElementTypeSimplifier.cpp"
Import "src/osgUtil/EdgeCollector.cpp"
Import "src/osgUtil/GLObjectsVisitor.cpp"
Import "src/osgUtil/HalfWayMapGenerator.cpp"
Import "src/osgUtil/HighlightMapGenerator.cpp"
Import "src/osgUtil/IntersectionVisitor.cpp"
Import "src/osgUtil/IntersectVisitor.cpp"
Import "src/osgUtil/LineSegmentIntersector.cpp"
Import "src/osgUtil/Optimizer.cpp"
Import "src/osgUtil/PlaneIntersector.cpp"
Import "src/osgUtil/PolytopeIntersector.cpp"
Import "src/osgUtil/PositionalStateContainer.cpp"
Import "src/osgUtil/RenderBin.cpp"
Import "src/osgUtil/RenderLeaf.cpp"
Import "src/osgUtil/RenderStage.cpp"
Import "src/osgUtil/ReversePrimitiveFunctor.cpp"
Import "src/osgUtil/SceneView.cpp"
Import "src/osgUtil/Simplifier.cpp"
Import "src/osgUtil/SmoothingVisitor.cpp"
Import "src/osgUtil/SceneGraphBuilder.cpp"
Import "src/osgUtil/StateGraph.cpp"
Import "src/osgUtil/Statistics.cpp"
Import "src/osgUtil/TangentSpaceGenerator.cpp"
Import "src/osgUtil/Tessellator.cpp"
Import "src/osgUtil/TransformAttributeFunctor.cpp"
Import "src/osgUtil/TransformCallback.cpp"
Import "src/osgUtil/TriStrip_tri_stripper.cpp"
Import "src/osgUtil/TriStripVisitor.cpp"
Import "src/osgUtil/UpdateVisitor.cpp"
Import "src/osgUtil/Version.cpp"

Import "src/osgViewer/CompositeViewer.cpp"
?Linux
Import "src/osgViewer/GraphicsWindowX11.cpp"
Import "src/osgViewer/PixelBufferX11.cpp"
?
?Win32
Import "src/osgViewer/GraphicsWindowWin32.cpp"
Import "src/osgViewer/PixelBufferWin32.cpp"
?
Import "src/osgViewer/HelpHandler.cpp"
Import "src/osgViewer/Renderer.cpp"
Import "src/osgViewer/Scene.cpp"
Import "src/osgViewer/ScreenCaptureHandler.cpp"
Import "src/osgViewer/StatsHandler.cpp"
Import "src/osgViewer/Version.cpp"
Import "src/osgViewer/View.cpp"
Import "src/osgViewer/Viewer.cpp"
Import "src/osgViewer/ViewerBase.cpp"
Import "src/osgViewer/ViewerEventHandlers.cpp"

Import "src/osgVolume/FixedFunctionTechnique.cpp"
Import "src/osgVolume/Layer.cpp"
Import "src/osgVolume/Locator.cpp"
Import "src/osgVolume/Property.cpp"
Import "src/osgVolume/RayTracedTechnique.cpp"
Import "src/osgVolume/Version.cpp"
Import "src/osgVolume/Volume.cpp"
Import "src/osgVolume/VolumeTechnique.cpp"
Import "src/osgVolume/VolumeTile.cpp"
Import "src/osgVolume/Shaders/volume_frag.cpp"
Import "src/osgVolume/Shaders/volume_iso_frag.cpp"
Import "src/osgVolume/Shaders/volume_lit_frag.cpp"
Import "src/osgVolume/Shaders/volume_lit_tf_frag.cpp"
Import "src/osgVolume/Shaders/volume_mip_frag.cpp"
Import "src/osgVolume/Shaders/volume_tf_frag.cpp"
Import "src/osgVolume/Shaders/volume_tf_iso_frag.cpp"
Import "src/osgVolume/Shaders/volume_tf_mip_frag.cpp"
Import "src/osgVolume/Shaders/volume_vert.cpp"

Import "src/osgWidget/Box.cpp"
Import "src/osgWidget/Browser.cpp"
Import "src/osgWidget/Canvas.cpp"
Import "src/osgWidget/Frame.cpp"
Import "src/osgWidget/Input.cpp"
Import "src/osgWidget/Label.cpp"
Import "src/osgWidget/Lua.cpp"
Import "src/osgWidget/PdfReader.cpp"
Import "src/osgWidget/Python.cpp"
Import "src/osgWidget/StyleManager.cpp"
Import "src/osgWidget/Table.cpp"
Import "src/osgWidget/Util.cpp"
Import "src/osgWidget/Version.cpp"
Import "src/osgWidget/ViewerEventHandlers.cpp"
Import "src/osgWidget/VncClient.cpp"
Import "src/osgWidget/Widget.cpp"
Import "src/osgWidget/Window.cpp"
Import "src/osgWidget/WindowManager.cpp"

