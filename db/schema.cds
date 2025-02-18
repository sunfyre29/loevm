namespace my.bookshop;

using {
  Currency,
  managed,
  cuid
} from '@sap/cds/common';

@loekz
entity Books : managed {
  key ID         : Integer;
      title      : String(100)            @title: '{i18n>Title}';
      stock      : Integer                @title: '{i18n>Stock}';
      bestseller : Boolean                @title: '{i18n>Bestseller}';
      author     : Association to Authors @title: '{i18n>Author}';
      genre      : String(100)            @title: '{i18n>Genre}';
      testField  : String(10);

      @Semantics.amount.currencyCode: 'currency'
      price      : Decimal(15, 2)         @title: '{i18n>Price}';
      currency   : Currency;
      deleteFlag : Boolean;
}

entity Authors : managed {
  key ID           : Integer;
      name         : String(111) @mandatory;
      dateOfBirth  : Date;
      dateOfDeath  : Date;
      placeOfBirth : String;
      placeOfDeath : String;
      books        : Association to many Books
                       on books.author = $self;
}
