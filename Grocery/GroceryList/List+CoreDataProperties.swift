//
//  List+CoreDataProperties.swift
//  GroceryList
//
//  Created by MacStudent on 2017-08-09.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List");
    }

    @NSManaged public var item: String?
    @NSManaged public var note: String?
    @NSManaged public var qty: String?

}
