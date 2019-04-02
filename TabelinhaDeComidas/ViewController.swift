//
//  ViewController.swift
//  TabelinhaDeComidas
//
//  Created by Gabriel Henrique Santos Pereira on 02/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let arquivoJSON = Bundle.main.url(forResource: "Comidas", withExtension: "json")!
        let dadosDoJSON: Data = try! Data(contentsOf: arquivoJSON)
        let comidas = ComidasDoMundo.parse(dadosDoJSON)
        
        print(comidas.comidasDoMundo)
    }
}

