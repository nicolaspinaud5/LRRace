import Foundation

public class Result {
	public var number : Int?
	public var position : Int?
	public var positionText : Int?
	public var points : Int?
	public var driver : Driver?
	public var constructor : Constructor?
	public var grid : Int?
	public var laps : Int?
	public var status : String?
	public var time : Time?
	public var fastestLap : FastestLap?

    /**
     Create an Array of Result
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a race result
     @return Array<Result> model An Array of Result created by an NSArray of NSDictionary
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Result]
    {
        var models:[Result] = []
        for item in array
        {
            models.append(Result(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    /**
     Initializer to create a Result object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a race result
     */
	required public init?(dictionary: NSDictionary) {

		number = dictionary["number"] as? Int
		position = dictionary["position"] as? Int
		positionText = dictionary["positionText"] as? Int
		points = dictionary["points"] as? Int
		if (dictionary["Driver"] != nil) { driver = Driver(dictionary: dictionary["Driver"] as! NSDictionary) }
		if (dictionary["Constructor"] != nil) { constructor = Constructor(dictionary: dictionary["Constructor"] as! NSDictionary) }
		grid = dictionary["grid"] as? Int
		laps = dictionary["laps"] as? Int
		status = dictionary["status"] as? String
		if (dictionary["Time"] != nil) { time = Time(dictionary: dictionary["Time"] as! NSDictionary) }
		if (dictionary["FastestLap"] != nil) { fastestLap = FastestLap(dictionary: dictionary["FastestLap"] as! NSDictionary) }
	}

    /**
     Return a NSDictionary containing all informations about a race result
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.number, forKey: "number")
		dictionary.setValue(self.position, forKey: "position")
		dictionary.setValue(self.positionText, forKey: "positionText")
		dictionary.setValue(self.points, forKey: "points")
		dictionary.setValue(self.driver?.dictionaryRepresentation(), forKey: "Driver")
		dictionary.setValue(self.constructor?.dictionaryRepresentation(), forKey: "Constructor")
		dictionary.setValue(self.grid, forKey: "grid")
		dictionary.setValue(self.laps, forKey: "laps")
		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.time?.dictionaryRepresentation(), forKey: "Time")
		dictionary.setValue(self.fastestLap?.dictionaryRepresentation(), forKey: "FastestLap")

		return dictionary
	}

}
