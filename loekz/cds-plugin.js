
const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");

log.debug("is starting....")

//check if Entity is annotated and not inside a Union
const isAnnotated = (entity) => (
    (entity['@loekz']
        || entity.elements && Object.values(entity.elements).some(e => e['@loekz'])) && entity.query?.SET?.op !== 'union'
)

cds.once('served', () => {  //Services und Entitäten müssen ERST geladen werden, bevor sie verarbeitet werden können

    for (const srv of cds.services) {  // schau in den Services welche Entitäten aus den Services annotiert sind
        for (const entity of Object.values(srv.entities)) {
            if (isAnnotated(entity)) {

                ///srv.after("DELETE", entity, setFlagTrue)
                entity['@UI.DeleteHidden'] = true;


            }
        }
    }

});




