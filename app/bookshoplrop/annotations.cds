using CatalogService as service from '../../srv/cat-service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Value : bestseller,
            },
            {
                $Type : 'UI.DataField',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Allgemeine Informationen',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Informationen über den Autor',
            ID : 'Autor',
            Target : '@UI.FieldGroup#Autor',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Value : bestseller,
        },
        {
            $Type : 'UI.DataField',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Value : deleteFlag,
            Label : '{i18n>Deleteflag}',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : '{i18n>Author}',
        },
        {
            $Type : 'UI.DataField',
            Value : author.placeOfBirth,
            Label : '{i18n>placeOfBirth}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
    UI.SelectionFields : [
        bestseller,
        genre,
        author.name,
    ],
    UI.HeaderInfo : {
        TypeName : 'Buch',
        TypeNamePlural : 'Bücher',
    },
    UI.FieldGroup #Autor : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : author.dateOfBirth,
                Label : '{i18n>dateOfBirth}',
            },
            {
                $Type : 'UI.DataField',
                Value : author.dateOfDeath,
                Label : '{i18n>dateOfDeath}',
            },
            {
                $Type : 'UI.DataField',
                Value : author.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : author.name,
                Label : '{i18n>Name}',
            },
            {
                $Type : 'UI.DataField',
                Value : author.placeOfBirth,
                Label : '{i18n>placeOfBirth}',
            },
            {
                $Type : 'UI.DataField',
                Value : author.placeOfDeath,
                Label : '{i18n>placeOfDeath}',
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfBirth',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfDeath',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'placeOfBirth',
            },
        ],
    }
};

annotate service.Books with {
    deleteFlag @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'DeleteFlag',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : deleteFlag_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'isActive',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'DeletedAt',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'books_ID',
            },
        ],
    }
};

annotate service.Authors with {
    name @Common.Label : 'author/name'
};


annotate service.Books with @(UI.LineItem: [
  {
    $Type : 'UI.DataFieldForAction',
    Action: 'CatalogService.EntityContainer/setDeleteFlagTrue',
    Label : 'LKOEZ zurücksetzen',
    Criticality: #Information
  }
]);

