//
//  ViewController.swift
//  FirstTimerApp
//
//  Created by Kaala on 2023/03/03.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    private weak var timer:Timer? // Strong Reference Cycle 방지위해 weak 사용
    private var number:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if slider.value * 60 >= 1 {
            number = Int(sender.value * 60)
            self.mainLabel.text = "\(number) 초"
        }
    }
    
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        self.timer?.invalidate()
        
        //* method #1
//        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTimerPerSecond), userInfo: nil, repeats: true)
        
        //* method #2
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if self.number <= 1 {
                self.slider.setValue(0, animated: true)
                self.number = 0
                self.mainLabel.text = "⏰🐣"
                AudioServicesPlayAlertSound(1005)
                self.timer?.invalidate()
            } else {
                self.number -= 1
                self.slider.setValue(Float(self.number)/60, animated: true)
                self.mainLabel.text = "\(self.number) 초"
            }
        })
        
    }
    
    @objc func setTimerPerSecond(){
        if self.number <= 1 {
            self.slider.setValue(0, animated: true)
            self.number = 0
            self.mainLabel.text = "⏰🐣"
            AudioServicesPlayAlertSound(1005)
            self.timer?.invalidate()
        } else {
            self.number -= 1
            self.slider.setValue(Float(self.number)/60, animated: true)
            self.mainLabel.text = "\(self.number) 초"
        }
    }
    
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        slider.setValue(0.5, animated: true)
        mainLabel.text = "초를 선택하세요"
        self.timer?.invalidate()
    }
    
    
}

