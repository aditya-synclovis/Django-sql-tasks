# 1.E-Commerce Order Analysis
DB Structure
customers(id, name, city, is_active)
products(id, name, category, price, is_active)
orders(id, customer_id, order_date, is_active)
order_items(id, order_id, product_id, quantity, is_active)

Problem Statement
The company requires a reporting module to analyze monthly sales performance by product category. The report should aggregate order, customer, and revenue information for each category, grouped by month.

Required Output Fields
month → Month of the order (YYYY-MM)
category → Product category
totalOrders → Number of distinct orders in that category for the month
uniqueCustomers → Count of distinct customers who placed orders in that category for the month
totalQuantity → Total quantity of products sold
totalRevenue → SUM(quantity × price)
avgOrderValue → totalRevenue ÷ totalOrders

Sample Output
[
  {
    "month": "2025-01",
    "category": "Electronics",
    "totalOrders": 120,
    "uniqueCustomers": 85,
    "totalQuantity": 320,
    "totalRevenue": 125000,
    "avgOrderValue": 1041.67
  },
  {
    "month": "2025-01",
    "category": "Clothing",
    "totalOrders": 90,
    "uniqueCustomers": 60,
    "totalQuantity": 210,
    "totalRevenue": 45000,
    "avgOrderValue": 500.00
  }
]


Attendance & Fee Defaulters Cross Report
DB Structure
classes(id, name, is_active)
students(id, name, class_id, is_active)
attendance(id, student_id, date, status, is_active)   -- status = 'P' (Present) / 'A' (Absent)
fee_types(id, name, is_active)
fee_mappings(id, student_id, fee_type_id, amount, is_active)
fee_collections(id, student_id, fee_type_id, amount_paid, paid_date, is_active)

Problem Statement
The school management wants to analyze the relationship between student attendance and fee payments.
The report should show, for each class and fee type:
Students who have high attendance (> 75%) but haven’t paid fees (defaulters).
Students who have low attendance (< 50%) but already paid fees.

Required Output Fields
classId → ID of the class
className → Name of the class
feeType → Name of the fee type
highAttendanceUnpaid → Number of students with > 75% attendance but unpaid
lowAttendancePaid → Number of students with < 50% attendance but paid

Sample Output (JSON)

[
  {
    "classId": 1,
    "className": "Class 10",
    "feeType": "Tuition Fee",
    "highAttendanceUnpaid": 5,
    "lowAttendancePaid": 3
  },
  {
    "classId": 1,
    "className": "Class 10",
    "feeType": "Library Fee",
    "highAttendanceUnpaid": 2,
    "lowAttendancePaid": 1
  },
  {
    "classId": 1,
    "className": "Class 10",
    "feeType": "Sports Fee",
    "highAttendanceUnpaid": 3,
    "lowAttendancePaid": 2
  }
]




















Hospital Resource Utilization
DB Structure
departments(id, name, is_active)
doctors(id, name, dept_id, is_active)
patients(id, name, admitted_date, discharged_date, is_active)
appointments(id, doctor_id, patient_id, appt_date, is_active)

Problem Statement
The hospital management requires an efficiency report per department within a given date range.
The report should show:
Number of doctors in the department
Number of patients admitted in the date range
Average stay duration of patients
Total number of appointments in the date range
Doctor-to-patient ratio

Required Output Fields
departmentId → ID of the department
departmentName → Name of the department
totalDoctors → Number of doctors in the department
totalPatients → Patients admitted in the given date range
avgStayDays → Average number of days between admission & discharge
appointmentsCount → Total number of appointments in the given date range
doctorPatientRatio → totalPatients ÷ totalDoctors

Sample Output (JSON)

[
  {
    "departmentId": 1,
    "departmentName": "Cardiology",
    "totalDoctors": 10,
    "totalPatients": 50,
    "avgStayDays": 4.6,
    "appointmentsCount": 120,
    "doctorPatientRatio": 5.0
  },
  {
    "departmentId": 2,
    "departmentName": "Neurology",
    "totalDoctors": 8,
    "totalPatients": 40,
    "avgStayDays": 6.2,
    "appointmentsCount": 95,
    "doctorPatientRatio": 5.0
  }
]





















University Exam Results Analysis
DB Structure
courses(id, name, is_active)
students(id, name, course_id, is_active)
subjects(id, name, course_id, is_active)
marks(id, student_id, subject_id, score, exam_date, is_active)

Problem Statement
The university requires an exam performance summary report per course.
The report should include:
Total students enrolled
Number of subjects in the course
Average score across all students & subjects
Number of students who passed (average score ≥ 40)
Number of students who failed
Name of the course topper (highest average score)

Required Output Fields
courseId → ID of the course
courseName → Name of the course
totalStudents → Number of students in the course
subjectCount → Total subjects in the course
avgScore → Average score across all students & subjects
passCount → Students with avg score ≥ 40
failCount → totalStudents - passCount
topperName → Name of the student with the highest avg score

Sample Output (JSON)

[
  {
    "courseId": 1,
    "courseName": "Computer Science",
    "totalStudents": 60,
    "subjectCount": 5,
    "avgScore": 55.4,
    "passCount": 50,
    "failCount": 10,
    "topperName": "Rahul Sharma"
  },
  {
    "courseId": 2,
    "courseName": "Mechanical Engineering",
    "totalStudents": 45,
    "subjectCount": 6,
    "avgScore": 48.7,
    "passCount": 35,
    "failCount": 10,
    "topperName": "Priya Singh"
  }
]



















Employee Timesheet & Project Billing
DB Structure
employees(id, name, dept_id, is_active)
departments(id, name, is_active)
projects(id, name, dept_id, billing_rate, is_active)
timesheets(id, emp_id, project_id, work_date, hours, is_active)

Problem Statement
The company requires a project billing summary report to analyze employee utilization and billing by project.
The report should include:
Total employees who worked on each project
Total hours spent
Billed amount (hours × project billing rate)
Average utilization (average hours per employee)
Top employee in the project (employee with maximum hours)

Required Output Fields
projectId → ID of the project
projectName → Name of the project
departmentName → Department linked to the project
totalEmployees → Distinct employees who worked on the project
totalHours → Total hours logged
billedAmount → totalHours × billing_rate
avgUtilization → Average hours per employee
topEmployee → Employee with the maximum hours in that project

Sample Output (JSON)

[
  {
    "projectId": 1,
    "projectName": "ERP System",
    "departmentName": "IT",
    "totalEmployees": 5,
    "totalHours": 220,
    "billedAmount": 11000,
    "avgUtilization": 44.0,
    "topEmployee": "Rohit Mehra"
  },
  {
    "projectId": 2,
    "projectName": "Mobile App",
    "departmentName": "Software",
    "totalEmployees": 3,
    "totalHours": 150,
    "billedAmount": 9000,
    "avgUtilization": 50.0,
    "topEmployee": "Sneha Patel"
  }
]



















Inventory & Supplier Performance Analysis
DB Structure
suppliers(id, name, is_active)
products(id, name, category, supplier_id, price, is_active)
purchases(id, product_id, purchase_date, quantity, cost, is_active)
sales(id, product_id, sale_date, quantity, revenue, is_active)

Problem Statement
The company wants to analyze supplier and inventory performance for each month.
The report should include:
Number of products supplied
Total purchase quantity and cost
Total sales quantity and revenue
Profit (revenue – cost)
Best selling product (by quantity) for that supplier in the month

Required Output Fields
supplierId → ID of the supplier
supplierName → Name of the supplier
month → YYYY-MM
productCount → Number of distinct products supplied
totalPurchased → Total purchased quantity
totalCost → Total purchase cost
totalSold → Total sales quantity
totalRevenue → Total sales revenue
profit → totalRevenue – totalCost
bestProduct → Product with maximum sales quantity

Sample Output (JSON)

[
  {
    "supplierId": 1,
    "supplierName": "Global Traders",
    "month": "2025-01",
    "productCount": 12,
    "totalPurchased": 800,
    "totalCost": 32000,
    "totalSold": 750,
    "totalRevenue": 45000,
    "profit": 13000,
    "bestProduct": "LED TV"
  },
  {
    "supplierId": 2,
    "supplierName": "Tech Supplies Ltd",
    "month": "2025-01",
    "productCount": 9,
    "totalPurchased": 600,
    "totalCost": 25000,
    "totalSold": 580,
    "totalRevenue": 40000,
    "profit": 15000,
    "bestProduct": "Laptop"
  }
]

