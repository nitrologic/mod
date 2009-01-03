
Strict

Rem
bbdoc: Open Dynamics Engine
end rem
Module Max3D.ODE

ModuleInfo "Version: 1.01"
ModuleInfo "Author: Russell Smith, Pierre Terdiman"
ModuleInfo "License: BSD/LGPL License"
ModuleInfo "Credit: Adapted for BlitzMax by Mark Sibly"

Import "opende/include/*.h"
Import "opende/OPCODE/*.h"

Import "opende/ode/src/array.cpp"
Import "opende/ode/src/box.cpp"
Import "opende/ode/src/capsule.cpp"
Import "opende/ode/src/collision_cylinder_box.cpp"
Import "opende/ode/src/collision_cylinder_plane.cpp"
Import "opende/ode/src/collision_cylinder_sphere.cpp"
Import "opende/ode/src/collision_cylinder_trimesh.cpp"
Import "opende/ode/src/collision_kernel.cpp"
Import "opende/ode/src/collision_quadtreespace.cpp"
Import "opende/ode/src/collision_space.cpp"
Import "opende/ode/src/collision_transform.cpp"
Import "opende/ode/src/collision_trimesh_box.cpp"
Import "opende/ode/src/collision_trimesh_ccylinder.cpp"
Import "opende/ode/src/collision_trimesh_distance.cpp"
Import "opende/ode/src/collision_trimesh_gimpact.cpp"
Import "opende/ode/src/collision_trimesh_opcode.cpp"
Import "opende/ode/src/collision_trimesh_plane.cpp"
Import "opende/ode/src/collision_trimesh_ray.cpp"
Import "opende/ode/src/collision_trimesh_sphere.cpp"
Import "opende/ode/src/collision_trimesh_trimesh.cpp"
Import "opende/ode/src/collision_trimesh_trimesh_new.cpp"
Import "opende/ode/src/collision_util.cpp"
Import "opende/ode/src/convex.cpp"
Import "opende/ode/src/cylinder.cpp"
Import "opende/ode/src/error.cpp"
Import "opende/ode/src/export-dif.cpp"
Import "opende/ode/src/fastdot.c"
Import "opende/ode/src/fastldlt.c"
Import "opende/ode/src/fastlsolve.c"
Import "opende/ode/src/fastltsolve.c"
'Import "opende/ode/src/joint.cpp"
Import "opende/ode/src/heightfield.cpp"
Import "opende/ode/src/lcp.cpp"
Import "opende/ode/src/mass.cpp"
Import "opende/ode/src/mat.cpp"
Import "opende/ode/src/matrix.cpp"
Import "opende/ode/src/memory.cpp"
Import "opende/ode/src/misc.cpp"
Import "opende/ode/src/obstack.cpp"
Import "opende/ode/src/ode.cpp"
Import "opende/ode/src/odeinit.cpp"
Import "opende/ode/src/odemath.cpp"
Import "opende/ode/src/odeou.cpp"
Import "opende/ode/src/odetls.cpp"
Import "opende/ode/src/plane.cpp"
Import "opende/ode/src/quickstep.cpp"
Import "opende/ode/src/ray.cpp"
Import "opende/ode/src/rotation.cpp"
'Import "opende/ode/src/scrapbook.cpp"		'deleted
Import "opende/ode/src/sphere.cpp"
'Import "opende/ode/src/stack.cpp"			'deleted
Import "opende/ode/src/step.cpp"
Import "opende/ode/src/stepfast.cpp"
Import "opende/ode/src/testing.cpp"
Import "opende/ode/src/timer.cpp"
Import "opende/ode/src/util.cpp"

Import "opende/ode/src/joints/amotor.cpp"
Import "opende/ode/src/joints/ball.cpp"
Import "opende/ode/src/joints/contact.cpp"
Import "opende/ode/src/joints/fixed.cpp"
Import "opende/ode/src/joints/hinge.cpp"
Import "opende/ode/src/joints/hinge2.cpp"
Import "opende/ode/src/joints/joint.cpp"
Import "opende/ode/src/joints/lmotor.cpp"
Import "opende/ode/src/joints/null.cpp"
Import "opende/ode/src/joints/piston.cpp"
Import "opende/ode/src/joints/plane2d.cpp"
Import "opende/ode/src/joints/pr.cpp"
Import "opende/ode/src/joints/pu.cpp"
Import "opende/ode/src/joints/slider.cpp"
Import "opende/ode/src/joints/universal.cpp"

Import "opende/OPCODE/OPC_AABBCollider.cpp"
Import "opende/OPCODE/OPC_AABBTree.cpp"
Import "opende/OPCODE/OPC_BaseModel.cpp"
Import "opende/OPCODE/OPC_BoxPruning.cpp"
Import "opende/OPCODE/OPC_Collider.cpp"
'Import "opende/OPCODE/OPC_Common.cpp"		'no symbols
Import "opende/OPCODE/OPC_HybridModel.cpp"
Import "opende/OPCODE/OPC_LSSCollider.cpp"
Import "opende/OPCODE/OPC_MeshInterface.cpp"
Import "opende/OPCODE/OPC_Model.cpp"
Import "opende/OPCODE/OPC_OBBCollider.cpp"
Import "opende/OPCODE/OPC_OptimizedTree.cpp"
'Import "opende/OPCODE/OPC_Picking.cpp"	'no symbols
Import "opende/OPCODE/OPC_PlanesCollider.cpp"
Import "opende/OPCODE/OPC_RayCollider.cpp"
Import "opende/OPCODE/OPC_SphereCollider.cpp"
Import "opende/OPCODE/OPC_SweepAndPrune.cpp"
Import "opende/OPCODE/OPC_ThreadLocalData.cpp"
Import "opende/OPCODE/OPC_TreeBuilders.cpp"
Import "opende/OPCODE/OPC_TreeCollider.cpp"
Import "opende/OPCODE/OPC_VolumeCollider.cpp"

Import "opende/OPCODE/Opcode.cpp"
'Import "opende/OPCODE/StdAfx.cpp"			'no symbols
Import "opende/OPCODE/Ice/IceAABB.cpp"
Import "opende/OPCODE/Ice/IceContainer.cpp"
Import "opende/OPCODE/Ice/IceHPoint.cpp"
Import "opende/OPCODE/Ice/IceIndexedTriangle.cpp"
Import "opende/OPCODE/Ice/IceMatrix3x3.cpp"
Import "opende/OPCODE/Ice/IceMatrix4x4.cpp"
Import "opende/OPCODE/Ice/IceOBB.cpp"
Import "opende/OPCODE/Ice/IcePlane.cpp"
Import "opende/OPCODE/Ice/IcePoint.cpp"
Import "opende/OPCODE/Ice/IceRandom.cpp"
Import "opende/OPCODE/Ice/IceRay.cpp"
Import "opende/OPCODE/Ice/IceRevisitedRadix.cpp"
Import "opende/OPCODE/Ice/IceSegment.cpp"
Import "opende/OPCODE/Ice/IceTriangle.cpp"
Import "opende/OPCODE/Ice/IceUtils.cpp"

Import "common.bmx"
Import "contact.bmx"
Import "objects.bmx"

Import "collision.bmx"
Import "collision_space.bmx"
Import "collision_trimesh.bmx"
