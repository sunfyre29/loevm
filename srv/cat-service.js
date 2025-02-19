const cds = require("@sap/cds");

module.exports = cds.service.impl(async function (srv) {

    const { Books } = srv.entities;

    srv.after('READ', 'Books', setFlagFalse);

    function setFlagFalse(books) { 
        if (!Array.isArray(books)) {
            books = [books]; // Convert single object to an array
        }
        books.forEach(book => {
            book.deleteFlag = false;
        });
    }

});

