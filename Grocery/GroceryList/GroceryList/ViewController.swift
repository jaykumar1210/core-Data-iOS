//
//  ViewController.swift
//  GroceryList
//
//  Created by MacStudent on 2017-08-09.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var nItem : List? = nil
    
    @IBOutlet weak var entryItem: UITextField!

    @IBOutlet weak var entryNote: UITextField!
    
    @IBOutlet weak var entryQty: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if nItem != nil
        {
            entryItem.text = nItem?.item
            entryNote.text = nItem?.note
            entryQty.text = nItem?.qty
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func cancelTapped(_ sender: Any) {
        dismissVC()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if nItem != nil{
            editItem()
        }else
        {
            newItem()
        }
        dismissVC()
    }
    
    func dismissVC()
    {
        navigationController?.popViewController(animated: true)
    }
    
    func newItem()
    {
        let context = self.context
        let ent = NSEntityDescription.entity(forEntityName: "List", in: context)
        let nItem = List(entity: ent!, insertInto: context)
        
        nItem.item = entryItem.text
        nItem.note = entryNote.text
        nItem.qty = entryQty.text
        
        do{
            try context.save()
        }catch{
            return
        }
        
    }
    
    func editItem()
    {
        nItem!.item = entryItem.text
        nItem!.note = entryNote.text
        nItem!.qty = entryQty.text
        
        do{
            try context.save()
        }catch{
            return
        }

    }
}

