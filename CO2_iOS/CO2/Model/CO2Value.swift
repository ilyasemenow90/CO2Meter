//
//  CO2Value.swift
//  CO2
//
//  Created by Илья on 16.06.16.
//  Copyright © 2016 Intellectsoft. All rights reserved.
//

import Foundation


class CO2Value: NSObject {
    var objectId: String?
    var created: NSDate?
    var updated: NSDate?
    var valueCO2: Int = 0
    
    class func getLastValue(completionBlock: Result<CO2Value, NSError> -> Void) {
        let backendless = Backendless.sharedInstance()
        let dataStore = backendless.data.of(CO2Value.ofClass())
        
        //CO2Value value =
        var error: Fault?
        let result = dataStore.findLastFault(&error)
        if error == nil {
            guard let value = result as? CO2Value else {
                let errorResult = NSError.init(domain:"Response from server failure", code: 1001, userInfo: ["response":result])
                completionBlock(.Failure(errorResult))
                return
            }
            completionBlock(.Success(value))
        }
        else {
            print("Server reported an error: \(error)")
        }
    }
    
    class func sendValueToServer() {
        let value = CO2Value()
        value.valueCO2 = 900
        let backendless = Backendless.sharedInstance()
        backendless.persistenceService.of(CO2Value.ofClass()).save(value)

    }
    
    
    override var description: String {
        return "Value \(self.valueCO2), created \(self.created), objectID \(self.objectId)"
    }
 
}
