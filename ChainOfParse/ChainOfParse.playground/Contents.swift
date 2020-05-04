import UIKit

func dataFunc(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

class Person {
    let name: String
    let age: Int
    let isDeveloper: Bool
    
    init(name: String, age: Int, isDeveloper: Bool) {
        self.name = name
        self.age = age
        self.isDeveloper = isDeveloper
    }
}

protocol ParsePerson {
    var next: ParsePerson? { get set }
    func parse(_ fileName: String) -> [Person]
    
}

class ParsePersonWithData: ParsePerson {
        var next: ParsePerson?
        func parse(_ fileName: String) -> [Person]{
            let data = dataFunc(from: fileName)
            var arrayPersons = [Person]()
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let persons = json["data"] as? [Any] {
                    print("ParsePersonWithData")
                    for person in persons {
                        let person = person as! [String: Any]
                        let name = person["name"] as! String
                        let age = person["age"] as! Int
                        let isDeveloper = person["isDeveloper"] as! Bool
                        arrayPersons.append(Person(name: name, age: age, isDeveloper: isDeveloper))
                    }
                }
                else {
                    arrayPersons = self.next!.parse(fileName)
                    return arrayPersons
                    }
            }
            else {
                    arrayPersons = self.next!.parse(fileName)
                    return arrayPersons
                }
            }
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                
            }
            return (arrayPersons)
        }
    }

class ParsePersonWithResult: ParsePerson {
    var next: ParsePerson?
    
    func parse(_ fileName: String) -> [Person]{
        let data = dataFunc(from: fileName)
        var arrayPersons = [Person]()
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let persons = json["result"] as? [Any] {
                print("ParsePersonWithResult")
                for person in persons {
                    let person = person as! [String: Any]
                    let name = person["name"] as! String
                    let age = person["age"] as! Int
                    let isDeveloper = person["isDeveloper"] as! Bool
                    arrayPersons.append(Person(name: name, age: age, isDeveloper: isDeveloper))
                }
            }
            else {
                arrayPersons = self.next!.parse(fileName)
                return arrayPersons
            }
        }
        else {
            arrayPersons = self.next!.parse(fileName)
            return arrayPersons
            }
        }
        catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
           
        }
        return (arrayPersons)
    }
}

class ParsePersonWithoutKey: ParsePerson {
    var next: ParsePerson?
    
    func parse(_ fileName: String) -> [Person]{
        let data = dataFunc(from: fileName)
        var arrayPersons = [Person]()
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] {
                print("ParsePersonWithoutKey")
                for person in json {
                    let person = person as! [String: Any]
                    let name = person["name"] as! String
                    let age = person["age"] as! Int
                    let isDeveloper = person["isDeveloper"] as! Bool
                    arrayPersons.append(Person(name: name, age: age, isDeveloper: isDeveloper))
                }
        }
        else {
            arrayPersons = self.next!.parse(fileName)
            return arrayPersons
            }
        }
        catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
           
        }
        return (arrayPersons)
    }
}



let parsePersonWithResult = ParsePersonWithResult()
let parsePersonWithData = ParsePersonWithData()
let parsePersonWithoutKey = ParsePersonWithoutKey()
let parsePerson: ParsePerson = parsePersonWithResult

parsePersonWithResult.next = parsePersonWithData
parsePersonWithData.next = parsePersonWithoutKey
parsePersonWithoutKey.next = nil

var arrayPersons = parsePerson.parse("1")



for person in arrayPersons {
    print(person.name)
    print(person.age)
    print(person.isDeveloper)
    print("")
}
arrayPersons = parsePerson.parse("2")
for person in arrayPersons {
    print(person.name)
    print(person.age)
    print(person.isDeveloper)
    print("")
}
arrayPersons = parsePerson.parse("3")
for person in arrayPersons {
    print(person.name)
    print(person.age)
    print(person.isDeveloper)
    print("")
}

