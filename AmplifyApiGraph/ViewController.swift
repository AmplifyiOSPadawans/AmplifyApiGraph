//
//  ViewController.swift
//  AmplifyApiGraph
//
//  Created by David Perez Espino on 20/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    let api = ApiHelper()
    
    
    @IBOutlet weak var txtFldAge: UITextField!
    @IBOutlet weak var swithcGender: UISwitch!
    @IBOutlet weak var txtFldBreed: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var lblPetsInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swithcGender.preferredStyle = .checkbox
        
        lblPetsInfo.numberOfLines = 0
    }


    @IBAction func createPet(_ sender: UIButton) {
        Task {
            let dog = Dog(
                name: txtFldName.text ?? "",
                bread: txtFldBreed.text ?? "",
                age: Int(txtFldAge.text ?? "") ?? 0,
                gender: swithcGender.isOn
            )
            
            let result = await api.createPet(dog: dog)
            
            if result {
                showMessage("Pet added")
            } else {
                showMessage("Something went wrong")
            }
            
        }
    }
    
    @IBAction func getPetsInfo(_ sender: UIButton) {
        Task {
            
            let dogList = await api.listDogs()
            
            if let dogs = dogList {
                for dog in dogs {
                    lblPetsInfo.text = (lblPetsInfo.text ?? "") +
                    "\nName: \(dog.name), Breed: \(dog.bread), Age: \(dog.age), Gender: \(dog.gender ? "Male" : "Female")"
                }
            }
            
        }
    }
    
    
    func showMessage(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

