from flask import jsonify, request, Blueprint
from models.agency_model import *
from config import *

agencyapi = Blueprint('agencyapi', __name__)
# Get all agencies
@agencyapi.route('/agency', methods=['GET'])
def get_all_agency():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetMasterAgency")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    agencies = [Agency(row.ID, row.ServicesID, row.AgencyName, row.Description, row.ContactNumber, row.Email, row.Web, row.IsActive, row.DateCreated, row.DateUpdated) for row in rows]

    return jsonify([agency.to_dict() for agency in agencies])

# # Get agencies by ID
@agencyapi.route('/agency/<int:services_id>', methods=['GET'])
def get_one_agencies(services_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [agencies].[GetAgencyServicesByID] ?", services_id)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    if rows:
        agencies = [Agency(row.ID, row.ServicesID, row.AgencyName, row.Description, row.ContactNumber, row.Email, row.Web, row.IsActive, row.DateCreated, row.DateUpdated) for row in rows]

        return jsonify([agency.to_dict() for agency in agencies])

    else:
        return jsonify({'error': 'User not found'}), 404

# # Add a new user
# @app.route('/users', methods=['POST'])
# def add_user():
#     data = request.get_json()
#     name = data['name']
#     email = data['email']
#     conn = get_db_connection()
#     cursor = conn.cursor()
#     cursor.execute("EXEC AddUser ?, ?", name, email)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'User created successfully'}), 201

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
