//
//  ErroView.swift
//  sand-box
//
//  Created by Rodrigo Queiroz on 15/03/24.
//

import UIKit

class ErroView: UIView {
  
  var btn: UIButton = {
    let btn = UIButton()
    btn.layer.cornerRadius = 10
    btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = UIColor(named: "main")
    btn.layer.shadowOpacity = 0.0
    return btn
  }()
  var errorImageView: UIImageView = {
    let imageView = UIImageView()
    if #available(iOS 13.0, *) {
      imageView.image = UIImage(systemName: "gearshape.2")
    } else {
      imageView.image = UIImage(named: "gearshape.2.jpg")
    }
    imageView.tintColor = UIColor(named: "main")
    return imageView
  }()
  var messageLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 22, weight: .medium)
    return label
  }()
  
  var tap: (()->())?
  
  var action: ButtonAction {
    didSet {
      btn.setTitle(action.rawValue, for: .normal)
    }
  }
  
  required init(_ error: String, action: ButtonAction) {
    self.action = action
    super.init(frame: CGRect.zero)
        
    messageLabel.text = error
    btn.setTitle(action.rawValue, for: .normal)
    
    addSubviews([
      errorImageView,
      messageLabel,
      btn
    ],enableConstraints: true)
    
    NSLayoutConstraint.activate([
      
      errorImageView.topAnchor.constraint(equalTo: topAnchor, constant: 240),
      errorImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      errorImageView.heightAnchor.constraint(equalToConstant: 86),
      errorImageView.widthAnchor.constraint(equalToConstant: 86),
      
      messageLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: 32),
      messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      btn.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 120),
      btn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
      btn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
      btn.heightAnchor.constraint(equalToConstant: 56)
    ])
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func tappedButton(sender: UIButton) {
    removeFromSuperview()
    tap?()
  }
  
  @discardableResult static func show(error: String,
                                      in viewController: UIViewController,
                                      action: ButtonAction, tap: (()->())? = nil) -> ErroView {
    
    let errView = ErroView(error, action: action)
    errView.btn.addTarget(errView, action: #selector(ErroView.tappedButton(sender:)), for: .touchUpInside)
    errView.tap = tap
    
    if let view = viewController.view {
      view.addSubview(errView, enableConstraints: true)
      errView.anchorEqualTo(view: view)
    }
    
    return errView
  }
}

enum ButtonAction: String {
  case back = "Voltar"
  case retry = "Tente novamente"
}
