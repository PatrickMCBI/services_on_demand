from config import EMAIL_HOST, EMAIL_PORT, EMAIL_USERNAME, EMAIL_PASSWORD
import smtplib
from email.mime.text import MIMEText
import uuid
from flask import jsonify, request, Blueprint
from models.users_model import *
from models.user_profile_model import *
from config import *

usersapi = Blueprint('usersapi', __name__)
# Get all booking
@usersapi.route('/users', methods=['GET'])
def get_all_booking():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC master.GetTransBooking")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    users = [Users(row.ID, row.FirstName, row.LastName, row.Email, row.Password, row.PhoneNumber, row.Profile, row.UserTypeID, row.IsActive, row.DateCreated, row.DateUpdated, row.TypeName, row.ServiceName, row.FullName) for row in rows]

    return jsonify([user.to_dict() for user in users])

# # Get booking by ID
@usersapi.route('/employee/<int:agency_id>', methods=['GET'])
def get_employee(agency_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [agencies].[GetAgencyEmployee] ?", agency_id)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    if rows:
        employee = [Users(row.ID, row.FirstName, row.LastName, row.Email, row.Password, row.PhoneNumber, row.Profile, row. UserTypeID, row.IsActive, row.DateCreated, row.DateUpdated, row.ServiceName, row.TypeName) for row in rows]

        return jsonify([employees.to_dict() for employees in employee])

    else:
        return jsonify({'error': 'User not found'}), 404

# # Add a new user
@usersapi.route('/addusers', methods=['POST'])
def add_users():
    data = request.get_json()
    
    verification_token = str(uuid.uuid4())
    
    newUser = Users(
        FirstName               = data['FirstName'],
        LastName                = data['LastName'],
        UserName                = data['UserName'],
        Password                = data['Password'],
        PhoneNumber             = data['PhoneNumber'],
        BirthDate               = data['BirthDate'],
        Profile                 = "icon_profile_default.png",
        UserTypeID              = data['UserTypeID'],
        VerificationToken       = verification_token
    )

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        EXEC [users].[PostNewUserData] @FirstName=?, @LastName=?, @UserName=?, @Password=?, @Email=?, @PhoneNumber=?, @BirthDate=?, @Profile=?, @UserTypeID=?, @VerificationToken=?""",
        newUser.FirstName, newUser.LastName, newUser.UserName, newUser.Password, newUser.UserName, newUser.PhoneNumber, newUser.BirthDate, newUser.Profile, newUser.UserTypeID, newUser.VerificationToken)
    conn.commit()
    cursor.close()
    conn.close()

    # Send verification email
    send_verification_email(newUser.UserName, verification_token)
    
    response = jsonify({'message': 'User created successfully, please check your email to verify your account','code':200})

    return response, 201

# get user profile
@usersapi.route('/usrprofile/<int:accountID>', methods=['GET'])
def user_profile(accountID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC [users].[GetUserProfile] ?", accountID)
    row = cursor.fetchone()
    cursor.close()
    conn.close()
    if row:

        userProfile = UsersProfile(row.AccountID,row.UserID,row.Username,row.Password,row.FirstName,row.LastName,row.Email,row.PhoneNumber,row.Birthdate,row.Address,row.Description,row.Profile)
        return jsonify(userProfile.to_dict())

    else:
        return jsonify({'error': 'User not found'}), 404
    
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



@usersapi.route('/login', methods=['POST'])
def user_login():
    data = request.get_json()
    UserName = data['UserName']
    Password = data['Password']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        EXEC [users].[AuthUserData] @UserName=?, @Password=?""",
        UserName, Password)

    result = cursor.fetchone()
    cursor.close()
    conn.close()

    if result:
        AccountID, UserTypeID, UserID, FullName, ProfileImage, StatusCode = result
        response = jsonify({'AccountID': AccountID, 'UserTypeID': UserTypeID, 'UserID': UserID, 'FullName': FullName, 'ProfileImage':ProfileImage,'StatusCode': StatusCode})
    else:
        response = jsonify({'AccountID': 0, 'UserTypeID': 0, 'StatusCode': 2})  # Default failure response

    return response, 200

@usersapi.route('/verify/<token>', methods=['GET'])
def verify_email(token):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Execute the stored procedure
    cursor.execute("""
        EXEC [users].[VerifyUserEmail] @Token=?""", token)
    
    # Check the number of affected rows
    rows_affected = cursor.rowcount

    conn.commit()
    cursor.close()
    conn.close()

    if rows_affected > 0:
        # HTML response for successful verification
        html_content = """
        <html>
        <head>
            <title>Email Verified</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                    text-align: center;
                }}
                .container {{
                    max-width: 600px;
                    margin: 50px auto;
                    padding: 20px;
                    background-color: #ffffff;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                }}
                h1 {{
                    color: #4CAF50;
                }}
                p {{
                    font-size: 18px;
                    color: #555555;
                }}
                a {{
                    color: #4CAF50;
                    text-decoration: none;
                    font-weight: bold;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Email Verified Successfully!</h1>
                <p>Thank you for verifying your email address.</p>
                <p>You can now log in to your account.</p>
                <a href="http://127.0.0.1:5500/login.html">Go to Login</a>
            </div>
        </body>
        </html>
        """
        return html_content, 200
    else:
        # HTML response for failed verification
        html_content = """
        <html>
        <head>
            <title>Verification Failed</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                    text-align: center;
                }}
                .container {{
                    max-width: 600px;
                    margin: 50px auto;
                    padding: 20px;
                    background-color: #ffffff;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                }}
                h1 {{
                    color: #FF0000;
                }}
                p {{
                    font-size: 18px;
                    color: #555555;
                }}
                a {{
                    color: #FF0000;
                    text-decoration: none;
                    font-weight: bold;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Verification Failed</h1>
                <p>Sorry, the verification link is invalid or has expired.</p>
                <p>Please request a new verification email.</p>
                <a href="http://127.0.0.1:5500/resend-verification">Resend Verification Email</a>
            </div>
        </body>
        </html>
        """
        return html_content, 400


def send_verification_email(email, token):
    verification_link = f"http://127.0.0.1:5500/verify/{token}"
    subject = "Please verify your email"
    body = f"Click the link to verify your email address: {verification_link}"

    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = EMAIL_USERNAME
    msg['To'] = email

    try:
        print("Starting to send email...")
        with smtplib.SMTP(EMAIL_HOST, EMAIL_PORT) as server:
            server.starttls()
            server.login(EMAIL_USERNAME, EMAIL_PASSWORD)
            server.sendmail(msg['From'], [msg['To']], msg.as_string())
    except Exception as e:
        print(f"Error sending email: {e}")
