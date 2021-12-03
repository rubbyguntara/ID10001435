*&---------------------------------------------------------------------*
*& Report ZRE_GET_MATERIALS_FOR_DATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_get_materials_for_date.

TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         ersda TYPE mara-ersda,
         mtart TYPE mara-mtart,
         matkl TYPE mara-matkl,
         meins TYPE mara-meins,
       END OF ty_mara .
DATA : it_mara TYPE TABLE OF ty_mara.
DATA : wa_mara TYPE ty_mara.

DATA : lo_material TYPE REF TO zcl_sapn_materials.
PARAMETERS : p_date TYPE mara-ersda.
CREATE OBJECT lo_material.

START-OF-SELECTION.

  CALL METHOD lo_material->get_materials_for_date
    EXPORTING
      im_date = p_date
    IMPORTING
      et_mara = it_mara.

  LOOP AT it_mara INTO wa_mara.
    WRITE:/ wa_mara-matnr, wa_mara-ersda, wa_mara-mtart, wa_mara-matkl, wa_mara-meins.
  ENDLOOP.
