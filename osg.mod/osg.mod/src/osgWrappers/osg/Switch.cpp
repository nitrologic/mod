// ***************************************************************************
//
//   Generated automatically by genwrapper.
//   Please DO NOT EDIT this file!
//
// ***************************************************************************

#include <osgIntrospection/ReflectionMacros>
#include <osgIntrospection/TypedMethodInfo>
#include <osgIntrospection/StaticMethodInfo>
#include <osgIntrospection/Attributes>

#include <osg/BoundingSphere>
#include <osg/CopyOp>
#include <osg/Node>
#include <osg/NodeVisitor>
#include <osg/Object>
#include <osg/Switch>

// Must undefine IN and OUT macros defined in Windows headers
#ifdef IN
#undef IN
#endif
#ifdef OUT
#undef OUT
#endif

TYPE_NAME_ALIAS(std::vector< bool >, osg::Switch::ValueList)

BEGIN_OBJECT_REFLECTOR(osg::Switch)
	I_DeclaringFile("osg/Switch");
	I_BaseType(osg::Group);
	I_Constructor0(____Switch,
	               "",
	               "");
	I_ConstructorWithDefaults2(IN, const osg::Switch &, x, , IN, const osg::CopyOp &, copyop, osg::CopyOp::SHALLOW_COPY,
	                           ____Switch__C5_Switch_R1__C5_CopyOp_R1,
	                           "Copy constructor using CopyOp to manage deep vs shallow copy. ",
	                           "");
	I_Method0(osg::Switch *, asSwitch,
	          Properties::VIRTUAL,
	          __Switch_P1__asSwitch,
	          "Convert 'this' into a Switch pointer if Node is a Switch, otherwise return 0. ",
	          "Equivalent to dynamic_cast<Switch*>(this). ");
	I_Method0(const osg::Switch *, asSwitch,
	          Properties::VIRTUAL,
	          __C5_Switch_P1__asSwitch,
	          "convert 'const this' into a const Switch pointer if Node is a Switch, otherwise return 0. ",
	          "Equivalent to dynamic_cast<const Switch*>(this). ");
	I_Method0(osg::Object *, cloneType,
	          Properties::VIRTUAL,
	          __osg_Object_P1__cloneType,
	          "clone an object of the same type as the node. ",
	          "");
	I_Method1(osg::Object *, clone, IN, const osg::CopyOp &, copyop,
	          Properties::VIRTUAL,
	          __osg_Object_P1__clone__C5_osg_CopyOp_R1,
	          "return a clone of a node, with Object* return type. ",
	          "");
	I_Method1(bool, isSameKindAs, IN, const osg::Object *, obj,
	          Properties::VIRTUAL,
	          __bool__isSameKindAs__C5_osg_Object_P1,
	          "return true if this and obj are of the same kind of object. ",
	          "");
	I_Method0(const char *, className,
	          Properties::VIRTUAL,
	          __C5_char_P1__className,
	          "return the name of the node's class type. ",
	          "");
	I_Method0(const char *, libraryName,
	          Properties::VIRTUAL,
	          __C5_char_P1__libraryName,
	          "return the name of the node's library. ",
	          "");
	I_Method1(void, accept, IN, osg::NodeVisitor &, nv,
	          Properties::VIRTUAL,
	          __void__accept__osg_NodeVisitor_R1,
	          "Visitor Pattern : calls the apply method of a NodeVisitor with this node's type. ",
	          "");
	I_Method1(void, traverse, IN, osg::NodeVisitor &, x,
	          Properties::VIRTUAL,
	          __void__traverse__NodeVisitor_R1,
	          "Traverse downwards : calls children's accept method with NodeVisitor. ",
	          "");
	I_Method1(void, setNewChildDefaultValue, IN, bool, value,
	          Properties::NON_VIRTUAL,
	          __void__setNewChildDefaultValue__bool,
	          "",
	          "");
	I_Method0(bool, getNewChildDefaultValue,
	          Properties::NON_VIRTUAL,
	          __bool__getNewChildDefaultValue,
	          "",
	          "");
	I_Method1(bool, addChild, IN, osg::Node *, child,
	          Properties::VIRTUAL,
	          __bool__addChild__Node_P1,
	          "Add Node to Group. ",
	          "If node is not NULL and is not contained in Group then increment its reference count, add it to the child list and dirty the bounding sphere to force it to recompute on next getBound() and return true for success. Otherwise return false. Scene nodes can't be added as child nodes. ");
	I_Method2(bool, addChild, IN, osg::Node *, child, IN, bool, value,
	          Properties::VIRTUAL,
	          __bool__addChild__Node_P1__bool,
	          "",
	          "");
	I_Method2(bool, insertChild, IN, unsigned int, index, IN, osg::Node *, child,
	          Properties::VIRTUAL,
	          __bool__insertChild__unsigned_int__Node_P1,
	          "Insert Node to Group at specific location. ",
	          "The new child node is inserted into the child list before the node at the specified index. No nodes are removed from the group with this operation. ");
	I_Method3(bool, insertChild, IN, unsigned int, index, IN, osg::Node *, child, IN, bool, value,
	          Properties::VIRTUAL,
	          __bool__insertChild__unsigned_int__Node_P1__bool,
	          "",
	          "");
	I_Method2(bool, removeChildren, IN, unsigned int, pos, IN, unsigned int, numChildrenToRemove,
	          Properties::VIRTUAL,
	          __bool__removeChildren__unsigned_int__unsigned_int,
	          "Remove children from Group. ",
	          "Note, must be override by subclasses of Group which add per child attributes. ");
	I_Method2(void, setValue, IN, unsigned int, pos, IN, bool, value,
	          Properties::NON_VIRTUAL,
	          __void__setValue__unsigned_int__bool,
	          "",
	          "");
	I_Method1(bool, getValue, IN, unsigned int, pos,
	          Properties::NON_VIRTUAL,
	          __bool__getValue__unsigned_int,
	          "",
	          "");
	I_Method2(void, setChildValue, IN, const osg::Node *, child, IN, bool, value,
	          Properties::NON_VIRTUAL,
	          __void__setChildValue__C5_Node_P1__bool,
	          "",
	          "");
	I_Method1(bool, getChildValue, IN, const osg::Node *, child,
	          Properties::NON_VIRTUAL,
	          __bool__getChildValue__C5_Node_P1,
	          "",
	          "");
	I_Method0(bool, setAllChildrenOff,
	          Properties::NON_VIRTUAL,
	          __bool__setAllChildrenOff,
	          "Set all the children off (false), and set the new default child value to off (false). ",
	          "");
	I_Method0(bool, setAllChildrenOn,
	          Properties::NON_VIRTUAL,
	          __bool__setAllChildrenOn,
	          "Set all the children on (true), and set the new default child value to on (true). ",
	          "");
	I_Method1(bool, setSingleChildOn, IN, unsigned int, pos,
	          Properties::NON_VIRTUAL,
	          __bool__setSingleChildOn__unsigned_int,
	          "Set a single child on, switch off all other children. ",
	          "");
	I_Method1(void, setValueList, IN, const osg::Switch::ValueList &, values,
	          Properties::NON_VIRTUAL,
	          __void__setValueList__C5_ValueList_R1,
	          "",
	          "");
	I_Method0(const osg::Switch::ValueList &, getValueList,
	          Properties::NON_VIRTUAL,
	          __C5_ValueList_R1__getValueList,
	          "",
	          "");
	I_Method0(osg::BoundingSphere, computeBound,
	          Properties::VIRTUAL,
	          __BoundingSphere__computeBound,
	          "Compute the bounding sphere around Node's geometry or children. ",
	          "This method is automatically called by getBound() when the bounding sphere has been marked dirty via dirtyBound(). ");
	I_IndexedProperty(bool, ChildValue, 
	                  __bool__getChildValue__C5_Node_P1, 
	                  __void__setChildValue__C5_Node_P1__bool, 
	                  0);
	I_SimpleProperty(bool, NewChildDefaultValue, 
	                 __bool__getNewChildDefaultValue, 
	                 __void__setNewChildDefaultValue__bool);
	I_SimpleProperty(unsigned int, SingleChildOn, 
	                 0, 
	                 __bool__setSingleChildOn__unsigned_int);
	I_IndexedProperty(bool, Value, 
	                  __bool__getValue__unsigned_int, 
	                  __void__setValue__unsigned_int__bool, 
	                  0);
	I_SimpleProperty(const osg::Switch::ValueList &, ValueList, 
	                 __C5_ValueList_R1__getValueList, 
	                 __void__setValueList__C5_ValueList_R1);
END_REFLECTOR

STD_VECTOR_REFLECTOR(std::vector< bool >)
