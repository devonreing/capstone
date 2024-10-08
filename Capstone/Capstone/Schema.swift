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
class PickUp {
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
class Send {
    @Persisted var emailSend: User // person sending request
    @Persisted var emailReceive: User // person receiving request
}

// relationship
class Receive {
    @Persisted var emailSend: User // person sending request
    @Persisted var emailReceive: User // person receiving request
}

// relationship
class For {
    @Persisted var rrid: RideRequest
    @Persisted var cid: List<Children> // list allows for ride request to be for multiple children or one child
}

class Teachers: Object {
    @Persisted(primaryKey: true) var tid: Int
    @Persisted var name: String
    @Persisted var classroom: String // incase buildings are involved or letters such as 3A
    @Persisted var email: String
    @Persisted var phone: String // incase of country codes, (), and dashes
}

// relationship
class Teach {
    @Persisted var cid: Children
    @Persisted var tid: Teachers
}

class School: Object {
    @Persisted(primaryKey: true) var sid: Int
    @Persisted var name: String
    @Persisted var address: String
    @Persisted var city: String
    @Persisted var state: String
}

// relationship
class Contain {
    @Persisted var email: User
    @Persisted var sid: School
}

// relationship
class Employ {
    @Persisted var sid: School
    @Persisted var tid: Teachers
}

class SchoolCalendar: Object {
    @Persisted(primaryKey: true) var calid: Int
    @Persisted var date: Date
}

// relationship
class Update {
    @Persisted var tid: Teachers
    @Persisted var calid: SchoolCalendar
}

// relationship
class Create {
    @Persisted var sid: School
    @Persisted var calid: SchoolCalendar
}

// relationship
class AddTo {
    @Persisted var email: User
    @Persisted var calid: SchoolCalendar
}

class CalEvents: Object {
    @Persisted(primaryKey: true) var eid: Int
    @Persisted var title: String
    @Persisted var message: String
    @Persisted var audience: String // may change this ??
    @Persisted var date: Date
}

// relationship
class Have {
    @Persisted var eid: CalEvents
    @Persisted var calid: SchoolCalendar
}

class Alerts: Object {
    @Persisted(primaryKey: true) var aid: Int
    @Persisted var priority: Int
    @Persisted var title: String
    @Persisted var body: String
    @Persisted var audience: String // may change this ??
}

// relationship
class AlertSend {
    @Persisted var calid: SchoolCalendar
    @Persisted var aid: Alerts
}
