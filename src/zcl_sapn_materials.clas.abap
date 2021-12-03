class ZCL_SAPN_MATERIALS definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_mara,
           matnr TYPE mara-matnr,
           ersda TYPE mara-ersda,
           mtart TYPE mara-mtart,
           matkl TYPE mara-matkl,
           meins TYPE mara-meins,
         END OF ty_mara .
  types:
    tt_mara TYPE TABLE OF ty_mara .

  data LANGUAGE type SPRAS .
  class-data MAT_TYPE type MTART .

  events NO_MATERIAL .
  events MATERIAL_NOT_FOUND .

  methods GET_MATERIAL_DETAILS
    importing
      !IM_MATNR type MARA-MATNR
    exporting
      !EX_MARA type MARA .
  methods GET_MATERIALS_FOR_TYPE
    importing
      !IM_MTART type MARA-MTART
    exporting
      !ET_MARA type ZTT_SAPN_MARA .
  methods GET_MATERIALS_FOR_DATE
    importing
      !IM_DATE type MARA-ERSDA
    exporting
      !ET_MARA type TT_MARA .
  methods NO_MATERIAL_HANDLER
    for event NO_MATERIAL of ZCL_SAPN_MATERIALS .
  methods MATERIAL_NOT_FOUND_HANDLER
    for event MATERIAL_NOT_FOUND of ZCL_SAPN_MATERIALS .
  methods CONSTRUCTOR
    importing
      !IM_SPRAS type MAKT-SPRAS .
  methods GET_MATERIAL_DESCRIPTION
    importing
      !IM_MATNR type MARA-MATNR
    exporting
      !EX_MAKT type MAKT .
  class-methods CLASS_CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SAPN_MATERIALS IMPLEMENTATION.


  METHOD get_material_details.
*Select material data from mara table into exporting parameter ex_mara (work area) for a material no im_matnr
    IF im_matnr IS INITIAL.
      RAISE EVENT no_material.
    ELSE.
      SELECT SINGLE * FROM mara
        INTO ex_mara
        WHERE matnr = im_matnr.
      IF ex_mara IS INITIAL.
        RAISE EVENT material_not_found.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD get_materials_for_date.
*Get material no, created date, material TYPE, material group, units of measue
*from MARA table
    SELECT matnr ersda mtart matkl meins
      FROM mara INTO TABLE et_mara
      WHERE ersda EQ im_date.
  ENDMETHOD.


  METHOD get_materials_for_type.
*Get DATA from mara for a material TYPE mtart
    SELECT * FROM mara
      INTO TABLE et_mara
      UP TO 50 ROWS
      WHERE mtart = im_mtart.
*For testing purpose im getting first 50 rows for a material type
  ENDMETHOD.


  METHOD material_not_found_handler.
    WRITE:/ 'Material is not found'.
  ENDMETHOD.


  METHOD no_material_handler.
    WRITE:/ 'No material entered'.
  ENDMETHOD.


  METHOD class_constructor.
*Set default material TYPE as fert
    mat_type = 'FERT'.
  ENDMETHOD.


  METHOD constructor.
    language = im_spras.
  ENDMETHOD.


  METHOD get_material_description.
    SELECT * FROM makt INTO ex_makt
      WHERE matnr = im_matnr
          AND spras = language. "LANGUAGE IS THE ATTRIBUTE DEFINED IN METHOD
    ENDSELECT.
  ENDMETHOD.
ENDCLASS.
