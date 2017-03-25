import Foundation

public class Driver {
	public var driverId : String?
	public var permanentNumber : Int?
	public var code : String?
	public var url : String?
	public var givenName : String?
	public var familyName : String?
	public var dateOfBirth : String?
	public var nationality : String?

    /**
     Initializer to create a Driver object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a driver
     */
	required public init?(dictionary: NSDictionary) {

		driverId = dictionary["driverId"] as? String
		permanentNumber = dictionary["permanentNumber"] as? Int
		code = dictionary["code"] as? String
		url = dictionary["url"] as? String
		givenName = dictionary["givenName"] as? String
		familyName = dictionary["familyName"] as? String
		dateOfBirth = dictionary["dateOfBirth"] as? String
		nationality = dictionary["nationality"] as? String
	}

    /**
     Return a NSDictionary containing all informations about a driver
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.driverId, forKey: "driverId")
		dictionary.setValue(self.permanentNumber, forKey: "permanentNumber")
		dictionary.setValue(self.code, forKey: "code")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.givenName, forKey: "givenName")
		dictionary.setValue(self.familyName, forKey: "familyName")
		dictionary.setValue(self.dateOfBirth, forKey: "dateOfBirth")
		dictionary.setValue(self.nationality, forKey: "nationality")

		return dictionary
	}

}
