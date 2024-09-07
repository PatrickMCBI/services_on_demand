class Notification:
    def __init__(self, ID = None, BookingID = None, IsActive = None, IsRead = None, CountNotifications = None):
        self.ID         = ID
        self.BookingID  = BookingID
        self.IsActive   = IsActive
        self.IsRead     = IsRead
        self.CountNotifications = CountNotifications

    def to_dict(self):
        return {
            "ID" : self.ID,
            "BookingID" : self.BookingID,
            "IsActive" : self.IsActive,
            "IsRead" : self.IsRead,
            "CountNotifications" : self.CountNotifications
        }