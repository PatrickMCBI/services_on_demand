class WFreelance:
    def __init__(self, ID, FullName, Email, PhoneNumber, Profile, ServiceName):
        self.ID             = ID
        self.FullName       = FullName
        self.Email          = Email
        self.PhoneNumber    = PhoneNumber
        self.Profile        = Profile
        self.ServiceName    = ServiceName
       

    def to_dict(self):
        return {
            "ID": self.ID,
            "FullName": self.FullName,
            "Email": self.Email,
            "PhoneNumber": self.PhoneNumber,
            "Profile": self.Profile,
            "ServiceName": self.ServiceName,
           
        }