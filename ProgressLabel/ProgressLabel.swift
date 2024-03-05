//
//  ProgressLabel.swift
//  MyTestApp
//
//  Created by lizihong on 2024/3/5.
//

import UIKit

/// 可以变色的label，进度label
class ProgressLabel: UIView {
    
    /// 进度方向枚举
    enum Direction {
        case leftToRight
        case rightToLeft
        case topToBottom
        case bottomToTop
    }

    private let baseLabel = UILabel()
    private let progressMaskView = UIView()
    private let progressLabel = UILabel()
    
    /// 文字
    var text: String? {
        set {
            self.baseLabel.text = newValue
            self.progressLabel.text = newValue
        }
        get {
            self.baseLabel.text
        }
    }
    
    /// 字体
    var font: UIFont {
        set {
            self.baseLabel.font = newValue
            self.progressLabel.font = newValue
        }
        get {
            self.baseLabel.font
        }
    }
    
    /// 基础颜色
    var baseColor: UIColor {
        set {
            self.baseLabel.textColor = newValue
        }
        get {
            self.baseLabel.textColor
        }
    }
    
    /// 进度颜色
    var progressColor: UIColor {
        set {
            self.progressLabel.textColor = newValue
        }
        get {
            self.progressLabel.textColor
        }
    }
    
    /// 进度方向
    var progressDirect: Direction = .leftToRight {
        didSet {
            self.updateProgressLayout()
        }
    }
    
    /// 进度
    var progress: CGFloat = 0 {
        didSet {
            self.updateProgressLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }

    private func setupUI() {
        self.addSubview(self.baseLabel)
        self.addSubview(self.progressLabel)
        
        self.baseLabel.frame = self.bounds
        self.progressLabel.frame = self.bounds
        
        self.baseLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.progressLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.progressLabel.mask = self.progressMaskView
        self.progressMaskView.backgroundColor = .black
        self.updateProgressLayout()
    }
    
    private func updateProgressLayout() {
        var frame = self.progressLabel.bounds
        let height = self.progressLabel.bounds.height
        let width = self.progressLabel.bounds.width
        switch self.progressDirect {
        case .leftToRight:
            frame.size.width = width*progress
        case .rightToLeft:
            frame.size.width = width*progress
            frame.origin.x = width*(1-progress)
        case .topToBottom:
            frame.size.height = height*progress
        case .bottomToTop:
            frame.size.height = height*progress
            frame.origin.y = height*(1-progress)
        }
        
        self.progressMaskView.frame = frame
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateProgressLayout()
    }
}
