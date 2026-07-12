from flask import Flask, request, jsonify
from flask_cors import CORS
from db import get_connection

app = Flask(__name__)
CORS(app)

@app.route("/add_user", methods=["POST"])
def add_user():
    data = request.json

    name = data.get("name")
    email = data.get("email")
    phone = data.get("phone")

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        "INSERT INTO users (name, email, phone) VALUES (?, ?, ?)",
        (name, email, phone)
    )

    conn.commit()
    conn.close()

    return jsonify({"message": "User added successfully"}), 201


@app.route("/users", methods=["GET"])
def get_users():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()

    conn.close()

    return jsonify([dict(u) for u in users])

# -------------------------
# DELETE USER
# -------------------------
@app.route("/delete_user/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("DELETE FROM users WHERE user_id = ?", (user_id,))
    conn.commit()
    conn.close()

    return jsonify({"message": "User deleted successfully"})


if __name__ == "__main__":
    app.run(debug=True)
