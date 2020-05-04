//
//  InAppMessage.swift
//  IBMMobileFirstPlatformFoundationLiveUpdate
//
//  Created by Vittal Pai on 19/04/20.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

public class InAppMessage {
    fileprivate var _title: String
    fileprivate var _message : String
    fileprivate var _imageURL : String
    fileprivate var _buttons : [String : String]
    
    init(title: String, message: String, imageURL: String, buttons : [String : String]) {
        _title = title;
        _message = message;
        _imageURL = imageURL;
        _buttons = buttons;
    }
    
    var title: String {
        return _title
    }
    
    var message: String {
        return _message
    }
    
    var imageURL : String {
        return _imageURL
    }
    
    var buttons : [String : String] {
        return _buttons
    }
}
