
import Foundation

let arrayOfInformationDicitonary: [[String:Any]] = [
    
    [
        
        "firstName": "Pallavi",
        
        "lastName": "Srikhakollu",
        
        "employeeId": 1,
        
        "address": [
            
            "city" : "pune",
            
            "state" : "Maharshtra"
            
        ],
        
        "technology":"c++",
        "experience" : 5
        
    ],
    
    [
        
        "firstName": "Rakshith",
        
        "lastName": "nandish",
        
        "employeeId": 2,
        
        "address": [
            
            "city" : "Dharwad",
            
            "state" : "karanataka"
            
        ],
        
        "technology":"java",
        "experience" : 3
        
        
    ],
    
    [
        
        "firstName": "Leah",
        
        "lastName": "Rivera",
        
        "employeeId": 3,
        
        "address": [
            
            "city" : "Mumbai",
            
            "state" : "Maharashtra"
            
        ],
        
        "technology":"html",
        "experience" : 4
        
    ],
    
    [
        
        "firstName": "Sonja",
        
        "lastName": "Moreno",
        
        "employeeId": 4,
        
        "address": [
            
            "city" : "california",
            
            "state" : "us"
            
        ],
        
        "technology":"android",
        "experience" : 2
        
    ],
    
    [
        
        "firstName": "Noel",
        
        "lastName": "Bowen",
        
        "employeeId": 5,
        
        "address": [
            
            "city" : "newjersey",
            
            "state" : "karanataka"
            
        ],
        
        "technology":"c++",
        "experience" : 2
        
    ]]



class Employee: Person{
    
    var employeeId:Int
    var experience:Int
    var technology:String
    var arrayOfEmployee = Array<Employee>()
    
    
    
    override init(){
        
        employeeId = 0
        experience = 0
        technology = ""
        super.init()
        
    }
    
    func initializeEmpObjects(){
        
        var dictArray1: Dictionary<String, String>
        
        for dict in arrayOfInformationDicitonary {
            
            var employee = Employee()
            employee.firstName = dict["firstName"] as! String
            employee.lastName = dict["lastName"] as! String
            employee.employeeId = dict["employeeId"] as! Int
            employee.experience = dict["experience"] as! Int
            employee.technology = dict["technology"] as! String
            dictArray1 = dict["address"] as! Dictionary
            employee.addressObject.city = dictArray1["city"] as String!
            employee.addressObject.state=dictArray1["state"] as String!
            arrayOfEmployee.append(employee)
            
            
        }
        
        
        
    }
    
    
    func employeeWithGreaterThanGivenExperience(givenExperience :Int ){
        
        var employeeExperience :Int
        println("employee with greater than \(givenExperience) experience are :\n")
        for employee in arrayOfEmployee{
            
            employeeExperience = employee.experience
           
            if(employeeExperience > givenExperience){
                println(employee.firstName)
            }
        }
        
        
    }
    
    
    func employeeWithLesserThanGivenExperience(givenExperience :Int){
        var employeeExperience :Int
        println("employee with lesser than \(givenExperience) experience are :\n")
        for employee in arrayOfEmployee{
            
            employeeExperience = employee.experience
            
            if(employeeExperience < givenExperience){
                println(employee.firstName)
            }
        }

    }
    
    
    
    func employeeWithEqualToGivenExperience(givenExperience :Int){
        var employeeExperience :Int
        println("employee with experience equal to  \(givenExperience) experience are :\n")
        for employee in arrayOfEmployee{
            
            employeeExperience = employee.experience
            
            if(employeeExperience == givenExperience){
                println(employee.firstName)
            }
        }

    }
    
    
    
    func highestExperienceInGivenTechnology(givenTechnology: String){
         var maximumEmployeeExperience=0
        var employeeIdWithMaximumExperience = 0
        for (index,employeeTemp) in enumerate(arrayOfEmployee)
        {
            if(employeeTemp.technology == givenTechnology)
            {
                if(maximumEmployeeExperience <  employeeTemp.experience ){
                    
                    employeeIdWithMaximumExperience = index
                    
                }
            }
            
        }
        
        
        println("employee with maximum experience in \(givenTechnology) is  \(arrayOfEmployee[employeeIdWithMaximumExperience].firstName)")
    }


}

