from flask import Flask, request
from flask_cors import CORS
from flask_restful import Api, Resource
from pymongo import MongoClient

app = Flask(__name__)
api = Api(app)
CORS(app)

# Connect to the MongoDB server
client = MongoClient('localhost', 27017)
db = client.testdb
users = db.users

class UserList(Resource):
    def get(self):
        output = []
        for user in users.find():
            output.append({'name': user['name'], 'email': user['email']})
        return {'result': output}
    
    def post(self):
        name = request.json['name']
        email = request.json['email']
        user_id = users.insert({'name': name, 'email': email})
        new_user = users.find_one({'_id': user_id})
        return {'name': new_user['name'], 'email': new_user['email']}

api.add_resource(UserList, '/users')

if __name__ == '__main__':
    app.run(debug=True)
