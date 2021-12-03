*&---------------------------------------------------------------------*
*& Report ZRE_GET_MATERIAL_DESCRIPTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_get_material_description.

DATA : lo_material TYPE REF TO zcl_sapn_materials.
DATA : wa_makt TYPE makt.
PARAMETERS p_matnr TYPE mara-matnr.
CREATE OBJECT lo_material
  EXPORTING
    im_spras = sy-langu.

START-OF-SELECTION.
  CALL METHOD lo_material->get_material_description
    EXPORTING
      im_matnr = p_matnr
    IMPORTING
      ex_makt  = wa_makt.

  WRITE : wa_makt-matnr, wa_makt-maktx.
