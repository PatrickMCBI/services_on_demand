class Users:
    def __init__(self, ID = None, FirstName = None, LastName = None, UserName=None, Email = None, Password = None, PhoneNumber = None, BirthDate = None, Profile = None, UserTypeID = None, IsActive = None, DateCreated = None, DateUpdated = None, TypeName = None, ServiceName = None, VerificationToken = None):
        self.ID             = ID
        self.FirstName      = FirstName
        self.LastName       = LastName
        self.Email          = Email
        self.UserName       = UserName
        self.Password       = Password
        self.PhoneNumber    = PhoneNumber
        self.BirthDate      = BirthDate
        self.Profile        = Profile
        self.UserTypeID     = UserTypeID
        self.IsActive       = IsActive
        self.DateCreated    = DateCreated
        self.DateUpdated    = DateUpdated
        self.TypeName       = TypeName
        self.ServiceName    = ServiceName
        self.VerificationToken = VerificationToken

    def to_dict(self):
        return {
            "ID" : self.ID,
            "FirstName" : self.FirstName,
            "LastName" : self.LastName,
            "Email" : self.Email,
            "UserName" : self.UserName,
            "Password" : self.Password,
            "PhoneNumber" : self.PhoneNumber,
            "BirthDate" : self.BirthDate,
            "Profile" : self.Profile,
            "UserTypeID" : self.UserTypeID,
            "IsActive" : self.IsActive,
            "DateCreated" : self.DateCreated,
            "DateUpdated" : self.DateUpdated,
            "TypeName" : self.TypeName,
            "ServiceName" : self.ServiceName,
            "VerificationToken" : self.VerificationToken
        }