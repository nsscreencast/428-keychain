import UIKit
import Valet

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    private let keychain = Valet.app

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if keychain.containsObject(forKey: "username") {
            usernameTextField.text = keychain.string(forKey: "username")
            passwordTextField.text = keychain.string(forKey: "password")
            signInTapped()
        } else {
            usernameTextField.text = nil
            passwordTextField.text = nil
        }
    }

    @IBAction func signInTapped() {
        if usernameTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false {

            saveCredentials()

            // secret area
            let secretVC = storyboard!.instantiateViewController(identifier: "SecretAreaViewController")
            secretVC.modalPresentationStyle = .fullScreen
            present(secretVC, animated: true, completion: nil)
        }
    }

    private func saveCredentials() {

        keychain.set(string: usernameTextField.text!, forKey: "username")
        keychain.set(string: passwordTextField.text!, forKey: "password")

    }
}

