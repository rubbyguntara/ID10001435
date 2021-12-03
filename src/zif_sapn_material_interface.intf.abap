interface ZIF_SAPN_MATERIAL_INTERFACE
  public .


  methods GET_MATERIAL_DETAILS
    importing
      !IM_MATNR type MARA-MATNR
    exporting
      !EX_MARA type MARA .
  methods GET_MATERIAL_DESCRIPTION
    importing
      !IM_MATNR type MARA-MATNR
    exporting
      !EX_MAKT type MAKT .
endinterface.
