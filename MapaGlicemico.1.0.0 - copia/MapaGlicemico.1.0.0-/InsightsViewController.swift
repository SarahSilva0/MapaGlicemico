//
//  InsightsViewController.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import UIKit
import CareKit
import CareKitUI
import CareKitStore
import ResearchKit

final class InsightsViewController:
    OCKListViewController,
    OCKFeaturedContentViewDelegate,
    ORKTaskViewControllerDelegate {
    
    func didTapView(_ view: OCKFeaturedContentView) {
        
    }
    

    let storeManager: OCKSynchronizedStoreManager

    init(storeManager: OCKSynchronizedStoreManager) {
        self.storeManager = storeManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

        // A spacer view.
        appendView(UIView(), animated: false)


        let jejumSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.jejum.rawValue,
            legendTitle: "Jejum",
            gradientStartColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let cafeSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.cafe.rawValue,
            legendTitle: "Pós o café",
            gradientStartColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let barChartManha = OCKCartesianChartViewController(
            plotType: .bar,
            selectedDate: Date(),
            configurations: [jejumSeries,cafeSeries],
            storeManager: storeManager
            
        )
        barChartManha.chartView.headerView.titleLabel.text = "Glicemia da semana - Manhã"
        appendViewController(barChartManha, animated: false)
        
        let almocoJejumSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.almocoJejum.rawValue,
            legendTitle: "Antes do almoço",
            gradientStartColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let almoco2Series = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.almoco2.rawValue,
            legendTitle: "Pós almoço",
            gradientStartColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let barChartAlmoco = OCKCartesianChartViewController(
            plotType: .bar,
            selectedDate: Date(),
            configurations: [almocoJejumSeries,almoco2Series],
            storeManager: storeManager
            
        )
        barChartAlmoco.chartView.headerView.titleLabel.text = "Glicemia da semana - Almoço"
        appendViewController(barChartAlmoco, animated: false)
        
        
        let JantarJejumSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.Jantar.rawValue,
            legendTitle: "Antes do jantar",
            gradientStartColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let jantar2Series = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.Jantar2.rawValue,
            legendTitle: "Pós Jantar",
            gradientStartColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let barChartJantar = OCKCartesianChartViewController(
            plotType: .bar,
            selectedDate: Date(),
            configurations: [JantarJejumSeries,jantar2Series],
            storeManager: storeManager
            
        )
        barChartJantar.chartView.headerView.titleLabel.text = "Glicemia da semana - Jantar"
        appendViewController(barChartJantar, animated: false)
        
        
        let deitarSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.Deitar.rawValue,
            legendTitle: "Antes de deitar",
            gradientStartColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let madrugadaSeries = OCKDataSeriesConfiguration(
            taskID: CareStoreReferenceManager.TaskIdentifiers.teste.rawValue,
            legendTitle: "Madrugada",
            gradientStartColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),
            gradientEndColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
            markerSize: 10,
            eventAggregator: .custom({ events in
                events
                    .first?
                    .answer(kind: Surveys.checkInGlicItemIdentifier)
                ?? 0
            })
        )
        
        let barChartNoite = OCKCartesianChartViewController(
            plotType: .bar,
            selectedDate: Date(),
            configurations: [deitarSeries,madrugadaSeries],
            storeManager: storeManager
            
        )
        barChartNoite.chartView.headerView.titleLabel.text = "Glicemia da semana - Noite"
        appendViewController(barChartNoite, animated: false)


        // A spacer view.
        appendView(UIView(), animated: false)
    }

    // MARK: OCKFeaturedContentViewDelegate



    // MARK: ORKTaskViewControllerDelegate

    func taskViewController(
        _ taskViewController: ORKTaskViewController,
        didFinishWith reason: ORKTaskViewControllerFinishReason,
        error: Error?) {

        taskViewController.dismiss(animated: true, completion: nil)
    }
}
