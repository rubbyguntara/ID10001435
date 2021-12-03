class ZCL_SAPN1 definition
  public
  final
  create public .

public section.

  methods GET_TEST
    importing
      !PARAMETER1 type CHAR25
    exporting
      !PARAMETER2 type CHAR25 .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SAPN1 IMPLEMENTATION.


  METHOD get_test.
    WRITE 'Hello World!'.
  ENDMETHOD.
ENDCLASS.
