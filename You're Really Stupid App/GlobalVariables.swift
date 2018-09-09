//
//  GlobalVariables.swift
//  You're Really Stupid App
//
//  Created by Warren Mui on 9/9/18.
//  Copyright © 2018 Warren Mui. All rights reserved.
//  Source Reference - http://www.wadecantley.com/lifeblog/2014/11/25/global-variables-singletons-in-swift

class GlobalVariables {
    
    // These are the properties you can store in your singleton
    var myName: String = "bob"
    
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
