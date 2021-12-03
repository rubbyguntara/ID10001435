*&---------------------------------------------------------------------*
*& Report ZRE_SAPN_CLASS_INTERFACE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_sapn_class_interface.

DATA : lo_class TYPE REF TO zcl_sapn_class_ex. "declare class

DATA : wa_mara TYPE mara. "mara decleration
DATA : wa_makt TYPE makt. "makt decleration

PARAMETERS p_matnr TYPE mara-matnr.

CREATE OBJECT lo_class. "create object for the class

START-OF-SELECTION.
  CALL METHOD lo_class->get_material_details
    EXPORTING
      im_matnr = p_matnr
    IMPORTING
      ex_mara  = wa_mara.

  CALL METHOD lo_class->get_material_description
    EXPORTING
      im_matnr = p_matnr
    IMPORTING
      ex_makt  = wa_makt.

  WRITE :/ 'Material Details - ' COLOR 5, wa_mara-matnr, wa_mara-mtart, wa_mara-mbrsh, wa_mara-matkl.
  WRITE :/ 'Material Descriptions - 'COLOR 6, wa_makt-matnr, wa_makt-maktx, wa_makt-spras.
