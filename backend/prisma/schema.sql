CREATE TABLE COMPANY (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE EMPLOYEE (
    id INT PRIMARY KEY,
    company_id INT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role VARCHAR(255),
    is_active BOOLEAN,
    FOREIGN KEY (company_id) REFERENCES COMPANY(id)
);

CREATE TABLE POSITION (
    id INT PRIMARY KEY,
    company_id INT,
    interview_flow_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50),
    is_visible BOOLEAN,
    location VARCHAR(255),
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
    employment_type VARCHAR(50),
    benefits TEXT,
    company_description TEXT,
    application_deadline DATE,
    contact_info VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES COMPANY(id),
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id)
);

CREATE TABLE INTERVIEW_FLOW (
    id INT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE INTERVIEW_STEP (
    id INT PRIMARY KEY,
    interview_flow_id INT,
    interview_type_id INT,
    name VARCHAR(255) NOT NULL,
    order_index INT,
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id),
    FOREIGN KEY (interview_type_id) REFERENCES INTERVIEW_TYPE(id)
);

CREATE TABLE INTERVIEW_TYPE (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE CANDIDATE (
    id INT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE APPLICATION (
    id INT PRIMARY KEY,
    position_id INT,
    candidate_id INT,
    application_date DATE,
    status VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (position_id) REFERENCES POSITION(id),
    FOREIGN KEY (candidate_id) REFERENCES CANDIDATE(id)
);

CREATE TABLE INTERVIEW (
    id INT PRIMARY KEY,
    application_id INT,
    interview_step_id INT,
    employee_id INT,
    interview_date DATE,
    result VARCHAR(50),
    score INT,
    notes TEXT,
    FOREIGN KEY (application_id) REFERENCES APPLICATION(id),
    FOREIGN KEY (interview_step_id) REFERENCES INTERVIEW_STEP(id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(id)
);