//
//  ApiHelper.swift
//  AmplifyApiGraph
//
//  Created by David Perez Espino on 20/09/23.
//

import Amplify

class ApiHelper {
    
    
    func createPet(dog: Dog) async -> Bool {
        do {
            let result = try await Amplify.API.mutate(request: .create(dog))
            switch result {
                case .success(let dog):
                    print("Successfully created the dog: \(dog)")
                    return true
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
            }
        } catch let error as APIError {
            print("Failed to create a dog: ", error)
        } catch {
            print("Unexpected error: \(error)")
        }
        
        return false
    }
    
    func listDogs() async -> List<Dog>? {
        let request = GraphQLRequest<Dog>.list(Dog.self, where: nil, limit: 1000)
        do {
            let result = try await Amplify.API.query(request: request)
            switch result {
                case .success(let dogs):
                    print("Successfully retrieved list of todos: \(dogs)")
                    return dogs
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
            }
        } catch let error as APIError {
            print("Failed to query list of dogs: ", error)
        } catch {
            print("Unexpected error: \(error)")
        }
        return nil
    }
    
    func updateDog(dog: Dog) async -> Bool {
        do {
            let result = try await Amplify.API.mutate(request: .update(dog))
            switch result {
                case .success(let dog):
                    print("Successfully updated dog: \(dog)")
                    return true
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
            }
        } catch let error as APIError {
            print("Failed to update dog: ", error)
        } catch {
            print("Unexpected error: \(error)")
        }
        return false
    }
    
    func deleteDog(dog: Dog) async -> Bool {
        do {
            let result = try await Amplify.API.mutate(request: .delete(dog))
            switch result {
                case .success:
                    print("Successfully deleted dog:")
                    return true
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
            }
            
        } catch let error as APIError {
            print("Failed to delete dog: ", error)
        } catch {
            print("Unexpected error: \(error)")
        }
        return false
    }

}
