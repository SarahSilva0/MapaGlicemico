//
//  OCKAnyEvent+Answer.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import Foundation

import CareKitStore

extension OCKAnyEvent {
    
    func answer(kind: String) -> Double {
        let values = outcome?.values ?? []
        let match = values.first(where: { $0.kind == kind })
        return match?.doubleValue ?? 0
    }
}
