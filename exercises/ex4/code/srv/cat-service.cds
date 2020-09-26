using teched.PurchaseOrder as PO from '../db/data-model';

service CatalogService {
    entity POHeaders @(
        title               : '{i18n>poService}',
        odata.draft.enabled : true
    ) as projection on PO.Headers;

    entity POItems @(
        title               : '{i18n>poService}',
    ) as projection on PO.Items;    
}
