//
//  ViewController.swift
//  userDefault
//
//  Created by Sercan Yeşilyurt on 11.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let visitedKey = "hasVisited"
    let visitCountKey = "visitCount"
    let destinationNameKey = "destinationName"

    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var visitedTextField: UITextField!
    @IBOutlet weak var visitCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveDreamDestination()
    }
    
    func saveDreamDestination(hasVisited: Bool, visitCount: Int, destinationName: String) {
        UserDefaults.standard.set(hasVisited, forKey: visitedKey)
        UserDefaults.standard.set(visitCount, forKey: visitCountKey)
        UserDefaults.standard.set(destinationName, forKey: destinationNameKey)
        print("Dream destination saved!")
    }
    
    func retrieveDreamDestination() {
        let hasVisited = UserDefaults.standard.bool(forKey: visitedKey)
        let visitCount = UserDefaults.standard.integer(forKey: visitCountKey)
        let destinationName = UserDefaults.standard.string(forKey: destinationNameKey) ?? "No place selected yet"
        
        destinationTextField.text = destinationName
        visitedTextField.text = hasVisited ? "Yes" : "No"
        visitCountTextField.text = hasVisited ? "\(visitCount)" : ""
        
        logDreamDestination(hasVisited: hasVisited, visitCount: visitCount, destinationName: destinationName)
    }
    
    func logDreamDestination(hasVisited: Bool, visitCount: Int, destinationName: String) {
        print("Dream Destination: \(destinationName)")
        print("Have visited before: \(hasVisited)")
        print("Times visited: \(visitCount)")
    }

    func isValidInput() -> Bool {
        if destinationTextField.text?.isEmpty ?? true {
            showAlert(message: "Please enter a destination name.")
            return false
        }
        
        let validVisitedInput = ["yes", "no"]
        guard let visitedText = visitedTextField.text?.lowercased(), validVisitedInput.contains(visitedText) else {
            showAlert(message: "Please enter 'Yes' or 'No' for visited status.")
            return false
        }
        
        if visitedText == "yes", Int(visitCountTextField.text ?? "") == nil {
            showAlert(message: "Please enter a valid number for visit count.")
            return false
        }
        
        return true
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard isValidInput() else { return }
        
        let destinationName = destinationTextField.text!
        let hasVisited = (visitedTextField.text?.lowercased() == "yes")
        let visitCount = hasVisited ? Int(visitCountTextField.text ?? "0") ?? 0 : 0
        
        saveDreamDestination(hasVisited: hasVisited, visitCount: visitCount, destinationName: destinationName)
        showAlert(message: "Dream destination saved successfully!")
        
        retrieveDreamDestination() // Otomatik güncelleme
    }
    
    func showAlert(title: String = "Info", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
