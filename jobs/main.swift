//  Created by Dania Alogla on 21/05/1443 AH.
import Foundation

// create majors and cities array
var majors: [String] = ["Computer science","Business","English","History","Economics","Engineering"]
var cities: [String] = ["Jeddah", "Makkah", "Riyadh","Dammam"]

// create variable for city and major to save user choise
var city : String = ""
var major : String = ""

// class of job
class Job{
    var name : String
    var majors : [String]
    var cities : [String]
    
    init (name: String,majors:[String],cities:[String]){
        self.name = name
        self.cities = cities
        self.majors = majors
    }
}
// create jobs
var softwareProgrammer = Job(name:"Software programmer",majors: ["Computer science"],cities:cities)
var databaseAdministrator = Job(name:"Database administrator",majors: ["Computer science"],cities: ["Jeddah","Riyadh","Dammam"])
var artificialIntelligenceQualityExpert = Job(name:"Artificial intelligence quality expert",majors: ["Computer science"],cities:["Riyadh"])
var stockBroker = Job(name:"Stock broker",majors:["Business"] ,cities:cities)
var purchaser = Job(name:"Purchaser",majors:["Business"] ,cities:["Jeddah", "Riyadh"])
var loanOfficer = Job(name:"Loan officer",majors: ["Business"] ,cities:["Jeddah", "Makkah", "Riyadh"])
var editor = Job(name:"Editor",majors:["English"] ,cities:["Jeddah","Riyadh","Dammam"])
var journalist = Job(name:"Journalist",majors: ["English"],cities:["Jeddah","Riyadh","Dammam"])
var televisionReporter = Job(name:"Television reporter",majors:["English"] ,cities:["Riyadh"])
var archivist = Job(name:"Archivist",majors:["History"] ,cities:cities)
var recordsManager = Job(name:"Records manager",majors:["History"] ,cities:["Riyadh"])
var consultant = Job(name:"Consultant",majors:["Economics"] ,cities:["Jeddah", "Makkah", "Riyadh"])
var financialAdviser = Job(name:"Financial adviser",majors: ["Economics"] ,cities:["Jeddah","Riyadh"])
var electronicsInstructor = Job(name:"Electronics instructor",majors:["Engineering"] ,cities:["Jeddah","Riyadh"])
var safetyEngineer = Job(name:"Safety engineer",majors:["Engineering"],cities:["Makkah", "Riyadh"])
var nuclearEngineer = Job(name:"Nuclear engineer",majors:["Engineering"] ,cities:["Riyadh"])

var jobs = [softwareProgrammer,databaseAdministrator,artificialIntelligenceQualityExpert,stockBroker,purchaser
            ,loanOfficer,editor,journalist,televisionReporter,archivist,recordsManager,consultant,financialAdviser
            ,electronicsInstructor,safetyEngineer,nuclearEngineer]

 
// print
print("-----------------------------------------------")
print("Hello, welcome to the Swift job applying system")
// call for showMenu function
showMenu()

var userChoise : String = ""

// function for show menu
func showMenu(){
    repeat{
    print("\n---------------------MENU----------------------")
    print("1. Select the major")
    print("2. Select the city")
    print("3. Display the available jobs")
    print("4. Exit")
    print("-----------------------------------------------")
    print("Select your choise")
    print("-----------------------------------------------")
    

    if let input = readLine(){
        userChoise = input
        
        switch userChoise{
        case "1":
            var majorIndex = selectMajor()
            major = majors[majorIndex]
        case "2":
            var cityIndex = selectCity()
            city = cities[cityIndex]
        case "3":
            availableJobs(major: major,city: city,jobs:jobs)
        case "4":
            print("Thank You!")
        default:
            print("")
            
        }
    } else {
        print("You did not enter a choise")
        showMenu()
    }
    } while(userChoise != "4")
}

// function to select major
func selectMajor() -> Int{
    print("\n--------------------MAJORS---------------------")
    for (index, element) in majors.enumerated() {
        print(index+1,".",element)
    }
    print("-----------------------------------------------")
    print("Select a major")
    print("-----------------------------------------------")
    
    var userChoise : String = ""

    if let input = readLine(){
        userChoise = input
    } else {
        print("You did not select a major")
        return selectMajor()
    }
    var majorIndex = Int(userChoise) ?? -1
    
    
    return majorIndex-1
}

// function to select city
func selectCity() -> Int{
    print("\n--------------------CITIES---------------------")
    for (index, element) in cities.enumerated() {
        print(index+1,".",element)
    }
    print("-----------------------------------------------")
    print("Select a city")
    print("-----------------------------------------------")
    
    var userChoise : String = ""

    if let input = readLine(){
        userChoise = input
    } else {
        print("You did not select a city")
        return selectCity()
    }
    var cityIndex = Int(userChoise) ?? -1
    
    return cityIndex-1
}

// function for filtter  jobs and select one
func availableJobs(major: String, city: String, jobs: [Job]){
    print("\n----------------AVAILABLE JOBS-----------------")
    var jobCounter = 0
    var availableJobs : [Job] = []
    var userChoise : String = ""
    
    for job in jobs{
        if job.majors .contains(major) && job.cities .contains(city){
            jobCounter += 1
            print(jobCounter,".",job.name)
            availableJobs.append(job)
        }
    }
    print("-----------------------------------------------")
    print("Select a job")
    
    if let input = readLine(){
        userChoise = input
    } else {
        
    }
    print("-----------------------------------------------")
    var jobIndex = Int(userChoise) ?? -1
    
    if jobCounter == 0 {
        print("There are not avaiable jobs for your major an city")
    } else {
        print("You have apply for ",availableJobs[jobIndex-1].name," position!")
    }

}

    






