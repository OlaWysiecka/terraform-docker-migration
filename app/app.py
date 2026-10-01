import os

import psycopg2
from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return "Terraform Docker Migration - Web Application"


@app.route("/health")
def health():
    return "OK"


@app.route("/db")
def database():
    try:
        connection = psycopg2.connect(
            host=os.getenv("DB_HOST", "postgres"),
            port=os.getenv("DB_PORT", "5432"),
            database=os.getenv("DB_NAME", "appdb"),
            user=os.getenv("DB_USER", "appuser"),
            password=os.getenv("DB_PASSWORD", "apppassword"),
        )

        connection.close()

        return "Database connection: OK"

    except Exception as error:
        return f"Database connection: FAILED - {error}", 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
