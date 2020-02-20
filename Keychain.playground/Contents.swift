import Foundation

let serviceName = "com.nsscreencast.keychaindemo"
let apiToken = "asdfasdfasdfd"


func addItem() {
    let attributes: [String: Any] = [
        kSecClass as String : kSecClassInternetPassword,
        kSecAttrService as String : serviceName,
        kSecValueData as String : apiToken.data(using: .utf8)!
    ]

    let result = SecItemAdd(attributes as CFDictionary, nil)

    if result == errSecSuccess {
        print("Added item")
    } else {
        print("Error adding item: \(result)")
        if let msg = SecCopyErrorMessageString(result, nil) {
            print(msg as String)
        }
    }
}


func searchItem() {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: serviceName,
        kSecMatchLimit as String: 1,
        kSecReturnData as String: true
    ]

    var item: AnyObject?
    let result = SecItemCopyMatching(query as CFDictionary, &item)

    if result == errSecSuccess {
        print("Found item: ")
        if let data = item as? Data {
            print(String(data: data, encoding: .utf8)!)
        }
    } else {
        print("Error searching item: \(result)")
        if let msg = SecCopyErrorMessageString(result, nil) {
            print(msg as String)
        }
    }
}

func removeItem() {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: serviceName,
        kSecMatchLimit as String: 1
    ]
    let result = SecItemDelete(query as CFDictionary)
    if result == errSecSuccess {
        print("Deleted item")
    } else {
        print("Error deleting item: \(result)")
        if let msg = SecCopyErrorMessageString(result, nil) {
            print(msg as String)
        }
    }
}

removeItem()
removeItem()
addItem()
searchItem()
