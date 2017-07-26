//
//  FilterDataHelper.swift
//  FilterSearch
//
//  Created by pikachu987 on 2017. 7. 26..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import Foundation
import CoreData

class FilterDataHelper: NSObject {
    static let shared = FilterDataHelper()

    func addFilter(_ name: String){
        let coreDataHelper = CoreDataHelper.shared
        let managedContext = coreDataHelper.managedObjectContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Filter", in: managedContext) else{
            return
        }
        let entityItem = Filter(entity: entity, insertInto: managedContext)
        entityItem.name = name
        coreDataHelper.saveContext()
    }

    func getFilters() -> [String]{
        let coreDataHelper = CoreDataHelper.shared
        let managedContext = coreDataHelper.managedObjectContext
        do{
            let fetchRequest = NSFetchRequest<Filter>(entityName: "Filter")
            let dataArray = try managedContext.fetch(fetchRequest)
            var array = [String]()
            for data in dataArray{
                if let name = data.name{
                    array.append(name)
                }
            }
            return array
        }catch let error{
            print("error: \(error)")
        }
        return [String]()
    }

    func getFiltersString() -> String{
        let filterArray = self.getFilters()

        let filters = filterArray.joined(separator: "\n")
        return filters
    }

    func removeFilters(){
        let coreDataHelper = CoreDataHelper.shared
        let managedContext = coreDataHelper.managedObjectContext
        do{
            let fetchRequest = NSFetchRequest<Filter>(entityName: "Filter")
            let dataArray = try managedContext.fetch(fetchRequest)
            for data in dataArray{
                managedContext.delete(data)
            }
            coreDataHelper.saveContext()
        }catch let error{
            print("error: \(error)")
        }
    }
}
