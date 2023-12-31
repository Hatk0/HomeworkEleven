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
    
    private lazy var loginButton:  UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var recoveryPassword: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.tintColor = .blue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var dividerView: UIView = {
       let divider = UIView()
        divider.backgroundColor = .blue
        divider.layer.cornerRadius = 20
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In With Twitter", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemOrange
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
            
        let imageSize = CGSize(width: 40, height: 40)
        let twitterImage = UIImageView()
        twitterImage.image = UIImage(named: "twitter")
        twitterImage.contentMode = .scaleAspectFit
        twitterImage.translatesAutoresizingMaskIntoConstraints = false
            
        button.addSubview(twitterImage)
            
        NSLayoutConstraint.activate([
                twitterImage.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
                twitterImage.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                twitterImage.widthAnchor.constraint(equalToConstant: imageSize.width),
                twitterImage.heightAnchor.constraint(equalToConstant: imageSize.height)
        ])
        
        return button
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In With Facebook", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let imageSize = CGSize(width: 40, height: 40)
        let facebookImage = UIImageView()
        facebookImage.image = UIImage(named: "facebook")
        facebookImage.contentMode = .scaleAspectFit
        facebookImage.translatesAutoresizingMaskIntoConstraints = false
            
        button.addSubview(facebookImage)
            
        NSLayoutConstraint.activate([
            facebookImage.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            facebookImage.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            facebookImage.widthAnchor.constraint(equalToConstant: imageSize.width),
            facebookImage.heightAnchor.constraint(equalToConstant: imageSize.height)
        ])
        
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let text = "Don't have account? Sign up"
        let attrubutedText = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "Sign up")
        attrubutedText.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        label.attributedText = attrubutedText
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        view.addSubview(loginButton)
        view.addSubview(recoveryPassword)
        view.addSubview(dividerView)
        view.addSubview(twitterButton)
        view.addSubview(facebookButton)
        view.addSubview(descriptionLabel)
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
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            
            recoveryPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5),
            recoveryPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recoveryPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            dividerView.topAnchor.constraint(equalTo: recoveryPassword.bottomAnchor, constant: 50),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dividerView.heightAnchor.constraint(equalToConstant: 1.0),

            twitterButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20),
            twitterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            twitterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            twitterButton.heightAnchor.constraint(equalToConstant: 52),
            
            facebookButton.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 20),
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            facebookButton.heightAnchor.constraint(equalToConstant: 52),
            
            descriptionLabel.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    // MARK: - Actions
    
    @objc private func buttonPressed() {
        
    }
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
