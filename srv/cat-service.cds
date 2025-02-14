using my.bookshop as my from '../db/schema';

service CatalogService {
        @Capabilities       : {
        DeleteRestrictions.Deletable : false,
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable : true,
    }
    @odata.draft.enabled: true
    entity Books      as projection on my.Books;

    entity DeleteFlag as projection on my.DeleteFlag;

}
