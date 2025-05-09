using my.bookshop as my from '../db/schema';

service CatalogService {
        @Capabilities       : {
        DeleteRestrictions.Deletable : true,
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable : true,
    }
    @odata.draft.enabled: true
    entity Books      as projection on my.Books;


    entity Authors as projection on my.Authors;

    action setDeleteFlagTrue() returns Boolean;


}
