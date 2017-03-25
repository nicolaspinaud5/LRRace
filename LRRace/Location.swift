import Foundation

public class Location {
	public var lat : Double?
	public var long : Double?
	public var locality : String?
	public var country : String?
    
    /**
     Initializer to create a Location object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a location
     */
	required public init?(dictionary: NSDictionary) {

		lat = dictionary["lat"] as? Double
		long = dictionary["long"] as? Double
		locality = dictionary["locality"] as? String
		country = dictionary["country"] as? String
	}

    /**
     Return a NSDictionary containing all informations about a location
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.lat, forKey: "lat")
		dictionary.setValue(self.long, forKey: "long")
		dictionary.setValue(self.locality, forKey: "locality")
		dictionary.setValue(self.country, forKey: "country")

		return dictionary
	}

}
