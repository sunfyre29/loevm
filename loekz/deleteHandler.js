const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");


const setFlagTrue = async (req, next) => {
    const { target, data } = req;

    if (target.elements.deleteFlag) {
        const { deleteFlag } = target.elements;
        const entityName = target.name;  
        const keyName = Object.keys(target.keys)[0]; 

        try {
            const result = await cds.update(entityName)
                .set({ deleteFlag: true })
                .where({ [keyName]: data[keyName] });

            console.log("Update-Ergebtnis:", result);

            // Wenn das Ergebnis leer oder nicht erfolgreich ist
            if (!result || result === 0) {
                console.log("DB wurde nicht aktualisiert");
            } else {
                req.reply(`Die Entität wurde nicht gelöscht. Stattdessen wurde ein Löschkennzeichen gesetzt.`);
                //req.reject(400, `Die Entität wurde nicht gelöscht. Stattdessen wurde ein Löschkennzeichen gesetzt.`);
               
            }

        } catch (error) {
            console.error("Update-Fehler:", error);
            req.reject(500, `Ein Fehler trat beim Setzen des Löschkennzeichens auf: ${error.message}`);
        }
    }  
}






module.exports = {  setFlagTrue };

