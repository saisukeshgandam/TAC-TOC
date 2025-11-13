from flask import Flask, render_template, request, redirect, url_for, session, flash

app = Flask(__name__)
app.secret_key = "dev-secret-key-please-change"

# Hardcoded admin credentials
ADMIN_USER = "admin"
ADMIN_PASS = "admin"

@app.route('/', methods=['GET'])
def index():
    if session.get('logged_in'):
        return redirect(url_for('game'))
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username', '')
        password = request.form.get('password', '')
        if username == ADMIN_USER and password == ADMIN_PASS:
            session['logged_in'] = True
            session['username'] = username
            flash('Logged in successfully.', 'success')
            return redirect(url_for('game'))
        flash('Invalid credentials', 'danger')
    return render_template('login.html')

@app.route('/game')
def game():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    return render_template('game.html', username=session.get('username'))

@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
