//
//  AnaSayfaViewModel.swift
//  toDoApp
//
//  Created by Seda Gültekin on 14.08.2023.
//

import Foundation
import RxSwift
class AnaSayfaViewModel{
    var krepo = ToDoDaoRepository()
    var toDoList=BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    init(){
        veritabaniKopyala()
        toDoList = krepo.toDoList
       
        
    }
    
    func sil(toDo_id:Int){
        krepo.sil(toDo_id: toDo_id)
        yapilacaklaryukle()
    }
    func ara(aramaKelimesi :String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func yapilacaklaryukle(){
        krepo.yapilacaklariYukle()
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDo", ofType: ".sqlite")
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDo.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: veritabaniURL.path()){
            print("veritabani zaten var")
        }else{
            do {
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch{
                
            }
        }
    }
}
