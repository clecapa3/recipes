//
//  DataConstants.swift
//  Data
//
//  Created by Clever Capa on 12-07-22.
//
enum DatainConstans {
    static let empty = ""
}


struct NetworkSettings {
    static let host = "https://7bd41459-86f3-4394-8ca8-b0a1fe7f15be.mock.pstmn.io/"
    static let apiVersion = "v1/"
}

enum EndPoints: String {
    
    case recipes = "recipes"
    var value: String {
        switch self {
        case .recipes:
            return "\(NetworkSettings.host)\(NetworkSettings.apiVersion)\(self.rawValue)"
        }
    }
}
