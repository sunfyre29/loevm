using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ID',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'stock',
                Value: stock,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Title}',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Stock}',
            Value: stock,
        },
        {
            $Type: 'UI.DataField',
            Value: bestseller,
            Label: '{i18n>Bestseller}',
        },
        {
            $Type: 'UI.DataField',
            Value: author,
            Label: '{i18n>Author}',
        },
        {
            $Type: 'UI.DataField',
            Value: genre,
            Label: '{i18n>Genre}',
        },
        {
            $Type: 'UI.DataField',
            Value: price,
            Label: '{i18n>Price}',
        },


    ],
    UI.SelectionFields           : [title, ],
);

annotate service.Books with {
    title @Common.Label: '{i18n>Title}'


};


annotate service.Books with {

   
// netCost                    @(Measures.ISOCurrency: currency_code);


};
