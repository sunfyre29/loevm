
const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");
const {
    logMessage
} = require('./deleteHandler');
//const { Books } = cds.entities("my.bookshop");


log.debug("is starting....")


const isAnnotated = (entity) => (
    (entity['@loekz']
        || entity.elements && Object.values(entity.elements).some(e => e['@loekz'])) && entity.query?.SET?.op !== 'union'
)



cds.once('served', () => {

    for (const srv of cds.services) {
        for (const entity of Object.values(srv.entities)) {
            if (isAnnotated(entity)) {

                cds.db.before("DELETE", entity, checkAnnotation)
                cds.db.before("DELETE", entity, setDeleteFlag)
            }
        }
    }


    for (const srv of cds.services) {
        for (const entities of srv.entities) {
            if (entities['@loekz']) {
                srv.after('each', entities, (item) => {
                    // item.deleteFlag = true;
                    console.log("Hi")
                })
                //Log annotierte Entitäten

                console.log(entities.name);

            }
            for (const key in entities.elements) {
                if (Object.hasOwnProperty.call(entities.elements, key)) {

                    const element = entities.elements[key];

                    if (element['@loekz']) {
                        //Log annotierte Felder
                        //console.log("NEW")
                        //console.log(element);
                        srv.after('each', entities, (item) => {

                            // item.deleteFlag = true;

                        });
                    }
                }
            }
        }
    }
});


async function checkAnnotation(req) {
    console.log(`DELETE blockiert ${req.target.name} data:`, req.data);

    req.error(403, `Die Enität ist mit @loekz annotiert und kann nicht gelöscht werden`);
}

async function setDeleteFlag(req) {


    for (const srv of cds.services) {
        for (const entities of srv.entities) {

            if (req.target.elements.deleteFlag) {
                await cds.update(entities)  // irgendwann mus hier rein, was du pdaten kannst
                    .set({ deleteFlag: true })
                    .where({ ID: req.data.ID });

                console.log(`deleteFlag set to true for ID: ${req.data.ID}`);
            } else {
                console.warn(`deleteFlag not found ${req.target.name}`);
            }
        }
    }
}



