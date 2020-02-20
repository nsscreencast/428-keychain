import UIKit
import Valet

class SecretAreaViewController : UIViewController {
    @IBOutlet weak var secretLabel: UILabel!

    private let keychain = Valet.app

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !keychain.containsObject(forKey: "secret") {
            let secret = UUID().uuidString
            keychain.set(string: secret, forKey: "secret")
        }

        secretLabel.text = keychain.string(forKey: "secret")
    }

    @IBAction func logOut(_ sender: UIButton) {
        keychain.removeAllObjects()
        dismiss(animated: true, completion: nil)
    }
}
