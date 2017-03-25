import Foundation

public class FastestLap {
	public var rank : Int?
	public var lap : Int?
	public var time : Time?
	public var averageSpeed : AverageSpeed?

    /**
     Initializer to create a FastestLap object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a driver's fastest lap
     */
	required public init?(dictionary: NSDictionary) {

		rank = dictionary["rank"] as? Int
		lap = dictionary["lap"] as? Int
		if (dictionary["Time"] != nil) { time = Time(dictionary: dictionary["Time"] as! NSDictionary) }
		if (dictionary["AverageSpeed"] != nil) { averageSpeed = AverageSpeed(dictionary: dictionary["AverageSpeed"] as! NSDictionary) }
	}

    /**
     Return a NSDictionary containing all informations about a driver's fastest lap
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.rank, forKey: "rank")
		dictionary.setValue(self.lap, forKey: "lap")
		dictionary.setValue(self.time?.dictionaryRepresentation(), forKey: "Time")
		dictionary.setValue(self.averageSpeed?.dictionaryRepresentation(), forKey: "AverageSpeed")

		return dictionary
	}

}
