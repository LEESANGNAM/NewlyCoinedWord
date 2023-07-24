//
//  LEDBoardViewController.swift
//  NewlyCoinedWord
//
//  Created by 이상남 on 2023/07/24.
//

import UIKit

class LEDBoardViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ledTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    
    var isBlinking = false // 반짝이는 상태
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ledTextField.delegate = self
        setUpLabel()
        setUpButton(button: resultButton, title: "보내기")
        setUpButton(button: languageButton, title: "반짝")
    }
    
    func setUpButton(button: UIButton, title: String){
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        
    }
    
    func setUpLabel(){
        resultLabel.text = "글자를 입력해주세요"
        resultLabel.numberOfLines = 1
        resultLabel.adjustsFontSizeToFitWidth = true //글자 크기 자동조정 활성화
        resultLabel.font = UIFont.boldSystemFont(ofSize: 150)
        resultLabel.textAlignment = .center
    }
    // 랜덤컬러
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
    func startBlinkingAnimation() {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                self.resultLabel.alpha = 0 // 라벨의 투명도를 0으로 설정하여 반짝이게 만듭니다.
            }, completion: nil)
        }
    
    func stopBlinkingAnimation() {
           self.resultLabel.layer.removeAllAnimations() // 애니메이션 멈춤 이거만 적용했더니 라벨이 사라짐
           self.resultLabel.alpha = 1 // 라벨의 투명도를 원래대로 복원 * 필수
       }
    
    // 반짝이면서 컬러바꾸기
    @IBAction func BlinkingLable(_ sender: UIButton) {
        isBlinking.toggle()
        resultLabel.textColor = RandomColor()
        if isBlinking{
            startBlinkingAnimation()
        }else {
            stopBlinkingAnimation()
        }
            
    }
    
    
    @IBAction func returnResult(_ sender: UITextField) {
        resultLabel.text = ledTextField.text
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        resultLabel.text = ledTextField.text
        view.endEditing(true)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func TapGestureTapped(_ sender: UITapGestureRecognizer) {
        topView.isHidden.toggle()
        view.endEditing(true)
    }
    
    
    // ???:  입력모드를 받아서 바꾸고 싶었으나(한영전환) textInputMode는 읽기전용이라 변경 불가능 조금더 고민해봐야함  생각해보니 여기선 필요 없을듯...
//    func languageChage() {
//        // 입력 모드를 받아서
//        if let inputMode = ledTextField.textInputMode?.primaryLanguage {
//            if inputMode == "ko-KR" { // 한글이면 버튼 텍스트를 한글로 띄우고
//                languageButton.setTitle("한글", for: .normal)
//            } else { // 영어면 버튼 텍스트를 영어로 띄우고
//                languageButton.setTitle("영어", for: .normal)
//            }
//        }
//
//    }
    
//    // 텍스트가 변경 될 때 마다 호출되는 메서드
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        languageChage()
//        return true
//    }
}
