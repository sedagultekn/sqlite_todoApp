//
//  AddToDo.swift
//  toDoApp
//
//  Created by Seda Gültekin on 3.08.2023.
//

import UIKit

class AddToDo: UIViewController {

    @IBOutlet weak var tfToDo: UITextField!
    @IBOutlet weak var tfTitle: UITextField!
    var viewModel = AddToDoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func ekleButton(_ sender: Any) {
        if let title = tfTitle.text,let toDo = tfToDo.text{
            viewModel.ekle(tf_title: title, tf_toDo: toDo)
            
        }
    }
    


}
