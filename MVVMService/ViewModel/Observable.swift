//
//  Observable.swift
//  MVVMService
//
//  Created by Marcello Chuahy on 14/11/21.
//

import Foundation

class Observable<T> {
    
    // MARK: - Typealias
    typealias Listener = (T?) -> Void

    // MARK: - Properties
    private var listeners: [(Listener)] = []
    var value: T? { didSet { listeners.forEach { $0(value) } } }

    // MARK: - Initializers
    init(_ value: T?) { self.value = value }

    // MARK: - Methods
    func bind(_ listener: @escaping Listener) {
        listener(value)
        self.listeners.append(listener)
    }
  
}
