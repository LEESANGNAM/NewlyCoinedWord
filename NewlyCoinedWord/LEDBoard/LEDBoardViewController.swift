//
//  LEDBoardViewController.swift
//  NewlyCoinedWord
//
//  Created by 이상남 on 2023/07/24.
//

import UIKit

class LEDBoardViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ledTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ledTextField.delegate = self
        languageChage() // 버튼의 타이틀 업데이트
        // Do any additional setup after loading the view.
    }
    
    // 현재 키보드의 인풋모드를 받아오는 메서드
    func getTextInputMode() -> String? {
        guard let textInputMode = UITextInputMode.activeInputModes.first else { return nil }
        return textInputMode.primaryLanguage
    }
    // ???:  입력모드를 받아서 바꾸고 싶었으나(한영전환) textInputMode는 읽기전용이라 변경 불가능 조금더 고민해봐야함
    func languageChage() {
        // 입력 모드를 받아서
        if let inputMode = ledTextField.textInputMode?.primaryLanguage {
            if inputMode == "ko-KR" { // 한글이면 버튼 텍스트를 한글로 띄우고
                languageButton.setTitle("한글", for: .normal)
            } else { // 영어면 버튼 텍스트를 영어로 띄우고
                languageButton.setTitle("영어", for: .normal)
            }
        }
        
    }
    
    // 텍스트가 변경 될 때 마다 호출되는 메서드
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        languageChage()
        return true
    }
    

 
    
    
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
