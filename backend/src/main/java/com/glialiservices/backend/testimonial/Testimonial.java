package com.glialiservices.backend.testimonial;

import jakarta.persistence.*;

@Entity
@Table(name = "testimonial")
public class Testimonial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String author;
    private String company;

    @Column(columnDefinition = "TEXT")
    private String quote;

    @Column(name = "case_study_text", columnDefinition = "TEXT")
    private String caseStudyText;

    // getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public String getCompany() { return company; }
    public void setCompany(String company) { this.company = company; }
    public String getQuote() { return quote; }
    public void setQuote(String quote) { this.quote = quote; }
    public String getCaseStudyText() { return caseStudyText; }
    public void setCaseStudyText(String caseStudyText) { this.caseStudyText = caseStudyText; }
}