const cds = require('@sap/cds');
const log = cds.log("LOEKZ Plugin");

log.debug("is starting....")

log("hello from the plugin side of life")

cds.on('served', services => {

    const basicInfo = x => [x.name, x.kind]
    const isAppService = x => x.kind == 'app-service'
    const loekzElements = en => ({

        name: en.name,
        entity: en,
        elements: [...en.elements].filter(el => el['@loekz']).map(el => el.name)
    })


    const myservices = [...services].filter(isAppService)

    //loggt und mappt alle Entitäten die  @loekz annotation haben
    myservices.forEach(s => {
        [...s.entities]
            .map(loekzElements)
            .filter(x => x.elements.length)
            .forEach(en => {
                log(en.name)
                s.after('READ', en.name, records => {
                    records.forEach(r => {
                        en.elements.forEach(el => {
                            log("hi")
                           r[el] = r[el].toUpperCase() // schreibt annotierte Felder in UPPERCASE
                            
                        })
                    })
                })
                })
            })
    })


