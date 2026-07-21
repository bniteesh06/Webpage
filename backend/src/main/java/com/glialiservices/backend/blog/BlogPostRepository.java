package com.glialiservices.backend.blog;
import org.springframework.data.jpa.repository.JpaRepository;
public interface BlogPostRepository extends JpaRepository<BlogPost, Long> {}