class ZCL_SAPN_CLASS_EX definition
  public
  create public .

public section.

  interfaces ZIF_SAPN_MATERIAL_INTERFACE .

  aliases GET_MATERIAL_DESCRIPTION
    for ZIF_SAPN_MATERIAL_INTERFACE~GET_MATERIAL_DESCRIPTION .
  aliases GET_MATERIAL_DETAILS
    for ZIF_SAPN_MATERIAL_INTERFACE~GET_MATERIAL_DETAILS .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SAPN_CLASS_EX IMPLEMENTATION.


  METHOD zif_sapn_material_interface~get_material_description.
    SELECT * FROM makt INTO ex_makt
      WHERE matnr = im_matnr
       AND spras = 'E'. "English description only
    ENDSELECT.
  ENDMETHOD.


  METHOD zif_sapn_material_interface~get_material_details.
    SELECT SINGLE * FROM mara
      INTO ex_mara
      WHERE matnr = im_matnr.
  ENDMETHOD.
ENDCLASS.
