import logging
from logging.handlers import RotatingFileHandler
from flask import Flask

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL')
db = SQLAlchemy(app)

if not app.debug:
    # Configuration du logger
    handler = RotatingFileHandler('/app/logs/app.log', maxBytes=100000, backupCount=10)
    handler.setLevel(logging.INFO)
    formatter = logging.Formatter(
        '%(asctime)s %(levelname)s: %(message)s '
        '[in %(pathname)s:%(lineno)d]'
    )
    handler.setFormatter(formatter)
    app.logger.addHandler(handler)

@app.route('/')
def home():
    app.logger.info("Home page accessed")
    return "Hello, Flask!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=os.environ.get("PORT",5000))
