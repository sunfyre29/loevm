namespace my.bookshop;
using { Currency } from '@sap/cds/common';


entity Books {
  key ID : Integer;
  title  : String (100) @title: '{i18n>Title}';
  stock  : Integer @title: '{i18n>Stock}';
  bestseller : Boolean @title: '{i18n>Bestseller}';
  author : String (100) @title: '{i18n>Author}';
  genre: String (100) @title: '{i18n>Genre}';
  @Semantics.amount.currencyCode: 'currency'
  price: Decimal @title: '{i18n>Price}';
  currency_code : Currency;
}
