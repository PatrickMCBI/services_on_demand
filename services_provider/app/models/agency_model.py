class Agency:
    def __init__(self, ID, ServicesID, AgencyName, Description, ContactNumber, Email, Web, IsActive, DateCreated, DateUpdated):
        self.ID = ID
        self.ServicesID     = ServicesID
        self.AgencyName     = AgencyName
        self.Description    = Description
        self.ContactNumber  = ContactNumber
        self.Email          = Email
        self.Web            = Web
        self.IsActive       = IsActive
        self.DateCreated    = DateCreated
        self.DateUpdated    = DateUpdated

    def to_dict(self):
        return {
            "ID": self.ID,
            "ServicesID": self.ServicesID,
            "AgencyName": self.AgencyName,
            "Description": self.Description,
            "ContactNumber": self.ContactNumber,
            "Web": self.Web,
            "DateUpdated": self.DateUpdated,
            "IsActive": self.IsActive,
            "DateCreated": self.DateCreated,
            "DateUpdated": self.DateUpdated
        }