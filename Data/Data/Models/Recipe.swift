//
//  Recipe.swift
//  Data
//
//  Created by Clever Capa on 22-08-22.
//

public struct Location: Codable {
    public let departamento: String
    public let latitud: String
    public let longitud: String
}


public struct Recipe: Codable {
    public let id: Int
    public let nombre: String
    public let ingredientes: [String]
    public let preparacion: String
    public let imagen: String
    public let location: Location
    
    init(id: Int, nombre: String, ingredientes: [String], preparacion: String, imagen: String, location: Location) {
        self.id = id
        self.nombre = nombre
        self.ingredientes = ingredientes
        self.preparacion = preparacion
        self.imagen = imagen
        self.location = location
    }
    
    init(id: Int, nombre: String) {
        self.id = id
        self.nombre = nombre
        self.ingredientes = []
        self.preparacion = ""
        self.imagen = ""
        self.location = Location(departamento: "", latitud: "", longitud: "s")
    }
    
}
