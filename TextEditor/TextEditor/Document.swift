//
//  Document.swift
//  TextEditor
//
//  Created by Sergii Melnyk on 12/14/19.
//  Copyright © 2019 Sergii Melnyk. All rights reserved.
//

import UIKit

enum DocumentError: Error {
    
    case invalidData
}

class Document: UIDocument {
    
    var text = ""
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data(text.utf8)
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        
        guard let contents = contents as? Data else {
            throw DocumentError.invalidData
        }
        
        text = String(decoding: contents, as: UTF8.self)
    }
}

