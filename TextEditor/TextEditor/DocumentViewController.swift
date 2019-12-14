//
//  DocumentViewController.swift
//  TextEditor
//
//  Created by Sergii Melnyk on 12/14/19.
//  Copyright © 2019 Sergii Melnyk. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var document: Document?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissDocumentViewController))
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                
                // Display the content of the document, e.g.:
                self.title = self.document?.fileURL.deletingPathExtension().lastPathComponent
                self.textView.text = self.document?.text ?? ""
                
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        
        document?.text = textView.text
        document?.updateChangeCount(.done)
        
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}
