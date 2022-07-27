//
//  CareStoreReferenceManager.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import Foundation
import CareKit
import CareKitStore

final class CareStoreReferenceManager {
    
    enum TaskIdentifiers: String, CaseIterable {
     
        case teste
        case Deitar
        case Jantar2
        case Jantar
        case almoco2
        case almocoJejum
        case cafe
        case jejum
        
    }
    
    static let shared = CareStoreReferenceManager()
    

    lazy var synchronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "MapaGlicemico0")
        store.mapaGlicemico()
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()
    
    private init() {}
    
    
}
