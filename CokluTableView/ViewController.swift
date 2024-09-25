//
//  ViewController.swift
//  CokluTableView
//
//  Created by Sait Demirel on 25.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelViewSehirler: UITableView!
    @IBOutlet weak var tabelViewUlkeler: UITableView!
    
    var ulkeler:[String] = [String]()
    var sehirler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ulkeler = ["Türkiye","Amerika","Kanada","İngiltere","Japonya"]
        sehirler = ["İstanbul","LosAngeles","Toronto","Londra","Tokyo"]
        
        tabelViewUlkeler.delegate = self
        tabelViewUlkeler.dataSource = self
        
        tabelViewSehirler.delegate = self
        tabelViewSehirler.dataSource = self
        
    }
    

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //1 satırı var.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // şimdi 2 tane veri kümesi olduğu için if ile hangisini seçtiğini belirlenmeli
        var veriSayisi:Int?
        
        if tableView == tabelViewUlkeler {
            veriSayisi = ulkeler.count
        }
        
        if tableView == tabelViewSehirler {
            veriSayisi = sehirler.count
        }
        
        return veriSayisi!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        //UITableViewCell sınıfından bir değişken oluşturulmalı
        
        if tableView == tabelViewUlkeler {
            cell = tableView.dequeueReusableCell(withIdentifier: "hucre1", for: indexPath)
            
            cell!.textLabel?.text = ulkeler[indexPath.row]
            
            
        }
        
        if tableView == tabelViewSehirler {
            cell = tableView.dequeueReusableCell(withIdentifier: "hucre2", for: indexPath)
            
            cell?.textLabel?.text = sehirler[indexPath.row]
        }
        return cell!
    }
    
    //şimdi cell-leri seçme metodunu yazmalıyız.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableViewUlkelerse şunu yap tableViewSehirler ise bunu yap diyeceğiz.
        if tableView == tabelViewUlkeler {
            print("Seçilen Ülke: \(ulkeler[indexPath.row])")
        }
        
        if tableView == tabelViewSehirler {
            print("Seçilen Şehir: \(sehirler[indexPath.row])")
        }
    }
    
}
