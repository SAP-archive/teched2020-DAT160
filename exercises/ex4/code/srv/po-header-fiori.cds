using CatalogService as pos from './cat-service';


annotate pos.POHeaders with @( // header-level annotations
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // POs List
    UI        : {
        LineItem            : [
        {
            $Type             : 'UI.DataField',
            Value             : ID,
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : grossAmount,
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : currency_code,
            ![@UI.Importance] : #Medium
        },
        {
            $Type : 'UI.DataField',
            Value : currency.symbol
        },
        ],
        PresentationVariant : {SortOrder : [
        {
            $Type      : 'Common.SortOrderType',
            Property   : ID,
            Descending : false
        },
        {
            $Type      : 'Common.SortOrderType',
            Property   : partner,
            Descending : false
        }
        ]}
    },

    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Page Header
    UI        : {
        HeaderInfo                     : {
            TypeName       : '{i18n>poService}',
            TypeNamePlural : '{i18n>poServices}',
            Title          : {Value : ID},
        },
        HeaderFacets                   : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        },
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#AdministrativeData',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description        : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID
        }
        ]},
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : partner
        },
        {
            $Type             : 'UI.DataField',
            Value             : noteId,
            ![@UI.Importance] : #Medium
        },
        {
            $Type : 'UI.DataField',
            Value : grossAmount
        },
        {
            $Type : 'UI.DataField',
            Value : netAmount
        },
        {
            $Type : 'UI.DataField',
            Value : taxAmount
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code
        },
        {
            $Type                   : 'UI.DataField',
            Value                   : currency.symbol,
            ![@Common.FieldControl] : #ReadOnly
        },
        {
            $Type                   : 'UI.DataField',
            Value                   : currency.name,
            ![@Common.FieldControl] : #ReadOnly
        },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {
            $Type : 'UI.DataField',
            Value : createdBy
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt
        }
        ]}
    },
    // Page Facets
    UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails',
        Label  : '{i18n>details}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>details}',
            Target : '@UI.FieldGroup#Details'
        }]
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>po_items}',
        Target : 'item/@UI.LineItem'
    }
    ]
);