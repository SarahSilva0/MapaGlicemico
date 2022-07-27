//
//  OCKStore.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import Foundation
import CareKit
import CareKitStore

extension OCKStore{
    
    
    func mapaGlicemico(){
        
        let thisMorning = Calendar.current.startOfDay(for: Date())
        guard let beforeBreakfast = Calendar.current.date(byAdding: .hour, value: 8, to: thisMorning) else {
            return assertionFailure("Could not create time 8AM this morning")
        }

        //----------------------Madrugada----------------------------------
        
        let madrugadaSc = OCKSchedule(composing: [OCKScheduleElement(start: beforeBreakfast, end: nil, interval: DateComponents(day: 1 ), text: "Glicemia da madrugada", targetValues: [], duration: .allDay)])
        
        var MadrugadaTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.teste.rawValue, title: "Glicemia às 3 horas da manhã.", carePlanUUID: nil, schedule: madrugadaSc)
        
        MadrugadaTask.impactsAdherence = false
        MadrugadaTask.instructions = "As glicemias às 03:00 são essencias, principalmente para quem utiliza insulinas à noite e devem ser realizadas pelo menos uma vez por semana: neste horário o seu médico pode avaliar a ação da insulina que você utiliza e você pode descobrir se as glicemias estão ficando baixas enquanto você dorme."
        addTask(MadrugadaTask)
        
        //--------- GLICEMIA AO DEITAR---------
        
        let deitar = OCKSchedule(composing: [OCKScheduleElement(start: .now,
                                                                end: nil,
                                                                interval: DateComponents(day: 1),
                                                                text: "Glicemia ao deitar",
                                                                targetValues: [],
                                                                duration: .allDay)
                                            ])
        var deitarTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.Deitar.rawValue, title: "Antes de deitar.", carePlanUUID: nil, schedule: deitar)
        deitarTask.instructions = "Verifique a glicemia antes de dormir."
        addTask(deitarTask)
        
        
        
        
        let jantar2 = OCKSchedule(composing: [OCKScheduleElement(start: .now,
                                                                 end: nil,
                                                                 interval: DateComponents(day: 1),
                                                                 text: "Glicemia 2 horas após o jantar.", targetValues: [],
                                                                 duration: .allDay)
                                             ])
        var jantar2Task = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.Jantar2.rawValue, title: "Pós Jantar", carePlanUUID: nil, schedule: jantar2)
        jantar2Task.instructions = "Verifique a glicemia 2 horas após o jantar."
        addTask(jantar2Task)
        
        //-------- GLICEMIA JANTAR---------
        
        let jantar = OCKSchedule(composing: [OCKScheduleElement(start: .now,
                                                                end: nil,
                                                                interval: DateComponents(day: 1),
                                                                text: "Glicemia antes do jantar.",
                                                                targetValues: [],
                                                                duration: .allDay)
                                            ])
        var jantarTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.Jantar.rawValue, title: "Jantar", carePlanUUID: nil, schedule: jantar)
        jantarTask.instructions = "Verifique a glicemia antes do jantar."
        addTask(jantarTask)
        
        //------------ 2H APÓS O ALMOCO-------------
        
        let almoco2 = OCKSchedule(composing: [OCKScheduleElement(start: .now,
                                                                 end: nil,
                                                                 interval: DateComponents(day: 1),
                                                                 text: "Glicemia 2 horas após o almoço.", targetValues: [],
                                                                 duration: .allDay)
                                             ])
        
        var almoco2Task = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.almoco2.rawValue, title: "Pós almoço", carePlanUUID: nil, schedule: almoco2)
        almoco2Task.instructions = "Verifique a glicemia 2 horas após o almoço."
        addTask(almoco2Task)
        
        //--------------------------ANTES DO ALMOCO------------------
        
        let almocoJejum = OCKSchedule(composing: [
            OCKScheduleElement(start: .now,
                               end: nil,
                               interval: DateComponents(day: 1),
                               text: "Glicemia antes do almoço.",
                               targetValues: [],
                               duration: .allDay)
        ])
        
        var almocoTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.almocoJejum.rawValue, title: "Almoço", carePlanUUID: nil, schedule: almocoJejum)
        
        almocoTask.instructions = "Verifique a glicemia antes do almoço."
        addTask(almocoTask)
        
        // --------------------CAFE--------------------------------
        
        
        let Gliccafe = OCKSchedule(composing: [
            OCKScheduleElement(start: .now,
                               end: nil,
                               interval: DateComponents(day: 1),
                               text: "Glicemia 2 horas após o café.",
                               targetValues: [],
                               duration: .allDay)
        ])
        
        var cafeTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.cafe.rawValue, title: "Café", carePlanUUID: nil, schedule: Gliccafe)
        
        cafeTask.instructions = "Verifique a glicemia 2 horas após o café da manhã."
        addTask(cafeTask)
        
        
        //----------JEJUM-----------------------
        
        let jejumGlic = OCKSchedule(composing: [
            OCKScheduleElement(start: .now,
                               end: nil,
                               interval: DateComponents(day: 1),
                               text: "Glicemia em jejum.",
                               targetValues: [],
                               duration: .allDay)
        ])
        
        var jejumTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.jejum.rawValue, title: "Jejum", carePlanUUID: nil, schedule: jejumGlic)
        
        jejumTask.instructions = "Verifique a glicemia antes da primeira refeição."
        addTask(jejumTask)
        
        
        
    }
    
}
