//
//  ViewController.swift
//  DotaScore
//
//  Created by Mike Ulanov on 05.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let mainManager = MainManager.shared
        mainManager.fetchData(id: 7521776248) { result in
            switch result {
            case .success(let dotaMatch):
                // Обработка успешного ответа
                print(dotaMatch)
            case .failure(let error):
                // Обработка ошибки
                print(error)
            }
        }
        print("hello dota")
    }
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

