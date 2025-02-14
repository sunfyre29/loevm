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
                Label: '{i18n>Title}',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Stock}',
                Value: stock,
            },
            {
                $Type : 'UI.DataField',
                Value : deleteFlag.isActive,
                Label : 'isActive',
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : bestseller,
            },
            {
                $Type : 'UI.DataField',
                Value : author,
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
        {
            $Type : 'UI.DataField',
            Value : deleteFlag.isActive,
        },


    ],
    UI.SelectionFields           : [title, ],
    UI.HeaderInfo : {
        TypeName : 'Buch',
        TypeNamePlural : 'Bücher',
        Title : {
            $Type : 'UI.DataField',
            Value : genre,
        },
    },
);

annotate service.Books with {
    title @(
        Common.Label: '{i18n>Title}',
        UI.MultiLineText : true,
    )


};


annotate service.Books with {

   
// netCost                    @(Measures.ISOCurrency: currency_code);


};
annotate service.DeleteFlag with {
    isActive @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'DeleteFlag',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : isActive,
                    ValueListProperty : 'isActive',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.Books with {
    stock @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Books',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : stock,
                    ValueListProperty : 'stock',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.Books with {
    bestseller @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Books',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bestseller,
                    ValueListProperty : 'bestseller',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.Books with {
    author @UI.MultiLineText : true
};

