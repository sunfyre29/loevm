const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");


const logMessage = async (req) => {
    const { Books } = cds.entities("my.bookshop");
    const { ID } = req.data;

  
   const checkedBook = await SELECT.from(Books).where({ ID });

   if (checkedBook.length > 0) {
    log("Eintrag GEFUNNNNNNNNNNNNNNNNNNNNNNNNNNDEN")
   }



    
}

module.exports = { logMessage }