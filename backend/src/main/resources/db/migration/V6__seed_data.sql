-- V6__seed_data.sql
-- Seed data sourced from the live glialiservices.com site (Jul 2026).
-- ⚠️ Fields marked TODO are placeholders — real dimensions/prices need confirming with Balajee.

-- ===================== CATEGORIES =====================
INSERT INTO category (name, slug, description) VALUES
  ('TTO Ribbons', 'tto-ribbons', 'Premium quality ribbons ensuring sharp, durable and smudge-resistant printing performance.'),
  ('Care Labels', 'care-labels', 'Wash-resistant and long-lasting care labels ideal for garment and textile applications.'),
  ('Printer Cleaning', 'printer-cleaning', 'Professional cleaning solutions to maintain print quality and extend printer lifespan.'),
  ('Barcode Labels & Ribbons', 'barcode-labels-ribbons', 'Superior barcode labeling solutions delivering accurate scanning and durable performance.');

-- ===================== SUB-CATEGORIES =====================
INSERT INTO sub_category (name, slug, category_id, description) VALUES
  ('TTO Wax Resin', 'tto-wax-resin', (SELECT id FROM category WHERE slug = 'tto-ribbons'), 'Wax-resin ribbons for TTO, Near Edge and Corner Edge printers.'),
  ('TTO Resin Ribbons', 'tto-resin-ribbons', (SELECT id FROM category WHERE slug = 'tto-ribbons'), 'Full-resin ribbons for high-durability printing applications.'),
  ('Thermal Taffeta', 'thermal-taffeta', (SELECT id FROM category WHERE slug = 'care-labels'), 'Thermal taffeta care labels for garment/textile use.'),
  ('Wash Care Resin', 'wash-care-resin', (SELECT id FROM category WHERE slug = 'care-labels'), 'Resin-printed wash care labels for durable garment instructions.'),
  ('Wipes', 'wipes', (SELECT id FROM category WHERE slug = 'printer-cleaning'), 'IPA-presaturated cleaning wipes for thermal/inkjet printers.'),
  ('Swabs', 'swabs', (SELECT id FROM category WHERE slug = 'printer-cleaning'), 'IPA-filled foam cleaning swabs for print heads.'),
  ('Wash Solvent', 'wash-solvent', (SELECT id FROM category WHERE slug = 'printer-cleaning'), 'IPA cleaning solvent for inkjet print head maintenance.'),
  ('Cromo Labels', 'cromo-labels', (SELECT id FROM category WHERE slug = 'barcode-labels-ribbons'), 'Chromo paper barcode labels.'),
  ('Polyester Labels', 'polyester-labels', (SELECT id FROM category WHERE slug = 'barcode-labels-ribbons'), 'Durable polyester barcode labels for harsh environments.');

-- ===================== PRODUCTS (real names/descriptions from the live site) =====================
INSERT INTO product (name, slug, description, sub_category_id) VALUES
  ('1104 Wax-Resin Ribbon', '1104-wax-resin-ribbon',
   'The newest wax/resin ribbon for TTO, Near Edge and Corner Edge printers. Dedicated to printing rough label materials like uncoated papers or tags. Achieves very good printing quality on these materials thanks to superior coverage capacity and high sensitivity for high-speed labelling applications.',
   (SELECT id FROM sub_category WHERE slug = 'tto-wax-resin')),

  ('1123 Wax-Resin Ribbon', '1123-wax-resin-ribbon',
   'The worldwide reference premium ribbon for Corner Edge and Near Edge printers — the standard in the wax/resin range. Balanced performance across speed, sensitivity, versatility, and blackness for a large majority of applications.',
   (SELECT id FROM sub_category WHERE slug = 'tto-wax-resin')),

  ('1126 Wax-Resin Ribbon', '1126-wax-resin-ribbon',
   'Premium Corner Edge and Near Edge ribbon with excellent sensitivity and receptor multi-compatibility, delivering very good print quality at high speed with sharp 90° barcodes.',
   (SELECT id FROM sub_category WHERE slug = 'tto-wax-resin')),

  ('1121 Wax-Resin Ribbon', '1121-wax-resin-ribbon',
   'Wax/resin ribbon for TTO, Near Edge and Corner Edge printers, dedicated to rough label materials like uncoated papers or tags, with high resistance to smudge.',
   (SELECT id FROM sub_category WHERE slug = 'tto-wax-resin')),

  ('Cleaning Wipes (IPA)', 'cleaning-wipes-ipa',
   'IPA presaturated cleaning wipes for preventive maintenance of thermal print heads, platen rollers, and components. 40 wipes per box, part number IPA-M3.',
   (SELECT id FROM sub_category WHERE slug = 'wipes')),

  ('Cleaning Swabs (IPA)', 'cleaning-swabs-ipa',
   'IPA-filled foam-tip cleaning swabs for print head maintenance, ideal for removing accumulated ink and reducing print errors. 50 swabs per box, part number IPA55-4.5.',
   (SELECT id FROM sub_category WHERE slug = 'swabs')),

  ('Inkjet Cleaning Solvent', 'inkjet-cleaning-solvent',
   'IPA pre-saturated cleaning solvent for inkjet print head cleaning, supplied in 1 litre bottles. Part number IPA-C1.',
   (SELECT id FROM sub_category WHERE slug = 'wash-solvent'));

-- ===================== PRODUCT VARIANTS =====================
-- TODO: width_mm / length_m / core_diameter_mm / price below are PLACEHOLDERS.
-- Confirm real values with Balajee before this goes live — ribbon dimensions vary by roll and need exact figures.

INSERT INTO product_variant (width_mm, length_m, core_diameter_mm, material, price, image_url, image_alt_text, product_id) VALUES
  (33, 300, 25.4, 'Wax-Resin', 380.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/1104-200x300.png',
   '1104 wax-resin TTO ribbon roll, black',
   (SELECT id FROM product WHERE slug = '1104-wax-resin-ribbon')),

  (33, 300, 25.4, 'Wax-Resin', 410.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/1123-200x300.png',
   '1123 wax-resin TTO ribbon roll, black',
   (SELECT id FROM product WHERE slug = '1123-wax-resin-ribbon')),

  (33, 300, 25.4, 'Wax-Resin', 410.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/1126-200x300.png',
   '1126 wax-resin TTO ribbon roll, black',
   (SELECT id FROM product WHERE slug = '1126-wax-resin-ribbon')),

  (33, 300, 25.4, 'Wax-Resin', 380.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/1121-200x300.png',
   '1121 wax-resin TTO ribbon roll, black',
   (SELECT id FROM product WHERE slug = '1121-wax-resin-ribbon')),

  (NULL, NULL, NULL, 'Non-Woven Fabric (40% Rayon, 60% Polyester)', 250.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/Picture1.png',
   'Box of 40 IPA presaturated cleaning wipes, part IPA-M3',
   (SELECT id FROM product WHERE slug = 'cleaning-wipes-ipa')),

  (NULL, NULL, NULL, 'Polyurethane foam tip, polypropylene handle', 300.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/Picture3.png',
   'Box of 50 IPA snap cleaning swabs, part IPA55-4.5',
   (SELECT id FROM product WHERE slug = 'cleaning-swabs-ipa')),

  (NULL, NULL, NULL, '99.9% IPA solution', 450.00,
   'https://glialiservices.com/wp-content/uploads/2026/04/Picture4.png',
   '1 litre IPA inkjet print head cleaning solvent bottle, part IPA-C1',
   (SELECT id FROM product WHERE slug = 'inkjet-cleaning-solvent'));

-- ===================== TESTIMONIALS =====================
-- No real testimonials existed on the old site (only partner logos, no quotes) — placeholder until real client quotes are collected.
INSERT INTO testimonial (author, company, quote) VALUES
  ('Placeholder — collect real client quote', 'Placeholder Company Pvt Ltd', 'Placeholder quote text — replace with a real testimonial once collected from a client.');

-- ===================== BLOG =====================
-- No existing blog content on the old site — placeholder post to unblock frontend/ISR testing.
INSERT INTO blog_post (title, slug, body, published_at) VALUES
  ('Choosing the Right TTO Ribbon Width for Your Packaging Line', 'choosing-right-tto-ribbon-width',
   'Placeholder body text — replace with a real application guide once written for Phase 6.',
   now());