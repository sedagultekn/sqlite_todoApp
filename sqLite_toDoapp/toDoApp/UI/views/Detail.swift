//
//  Detail.swift
//  toDoApp
//
//  Created by Seda Gültekin on 3.08.2023.
//

import UIKit

class Detail: UIViewController {
    var toDoList = [ToDo]()
    @IBOutlet weak var guncelleButton: UIButton!
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tfToDo: UITextField!
    var viewModel = DetailViewModel()
    var toDoModel: ToDo?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = toDoModel {
            tfTitle.text = t.toDo_text
            tfToDo.text = t.toDo_title
            
        }
    }

    @IBAction func guncelleButton(_ sender: Any) {
    
    
        if let title = tfTitle.text,let toDo = tfToDo.text,let t = toDoModel {
            viewModel.guncelle(toDo_id :t.toDo_id!,toDo_title: title, toDo_text: toDo)
        }
    }
    
}


