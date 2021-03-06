
Strict

'Conversion of objects.h

Extern

Function dWorldCreate()
Function dWorldDestroy( world )
Function dWorldSetGravity( world,x#,y#,z# )
Function dWorldGetGravity( world,gravity:Float Ptr )
Function dWorldSetERP( world,erp# )
Function dWorldGetERP#( world )
Function dWorldSetCFM( world,cfm# )
Function dWorldGetCFM#( world )
Function dWorldStep( world,stepsize# )
Function dWorldImpulseToForce( world,stepsize#,ix#,iy#,iz#,force:Float Ptr )
Function dWorldQuickStep( world,stepsize# )
Function dWorldSetQuickStepNumIterations( world,num )
Function dWorldGetQuickStepNumIterations( world )
Function dWorldSetQuickStepW( world,over_relaxation# )
Function dWorldGetQuickStepW#( world )

Function dWorldSetContactMaxCorrectingVel( world,vel# )
Function dWorldGetContactMaxCorrectingVel#( world )
Function dWorldSetContactSurfaceLayer( world,depth# )
Function dWorldGetContactSurfaceLayer#( world )

Function dWorldStepFast1( world,stepsize#,maxiterations )

Function dWorldSetAutoEnableDepthSF1( world,autoEnableDepth )
Function dWorldGetAutoEnableDepthSF1( world )
Function dWorldSetAutoDisableLinearThreshold( world,linear_threshold# )
Function dWorldGetAutoDisableLinearThreshold#( world )
Function dWorldSetAutoDisableAngularThreshold( world,angular_threshold# )
Function dWorldGetAutoDisableAngularThreshold#( world )
Function dWorldSetAutoDisableSteps( world,steps )
Function dWorldGetAutoDisableSteps( world )
Function dWorldSetAutoDisableTime( world,time# )
Function dWorldGetAutoDisableTime#( world )
Function dWorldSetAutoDisableFlag( world,do_auto_disable )
Function dWorldGetAutoDisableFlag( world )

Function dBodyGetAutoDisableLinearThreshold#( body )
Function dBodySetAutoDisableLinearThreshold( body,linear_threshold# )
Function dBodyGetAutoDisableAngularThreshold#( body )
Function dBodySetAutoDisableAngularThreshold( body,angular_threshold# )
Function dBodyGetAutoDisableSteps( body )
Function dBodySetAutoDisableSteps( body,steps )
Function dBodyGetAutoDisableTime#( body )
Function dBodySetAutoDisableTime( body,time# )
Function dBodyGetAutoDisableFlag( body )
Function dBodySetAutoDisableFlag( body,do_auto_disable )
Function dBodySetAutoDisableDefaults( body )

Function dBodyCreate( world )
Function dBodyDestroy( body )
Function dBodySetData( body,data:Byte Ptr )
Function dBodyGetData:Byte Ptr( body )
Function dBodySetPosition( body,x#,y#,z# )
Function dBodySetRotation( body,R:Float Ptr )
Function dBodySetQuaternion( body,Q:Float Ptr )
Function dBodySetLinearVel( body,x#,y#,z# )
Function dBodySetAngularVel( body,x#,y#,z# )
Function dBodyGetPosition:Float Ptr( body )
Function dBodyGetRotation:Float Ptr( body )
Function dBodyGetQuaternion:Float Ptr( body )
Function dBodyGetLinearVel:Float Ptr( body )
Function dBodyGetAngularVel:Float Ptr( body )
Function dBodySetMass( body,mass:Byte Ptr )
Function dBodyGetMass( body,mass:Byte Ptr )
Function dBodyAddForce( body,fx#,fy#,fz# )
Function dBodyAddTorque( body,fx#,fy#,fz# )
Function dBodyAddRelForce( body,fx#,fy#,fz# )
Function dBodyAddRelTorque( body,fx#,fy#,fz# )
Function dBodyAddForceAtPos( body,fx#,fy#,fz#,px#,py#,pz# )
Function dBodyAddForceAtRelPos( body,fx#,fy#,fz#,px#,py#,pz# )
Function dBodyAddRelForceAtPos( body,fx#,fy#,fz#,px#,py#,pz# )
Function dBodyAddRelForceAtRelPos( body,fx#,fy#,fz#,px#,py#,pz# )
Function dBodyGetForce:Float Ptr( body )
Function dBodyGetTorque:Float Ptr( body )
Function dBodySetForce( body,x#,y#,z# )
Function dBodySetTorque( body,x#,y#,z# )

Function dBodyGetRelPointPos( body,px#,py#,pz#,result:Float Ptr )
Function dBodyGetRelPointVel( body,px#,py#,pz#,result:Float Ptr )
Function dBodyGetPointVel( body,px#,py#,pz#,result:Float Ptr )
Function dBodyGetPosRelPoint( body,px#,py#,pz#,result:Float Ptr )
Function dBodyVectorToWorld( body,px#,py#,pz#,result:Float Ptr )
Function dBodyVectorFromWorld( body,px#,py#,pz#,result:Float Ptr )

Function dBodySetFiniteRotationMode( body,mode )
Function dBodySetFiniteRotationAxis( body,x#,y#,z# )
Function dBodyGetFiniteRotationMode( body )
Function dBodyGetFiniteRotationAxis( body,result:Float Ptr )
Function dBodyGetNumJoints( body )
Function dBodyGetJoint( body,index )
Function dBodyEnable( body )
Function dBodyDisable( body )
Function dBodyIsEnabled( body )
Function dBodySetGravityMode( body,mode )
Function dBodyGetGravityMode( body )

Function dJointCreateBall( world,group )
Function dJointCreateHinge( world,group )
Function dJointCreateSlider( world,group )
Function dJointCreateContact( world,group,contact:Byte Ptr )
Function dJointCreateHinge2( world,group )
Function dJointCreateUniversal( world,group )
Function dJointCreateFixed( world,group )
Function dJointCreateNull( world,group )
Function dJointCreateAMotor( world,group )
Function dJointCreateLMotor( world,group )

Function dJointDestroy( joint )

Function dJointGroupCreate( max_size )
Function dJointGroupDestroy( group )
Function dJointGroupEmpty( group )

Function dJointAttach( joint,body1,body2 )
Function dJointSetData( joint,data:Byte Ptr )
Function dJointGetData:Byte Ptr( joint )
Function dJointGetType( joint )
Function dJointGetBody( joint,index )
Function dJointSetFeedback( joint,feedback:Byte Ptr )
Function dJointGetFeedback:Byte Ptr( joint )

Function dJointSetBallAnchor( joint,x#,y#,z# )
Function dJointSetBallAnchor2( joint,x#,y#,z# )

Function dJointSetHingeAnchor( joint,x#,y#,z# )
Function dJointSetHingeAnchorDelta( joint,x#,y#,z#,ax#,ay#,az# )
Function dJointSetHingeAxis( joint,x#,y#,z# )
Function dJointSetHingeParam( joint,parameter,value# )
Function dJointAddHingeTorque( joint,torque# )

Function dJointSetSliderAxis( joint,x#,y#,z# )
Function dJointSetSliderAxisDelta( joint,x#,y#,z#,ax#,ay#,az# )
Function dJointSetSliderParam( joint,parameter,value# )
Function dJointAddSliderForce( joint,force# )

Function dJointSetHinge2Anchor( joint,x#,y#,z# )
Function dJointSetHinge2Axis1( joint,x#,y#,z# )
Function dJointSetHinge2Axis2( joint,x#,y#,z# )
Function dJointSetHinge2Param( joint,parameter,value# )
Function dJointAddHinge2Torques( joint,torque1#,torque2# )

Function dJointSetUniversalAnchor( joint,x#,y#,z# )
Function dJointSetUniversalAxis1( joint,x#,y#,z# )
Function dJointSetUniversalAxis2( joint,x#,y#,z# )
Function dJointSetUniversalParam( joint,parameter,value# )
Function dJointAddUniversalTorques( joint,torque1#,torque2# )

Function dJointSetFixed( joint )

Function dJointSetAMotorNumAxes( joint,num )
Function dJointSetAMotorAxis( joint,anum,rel,x#,y#,z# )
Function dJointSetAMotorAngle( joint,anum,angle# )
Function dJointSetAMotorParam( joint,parameter,value# )
Function dJointSetAMotorMode( joint,mode )
Function dJointAddAMotorTorques( joint,torque1#,torque2#,torque3# )

Function dJointSetLMotorNumAxes( joint,num )
Function dJointSetLMotorAxis( joint,anum,rel,x#,y#,z# )
Function dJointSetLMotorParam( joint,parameter,value# )

Function dJointGetBallAnchor( joint,result:Float Ptr )
Function dJointGetBallAnchor2( joint,result:Float Ptr )
Function dJointGetHingeAnchor( joint,result:Float Ptr )
Function dJointGetHingeAnchor2( joint,result:Float Ptr )
Function dJointGetHingeAxis( joint,result:Float Ptr )
Function dJointGetHingeParam#( joint,parameter )
Function dJointGetHingeAngle#( joint )
Function dJointGetHingeAngleRate#( joint )
Function dJointGetSliderPosition#( joint )
Function dJointGetSliderPositionRate#( joint )
Function dJointGetSliderAxis( joint,result:Float Ptr )
Function dJointGetSliderParam#( joint,parameter )
Function dJointGetHinge2Anchor( joint,result:Float Ptr )
Function dJointGetHinge2Anchor2( joint,result:Float Ptr )
Function dJointGetHinge2Axis1( joint,result:Float Ptr )
Function dJointGetHinge2Axis2( joint,result:Float Ptr )
Function dJointGetHinge2Param#( joint,parameter )
Function dJointGetHinge2Angle1#( joint )
Function dJointGetHinge2Angle1Rate#( joint )
Function dJointGetHinge2Angle2Rate#( joint )
Function dJointGetUniversalAnchor( joint,result:Float Ptr )
Function dJointGetUniversalAnchor2( joint,result:Float Ptr )
Function dJointGetUniversalAxis1( joint,result:Float Ptr )
Function dJointGetUniversalAxis2( joint,result:Float Ptr )
Function dJointGetUniversalParam#( joint,parameter )
Function dJointGetUniversalAngle1#( joint )
Function dJointGetUniversalAngle2#( joint )
Function dJointGetUniversalAngle1Rate#( joint )
Function dJointGetUniversalAngle2Rate#( joint )
Function dJointGetAMotorNumAxes( joint )
Function dJointGetAMotorAxis( joint,anum,result:Float Ptr )
Function dJointGetAMotorAxisRel( joint,anum )
Function dJointGetAMotorAngle#( joint,anum )
Function dJointGetAMotorAngleRate#( joint,anum )
Function dJointGetAMotorParam#( joint,parameter )
Function dJointGetAMotorMode( joint )
Function dJointGetLMotorNumAxes( joint )
Function dJointGetLMotorAxis( joint,anum,result:Float Ptr )
Function dJointGetLMotorParam#( joint )
Function dConnectingJoint( body1,body2 )
Function dConnectingJointList( body1,body2,joint_list:Int Ptr )
Function dAreConnected( body1,body2 )
Function dAreConnectedExcluding( body1,body2,joint_type )

End Extern
