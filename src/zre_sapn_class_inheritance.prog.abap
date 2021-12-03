*&---------------------------------------------------------------------*
*& Report ZRE_SAPN_CLASS_INHERITANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_sapn_class_inheritance.

DATA : lo_class TYPE REF TO zcl_sapn_childclass. "declare class
DATA : wa_mara TYPE mara. "declare MARA
DATA : wa_makt TYPE makt. "declare MAKT

PARAMETERS p_matnr TYPE mara-matnr. "material input
CREATE OBJECT lo_class. "create instance for class

START-OF-SELECTION.
  CALL METHOD lo_class->get_material_details "get material details
    EXPORTING
      im_matnr = p_matnr
    IMPORTING
      ex_mara  = wa_mara.

  wa_makt = lo_class->ls_makt. "access material description from class attribute
  WRITE:/ wa_mara-matnr, wa_mara-mtart, wa_mara-meins, wa_mara-matkl. "print material details
  WRITE:/ wa_makt-matnr, wa_makt-maktx. "print material descriptions
