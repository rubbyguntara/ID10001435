class ZCL_SAPN_SUPERCLASS definition
  public
  create public .

public section.

  methods GET_MATERIAL_DETAILS
    importing
      !IM_MATNR type MARA-MATNR
    exporting
      !EX_MARA type MARA .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SAPN_SUPERCLASS IMPLEMENTATION.


  METHOD get_material_details.
    SELECT SINGLE * FROM mara
      INTO ex_mara
      WHERE matnr = im_matnr.
  ENDMETHOD.
ENDCLASS.
