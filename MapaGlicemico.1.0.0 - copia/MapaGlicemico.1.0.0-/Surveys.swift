//
//  Surveys.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import CareKitStore
import ResearchKit

struct Surveys {

    private init() {}

    // MARK: Onboarding
    
    static let checkInIdentifier = "checkin"
    static let checkInFormIdentifier = "checkin.form"
    static let checkInGlicItemIdentifier = "checkin.form.glic"
    static let checkInRefeicaoItemIdentifier = "checkin.form.refeicao"

    static func onboardingSurvey() -> ORKTask {

       
        let glicFormat1 = ORKFormItem(identifier: checkInGlicItemIdentifier, text: "Glicemia: ", answerFormat: ORKAnswerFormat.decimalAnswerFormat(withUnit: "mg/dL"), optional: false)
        glicFormat1.detailText = "Insira o valor da glicemia."
        


        let formStep = ORKFormStep(identifier: checkInFormIdentifier, title: "Vamos começar?", text: "Por favor insira as informações.")
        formStep.formItems = [glicFormat1]
        formStep.isOptional = false
        
        
        
        let surveyTask = ORKOrderedTask(identifier: checkInIdentifier, steps: [formStep])
       
        return surveyTask
       

   
    }

    static func extractAnswersFromCheckSurvey(_ result: ORKTaskResult) -> [OCKOutcomeValue]? {
    
    
            guard
    
                let response = result.results?.compactMap({$0 as? ORKStepResult}).first(where: { $0.identifier == checkInFormIdentifier}),
    
                    let numericResult = response.results?.compactMap({$0 as? ORKNumericQuestionResult}),
    
                    let glicAnswer = numericResult.first(where: {$0.identifier == checkInGlicItemIdentifier})?.answer
    
    
            else{
    
                assertionFailure("Failed to extract answers from check in survey!")
                return nil
    
            }
    
            var glicValue = OCKOutcomeValue(Double(truncating: glicAnswer as! NSNumber))
            glicValue.kind = checkInGlicItemIdentifier
    
    
            return [glicValue]
    }

}
