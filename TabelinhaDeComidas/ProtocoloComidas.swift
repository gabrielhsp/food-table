//
//  ProtocoloComidas.swift
//  TabelinhaDeComidas
//
//  Created by Gabriel Henrique Santos Pereira on 02/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import Foundation

struct ComidasDoMundo: Decodable {
    var comidasDoMundo: [AtributosDeComida]
    
    enum CodingKeys: String, CodingKey {
        case comidasDoMundo = "comidas_do_mundo"
    }
}

extension ComidasDoMundo {
    static func parse(_ data: Data) -> ComidasDoMundo {
        var comidasDoMundo = ComidasDoMundo(comidasDoMundo: [AtributosDeComida]())
        
        do {
            comidasDoMundo = try JSONDecoder().decode(ComidasDoMundo.self, from: data)
        } catch let error {
            print("DEU ERRO PLAYBOY \(error)")
        }
        
        return comidasDoMundo
    }
}

struct AtributosDeComida: Decodable {
    var nomeDaComida: String?
    var calorias: Int?
    var descricaoDaComida: String?
    var imagem: String?
    
    enum CodingKeys: String, CodingKey {
        case nomeDaComida = "nome"
        case calorias
        case descricaoDaComida = "descricao"
        case imagem
    }
    
    init(from decoder: Decoder) throws {
        let valores = try decoder.container(keyedBy: CodingKeys.self)
        
        nomeDaComida = try valores.decodeIfPresent(String.self, forKey: .nomeDaComida)
        calorias = try valores.decodeIfPresent(Int.self, forKey: .calorias)
        descricaoDaComida = try valores.decodeIfPresent(String.self, forKey: .descricaoDaComida)
        imagem = try valores.decodeIfPresent(String.self, forKey: .imagem)
    }
}
