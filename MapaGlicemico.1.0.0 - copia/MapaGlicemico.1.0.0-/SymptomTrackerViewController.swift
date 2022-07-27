//
//  SymptomTrackerViewController.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import UIKit
import CareKit
import CareKitStore
import CareKitUI
import ResearchKit



final class SymptomTrackerViewController: OCKDailyPageViewController {
    
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController,
                                              prepare listViewController: OCKListViewController, for date: Date) {
            
            let identifiers = CareStoreReferenceManager.TaskIdentifiers.allCases.map { $0.rawValue }
            var query = OCKTaskQuery(for: date)
            query.ids = identifiers
            query.excludesTasksWithNoEvents = true
            
            storeManager.store.fetchAnyTasks(query: query, callbackQueue: .main) { result in
                guard let tasks = try? result.get() else { return }
                
                tasks.forEach { task in
                    
                    switch task.id {
                   
                    case CareStoreReferenceManager.TaskIdentifiers.teste.rawValue:
                        
                        let maduCard = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(maduCard, animated: false)
                        
                    case CareStoreReferenceManager.TaskIdentifiers.Deitar.rawValue:
                        
                        let deitarCard = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(deitarCard, animated: false)
                        
                    case CareStoreReferenceManager.TaskIdentifiers.Jantar2.rawValue:
                        
                        let Jantar2Card = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(Jantar2Card, animated: false)
                        
                    case CareStoreReferenceManager.TaskIdentifiers.Jantar.rawValue:
                        
                        let JantarCard = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(JantarCard, animated: false)
                        
                    case CareStoreReferenceManager.TaskIdentifiers.almoco2.rawValue:
                        
                        let almoco2Card = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(almoco2Card, animated: false)
                        
                        case CareStoreReferenceManager.TaskIdentifiers.almocoJejum.rawValue:
                            
                            let almocoCard = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                            
                            listViewController.appendViewController(almocoCard, animated: false)
                        
                    case CareStoreReferenceManager.TaskIdentifiers.cafe.rawValue:
                        
                        let cafeCard = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(cafeCard, animated: false)
                        
                        
                    case CareStoreReferenceManager.TaskIdentifiers.jejum.rawValue:
                        
                        let jejumCard = OCKSurveyTaskViewController(task: task, eventQuery: OCKEventQuery(for: date), storeManager: self.storeManager, survey: Surveys.onboardingSurvey(), viewSynchronizer: SurveyViewSynchronizer(), extractOutcome: Surveys.extractAnswersFromCheckSurvey)
                        
                        listViewController.appendViewController(jejumCard, animated: false)
                        
                        
                        
                   
                    
                        
                
                        
                        
                    default: return
                    }
                }
            }
        }
    

   
    final class SurveyViewSynchronizer: OCKSurveyTaskViewSynchronizer {

        override func updateView(
            _ view: OCKInstructionsTaskView,
            context: OCKSynchronizationContext<OCKTaskEvents>) {

            super.updateView(view, context: context)
                //MUDA O NOME DO BOTAO
                view.completionButton.label.text = "Começar"
                
                
                

            if let event = context.viewModel.first?.first, event.outcome != nil {
                view.instructionsLabel.isHidden = false
            
                
                let glic = event.answer(kind: Surveys.checkInGlicItemIdentifier)
                //MUDA O NOME DO BOTAO
                view.completionButton.label.text = "Feito"
                view.instructionsLabel.text = """
                    Valor da Glicemia: \(Int(glic)) mg/dL
                    """
            } else {
                view.instructionsLabel.isHidden = true
            }
        }
    }
    
}


