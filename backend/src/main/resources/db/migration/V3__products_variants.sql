CREATE TABLE product (
       id BIGSERIAL PRIMARY KEY,
       sub_category_id BIGINT NOT NULL REFERENCES sub_category(id),
       name VARCHAR(200) NOT NULL,
       slug VARCHAR(200) NOT NULL UNIQUE,
       description TEXT,
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );
   CREATE INDEX idx_product_slug ON product(slug);
   CREATE INDEX idx_product_sub_category_id ON product(sub_category_id);

   CREATE TABLE product_variant (
       id BIGSERIAL PRIMARY KEY,
       product_id BIGINT NOT NULL REFERENCES product(id),
       width_mm NUMERIC(8,2),
       length_m NUMERIC(8,2),
       core_diameter_mm NUMERIC(8,2),
       material VARCHAR(100),
       price NUMERIC(10,2) NOT NULL,
       image_url VARCHAR(500),
       image_alt_text VARCHAR(255),
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );
   CREATE INDEX idx_product_variant_product_id ON product_variant(product_id);