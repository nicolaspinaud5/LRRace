import Foundation

public class RaceTable {
	public var season : Int?
	public var round : Int?
	public var races : Array<Race>?

    /**
    Initializer to create a RaceTable object from NSDictionary
        
    @param NSDictionary dictionary An NSDictionary containing all informations about races
     */
	required public init?(dictionary: NSDictionary) {

		season = dictionary["season"] as? Int
		round = dictionary["round"] as? Int
		if (dictionary["Races"] != nil) { races = Race.modelsFromDictionaryArray(array: dictionary["Races"] as! NSArray) }
	}
    
    /**
    Return a NSDictionary containing all informations about races
     
    @return NSDictionary
    */
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.season, forKey: "season")
		dictionary.setValue(self.round, forKey: "round")

		return dictionary
	}
}
