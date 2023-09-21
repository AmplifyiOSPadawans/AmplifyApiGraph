// swiftlint:disable all
import Amplify
import Foundation

public struct Dog: Model {
  public let id: String
  public var name: String
  public var bread: String
  public var age: Int
  public var gender: Bool
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      bread: String,
      age: Int,
      gender: Bool) {
    self.init(id: id,
      name: name,
      bread: bread,
      age: age,
      gender: gender,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      bread: String,
      age: Int,
      gender: Bool,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.bread = bread
      self.age = age
      self.gender = gender
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
