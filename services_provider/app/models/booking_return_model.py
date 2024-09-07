class BookingReturn:
    def __init__(self, ID =None, FullName =None, BookingStartDate =None, BookingEndDate =None, BookingAddress =None, BookingMessage =None,  TotalPrice =None, StatusName =None):
        self.ID                 = ID
        self.FullName           = FullName
        self.BookingStartDate   = BookingStartDate
        self.BookingEndDate     = BookingEndDate
        self.BookingAddress     = BookingAddress
        self.BookingMessage     = BookingMessage
        self.TotalPrice         = TotalPrice
        self.StatusName         = StatusName

    def to_dict(self):
        return {
            "ID" : self.ID,
            "FullName" : self.FullName,
            "BookingStartDate" : self.BookingStartDate,
            "BookingEndDate" : self.BookingEndDate,
            "BookingAddress" : self.BookingAddress,
            "BookingMessage" : self.BookingMessage,
            "TotalPrice" : self.TotalPrice,
            "StatusName" : self.StatusName
        }
class BookingUserReturn:
    def __init__(self, BookingID =None, BookingStartDate =None, BookingEndDate =None, TotalPrice =None, FullName =None, PhoneNumber =None,  Profile =None, ServiceName =None, StatusID = None, StatusName =None):
        self.BookingID          = BookingID
        self.BookingStartDate   = BookingStartDate
        self.BookingEndDate     = BookingEndDate
        self.TotalPrice         = TotalPrice
        self.FullName           = FullName
        self.PhoneNumber        = PhoneNumber
        self.Profile            = Profile
        self.ServiceName        = ServiceName
        self.StatusID           = StatusID
        self.StatusName         = StatusName

    def to_dict(self):
        return {
            "BookingID" : self.BookingID,
            "BookingStartDate" : self.BookingStartDate,
            "BookingEndDate" : self.BookingEndDate,
            "TotalPrice" : self.TotalPrice,
            "FullName" : self.FullName,
            "PhoneNumber" : self.PhoneNumber,
            "Profile" : self.Profile,
            "ServiceName" : self.ServiceName,
            "StatusID" : self.StatusID,
            "StatusName" : self.StatusName
        }