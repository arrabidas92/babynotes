//
//  BabyNotesRouter.swift
//  BabyNotes
//
//  Created by Alexandre DUARTE on 10/04/2024.
//

import SwiftUI

protocol Router {
    var navPath: NavigationPath { get set }
    func navigate(to route: Route)
    func navigateBack()
    func navigateToRoot()
}

@Observable
final class RouterImpl: Router {
    var navPath: NavigationPath = NavigationPath()
    
    func navigate(to route: Route) {
        navPath.append(route)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
        
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
