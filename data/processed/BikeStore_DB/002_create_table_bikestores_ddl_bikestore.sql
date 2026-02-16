-- 2. Criação das tabelas ajustadas para Oracle (use NUMBER para integers/decimals, NUMBER(1) para boolean)
-- Rode como SYSTEM ou em um usuário dedicado (ex: bikestore)

-- production
CREATE TABLE production_tb_brands (
    brand_id    NUMBER PRIMARY KEY,
    brand_name  VARCHAR2(100) NOT NULL
);

CREATE TABLE production_tb_categories (
    category_id    NUMBER PRIMARY KEY,
    category_name  VARCHAR2(100) NOT NULL
);

CREATE TABLE production_tb_products (
    product_id     NUMBER PRIMARY KEY,
    product_name   VARCHAR2(255) NOT NULL,
    brand_id       NUMBER NOT NULL,
    category_id    NUMBER NOT NULL,
    product_model_year     NUMBER(4)     NOT NULL,
    product_list_price     NUMBER(10,2)  NOT NULL,
    CONSTRAINT fk_products_brand    FOREIGN KEY (brand_id)    REFERENCES production_tb_brands(brand_id),
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES production_tb_categories(category_id)
);


-- sales
CREATE TABLE sales_tb_stores (
    store_id    NUMBER PRIMARY KEY,
    store_name  VARCHAR2(100) NOT NULL,
    store_phone       VARCHAR2(25),
    store_email       VARCHAR2(100),
    store_street      VARCHAR2(100),
    store_city        VARCHAR2(50),
    store_state       CHAR(2),
    store_zip_code    VARCHAR2(10)
);

CREATE TABLE production_tb_stocks (
    store_id       NUMBER NOT NULL,
    product_id     NUMBER NOT NULL,
    stock_quantity       NUMBER NOT NULL,
    CONSTRAINT pk_tb_stocks      PRIMARY KEY (store_id, product_id),
    CONSTRAINT fk_stocks_store   FOREIGN KEY (store_id)   REFERENCES sales_tb_stores(store_id),
    CONSTRAINT fk_stocks_product FOREIGN KEY (product_id) REFERENCES production_tb_products(product_id)
);

CREATE TABLE sales_tb_staffs (
    staff_id       NUMBER PRIMARY KEY,
    staff_first_name     VARCHAR2(50)  NOT NULL,
    staff_last_name      VARCHAR2(50)  NOT NULL,
    staff_email          VARCHAR2(100) UNIQUE NOT NULL,
    staff_phone          VARCHAR2(25),
    staff_active         NUMBER(1)     NOT NULL,
    store_id       NUMBER        NOT NULL,
    manager_id     NUMBER,
    CONSTRAINT fk_staffs_store   FOREIGN KEY (store_id)   REFERENCES sales_tb_stores(store_id),
    CONSTRAINT fk_staffs_manager FOREIGN KEY (manager_id) REFERENCES sales_tb_staffs(staff_id)
);

CREATE TABLE sales_tb_customers (
    customer_id    NUMBER PRIMARY KEY,
    customer_first_name     VARCHAR2(50)  NOT NULL,
    customer_last_name      VARCHAR2(50)  NOT NULL,
    customer_phone          VARCHAR2(25),
    customer_email          VARCHAR2(100) UNIQUE NOT NULL,
    customer_street         VARCHAR2(100),
    customer_city           VARCHAR2(50),
    customer_state          CHAR(2),
    customer_zip_code       VARCHAR2(10)
);

CREATE TABLE sales_tb_orders (
    order_id        NUMBER PRIMARY KEY,
    customer_id     NUMBER NOT NULL,
    order_status    NUMBER(2) NOT NULL,
    order_date      DATE NOT NULL,
    order_required_date   DATE NOT NULL,
    order_shipped_date    DATE,
    store_id        NUMBER NOT NULL,
    staff_id        NUMBER NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES sales_tb_customers(customer_id),
    CONSTRAINT fk_orders_store    FOREIGN KEY (store_id)    REFERENCES sales_tb_stores(store_id),
    CONSTRAINT fk_orders_staff    FOREIGN KEY (staff_id)    REFERENCES sales_tb_staffs(staff_id)
);

CREATE TABLE sales_tb_order_items (
    order_id       NUMBER       NOT NULL,
    item_id        NUMBER       NOT NULL,
    product_id     NUMBER       NOT NULL,
    order_item_quantity       NUMBER       NOT NULL,
    order_item_list_price     NUMBER(10,2) NOT NULL,
    order_item_discount       NUMBER(4,2)  NOT NULL,
    CONSTRAINT pk_order_items       PRIMARY KEY (order_id, item_id),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)   REFERENCES sales_tb_orders(order_id),
    CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES production_tb_products(product_id)
);