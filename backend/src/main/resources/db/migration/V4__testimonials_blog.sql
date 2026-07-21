CREATE TABLE testimonial (
       id BIGSERIAL PRIMARY KEY,
       author VARCHAR(150) NOT NULL,
       company VARCHAR(150),
       quote TEXT NOT NULL,
       case_study_text TEXT,
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );

   CREATE TABLE blog_post (
       id BIGSERIAL PRIMARY KEY,
       title VARCHAR(200) NOT NULL,
       slug VARCHAR(200) NOT NULL UNIQUE,
       body TEXT NOT NULL,
       published_at TIMESTAMP,
       created_at TIMESTAMP NOT NULL DEFAULT now()
   );
   CREATE INDEX idx_blog_post_slug ON blog_post(slug);
   CREATE INDEX idx_blog_post_published_at ON blog_post(published_at);