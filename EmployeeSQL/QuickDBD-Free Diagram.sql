-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/6OeKX8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(200)   NOT NULL,
    "birth_date" DATE,   NOT NULL,
    "first_name" VARCHAR(255),   NOT NULL,
    "last_name" VARCHAR(255),   NOT NULL,
    "sex" CHAR(1),   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     ),
    CONSTRAINT "uc_employees_emp_title_id" UNIQUE (
        "emp_title_id"
    )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(200)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(200)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(200)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_manager" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

CREATE INDEX "idx_departments_dept_name"
ON "departments" ("dept_name");

CREATE INDEX "idx_titles_title"
ON "titles" ("title");

