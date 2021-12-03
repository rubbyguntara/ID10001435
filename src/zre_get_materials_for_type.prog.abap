*&---------------------------------------------------------------------*
*& Report ZRE_GET_MATERIALS_FOR_TYPE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_get_materials_for_type.

DATA : it_mara TYPE TABLE OF mara. "internal table to store materials
DATA : wa_mara TYPE mara. "work area for materials to loop
DATA : lo_materials TYPE REF TO zcl_sapn_materials. "declare materials class

PARAMETERS : p_mtart TYPE mara-mtart. "material type input

CREATE OBJECT lo_materials. "Create object for material class

START-OF-SELECTION.
  CALL METHOD lo_materials->get_materials_for_type "call method to get materials
    EXPORTING
      im_mtart = p_mtart
    IMPORTING
      et_mara  = it_mara.

  LOOP AT it_mara INTO wa_mara.
    WRITE :/ wa_mara-matnr, wa_mara-mtart, wa_mara-meins.
  ENDLOOP.
