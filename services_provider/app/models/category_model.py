class Category:
    def __init__(self, ID, CategoryName, Img, Description, DateCreated):
        self.ID = ID
        self.CategoryName   = CategoryName
        self.Img            = Img
        # self.Img            = Img, -- multiple data array
        self.Description    = Description
        self.DateCreated    = DateCreated

    def to_dict(self):
        return {
            "ID": self.ID,
            "CategoryName": self.CategoryName,
            "Img" : self.Img,
            "Description": self.Description,
            "DateCreated": self.DateCreated
        }