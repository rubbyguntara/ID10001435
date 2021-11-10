@AbapCatalog.sqlViewName: 'ZVPURCHORD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Order Data'
define view zCDS_PURCHASE_ORDER
  as select from ekko
  association [1..*] to ekpo as _zpoitem on $projection.ebeln = _zpoitem.ebeln
{
  key ebeln,
      ekorg,
      lifnr,
      //    Exposed Association
      //    _zpoitem // Make association public

      //    ad hoc association
      _zpoitem.ebelp,
      _zpoitem.matnr,
      _zpoitem.werks
}
