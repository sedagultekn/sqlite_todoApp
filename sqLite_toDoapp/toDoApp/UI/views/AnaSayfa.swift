//
//  ViewController.swift
//  toDoApp
//
//  Created by Seda Gültekin on 3.08.2023.
//

import UIKit

class AnaSayfa: UIViewController {
var toDoList = [ToDo]()
    var viewModel = AnaSayfaViewModel()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        //let toDoModel = ToDo(toDo_title: "rudy",toDo_text: "rudye su vermeyi unutma!!!")
        _ = viewModel.toDoList.subscribe(onNext: { liste in
            self.toDoList = liste
            self.tableView.reloadData()
        })
   
    }
    override func viewWillAppear(_ animated: Bool) {
            viewModel.yapilacaklaryukle()
        }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="detail"{
            if let toDoModel = sender as? ToDo{
                let gidilecekVC = segue.destination as! Detail
                gidilecekVC.toDoModel = toDoModel
            }
        }
            
    }
}

extension AnaSayfa:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}
extension AnaSayfa:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toDoHucre") as! ToDoHucre
        hucre.toDoTextLabel.text = toDo.toDo_text
        hucre.toDoTitleLabel.text = toDo.toDo_title
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = toDoList[indexPath.row]
      performSegue(withIdentifier: "toDetay", sender: kisi)
      
        tableView.deselectRow(at: indexPath, animated: true) //secilen cellin gri arka planını kaldırmak
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //UISwipeActionsConfigurstion silmek ici gerekli nesneyi bekliyor
        let silAction=UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            let toDo=self.toDoList[indexPath.row]
            
            
            let alert = UIAlertController(title: "silme işlemi", message: "\(toDo.toDo_title) silinsin mi", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "iptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "evet", style: .destructive){  action in
                self.viewModel.sil(toDo_id:toDo.toDo_id!)
                
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
