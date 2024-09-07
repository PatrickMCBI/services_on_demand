from flask import jsonify, request, Blueprint
from models.notification_model import *
from config import *

notifyapi = Blueprint('notifyapi', __name__)
# Get all notifcation
@notifyapi.route('/booking', methods=['GET'])
def get_all_notification():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetAdminNotification")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    notify = [Notification(row.ID, row.BookingID, row.IsActive, row.IsRead) for row in rows]

    return jsonify([notification.to_dict() for notification in notify])

# # Get notification by ID
@notifyapi.route('/notification/<int:notification_id>', methods=['GET'])
def get_one_booking(notification_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetTransBookingByID ?", notification_id)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    if rows:
        notify = [Notification(row.ID, row.BookingID, row.IsActive, row.IsRead) for row in rows]

        return jsonify([notification.to_dict() for notification in notify])

    else:
        return jsonify({'error': 'User not found'}), 404

# # Get a count Notification
@notifyapi.route('/wnotification_count/<int:userID>', methods=['GET'])
def get_count_notify(userID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [admin].[GetWorkerCountNotification] ?", (userID,))
    rows = cursor.fetchone()
    cursor.close()
    conn.close()
    
    if rows:
        notification = Notification(CountNotifications=rows.CountNotifications)
        return jsonify(notification.to_dict())
    else:
        return jsonify({'error': 'No notifications found'}), 404

# # Update user
# @app.route('/users/<int:user_id>', methods=['PUT'])
# def update_user(user_id):
#     data = request.get_json()
#     name = data['name']
#     email = data['email']
#     conn = get_db_connection()
#     cursor = conn.cursor()
#     cursor.execute("EXEC UpdateUser ?, ?, ?", user_id, name, email)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'User updated successfully'})

# # Delete user
# @app.route('/users/<int:user_id>', methods=['DELETE'])
# def delete_user(user_id):
#     conn = get_db_connection()
#     cursor = conn.cursor()
#     cursor.execute("EXEC DeleteUser ?", user_id)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'User deleted successfully'})
