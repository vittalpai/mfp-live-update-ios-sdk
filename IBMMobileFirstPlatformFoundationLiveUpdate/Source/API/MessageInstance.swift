//
//  MessageInstance.swift
//  IBMMobileFirstPlatformFoundationLiveUpdate
//
//  Created by Vittal Pai on 19/04/20.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

class MessageInstance: Message {
    
    fileprivate var messages : [InAppMessage] = [InAppMessage]()
    
    init(id: String, data: [String: AnyObject]) {
        let message = InAppMessage.init(title: "Asdfad", message: "Asdf", imageURL: "asdfa", buttons: [String : String]())
        self.messages.append(message);
    }
    
    func getMessages() -> [InAppMessage]? {
        return messages;
    }
    
}
