from flask import Flask, render_template, request, redirect, url_for
import mysql.connector


app = Flask(__name__)

# -----------------------------
# Database Connection Function
# -----------------------------
def get_conn_company():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="vikas@1020",
        database="company_db"
    )

# -----------------------------
# Show All Employees
# -----------------------------
@app.route('/employees')
def employees():
    conn = get_conn_company()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('ShowAllEmployees')
    for result in cursor.stored_results():
        data = result.fetchall()

    cursor.close(); conn.close()
    return render_template('employees.html', employees=data)

# -----------------------------
# Add Employee
# -----------------------------
@app.route('/employees/add', methods=['GET', 'POST'])
def add_employees():
    if request.method == 'POST':
        emp_id = request.form['emp_id']
        name = request.form['emp_name']
        dept = request.form['dept']
        salary = request.form['salary']

        conn = get_conn_company(); cursor = conn.cursor()
        cursor.callproc('AddEmployees', (emp_id, name, dept, salary))
        conn.commit(); cursor.close(); conn.close()
        return redirect('/employees')

    return render_template('add_employee.html')

# -----------------------------
# Edit Employee
# -----------------------------
@app.route('/employees/edit/<int:id>', methods=['GET', 'POST'])
def edit_employee(id):
    conn = get_conn_company()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('GetEmployeesById', [id])
    for result in cursor.stored_results():
        emp = result.fetchone()

    cursor.close(); conn.close()

    if request.method == 'POST':
        name = request.form['emp_name']
        dept = request.form['dept']
        salary = request.form['salary']

        conn = get_conn_company(); cursor = conn.cursor()
        cursor.callproc('UpdateEmployee', (id, name, dept, salary))
        conn.commit(); cursor.close(); conn.close()

        return redirect(url_for('/employees'))

    return render_template('edit_employee.html', emp=emp)

# -----------------------------
# Delete Employee (Fixed)
# -----------------------------
@app.route('/employees/delete/<int:id>')
def delete_employee(id):
    conn = get_conn_company(); cursor = conn.cursor()
    cursor.callproc('DeleteEmployee', [id])
    conn.commit(); 
    cursor.close(); 
    conn.close()
    return redirect('/employees')

@app.route('/')
def home():
    return render_template('home.html')


# # STUDENT ROUTES (school_db)

# def get_conn_school():
#     return mysql.connector.connect(
#         host="localhost",
#         user="root",
#         password="vikas@1020",
#         database="school_db"
#     )


# @app.route('/students')
# def students():
#     conn = get_conn_school()
#     cursor = conn.cursor(dictionary=True)
#     cursor.callproc('ShowAllStudents')
#     for result in cursor.stored_results():
#         data = result.fetchall()
#         cursor.close(); conn.close()
#         return render_template('stdents.htmlu', students=data)
    


# @app.route('/student/add', methods=['GET', 'POST'])
# def add_student():
#     if request.method == 'POST':
#         sid = request.form['sid']
#         name = request.form['name']
#         course = request.form['course']
#         marks = request.form['marks']
#         conn = get_conn_school()
#         cursor = conn.cursor()
#         cursor.callproc('AddStudent', (sid, name, course, marks))
#         conn.commit(); cursor.close(); conn.close()
#         return redirect('/students')
#     return render_template('add_student.html')

# @app.route('/students/edit/<int:id>', methods=['GET', 'POST'])
# def edit_student(id):
#     conn = get_conn_school()
#     cursor =conn.cursor(dictionary=True)
#     cursor.callproc('GetStudentById', [id])
#     for result in cursor.stored_results():
#         stu = result.fetchone()
#     cursor.close(); conn.close()
#     if request.method == 'POST':
#         name = request.form['name']
#         course = request.form['course']
#         marks = request.form['marks']
#         conn = get_conn_school()
#         cursor = conn.cursor()
#         cursor.callproc('UpdateStudent', (id, name, course, marks))
#         conn.commit(); cursor.close(); conn.close()
#         return redirect('/students')
#     return render_template('edit_student.html', stu=stu)

# @app.route('/students/delete/<int:id>')
# def delete_student(id):
#     conn = get_conn_school()
#     cursor = conn.cursor()
#     cursor.callproc('DeleteStudent', [id])
#     conn.commit(); cursor.close(); conn.close()
#     return redirect('/students')
# -----------------------------
# Run the Flask App
# -----------------------------
if __name__ == '__main__':
    app.run(debug=True)