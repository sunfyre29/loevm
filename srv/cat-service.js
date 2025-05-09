const cds = require("@sap/cds");



module.exports = cds.service.impl(function () {
this.on('setDeleteFlagTrue',async (req) => {

    const { Books } = this.entities;
    
    const result = await cds
      .transaction(req)                   
      .run(UPDATE(Books).set({ deleteFlag: false }));

    return result;
  }); 
});

