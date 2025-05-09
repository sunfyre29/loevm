
const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");
const {
    setFlagTrue
} = require('./deleteHandler');

log.debug("is starting....")

//check if Entity is annotated
const isAnnotated = (entity) => (
    (entity['@loekz']
        || entity.elements && Object.values(entity.elements).some(e => e['@loekz'])) && entity.query?.SET?.op !== 'union'
)

cds.once('served', () => {

    for (const srv of cds.services) {
        for (const entity of Object.values(srv.entities)) {
            if (isAnnotated(entity)) {

                srv.before("DELETE", entity, setFlagTrue)
            }
        }
    }

});







