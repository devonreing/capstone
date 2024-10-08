import RealmSwift
import Foundation

// used for parents
class User: Object {
    @Persisted(primaryKey: true) var email: String
    @Persisted var name: String
    @Persisted var phoneNumber: String // incase of country codes, (), and dashes
    @Persisted var role: String
    @Persisted var address: String
    @Persisted var city: String
    @Persisted var state: String
}

class Children: Object {
    @Persisted(primaryKey: true) var cid: Int
    @Persisted var signUpCode: Int
    @Persisted var name: String
    @Persisted var classroom: String
    @Persisted var age: Int
}

// relationship
class PickUp: Object {
    @Persisted var cid: Children // foreign key declaration
    @Persisted var email: User
    @Persisted var validDates: Date
}

class RideRequest: Object {
    @Persisted(primaryKey: true) var rrid: Int
    @Persisted var status: Bool // true for responded, false for still open
    @Persisted var accepted: Bool // true for accepted, false for denied, null for not responded
    @Persisted var date: Date
}

// relationship
class Send: Object {
    @Persisted var emailSend: User // person sending request
    @Persisted var emailReceive: User // person receiving request
}

// relationship
class Receive: Object {
    @Persisted var emailSend: User // person sending request
    @Persisted var emailReceive: User // person receiving request
}

// relationship
class For: Object {
    @Persisted var rrid: RideRequest
    @Persisted var cid: List<Children> // list allows for ride request to be for multiple children or one child
}

//
