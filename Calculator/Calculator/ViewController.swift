//
//  ViewController.swift
//  Calculator
//
//  Created by Allexia Azevedo de Morais on 20/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [resultLabel,
                                                        firstLineStackView,
                                                        secondLineStackView,
                                                        thirdLineStackView,
                                                        fourthLineStackView,
                                                        fifthLineStackViewCompleted])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var firstLineStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [clearButton,
                                                       moreOrLessButton,
                                                       percentButton,
                                                       divisionButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var secondLineStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sevenButton,
                                                       eightButton,
                                                       nineButton,
                                                       versusButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var thirdLineStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fourButton,
                                                       fiveButton,
                                                       sixButton,
                                                       minusButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fourthLineStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [oneButton,
                                                       twoButton,
                                                       threeButton,
                                                       plusButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fifthLineRightSideStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [commaButton,
                                                       equalButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var fifthLineStackViewCompleted: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [zeroButton,
                                                       fifthLineRightSideStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private var resultLabel: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 100)
        label.textColor = .white
        return label
    }()
    
    private lazy var clearButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("C", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(clearResult(_:)), for: .touchUpInside)
        //button.addTarget(self, action: #selector(clearResult(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var moreOrLessButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+/-", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        button.tag = 6
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var percentButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("%", for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        button.tag = 7
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var divisionButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("/", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 5
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var sevenButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 8
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var eightButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("8", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 9
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var nineButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("9", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 10
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var versusButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("x", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var fourButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("4", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 5
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var fiveButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 6
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var sixButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 7
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var minusButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var oneButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var twoButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var threeButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("3", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var zeroButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .leading
        button.tag = 1
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var commaButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(",", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapNumbers(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var equalButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("=", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    var firstNumber = 0
    var resultNumber = 0
    var currentOperations: Operation?
    
    enum Operation{
        case plus, minus, versus, division, invertion, percent
    }
    
    override func viewDidLoad() {
        
        setupLayout()
        setupUIConstraint()
    }
    
    private func setupUIConstraint() {
        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            clearButton.widthAnchor.constraint(equalTo: clearButton.heightAnchor),
            sevenButton.widthAnchor.constraint(equalTo: sevenButton.heightAnchor),
            fourButton.widthAnchor.constraint(equalTo: fourButton.heightAnchor),
            oneButton.widthAnchor.constraint(equalTo: oneButton.heightAnchor),
            equalButton.widthAnchor.constraint(equalTo: equalButton.heightAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
    
    private func setupLayout() {
        view.backgroundColor = .black
    }
    

    @objc private func didTapNumbers(_ sender: UIButton) {
        let tag = sender.tag - 1
        
        if resultLabel.text == "0" {
            resultLabel.text = "\(tag)"
        //o texto na label é igual ao texto + a tag na frente dele
        } else if let text = resultLabel.text {
        resultLabel.text = "\(text)\(tag)"
        }
    }
    
    @objc private func clearResult(_ sender: UIButton) {
        resultLabel.text = "0"
        currentOperations = nil
        firstNumber = 0
    }
    
    @objc func operationPressed(_ sender: UIButton) {
        let tag = sender.tag
        if let text = resultLabel.text, let value = Int(text), firstNumber == 0 {
            firstNumber = value
            resultLabel.text = "0"
        }
        
        if tag == 1 {
            if let operation = currentOperations {
                var secondNumber = 0
                if let text = resultLabel.text, let value = Int(text) {
                    secondNumber = value
                }
                
                switch operation {
                case .plus:
                    //realiza operação
                    let result = firstNumber + secondNumber
                    secondNumber = 0
                    //mostra o resultado na label
                    resultLabel.text = "\(result)"
                    firstNumber = 0
                case .minus:
                    let result = firstNumber - secondNumber
                    secondNumber = 0
                    resultLabel.text = "\(result)"
                case .versus:
                    let result = firstNumber * secondNumber
                    secondNumber = 0
                    resultLabel.text = "\(result)"
                case .division:
                    let result = firstNumber / secondNumber
                    secondNumber = 0
                    resultLabel.text = "\(result)"
                case .invertion:
                    let result = firstNumber * -1
                    resultLabel.text = "\(result)"
                case .percent:
                    let percent = secondNumber / 100
                    let result = firstNumber * (1 + percent)
                    resultLabel.text = "\(result)"
                }
            }
        }
        
        else if tag == 2 {
            currentOperations = .plus
        }
        else if tag == 3 {
            currentOperations = .minus
        }
        else if tag == 4 {
            currentOperations = .versus
        }
        else if tag == 5 {
            currentOperations = .division
        }
        else if tag == 6 {
            currentOperations = .invertion
        }
        else if tag == 7 {
            currentOperations = .percent
        }
    }
    


}

