import Foundation

public class Time {
	public var time : String?

    /**
     Initializer to create a Time object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing driver's time to end up the race
     */
    required public init?(dictionary: NSDictionary) {

		time = dictionary["time"] as? String
	}

    /**
     Return a NSDictionary containing driver's time to end up the race
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.time, forKey: "time")

		return dictionary
	}

}
