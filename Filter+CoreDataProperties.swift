//
//  Filter+CoreDataProperties.swift
//  
//
//  Created by pikachu987 on 2017. 7. 26..
//
//

import Foundation
import CoreData


extension Filter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Filter> {
        return NSFetchRequest<Filter>(entityName: "Filter")
    }

    @NSManaged public var name: String?

}
