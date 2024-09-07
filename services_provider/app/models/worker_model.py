class WorkerUsers:
    def __init__(self, ID = None, UserID = None, FullName = None, Address = None, Description = None, Profile = None, Url = None):
        self.ID             = ID
        self.UserID         = UserID
        self.FullName       = FullName
        self.Address        = Address
        self.Description    = Description
        self.Profile        = Profile
        self.Url            = Url
       

    def to_dict(self):
        return {
            "ID" : self.ID,
            "UserID" : self.UserID,
            "FullName" : self.FullName,
            "Address" : self.Address,
            "Description" : self.Description,
            "Profile" : self.Profile,
            "Url" : self.Url
        }