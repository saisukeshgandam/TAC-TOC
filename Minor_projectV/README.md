Tic Tac Toe (Web) - Minimal Flask App

Overview
- Simple web-based Tic Tac Toe game with a login. Use the credentials: admin / admin.
- Built with Python + Flask. The game is a local two-player game (both players share the same device/browser).

Files created
- `app.py` - Flask application (login, game, logout).
- `templates/login.html`, `templates/game.html` - HTML templates.
- `static/style.css`, `static/game.js` - styling and client-side game logic.
- `requirements.txt` - required Python package(s).

Run (PowerShell on Windows)
1. Create and activate a virtual environment (recommended):

   python -m venv .venv
   .\.venv\Scripts\Activate.ps1

2. Install dependencies:

   pip install -r requirements.txt

3. Start the app:

   python app.py

4. Open a browser to http://127.0.0.1:5000 or http://localhost:5000

Notes
- This app uses a hardcoded secret key and credentials for simplicity. Do not use this approach in production.
- The tic-tac-toe logic runs in the browser. The server only enforces login and serves static files.

Potential next steps
- Add password hashing and user registration backed by a database.
- Add AI opponent or online multiplayer support.
