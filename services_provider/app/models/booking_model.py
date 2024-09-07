class Booking:
    def __init__(self, ID =None, AccountID =None, UserID=None, WServicesID =None, BookingStartDate =None, BookingEndDate =None, BookingAddress =None, BookingMessage =None, BookingStatus =None, TotalPrice =None, FullName =None, StatusName =None, PaymentMethod = None):
        self.ID                 = ID
        self.AccountID          = AccountID
        self.UserID             = UserID
        self.WServicesID        = WServicesID
        self.BookingStartDate   = BookingStartDate
        self.BookingEndDate     = BookingEndDate
        self.BookingAddress     = BookingAddress
        self.BookingMessage     = BookingMessage
        self.BookingStatus      = BookingStatus
        self.TotalPrice         = TotalPrice
        self.FullName           = FullName
        self.StatusName         = StatusName
        self.PaymentMethod      = PaymentMethod

    def to_dict(self):
        return {
            "ID" : self.ID,
            "AccountID" : self.AccountID,
            "UserID" : self.UserID,
            "WServicesID" : self.WServicesID,
            "BookingStartDate" : self.BookingStartDate,
            "BookingEndDate" : self.BookingEndDate,
            "BookingAddress" : self.BookingAddress,
            "BookingMessage" : self.BookingMessage,
            "BookingStatus" : self.BookingStatus,
            "TotalPrice" : self.TotalPrice,
            "FullName" : self.FullName,
            "StatusName" : self.StatusName,
            "PaymentMethod" : self.PaymentMethod
        }
    
class UpdateBooking:
    def __init__(self, BookingID = None, StatusID = None):
        self.BookingID  = BookingID
        self.StatusID   = StatusID

    def to_dict(self):
        return {
            "BookingID" : self.BookingID,
            "StatusID" : self.StatusID
        }