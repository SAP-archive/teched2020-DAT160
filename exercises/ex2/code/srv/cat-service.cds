using teched.PurchaseOrder as PO from '../db/data-model';

service CatalogService {
   entity POHeaders as projection on PO.Headers;
}