namespace my.bookshop;

using {
  Currency,
  managed,
  cuid
} from '@sap/cds/common';


entity Books : managed {
  key ID            : Integer;
      title         : String(100) @title: '{i18n>Title}';
      stock         : Integer     @title: '{i18n>Stock}';
      bestseller    : Boolean     @title: '{i18n>Bestseller}';
      author        : String(100) @title: '{i18n>Author}';
      genre         : String(100) @title: '{i18n>Genre}';

      @Semantics.amount.currencyCode: 'currency'
      price         : Decimal     @title: '{i18n>Price}';
      currency_code : Currency;
      deleteFlag    : Association to DeleteFlag @title: '{i18n>deleteFlag}';
}

@title: '{i18n>deleteFlag}'
entity DeleteFlag : cuid {
  EntityID   : Integer;
  isActive   : Boolean @title: '{i18n>isActive}';
  EntityType : String;
  DeletedAt  : Timestamp; // Zeitpunkt der Löschung
  Reason     : String(150); // Optionaler Grund für das Löschen

}
