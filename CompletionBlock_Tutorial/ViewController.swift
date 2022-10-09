//
//  ViewController.swift
//  CompletionBlock_Tutorial
//
//  Created by hoonsbrand on 2022/10/09.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController - viewDidLoad() 호출됨")
        
        KRProgressHUD.show()
        
        sayHi(completion: { result in
            print("completion block으로 넘겨받았음 : \(result)")
            KRProgressHUD.showSuccess()
            self.mainTitle.text = "Completion Block 완료"
        })
    }
    
    fileprivate func sayHi(completion: @escaping (String) -> ()) {
        
        print("ViewController - sayHi() 호출됨")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            completion("하이")
        }
    }
}

