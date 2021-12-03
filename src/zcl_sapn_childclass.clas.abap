class ZCL_SAPN_CHILDCLASS definition
  public
  inheriting from ZCL_SAPN_SUPERCLASS
  final
  create public .

public section.

  data LS_MAKT type MAKT .

  methods GET_MATERIAL_DETAILS
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SAPN_CHILDCLASS IMPLEMENTATION.


  METHOD get_material_details.
    CALL METHOD super->get_material_details
      EXPORTING
        im_matnr = im_matnr
      IMPORTING
        ex_mara  = ex_mara.

***Additional code to get material descriptions
    SELECT * FROM makt
      INTO ls_makt
      WHERE matnr = ex_mara-matnr.
    ENDSELECT.
  ENDMETHOD.
ENDCLASS.
