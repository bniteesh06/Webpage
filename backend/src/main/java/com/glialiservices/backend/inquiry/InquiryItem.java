package com.glialiservices.backend.inquiry;

import com.glialiservices.backend.catalog.ProductVariant;
import jakarta.persistence.*;

@Entity
@Table(name = "inquiry_item")
public class InquiryItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "inquiry_id")
    private Inquiry inquiry;

    @ManyToOne
    @JoinColumn(name = "product_variant_id")
    private ProductVariant productVariant;

    private Integer quantity;

    // getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Inquiry getInquiry() { return inquiry; }
    public void setInquiry(Inquiry inquiry) { this.inquiry = inquiry; }
    public ProductVariant getProductVariant() { return productVariant; }
    public void setProductVariant(ProductVariant productVariant) { this.productVariant = productVariant; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
}