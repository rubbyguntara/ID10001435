*&---------------------------------------------------------------------*
*& Report ZRE_SAPN_CLASS_EVENT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_sapn_class_event.

DATA : lo_material TYPE REF TO zcl_sapn_materials. "class decleration
DATA wa_mara TYPE mara. "work area to store material data

PARAMETERS p_matnr TYPE mara-matnr. "material input

CREATE OBJECT lo_material. "create object for material calsss
SET HANDLER lo_material->no_material_handler FOR lo_material. "register event handler method
SET HANDLER lo_material->material_not_found_handler FOR lo_material. "register event handler method

START-OF-SELECTION.
  CALL METHOD lo_material->get_material_details "call method
    EXPORTING
      im_matnr = p_matnr
    IMPORTING
      ex_mara  = wa_mara.

  WRITE : wa_mara-matnr, wa_mara-mtart, wa_mara-meins.
