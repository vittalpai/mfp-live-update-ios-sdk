//
//  Messages.swift
//  IBMMobileFirstPlatformFoundationLiveUpdate
//
//  Created by Vittal Pai on 19/04/20.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

public protocol Message {
    /**
     Returns array of InApp Message
     
     - Returns: Array of InApp Message or nil for non existing  InApp Message.
     */
    func getMessages()-> [InAppMessage]?
}
