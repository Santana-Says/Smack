//
//  MessageService.swift
//  Smack
//
//  Created by Jeffrey Santana on 11/18/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var selectedChannel: Channel?
    
    func getAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                if let json = JSON(data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDesciption = item["description"].stringValue
                        let id = item["id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDesciption, id: id)
                        
                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
}