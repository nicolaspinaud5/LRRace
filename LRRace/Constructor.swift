import Foundation

public class Constructor {
	public var constructorId : String?
	public var url : String?
	public var name : String?
	public var nationality : String?

    /**
     Initializer to create a Constructor object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a car constructor
     */
	required public init?(dictionary: NSDictionary) {

		constructorId = dictionary["constructorId"] as? String
		url = dictionary["url"] as? String
		name = dictionary["name"] as? String
		nationality = dictionary["nationality"] as? String
	}

    /**
     Return a NSDictionary containing all informations about a car constructor
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.constructorId, forKey: "constructorId")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.nationality, forKey: "nationality")

		return dictionary
	}

}
