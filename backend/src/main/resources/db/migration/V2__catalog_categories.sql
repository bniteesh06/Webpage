CREATE TABLE category (
       id BIGSERIAL PRIMARY KEY,
       name VARCHAR(150) NOT NULL,
       slug VARCHAR(150) NOT NULL UNIQUE,
       description TEXT,
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );
   CREATE INDEX idx_category_slug ON category(slug);

   CREATE TABLE sub_category (
       id BIGSERIAL PRIMARY KEY,
       category_id BIGINT NOT NULL REFERENCES category(id),
       name VARCHAR(150) NOT NULL,
       slug VARCHAR(150) NOT NULL UNIQUE,
       description TEXT,
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );
   CREATE INDEX idx_sub_category_slug ON sub_category(slug);
   CREATE INDEX idx_sub_category_category_id ON sub_category(category_id);