//
//  ViewController.swift
//  TabelinhaDeComidas
//
//  Created by Gabriel Henrique Santos Pereira on 02/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewComidinhas: UITableView!
    
    // Here we create an empty attribute that receives an array of AtributosDeComida
    var arrayDeComidas = [AtributosDeComida]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewComidinhas.delegate = self
        tableViewComidinhas.dataSource = self
        
        let nibDaCelula = UINib(nibName: "ComidinhasTableViewCell", bundle: nil)
        tableViewComidinhas.register(nibDaCelula, forCellReuseIdentifier: "comidinhasCell")
        
        // We catch the return of the retornaArrayDeComidas method and storage inside arrayDeComidas variable
        self.arrayDeComidas = self.retornaArrayDeComidas()
    }
    
    // This method reads the Comidas.json file
    // After read the file, we make a parse of this file using ComidasDoMundo class
    // In case of the parse returns true, the file is parsed and the method returns an array of AtributosDeComida type
    func retornaArrayDeComidas() -> [AtributosDeComida] {
        let arquivoJSON = Bundle.main.url(forResource: "Comidas", withExtension: "json")!
        let dadosDoJSON: Data = try! Data(contentsOf: arquivoJSON)
        let comidas = ComidasDoMundo.parse(dadosDoJSON)
        
        return comidas.comidasDoMundo
    }
}

// Here we create an extension that will extend the UITableViewDataSource and UITableViewDelegate protocol
// After create the extension, we need to implement the methods that are inside this protocols
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // Here we return the number of sections present inside our UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Here we return the number of items inside arrayDeComidas attribute
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDeComidas.count
    }
    
    // Here we return our ComidinhasTableViewCell.xib and convert him to ComidinhasTableViewCell swift type
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comidinhasCell") as! ComidinhasTableViewCell
        
        return cell
    }
    
    // Here we add the height of our TableCellView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139
    }
}
