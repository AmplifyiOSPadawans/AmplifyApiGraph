// swiftlint:disable all
import Amplify
import Foundation

extension Dog {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case bread
    case age
    case gender
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let dog = Dog.keys
    
    model.listPluralName = "Dogs"
    model.syncPluralName = "Dogs"
    
    model.attributes(
      .primaryKey(fields: [dog.id])
    )
    
    model.fields(
      .field(dog.id, is: .required, ofType: .string),
      .field(dog.name, is: .required, ofType: .string),
      .field(dog.bread, is: .required, ofType: .string),
      .field(dog.age, is: .required, ofType: .int),
      .field(dog.gender, is: .required, ofType: .bool),
      .field(dog.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(dog.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Dog: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}