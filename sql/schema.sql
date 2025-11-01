-- Supply Chain Optimization Database Schema
-- PostgreSQL / MySQL compatible

-- ============================================
-- DIMENSION TABLES
-- ============================================

CREATE TABLE dim_sku (
    sku_id INT PRIMARY KEY,
    sku_code VARCHAR(50) UNIQUE NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    unit_cost DECIMAL(10, 2),
    unit_price DECIMAL(10, 2),
    supplier_id INT,
    reorder_point INT,
    safety_stock INT,
    lead_time_days INT DEFAULT 14,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_warehouse (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location_city VARCHAR(100),
    location_state VARCHAR(50),
    region VARCHAR(50),
    capacity_units INT,
    manager_name VARCHAR(100),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    supplier_code VARCHAR(50) UNIQUE,
    country VARCHAR(50),
    rating DECIMAL(3, 2),
    on_time_delivery_pct DECIMAL(5, 2),
    quality_score DECIMAL(5, 2),
    cost_competitiveness DECIMAL(5, 2),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_carrier (
    carrier_id INT PRIMARY KEY,
    carrier_name VARCHAR(100) NOT NULL,
    carrier_code VARCHAR(50),
    service_type VARCHAR(50),
    rating DECIMAL(3, 2),
    avg_cost_per_shipment DECIMAL(10, 2),
    on_time_delivery_pct DECIMAL(5, 2),
    coverage_regions VARCHAR(500)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    day_of_week INT,
    day_name VARCHAR(20),
    week_of_year INT,
    month_number INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT,
    is_weekend BOOLEAN
);

-- ======
