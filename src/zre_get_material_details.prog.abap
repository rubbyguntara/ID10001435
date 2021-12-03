*&---------------------------------------------------------------------*
*& Report ZRE_GET_MATERIAL_DETAILS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_get_material_details.

DATA : lo_material TYPE REF TO zcl_sapn_materials.

PARAMETERS : p_matnr TYPE mara-matnr.
DATA : wa_mara TYPE mara.
CREATE OBJECT lo_material.

START-OF-SELECTION.
  CALL METHOD lo_material->get_material_details
    EXPORTING
      im_matnr = p_matnr
    IMPORTING
      ex_mara  = wa_mara.
  WRITE :/ wa_mara-matnr, wa_mara-mtart, wa_mara-meins.
