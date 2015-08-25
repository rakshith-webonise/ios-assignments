

import Foundation
import UIKit

class OrganisationDetailsViewController :  UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrayOfOrganisation : NSArray!
    var OrganisationObject = Organisation()
    let entityName = "Organisation"
    let cellIdentifier = "customCell"
    
    
    @IBOutlet weak var tableViewOrganisationDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func viewWillAppear(animated: Bool){
        self.navigationController?.navigationBarHidden = false
         arrayOfOrganisation = fetchAllRecordsFromEntity(entityName)
        tableViewOrganisationDetails.reloadData()
    }
    
    //table view delegate functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (arrayOfOrganisation.count)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell :UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if(cell == nil){
            OrganisationObject.organisationName  = arrayOfOrganisation.objectAtIndex(indexPath.row).valueForKey("organisationName") as! String
            OrganisationObject.location = arrayOfOrganisation.objectAtIndex(indexPath.row).valueForKey("location") as! String
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:cellIdentifier )
            cell.textLabel?.text = OrganisationObject.organisationName
            cell.detailTextLabel?.text = OrganisationObject.location
        }

        return cell
    }
    
    //add bar button action handler
    
    
    @IBAction func buttonAddActionHandler(sender: UIBarButtonItem) {
        var addDetailsObject = self.storyboard!.instantiateViewControllerWithIdentifier("AddDetailsViewController") as! AddDetailsViewController
        addDetailsObject.isCalledFromPersonDetails = false
        self.navigationController?.pushViewController(addDetailsObject, animated: true)
        
    }
    
}
