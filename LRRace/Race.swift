import Foundation

public class Race {
	public var season : Int?
	public var round : Int?
	public var url : String?
	public var raceName : String?
	public var circuit : Circuit?
	public var date : String?
	public var time : String?
	public var results : Array<Result>?

    /**
     Create an Array of Race
     
     @param NSDictionary dictionary An NSDictionary containing all informations about a race
     @return Array<Race> model An Array of Result created by an NSArray of NSDictionary
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Race]
    {
        var models:[Race] = []
        for item in array
        {
            models.append(Race(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    /**
     Initializer to create a Race object from NSDictionary
     
     @param NSDictionary dictionary An NSDictionary containing all informations about the last race
     */
	required public init?(dictionary: NSDictionary) {

		season = dictionary["season"] as? Int
		round = dictionary["round"] as? Int
		url = dictionary["url"] as? String
		raceName = dictionary["raceName"] as? String
		if (dictionary["Circuit"] != nil) { circuit = Circuit(dictionary: dictionary["Circuit"] as! NSDictionary) }
		date = dictionary["date"] as? String
		time = dictionary["time"] as? String
		if (dictionary["Results"] != nil) { results = Result.modelsFromDictionaryArray(array: dictionary["Results"] as! NSArray) }
	}
    
    /**
     Return a NSDictionary containing all informations about the last race
     
     @return NSDictionary
     */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.season, forKey: "season")
		dictionary.setValue(self.round, forKey: "round")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.raceName, forKey: "raceName")
		dictionary.setValue(self.circuit?.dictionaryRepresentation(), forKey: "Circuit")
		dictionary.setValue(self.date, forKey: "date")
		dictionary.setValue(self.time, forKey: "time")

		return dictionary
	}

}
