//
//  DateViewController.swift
//  NewlyCoinedWord
//
//  Created by 이상남 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var date100Label: UILabel!
    
    
    @IBOutlet var background200ImageView: UIImageView!
    @IBOutlet var date200Label: UILabel!
    
    @IBOutlet var background300ImageView: UIImageView!
    @IBOutlet var date300Label: UILabel!
    
    @IBOutlet var background400ImageView: UIImageView!
    @IBOutlet var date400Label: UILabel!
    
    var days: [Int] = []
    
    
    @IBOutlet var dateTitleLabel100: UILabel!
    @IBOutlet var dateTitleLabel200: UILabel!
    @IBOutlet var dateTitleLabel300: UILabel!
    @IBOutlet var dateTitleLabel400: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        setUpdatePicker()
        resultDayTitleLabel()
        setUpImageView()
        
        datePickerValueChanged(datePicker)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
       
        makeDateFormatter(sender:sender)
       
    }
    
    
    
    func makeDateFormatter(sender: UIDatePicker){
        //DateFormatter: 1. 시간대 변경 2.날짜 포맷 변경
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        
        let day1 = Calendar.current.date(byAdding: .day, value: days[0], to: sender.date)!
        let day2 = Calendar.current.date(byAdding: .day, value: days[1], to: sender.date)!
        let day3 = Calendar.current.date(byAdding: .day, value: days[2], to: sender.date)!
        let day4 = Calendar.current.date(byAdding: .day, value: days[3], to: sender.date)!
        
        //+100일뒤
        let result100 = format.string(from:  day1)
        let result200 = format.string(from:  day2)
        let result300 = format.string(from:  day3)
        let result400 = format.string(from:  day4)
        
        date100Label.text = result100
        date200Label.text = result200
        date300Label.text = result300
        date400Label.text = result400
    }
    
    func resultDayTitleLabel(){
        setUpTitleLable(titleLabel: dateTitleLabel100, day: 100)
        setUpTitleLable(titleLabel: dateTitleLabel200, day: 200)
        setUpTitleLable(titleLabel: dateTitleLabel300, day: 365)
        setUpTitleLable(titleLabel: dateTitleLabel400, day: 1000)
    }
    
    func setUpTitleLable(titleLabel: UILabel, day: Int ){
        days.append(day)
        titleLabel.text = "D + \(day)"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.layer.cornerRadius = 20
        titleLabel.clipsToBounds = true
    }
    
    func setUpLabel(){
        date100Label.layer.cornerRadius = 20
        date100Label.clipsToBounds = true
        date100Label.font = .boldSystemFont(ofSize: 15)
        date100Label.text = ""
        date200Label.layer.cornerRadius = 20
        date200Label.clipsToBounds = true
        date200Label.text = ""
        date300Label.layer.cornerRadius = 20
        date300Label.clipsToBounds = true
        date300Label.text = ""
        date400Label.layer.cornerRadius = 20
        date400Label.clipsToBounds = true
        date400Label.text = ""
        
    }
    func setUpImageView(){
        background100ImageView.layer.cornerRadius = 20
        background100ImageView.backgroundColor = .blue
        background200ImageView.layer.cornerRadius = 20
        background200ImageView.backgroundColor = .blue
        background300ImageView.layer.cornerRadius = 20
        background300ImageView.backgroundColor = .blue
        background400ImageView.layer.cornerRadius = 20
        background400ImageView.backgroundColor = .blue
        
        
//        background100ImageView.layer.shadowColor = UIColor.black.cgColor
//        background100ImageView.layer.shadowOffset = .zero //CGSize(width:0, heigth:0)
//        background100ImageView.layer.shadowRadius = 10
//        background100ImageView.layer.shadowOpacity = 0.5
//        background100ImageView.clipsToBounds = false
        
    }
    
    
    func setUpdatePicker(){
        
        datePicker.tintColor = .systemPink
        
        
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
    }
   

}
