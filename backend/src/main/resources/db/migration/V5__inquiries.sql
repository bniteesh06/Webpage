CREATE TYPE inquiry_status AS ENUM ('new', 'contacted', 'closed');

   CREATE TABLE inquiry (
       id BIGSERIAL PRIMARY KEY,
       name VARCHAR(150) NOT NULL,
       email VARCHAR(255) NOT NULL,
       phone VARCHAR(50),
       status inquiry_status NOT NULL DEFAULT 'new',
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );

   CREATE TABLE inquiry_item (
       id BIGSERIAL PRIMARY KEY,
       inquiry_id BIGINT NOT NULL REFERENCES inquiry(id),
       product_variant_id BIGINT NOT NULL REFERENCES product_variant(id),
       quantity INT NOT NULL CHECK (quantity > 0)
   );
   CREATE INDEX idx_inquiry_item_inquiry_id ON inquiry_item(inquiry_id);
   CREATE INDEX idx_inquiry_status ON inquiry(status);