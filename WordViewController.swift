//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by 이상남 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {
    
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var mainResultLavel: UILabel!
    
    
    @IBOutlet var wordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        wordTextField.text = getRandomString()
        
        
        wordButton.titleLabel?.font = .systemFont(ofSize: 20)
        wordButton.titleLabel?.textColor = .black

        // Do any additional setup after loading the view.
    }
    
    @discardableResult // 값을 써도 되고 안써도된다.
    func getRandomString() -> String {
        let random = ["고래밥","칙촉","카스타드","메로나","월드콘"]
        let result = random.randomElement()!
        return result
    }
    
    
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        
        wordTextFieldTapped(wordTextField)
    }
    
    
    @IBAction func wordTextFieldTapped(_ sender: UITextField) {
//        if wordTextField.text == "단어1"{
//            mainResultLavel.text = "단어1 뜻은 뭘까요."
//        }else if wordTextField.text == "단어2"{
//            mainResultLavel.text = "단어2 뜻은 뭘까요."
//        }else if wordTextField.text == "단어3"{
//            mainResultLavel.text = "단어3 뜻은 뭘까요."
//        }else{
//            mainResultLavel.text = "찾는 결과가 없습니다."
//        }
        
        switch wordTextField.text {
        case "단어1":
            mainResultLavel.text = "단어1 뜻은 뭘까요."
        case "단어2":
            mainResultLavel.text = "단어2 뜻은 뭘까요."
        case "단어3":
            mainResultLavel.text = "단어3 뜻은 뭘까요."
        default:
            mainResultLavel.text = "결과가 없습니다."
        }
        
        
        
    }
    
   
}
