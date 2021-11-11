@AbapCatalog.sqlViewName: 'ZVVENDORPO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Vendor Purchase Order Association'
define view ZCDS_VENDOR_PO
  as select from lfa1
  association [1..*] to ZCDS_PURCHASE_ORDER as _zpohead on $projection.lifnr = _zpohead.lifnr
{
  key lifnr,
      name1,
      land1,
      
//      exposed association
      _zpohead // Make association public
}
