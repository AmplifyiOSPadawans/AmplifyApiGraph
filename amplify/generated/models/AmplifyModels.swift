// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "2e33fe3aaec26cc67280748fa917b258"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Dog.self)
  }
}
