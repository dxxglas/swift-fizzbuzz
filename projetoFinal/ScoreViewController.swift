//
//  ScoreViewController.swift
//  projetoFinal
//
//  Created by Lab on 02/08/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController {
    
    var appDelegate: AppDelegate?
    var managedContext: NSManagedObjectContext?
    
    var players:[NSManagedObject] = []
    
    var recievedScore: String?
    
    @IBOutlet weak var scoreNumber: UILabel!
    @IBOutlet weak var namePlayer: UITextField!
    @IBOutlet weak var imagePlayer: UIImageView!
    
    @IBAction func savePlayer(_ sender: Any) {
        if let test = namePlayer.text, let imgTest = imagePlayer.image, test != "" {
            
            let newPlayer = Player(context: self.managedContext!)
            newPlayer.name = test
            newPlayer.score = scoreNumber.text
            newPlayer.image = NSData(data: UIImagePNGRepresentation(imgTest)!) as Data
            
            save(newPlayer: newPlayer)
            
            performSegue(withIdentifier: "toSave", sender: nil)
            
        } else {
            let alert = UIAlertController(title: ".error", message: "add your name and a profile picture", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: ".ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func addImagePlayer(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.scoreNumber.text = recievedScore
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = self.appDelegate?.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func save(newPlayer: Player) {
        do {
            try managedContext?.save()
            self.players.append(newPlayer)
        } catch let error as NSError {
            print("erro ao salvar: \(error), \(error.userInfo)")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScoreViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePlayer.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

