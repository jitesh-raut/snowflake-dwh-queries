SELECT
    e.id,
    e.name,
    e.department,
    e.salary,
    d.manager
FROM employees e
JOIN departments d
    ON e.department = d.department;
