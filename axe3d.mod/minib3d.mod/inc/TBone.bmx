Type TBone Extends TMiniEntity

	Field n_px#,n_py#,n_pz#,n_sx#,n_sy#,n_sz#,n_rx#,n_ry#,n_rz#,n_qw#,n_qx#,n_qy#,n_qz#

	Field keys:TAnimationKeys
	
	' additional matrices used for animation purposes
	Field mat2:TMatrix=New TMatrix
	Field inv_mat:TMatrix ' set in TModel, when loading anim mesh
	Field tform_mat:TMatrix=New TMatrix
	
	Field kx#,ky#,kz#,kqw#,kqx#,kqy#,kqz# ' used to store current keyframe in AnimateMesh, for use with transition

	Method New()
	
		If LOG_NEW
			DebugLog "New TBone"
		EndIf
	
	End Method
	
	Method Delete()
	
		If LOG_DEL
			DebugLog "Del TBone"
		EndIf
	
	End Method
	
	Method CopyEntity:TEntity(parent_ent:TEntity=Null)
	
		' new bone
		Local bone:TBone=New TBone
		
		Clone(bone,TMiniEntity(parent_ent))
		' copy bone info
		
		bone.n_px#=n_px#
		bone.n_py#=n_py#
		bone.n_pz#=n_pz#
		bone.n_sx#=n_sx#
		bone.n_sy#=n_sy#
		bone.n_sz#=n_sz#
		bone.n_rx#=n_rx#
		bone.n_ry#=n_ry#
		bone.n_rz#=n_rz#
		bone.n_qw#=n_qw#
		bone.n_qx#=n_qx#
		bone.n_qy#=n_qy#
		bone.n_qz#=n_qz#
	
		bone.keys=keys.Copy()
		
		bone.kx#=kx#
		bone.ky#=ky#
		bone.kz#=kz#
		bone.kqw#=kqw#
		bone.kqx#=kqx#
		bone.kqy#=kqy#
		bone.kqz#=kqz#
		
		bone.mat2=mat2.Copy()
		bone.inv_mat=inv_mat.Copy()
		bone.tform_mat=tform_mat.Copy()

		Return bone
	
	End Method
		
	Method FreeEntity()
	
		Super.FreeEntity() 
	
		keys=Null
	
	End Method

	' Same as UpdateChildren in TEntity except it negates z value of bone matrices so that children are transformed
	' in correct z direction
	Function UpdateBoneChildren(ent_p:TMiniEntity)
		'skid
		Assert False
		Return
		For Local ent_c:TMiniEntity=EachIn ent_p.child_list
			
			If TBone(ent_c)=Null ' if child is not a bone
						
				Local mat:TMatrix=ent_p.Copy()
			
				' if parent is a bone, negate z value of matrix
				If TBone(ent_p)<>Null
					mat.grid[3,2]=-mat.grid[3,2]
					'mat=TBone(ent_p).tform_mat
				EndIf
			
				ent_c.Overwrite(mat)
				ent_c.Dirty()
				
			EndIf
			
'			UpdateChildren(ent_c:TEntity)
					
		Next
	
	End Function
	
	Method Update()
	
	End Method

End Type
