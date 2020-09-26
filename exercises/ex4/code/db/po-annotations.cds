using teched.PurchaseOrder as PO from './data-model';

annotate PO.Headers with @(
    title       : '{i18n>poService}',
    description : '{i18n>poService}'
) {
    ID              @(
        title       : '{i18n>po_id}',
        description : '{i18n>po_id}',
    );

    items           @(
        title       : '{i18n>po_items}',
        description : '{i18n>po_items}'
    );

    partner         @(
        title            : '{i18n>partner_id}',
        description      : '{i18n>partner_id}'
    );

    lifecycleStatus @(
        title               : '{i18n>lifecycle}',
        description         : '{i18n>lifecycle}',
        Common.FieldControl : #ReadOnly
    );

    approvalStatus  @(
        title               : '{i18n>approval}',
        description         : '{i18n>approval}',
        Common.FieldControl : #ReadOnly
    );

    confirmStatus   @(
        title               : '{i18n>confirmation}',
        description         : '{i18n>confirmation}',
        Common.FieldControl : #ReadOnly
    );

    orderingStatus  @(
        title               : '{i18n>ordering}',
        description         : '{i18n>ordering}',
        Common.FieldControl : #ReadOnly
    );

    invoicingStatus @(
        title               : '{i18n>invoicing}',
        description         : '{i18n>invoicing}',
        Common.FieldControl : #ReadOnly
    );
};

annotate Items with {
    ID           @(
        title       : '{i18n>internal_id}',
        description : '{i18n>internal_id}',
    );

    product      @(
        title               : '{i18n>product}',
        description         : '{i18n>product}',
        Common.FieldControl : #Mandatory,
        Search.defaultSearchElement       
    );

    deliveryDate @(
        title       : '{i18n>deliveryDate}',
        description : '{i18n>deliveryDate}'
    )
}