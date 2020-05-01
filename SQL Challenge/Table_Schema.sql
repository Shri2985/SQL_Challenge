-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Mu93sn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "department" (
    "dept_number" varchar(10)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_number"
     )
);

CREATE TABLE "department_employee" (
    "employee_number" integer   NOT NULL,
    "dept_number" varchar(10)   NOT NULL
);

CREATE TABLE "department_manager" (
    "dept_number" varchar(10)   NOT NULL,
    "employee_number" integer   NOT NULL
);

CREATE TABLE "employee" (
    "employee_number" integer   NOT NULL,
    "employee_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hier_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "salary" (
    "employee_number" integer   NOT NULL,
    "salary" decimal(18,4)   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employee" ("employee_number");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_dept_number" FOREIGN KEY("dept_number")
REFERENCES "department" ("dept_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_dept_number" FOREIGN KEY("dept_number")
REFERENCES "department" ("dept_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employee" ("employee_number");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_employee_title_id" FOREIGN KEY("employee_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employee" ("employee_number");

