//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Mike Conner on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK: - Properties
    var entry: Entry?
    
    
    //MARK: - IBActions
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
        if let entry = entry {
            entry.title = title
            entry.body = body
            EntryController.shared.updateEntry(entry)
        } else {
            EntryController.shared.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Functions
    func updateView() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }

} //End of class
