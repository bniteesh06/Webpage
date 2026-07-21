package com.glialiservices.backend.catalog;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "product_variant")
public class ProductVariant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "width_mm")
    private BigDecimal widthMm;

    @Column(name = "length_m")
    private BigDecimal lengthM;

    @Column(name = "core_diameter_mm")
    private BigDecimal coreDiameterMm;

    private String material;
    private BigDecimal price;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "image_alt_text")
    private String imageAltText;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    // getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public BigDecimal getWidthMm() { return widthMm; }
    public void setWidthMm(BigDecimal widthMm) { this.widthMm = widthMm; }
    public BigDecimal getLengthM() { return lengthM; }
    public void setLengthM(BigDecimal lengthM) { this.lengthM = lengthM; }
    public BigDecimal getCoreDiameterMm() { return coreDiameterMm; }
    public void setCoreDiameterMm(BigDecimal coreDiameterMm) { this.coreDiameterMm = coreDiameterMm; }
    public String getMaterial() { return material; }
    public void setMaterial(String material) { this.material = material; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getImageAltText() { return imageAltText; }
    public void setImageAltText(String imageAltText) { this.imageAltText = imageAltText; }
    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
}