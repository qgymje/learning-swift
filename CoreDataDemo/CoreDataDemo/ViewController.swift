import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func save() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        newUser.setValue(userName.text, forKey: "username")
        newUser.setValue(password.text, forKey: "password")
        
        do {
            try context.save()
        } catch {
            print("error")
        }
       
        print(newUser)
    }
    
    @IBAction func laod() {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        let userRequest = NSFetchRequest(entityName: "Users")
        userRequest.returnsObjectsAsFaults = false
        userRequest.predicate = NSPredicate(format: "username=%@", "qgymje")
        
        do {
            let results = try context.executeFetchRequest(userRequest) as NSArray
            if results.count > 0 {
                let result: NSManagedObject = results[0] as! NSManagedObject
                userName.text = result.valueForKey("username") as? String
                password.text = result.valueForKey("password") as? String
            } else {
                print("no users")
            }
        } catch {
            print("fetch error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

