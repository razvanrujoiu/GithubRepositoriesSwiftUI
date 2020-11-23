//
//  Resource.swift
//  GithubReposSwiftUI
//
//  Created by Razvan Rujoiu on 23.11.2020.
//

import SwiftUI

enum Resource<T> {
    case loading
    case success(T)
    case error(Error)
}

extension Resource {
    
    var loading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }
    
    var error: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
    
    var value: T? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }
}

extension Resource {
    
    func transform<S> (_ t:@escaping (T) -> S) -> Resource<S> {
        switch self {
        case .loading:
            return .loading
        case .error(let error):
            return .error(error)
        case .success(let value):
            return .success(t(value))
        }
    }
    
    func isLoading<Content: View>(@ViewBuilder content: @escaping () -> Content) -> Content? {
        if loading {
            return content()
        }
        return nil
    }
    
    func hasResource<Content: View>(@ViewBuilder content: @escaping (T) -> Content) -> Content? {
        if let value = value {
            return content(value)
        }
        return nil
    }
    
    func hasError<Content: View>(@ViewBuilder content: @escaping (Error) -> Content) -> Content? {
        if let error = error {
            return content(error)
        }
        return nil
    }
}
