WITH Departament AS (
    SELECT id, name, parent_id, 0 AS level
	from subdivisions 
    WHERE id = 100051 -- Department ID of "Employee 1"

	Union ALL 

	Select s.id,s.name, s.parent_id, dep.level + 1
	from subdivisions as s
	JOIN Departament as dep ON s.parent_id = dep.id
)
SELECT c.id, c.name,rs.name as sub_name,c.subdivision_id as sub_id,rs.level as sub_level, (SELECT COUNT(*) FROM collaborators WHERE subdivision_id = c.subdivision_id) AS colls_count
FROM collaborators c
JOIN Departament rs ON c.subdivision_id = rs.id
WHERE c.age < 40
AND c.subdivision_id NOT IN (100055, 100059)
ORDER BY rs.level;