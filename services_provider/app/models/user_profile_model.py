class UsersProfile:
    def __init__(self, AccountID = None, UserID = None, Username = None, Password = None, FirstName = None, LastName =None, Email = None, PhoneNumber = None, Birthdate = None, Address = None, Description = None, Profile = None):
        self.AccountID      = AccountID
        self.UserID         = UserID
        self.Username       = Username
        self.Password       = Password
        self.FirstName      = FirstName
        self.LastName       = LastName
        self.Email          = Email
        self.PhoneNumber    = PhoneNumber
        self.Birthdate      = Birthdate
        self.Address        = Address
        self.Description    = Description
        self.Profile        = Profile
        
    def to_dict(self):
        return {
            "AccountID" : self.AccountID,
            "UserID" : self.UserID,
            "Username" :self.Username,
            "Password" :self.Password,
            "FirstName" :self.FirstName,
            "LastName" :self.LastName,
            "Email" :self.Email,
            "PhoneNumber" :self.PhoneNumber,
            "Birthdate" :self.Birthdate,
            "Address" :self.Address,
            "Description" :self.Description,
            "Profile" :self.Profile
        }