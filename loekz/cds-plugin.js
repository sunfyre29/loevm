
const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");
const {
    logMessage
} = require('./deleteHandler');


log.debug("is starting....")




cds.once('served', () => {



    for (const srv of cds.services) {
        for (const entities of srv.entities) {
            if (entities['@loekz']) {
                srv.after('each', entities, (item) => {
                    item.deleteFlag = true;
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



//



// cds.once('served', () => {

//     for (const srv of cds.services) {
//         for (const entity of srv.entities) {
//             // Check if the entity has the @loekz annotation
//             // if (entity['@loekz']) {

//             //     console.log(entity.name);

//             // }
//             for (const key in entities.elements) {
//                 if (Object.hasOwnProperty.call(entities.elements, key)) {
//                     const element = entities.element[key];
//                     if (element['@loekz']) {
//                         console.log(element.name);
//                     }
//                 }
//             }
//         }
//     }


// });





















/* cds.on('served', services => {

    const basicInfo = x => [x.name, x.kind]
    const isAppService = x => x.kind == 'app-service'
    const loekzElements = en => ({

        name: en.name,
        entity: en,
        elements: [...en.elements].map(el => el.name) // [...en.elements].filter(el => el['@loekz']).map(el => el.name)
    })


    const myservices = [...services].filter(isAppService)

    myservices.forEach(s => {
        [...s.entities]
            .map(loekzElements)
            .filter(x => x.elements.length)
            .forEach(en => {

                const isAnnotated = en => !!en['@loekz']; // Returns true if ENTITY has @loekz
                const annotatedEntities = [...s.entities].filter(isAnnotated);

                annotatedEntities.forEach(en => {
                    log("Annotierte Entität:", en.name);
                });
                

            })
    })
}) */


