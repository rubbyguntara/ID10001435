class ZCL_SAPN_MATERIALS definition
  public
  final
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



CLASS ZCL_SAPN_MATERIALS IMPLEMENTATION.


  METHOD get_material_details.
*Select material data from mara table into exporting parameter ex_mara (work area) for a material no im_matnr
    SELECT SINGLE * FROM mara
      INTO ex_mara
      WHERE matnr = im_matnr.
  ENDMETHOD.
ENDCLASS.
