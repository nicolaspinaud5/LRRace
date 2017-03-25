import Foundation

public class AverageSpeed {
	public var units : String?
	public var speed : Double?
    
    /**
     Initializer to create an AverageSpeed object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about average speed of fastest lap
     */
	required public init?(dictionary: NSDictionary) {

		units = dictionary["units"] as? String
		speed = dictionary["speed"] as? Double
	}

    /**
     Return a NSDictionary containing all informations about average speed of fastest lap
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.units, forKey: "units")
		dictionary.setValue(self.speed, forKey: "speed")

		return dictionary
	}

}
