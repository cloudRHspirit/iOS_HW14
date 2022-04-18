//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Roman Hural on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Variables
    var user: User?
    
    //MARK: - Outlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var addressLine1TextField: UITextField!
    @IBOutlet var addressLine2TextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        registerForKeyboardNotifications()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        phoneNumberTextField.keyboardType = .numberPad
        zipCodeTextField.keyboardType = .numberPad
    }
    
    //MARK: - Methods
    func registerForKeyboardNotifications() {
            NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWasShown(_:)),
            name: UIResponder.keyboardDidShowNotification,
            object: nil)
            NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWillBeHidden(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        }
    
        @objc func keyboardWasShown(_ notificiation: NSNotification) {
            guard let info = notificiation.userInfo,
                let keyboardFrameValue =
                info[UIResponder.keyboardFrameBeginUserInfoKey]
                as? NSValue else { return }
            let keyboardFrame = keyboardFrameValue.cgRectValue
            let keyboardSize = keyboardFrame.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,
            bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    
        @objc func keyboardWillBeHidden(_ notification: NSNotification) {
            let contentInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        updateView()
        let destinationVC = segue.destination as! DescribingUserViewController
        destinationVC.textLabel = user?.description
    }
    
    func updateView () {
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let addressLine1 = addressLine1TextField.text,
              let addressLine2 = addressLine2TextField.text,
              let city = cityTextField.text,
              let state = stateTextField.text,
              let zipCode = zipCodeTextField.text,
              let phoneNumber = phoneNumberTextField.text else { return }
        user = User(firstName: firstName, lastName: lastName, addressLine1: addressLine1, addressLine2: addressLine2, city: city, state: state, zipCode: zipCode, phoneNumber: phoneNumber)
    }
    
    func isSaveButtonOn () {
        if !(firstNameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(lastNameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(addressLine1TextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(addressLine2TextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(cityTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(stateTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(zipCodeTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) && !(phoneNumberTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }

    //MARK: - Actions
    @IBAction func textFieldsEditing(_ sender: UITextField) {
        isSaveButtonOn()
    }
}
