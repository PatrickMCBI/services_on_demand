from flask import jsonify, request, Blueprint
from models.notification_model import *
from models.booking_model import *
from models.booking_return_model import *
from models.users_model import *
from config import *

bookingapi = Blueprint('bookingapi', __name__)
# Get all booking
@bookingapi.route('/booking', methods=['GET'])
def get_all_booking():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetTransBooking")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    booking = [Booking(row.ID, row.UserID, row.AgenServicesID, row.BookingStartDate, row.BookingEndDate, row.BookingAddress, row.BookingMessage, row.BookingStatus, row.TotalPrice, row.FullName, row.StatusName) for row in rows]

    return jsonify([booknow.to_dict() for booknow in booking])

# # Get booking by ID
@bookingapi.route('/booking/<int:userID>', methods=['GET'])
def get_one_booking(userID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [transaction].[GetTransBookingByID] ?", userID)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    if rows:
        booking = [BookingReturn(row.ID, row.FullName, row.BookingStartDate, row.BookingEndDate, row.BookingAddress, row.BookingMessage, row.TotalPrice, row.StatusName) for row in rows]

        return jsonify([booknow.to_dict() for booknow in booking])

    else:
        return jsonify({'error': 'User not found'}), 404
    
# # Get User booking by ID
@bookingapi.route('/usrbooking/<int:accountID>', methods=['GET'])
def get_user_booking(accountID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [transaction].[GetTransBookingUserByID] ?", accountID)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    # Initialize dictionary to store bookings by status
    bookings_by_status = {
        "Pending": [],
        "InProgress": [],
        "Complete": [],
        "Cancel": []
    }

    if rows:
        for row in rows:
            booking = BookingUserReturn(
                row.BookingID, row.BookingStartDate, row.BookingEndDate, 
                row.TotalPrice, row.FullName, row.PhoneNumber, 
                row.Profile, row.ServiceName, row.StatusID, row.StatusName
            ).to_dict()

            # Use status names directly for matching
            if row.StatusID == 1:
                bookings_by_status["Pending"].append(booking)
            if row.StatusID == 2:
                bookings_by_status["InProgress"].append(booking)
            if row.StatusID == 3:
                bookings_by_status["Complete"].append(booking)
            if row.StatusID == 4:
                bookings_by_status["Cancel"].append(booking)

    return jsonify(bookings_by_status)


# # Add a new booking
@bookingapi.route('/addbooking', methods=['POST'])
def add_booking():
    data = request.get_json()
   
    booking = Booking(
        AccountID           = data['AccountID'],
        UserID              = data['UserID'],
        WServicesID         = data['WServicesID'],
        BookingStartDate    = data['BookingStartDate'],
        BookingEndDate      = data['BookingEndDate'],
        BookingAddress      = data['BookingAddress'],
        BookingMessage      = data['BookingMessage'],
        TotalPrice          = data['TotalPrice'],
        PaymentMethod       = data['PaymentMethod']
    )

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        EXEC [transaction].[PostBookingData] @AccountID=?, @UserID=?, @WServicesID=?, @BookingStartDate=?, @BookingEndDate=?, @BookingAddress=?, @BookingMessage=?, @TotalPrice=?, @PaymentMethod=? """,
        booking.AccountID, booking.UserID, booking.WServicesID, booking.BookingStartDate, booking.BookingEndDate, booking.BookingAddress, booking.BookingMessage, booking.TotalPrice, booking.PaymentMethod)
    conn.commit()
    cursor.close()
    conn.close()

    response = jsonify({'message': 'Booking created successfully','code':200})

    return response, 201

# # Update Booking
@bookingapi.route('/updatebooking', methods=['POST'])
def update_booking():
    data = request.get_json()
    booking = UpdateBooking(
        BookingID   = data['BookingID'],
        StatusID    = data['BookingStatus']
    )
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        EXEC [transaction].[UpdateBookingData] @BookingID=?, @StatusID=? """, booking.BookingID, booking.StatusID)
    conn.commit()
    cursor.close()
    conn.close()

    response = jsonify({'message': 'Booking updated successfully','code':200})

    return response, 201
