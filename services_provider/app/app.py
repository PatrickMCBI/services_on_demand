from flask import Flask
from flask_cors import CORS
from routes.category_routes import *
from routes.services_routes import *
from routes.agency_routes import *
from routes.booking_routes import *
from routes.notification_routes import *
from routes.users_routes import *

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

app.register_blueprint(categoryapi)
app.register_blueprint(servicesapi)
app.register_blueprint(agencyapi)
app.register_blueprint(bookingapi)
app.register_blueprint(notifyapi)
app.register_blueprint(usersapi)

# @app.route('/')
# def index():
#     return "Welcome to the Flask API!"

if __name__ == '__main__':
    app.run(debug=True)
