//
//  DetailViewModel.swift
//  toDoApp
//
//  Created by Seda Gültekin on 14.08.2023.
//

import Foundation
class DetailViewModel{
    
    var krepo = ToDoDaoRepository()
    
    func guncelle(toDo_id:Int,toDo_title:String,toDo_text:String){
        
        krepo.guncelle(toDo_id: toDo_id, toDo_title: toDo_title, toDo_text: toDo_text)
    }
}
