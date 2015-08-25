

import Foundation
import UIKit

class PersonDetailsViewController :  UIViewController,UITableViewDataSource,UITableViewDelegate {
    let cellIdentifier = "customCell"
    var arrayOfPersons : NSArray!
    var personObject = Person()
    let entityName = "Person"
    
    @IBOutlet weak var tableViewPersonDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create bar button
        var b = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: "buttonAddActionHandler")
        self.navigationItem.rightBarButtonItem = b
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        
        arrayOfPersons = fetchAllRecordsFromEntity(entityName)
        
        tableViewPersonDetails.reloadData()
        
    }
    
    // table view delegate functions
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayOfPersons.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell :UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if(cell == nil){
            personObject.firstName  = arrayOfPersons.objectAtIndex(indexPath.row).valueForKey("firstName") as! String
            personObject.contactNumber = arrayOfPersons.objectAtIndex(indexPath.row).valueForKey("contactNumber") as! String
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:cellIdentifier )
            cell.textLabel?.text = personObject.firstName
            cell.detailTextLabel?.text = personObject.contactNumber
        }
        
        return cell
    }
    
    
    // handle bar button click action
    func buttonAddActionHandler(){
    var addDetailsObject = self.storyboard!.instantiateViewControllerWithIdentifier("AddDetailsViewController") as! AddDetailsViewController
    addDetailsObject.isCalledFromPersonDetails = true
    self.navigationController?.pushViewController(addDetailsObject, animated: true)

    }
    
}


