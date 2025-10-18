//
//  HomeViewController.swift
//  fakestagram
//
//  Created by Francisco Javier Gómez León on 11/10/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageType: UISwitch!
    @IBOutlet weak var captionSwitch: UISwitch!
    @IBOutlet weak var customeTextField: UITextView!{
        didSet{
            customeTextField.delegate = self
        }
    }
    
    @IBOutlet weak var picsButton: UIButton!
    @IBOutlet weak var customeTextSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picsButton.setImage(UIImage(systemName: imageType.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        customeTextField.isEditable = customeTextSwitch.isOn
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let feedViewController = segue.destination as? FeedViewController{
            feedViewController.pictureType = imageType.isOn ? .dog : .cat
            feedViewController.showCaption = captionSwitch.isOn
        }else if segue.identifier == "HomeInformationSegue",
            let informationViewController = segue.destination as?
            InformationViewController {
                if customeTextSwitch.isOn{
                    informationViewController.informationText = customeTextField.text

                }
            }
        
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any){
        navigationController?.dismiss(animated: true)
    }
    
    
    @IBAction func informationButtonTapped(_ sender: Any) {
        if customeTextSwitch.isOn {
            if customeTextField.text != "" {
                //home Information Segue
                performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
            }else{
              let alert = UIAlertController(title: nil, message: "Please enter a text", preferredStyle: .alert)
                alert.addAction (UIAlertAction(title: "Ok", style: .cancel))
                present(alert, animated: true)
            }
        }else {
            performSegue(withIdentifier: "HomeInformationSegue", sender: nil)

            //Home Information Segue
        }
        
    }
    
    @IBAction func logOutButtonTaped(_ sender: Any) {
    }
    
    
    @IBAction func imageType(_ sender: UISwitch) {
        picsButton.setImage(UIImage(systemName: imageType.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        }
    
    
    @IBAction func captionTypeSwitchValueChanged(_ sender: UISwitch) {
        customeTextField.isEditable = sender.isOn
        }
    

}


extension HomeViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn
        range: NSRange, replacementText text: String) -> Bool{
        let allowedCharecterSet = CharacterSet.alphanumerics.union(CharacterSet.whitespacesAndNewlines)
        let maxCharacters = 10
        let currentCharacters = textView.text.count
        let finalCharacters = currentCharacters - range.length + text.count
        return CharacterSet(charactersIn: text).isSubset(of: allowedCharecterSet) && finalCharacters <= maxCharacters
    }
}
