//
//  ViewController.swift
//  ProgressLabel
//
//  Created by lizihong on 2024/3/5.
//

import UIKit

class ViewController: UIViewController {
    
    //let textField = UITextField(frame: .init(x: 0, y: 0, width: 200, height: 200))
    let contentView = UIView.init(frame: .init(x: 50, y: 100, width: 200, height: 200))
    let button = UIButton(type: .system)
    
    let progressLabel = ProgressLabel(frame: .init(x: 0, y: 100, width: 130, height: 25))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        button.setTitle("填充文字", for: .normal)
        button.frame = .init(x: 0, y: 0, width: 100, height: 100)
        contentView.addSubview(button)
        self.view.addSubview(contentView)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        self.contentView.addSubview(self.progressLabel)
        
        // progressLabel 配置
        self.progressLabel.baseColor = .yellow
        self.progressLabel.progressColor = .cyan
        self.progressLabel.progressDirect = .bottomToTop
        self.progressLabel.text = "我是测试文字"
        self.progressLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    @objc
    func buttonDidTap(_ sender: UIButton) {
        if self.progressLabel.progress == 0 {
            UIView.animate(withDuration: 3, animations: {
                self.progressLabel.progress = 1
            })
        } else {
            UIView.animate(withDuration: 3, animations: {
                self.progressLabel.progress = 0
            })
        }
        
    }

}

