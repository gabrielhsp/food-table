//
//  ComidinhasTableViewCell.swift
//  TabelinhaDeComidas
//
//  Created by Gabriel Henrique Santos Pereira on 02/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ComidinhasTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewComida: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelCalorias: UILabel!
    @IBOutlet weak var textViewDescricao: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
