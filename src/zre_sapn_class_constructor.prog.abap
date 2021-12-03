*&---------------------------------------------------------------------*
*& Report ZRE_SAPN_CLASS_CONSTRUCTOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_sapn_class_constructor.

DATA : lo_material TYPE REF TO zcl_sapn_materials. "Declare class

CREATE OBJECT lo_material "create object CONSTRUCTOR method will trigger
  EXPORTING
    im_spras = 'E'.
**When ever first call to a class is made class constructor will trigger
WRITE:/ 'Executed through class constructor', zcl_sapn_materials=>mat_type. "Executed through Class Constructor

WRITE:/ 'Executed through Constructor', lo_material->language . "Executed through constructor method
