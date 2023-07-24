//
//  NewWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 이상남 on 2023/07/20.
//

import UIKit

class NewWordViewController: UIViewController {
    
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var searchTextField: UITextField!
    
    
    @IBOutlet var listButtons: [UIButton]!
    
    var newWord: [String: String] = [:]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // 설정 함수
    func configUI(){
        setUpdate()
        setUplistButton()
        setUpResultLabel()
        setUpSearchTextField()
        listButtonTitleReset()
    }
    
    // 결과창 라벨 UI설정
    func setUpResultLabel(){
        resultLabel.backgroundColor = UIColor.systemGray6
        resultLabel.layer.borderWidth = 2
        resultLabel.layer.cornerRadius = 5
        resultLabel.clipsToBounds = true
        resultLabel.textAlignment = .center 
        resultLabel.numberOfLines = 0
        resultLabel.text = "궁금한 신조어를 검색하거나 선택해주세요"
    }
    
    // 텍스트필드 UI설정
    func setUpSearchTextField(){
        searchTextField.placeholder = "여기에 입력해주세요"
        searchTextField.borderStyle = .line
    }
    
    // 버튼 리셋함수
    func listButtonTitleReset(){
        var testList: [String] = Array(newWord.keys) // 키만뽑기
        for button in listButtons{ // 버튼 한개당 키뽑은 배열의 인덱스를 랜덤으로 뽑아
//            let index = Int.random(in: button.tag - 10...button.tag - 5) 갯수가 한정적임
            let index = Int.random(in: 0...testList.count - 1)
            let title = testList.remove(at: index) // 삭제한걸 반환받는다. 나왔던게 또 나올 수 가 없다.
            button.setTitle(title, for: .normal)
        }
    }
    
    // 버튼 갯수만큼 설정반복
    func setUplistButton() {
        for button in listButtons{
            setupButton(button: button)
        }
    }
    
    // 버튼 UI설정
    func setupButton(button: UIButton){
        button.setTitleColor(.black, for: .normal)
        
        button.setTitleColor(.red, for: .highlighted)
        
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.layer.cornerRadius = 5
        button.sizeToFit() // 라벨의 넓이를 텍스트에 맞게 조정
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.titleLabel?.numberOfLines = 1
        
    }
    
    // 검색 버튼 이벤트
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        checkTextValidity(text: searchTextField.text)
    }
    // 키보드 리턴키 이벤트
    @IBAction func searchTextFieldTapped(_ sender: UITextField) {
        checkTextValidity(text: searchTextField.text)
    }
    // 랜덤 단어 리스트 버튼 이벤트
    @IBAction func ListButtonTapped(_ sender: UIButton) {
        checkTextValidity(text: sender.currentTitle)
    }
    // 뷰 제스처
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // 텍스트필드의 텍스트를 받으면 옵셔널 타입이다.
    // 옵셔널 바인딩을 통해 값이 바인딩 되거나, 바인딩된 값이 빈값이 아니고(""), 딕셔너리에 있는 항목이면
    func checkTextValidity(text checktext: String?){
        // 넘어온 텍스트 값의 공백을 제거 한 후 검사.
        guard let text = checktext?.replacingOccurrences(of: " ", with: ""), !text.isEmpty, let resultText = newWord[text]
        else {// 아니라면 텍스트필드 지우고 얼럿 생성하는 함수로 이동
            showAlert(word: checktext?.replacingOccurrences(of: " ", with: ""));
            searchTextField.text = ""
            return
            
        }
        // 값 을 알려주고 초기화
        resultLabel.text = resultText
        searchTextField.text = ""
        // 버튼도 초기화
        listButtonTitleReset()
    }
    // 얼럿 생성함수.
    func showAlert(word: String?){
        // 위에서 넘어온 텍스트 값이 빈값이 아니라면 입력받은값 표시
        if let word,!word.isEmpty{
            let alert = UIAlertController(title: "\(word)는 없는 신조어 입니다.", message: "추가예정입니다.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        }else{// "" 빈문자열로 넘어와서 바인딩이 됐을경우 텍스트 입력경고
            let alert = UIAlertController(title: "경고", message: "텍스트를 입력해주세요", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
            
        }
    }
    
    
    func setUpdate(){
        newWord = [
            "갑분싸": "갑자기 분위기 싸하다.",
            "갑통알": "갑자기 통장을 보니 알바 해야겠다",
            "구취": "구독 취소",
            "남아공": "남아서 공부나 해라",
            "만반잘부": "만나서 반가워 잘 부탁해",
            "분조카": "분위기 좋은 카페",
            "불소": "불타는 소통",
            "애빼시": "애교 빼면 시체",
            "오운완": "오늘 운동 완료",
            "점메추": "점심 메뉴 추천",
            "저메추": "저녁 메뉴 추천",
            "주불": "주소 불러  의 줄임말",
            "스불재": "스스로 불러온 재앙 의 줄임말",
            "내또출": "내일 또 출근",
            "삼귀다": "사귀다의 사를 삼으로 바꾼 말로, 사귀기전의 썸을 타는 단계를 뜻하는 말",
            "나심비": "가심비의 가를 나로 바꿔 나(본인)의 심리를 만족시킨다는 뜻",
            "오저치고": "오늘 저녁 치킨 고? 의 줄임말",
            "쉽살재빙": "쉽게 살면 재미없어 빙고 의 줄임말",
            "꾸안꾸": "꾸미지 않은듯 꾸민듯 하다를 뜻함",
            "좋댓구알": "좋아요 댓글 구독 알림설정  의 줄임말",
            "복세편살": "복잡한 세상 편하게 살자 의 줄임말",
            "억텐": "억지 텐션 의 줄임말",
            "슬세권": "역세권의 변형어로 역을 슬리퍼의 슬로 바꿔 슬리퍼를 신고 돌아다닐수 있는 곳을 뜻함",
            "스세권": "슬세권처럼 역세권의 변형어로 역을 스타벅스의 스로 바꿘 스타벅스 세권의 합성어",
            "맥세권": "스세권과 마찬가지로 맥도날드와 세권의 합성어, 이외에도 파세권(파리바게트), 등 좋아하는 브랜드의 앞글자와 세권을 합친 합성어가 많음",
            "스라밸": "일과 삶의 균형을 뜻하는 워라밸의 변형된 말로 스터디(Study)+라이프(Life)+밸런스(Balance)합성어",
            "고스팅": "Gost(유령) 와 ing의 합성어 ( 유령처럼 잠수타서 안보이는 사람을 뜻함 )",
            "제당슈만": "제가 당신을 슈퍼스타로 만들어드리겠습니다  의 줄임말",
            "군싹": "군침이 싹도네(싹돈다) 라는 뜻",
            "편리미엄": "편리함이 프리미엄이다라는 뜻으로 가격보다는 편리한게 중요하다는 말",
            "추미스": "추리 미스터리 스릴러 의 줄임말",
            "H워얼V": "사랑해( 글자를 뒤집어 보면 사랑해가 된다.)",
            "팬아저": "팬이 아니지만 저장 한다는 뜻",
            "먹노매": "먹이를 노리는 매의눈  의 줄임말",
            "롬곡옾높": "폭풍눈물 ( 글자를 뒤집어 보면 폭풍눈물 이 된다 )",
            "좋못사": "좋아하다 못해 사랑한다 의 줄임말",
            "알잘딱깐센": "알아서 잘 딱 깔끔하고 센스있게 의 줄임말",
            "자만추": "자연스러운 만남 추구 의 줄임말",
            "스좀비": "스마트폰과 좀비의 합성어로 스마트폰만 보며 앞도 제대로 안보고 좀비처럼 걷는 사람들을 뜻함"
        ]
    }
    
    
}
