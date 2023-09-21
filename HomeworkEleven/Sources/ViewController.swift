import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    private lazy var backgroundImage: UIImageView = {
       let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainTitle: UILabel = {
       let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
           let textField = UITextField()
            textField.layer.cornerRadius = 20
            textField.backgroundColor = .white
            textField.placeholder = "Enter login or e-mail adress"
            textField.textColor = .black
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    
    private lazy var passwordTextField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        
        loginTextField.setLeftIcon("person.fill", pointSize: 20)
        passwordTextField.setLeftIcon("lock.shield.fill", pointSize: 20)
    }

    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(mainTitle)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginTextField.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 40),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    // MARK: - Actions

}

extension UITextField {
    func setLeftIcon(_ symbolName: String, pointSize: CGFloat, weight: UIImage.SymbolWeight = .regular, scale: UIImage.SymbolScale = .default) {
        let configuration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
        if let symbolImage = UIImage(systemName: symbolName, withConfiguration: configuration) {
            let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
            iconView.image = symbolImage
            let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
            iconContainerView.addSubview(iconView)
            leftView = iconContainerView
            leftViewMode = .always
        }
    }
}


