import Foundation

public class Circuit {
	public var circuitId : String?
	public var url : String?
	public var circuitName : String?
	public var location : Location?

    /**
     Initializer to create a Circuit object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a circuit
     */
	required public init?(dictionary: NSDictionary) {

		circuitId = dictionary["circuitId"] as? String
		url = dictionary["url"] as? String
		circuitName = dictionary["circuitName"] as? String
		if (dictionary["Location"] != nil) { location = Location(dictionary: dictionary["Location"] as! NSDictionary) }
	}

    /**
     Return a NSDictionary containing all informations about a circuit
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.circuitId, forKey: "circuitId")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.circuitName, forKey: "circuitName")
		dictionary.setValue(self.location?.dictionaryRepresentation(), forKey: "Location")

		return dictionary
	}

}
