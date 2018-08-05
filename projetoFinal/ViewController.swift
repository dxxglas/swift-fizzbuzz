//
//  ViewController.swift
//  projetoFinal
//
//  Created by Lab on 02/08/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzbuzzButton: UIButton!
    
    @IBAction func countClick(_ sender: Any) {
        if (counter + 1) % 3 != 0 && (counter + 1) % 5 != 0 {
            counter = counter + 1
            numberButton.setTitle(String (counter), for: .normal)
        } else {
            performSegue(withIdentifier: "gameOver", sender: nil)
            counter = 0
            numberButton.setTitle(String (counter), for: .normal)
        }
    }
    
    @IBAction func fizzClick(_ sender: Any) {
        if (counter + 1) % 3 == 0 {
            if (counter + 1) % 5 != 0 {
                counter = counter + 1
                numberButton.setTitle(String (counter), for: .normal)
            } else {
                performSegue(withIdentifier: "gameOver", sender: nil)
                counter = 0
                numberButton.setTitle(String (counter), for: .normal)
            }
        } else {
            performSegue(withIdentifier: "gameOver", sender: nil)
            counter = 0
            numberButton.setTitle(String (counter), for: .normal)
        }
    }
    
    @IBAction func buzzClick(_ sender: Any) {
        if (counter + 1) % 5 == 0 {
            if (counter + 1) % 3 != 0 {
                counter = counter + 1
                numberButton.setTitle(String (counter), for: .normal)
            } else {
                performSegue(withIdentifier: "gameOver", sender: nil)
                counter = 0
                numberButton.setTitle(String (counter), for: .normal)
            }
        } else {
            performSegue(withIdentifier: "gameOver", sender: nil)
            counter = 0
            numberButton.setTitle(String (counter), for: .normal)
        }
    }
    
    @IBAction func fizzbuzzClick(_ sender: Any) {
        if (counter + 1) % 3 == 0 && (counter + 1) % 5 == 0 {
            counter = counter + 1
            numberButton.setTitle(String (counter), for: .normal)
        } else {
            performSegue(withIdentifier: "gameOver", sender: nil)
            counter = 0
            numberButton.setTitle(String (counter), for: .normal)
        }
    }
    
    @IBAction func unwindGame (unwindSegue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scoreVC = segue.destination as? ScoreViewController {
            scoreVC.recievedScore = String(counter)
        }
    }

}

