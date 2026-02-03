--Row Counts
SELECT COUNT(*) FROM cpi.dim_date;
SELECT COUNT(*) FROM cpi.dim_category;
SELECT COUNT(*) FROM cpi.fact_cpi;

--Orphan Checks
-- Categories without parents (except All Items)
SELECT *
FROM cpi.dim_category
WHERE category_level != 'all_items'
AND parent_category_id IS NULL;

--Fact integrity
-- Fact rows without matching categories
SELECT f.*
FROM cpi.fact_cpi f
LEFT JOIN cpi.dim_category c ON f.category_id = c.category_id
WHERE c.category_id IS NULL;

--Contribution sanity check
SELECT
    d.month_name,
    ROUND(SUM(f.relative_weight), 2) AS total_weight
FROM cpi.fact_cpi f
JOIN cpi.dim_date d ON f.date_id = d.date_id
GROUP BY d.month_name
ORDER BY d.month_name;

--Essentials check
SELECT
    is_essential_core,
    COUNT(*) AS categories
FROM cpi.dim_category
GROUP BY is_essential_core;
