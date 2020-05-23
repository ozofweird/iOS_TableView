//
//  ViewController.swift
//  TableView
//
//  Created by Ahn on 2020/05/23.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit

// 1.
struct Person {
    var name: String
    var phone: String
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var personList: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
// 3.
        // 위임
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Cell 연결
        let cellNib = UINib(nibName: "TableCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "TableCell")
        
        // 데이터 생성
        self.personList.append(Person(name: "홍길동1", phone: "010-0000-0001"))
        self.personList.append(Person(name: "홍길동2", phone: "010-0000-0002"))
        self.personList.append(Person(name: "홍길동3", phone: "010-0000-0003"))
        self.personList.append(Person(name: "홍길동4", phone: "010-0000-0004"))
        self.personList.append(Person(name: "홍길동5", phone: "010-0000-0005"))
    }

}

// 2.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList.count
    }
    
// 4.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = personList[indexPath.row].name
        cell.phoneLabel.text = personList[indexPath.row].phone
        
        return cell
    }
    
    
}
