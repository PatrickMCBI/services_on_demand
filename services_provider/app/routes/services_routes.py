from flask import jsonify, request, Blueprint
from models.services_model import *
from models.wfreelance_model import*
from models.worker_model import *
from config import *

servicesapi = Blueprint('servicesapi', __name__)
# Get all services
@servicesapi.route('/services', methods=['GET'])
def get_all_services():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetMasterServices")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    services = [Services(row.ID, row.CategoryID, row.ServiceName, row.Img, row.Description, row.IsActive, row.DateCreated, row.DateUpdated) for row in rows]

    return jsonify([service.to_dict() for service in services])

# # Get services by ID
@servicesapi.route('/services/<int:category_id>', methods=['GET'])
def get_one_services(category_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetMasterServicesByID ?", category_id)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    if rows:
        services = [Services(row.ID, row.CategoryID, row.ServiceName, row.Img, row.Description, row.IsActive, row.DateCreated, row.DateUpdated) for row in rows]

        return jsonify([service.to_dict() for service in services])

    else:
        return jsonify({'error': 'User not found'}), 404


# # Get freelnace by Services ID
@servicesapi.route('/freelance/<int:services_id>', methods=['GET'])
def get_freelance_services(services_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [users].[GetServiceWorkers] ?", services_id)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    if rows:
        freelance = [WFreelance(row.ID, row.FullName, row.Email, row.PhoneNumber, row.Profile, row.ServiceName) for row in rows]

        return jsonify([s_freelance.to_dict() for s_freelance in freelance])

    else:
        return jsonify({'error': 'User not found'}), 404

# # Get worker by  ID
@servicesapi.route('/freelance_worker/<int:service_workerID>', methods=['GET'])
def get_freelance_worker(service_workerID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [users].[GetFreelanceWorkers] ?", (service_workerID,))
    row = cursor.fetchone()  # Fetch a single row

    if row:
        # Create a WorkerUsers object from the fetched row
        freelance = WorkerUsers(row.ID, row.UserID, row.FullName, row.Address, row.Description, row.Profile, row.Url)
        return jsonify(freelance.to_dict())

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
