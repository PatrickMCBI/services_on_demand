class Services:
    def __init__(self, ID, CategoryID, ServiceName, Img, Description, IsActive, DateCreated, DateUpdated):
        self.ID             = ID
        self.CategoryID     = CategoryID
        self.Img            = Img
        self.ServiceName    = ServiceName
        self.Description    = Description
        self.IsActive       = IsActive
        self.DateCreated    = DateCreated
        self.DateUpdated    = DateUpdated

    def to_dict(self):
        return {
            "ID": self.ID,
            "CategoryID": self.CategoryID,
            "ServiceName": self.ServiceName,
            "Img": self.Img,
            "Description": self.Description,
            "IsActive": self.IsActive,
            "DateCreated": self.DateCreated,
            "DateUpdated": self.DateUpdated
        }