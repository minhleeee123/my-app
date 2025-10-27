-- ===================================
-- SEED DATA CHO WEBSITE BÁN GIÀY EVERSHOP
-- Tạo ngày: 2025-10-09
-- Tổng số sản phẩm: 100 (50 Nam + 50 Nữ)
-- Thương hiệu: Nike, Adidas, Puma
-- ===================================

BEGIN;

-- Lấy ID của các thuộc tính cần thiết
DO $$
DECLARE
    brand_attr_id INTEGER;
    size_attr_id INTEGER;
    color_attr_id INTEGER;
    nike_option_id INTEGER;
    adidas_option_id INTEGER;
    puma_option_id INTEGER;
    men_category_id INTEGER := 3;
    women_category_id INTEGER := 2;
    current_product_id INTEGER;
    base_price DECIMAL;
    shoe_names TEXT[] := ARRAY[
        'Air Max 90', 'Air Force 1', 'Dunk Low', 'Blazer Mid', 'Cortez Classic',
        'Revolution 5', 'Tanjun', 'Flex Experience', 'Free RN', 'Air Max 270',
        'React Infinity', 'Zoom Pegasus', 'Air Max 97', 'Vapormax', 'Huarache',
        'Presto', 'Air Max 1'
    ];
    adidas_names TEXT[] := ARRAY[
        'Stan Smith', 'Superstar', 'Gazelle', 'NMD R1', 'Ultraboost 22',
        'Forum Low', 'Continental 80', 'Samba Classic', 'Campus 00s', 'Handball Spezial',
        'ZX 750', 'I-5923', 'Swift Run', 'Falcon', 'Ozweego',
        'Nite Jogger', 'Grand Court'
    ];
    puma_names TEXT[] := ARRAY[
        'Suede Classic', 'RS-X', 'Cali', 'Mayze', 'Smash v2',
        'Roma Basic', 'Clyde Court', 'Thunder Spectra', 'Cell Endura', 'Basket Classic',
        'Speedcat', 'Future Rider', 'Mirage Sport', 'Ralph Sampson', 'CA Pro',
        'Slipstream'
    ];
BEGIN
    -- Lấy attribute IDs
    SELECT attribute_id INTO brand_attr_id FROM attribute WHERE attribute_code = 'Brand';
    SELECT attribute_id INTO size_attr_id FROM attribute WHERE attribute_code = 'size';
    SELECT attribute_id INTO color_attr_id FROM attribute WHERE attribute_code = 'color';
    
    -- Lấy brand option IDs
    SELECT attribute_option_id INTO nike_option_id FROM attribute_option WHERE attribute_code = 'Brand' AND option_text = 'Nike';
    SELECT attribute_option_id INTO adidas_option_id FROM attribute_option WHERE attribute_code = 'Brand' AND option_text = 'Adidas';
    SELECT attribute_option_id INTO puma_option_id FROM attribute_option WHERE attribute_code = 'Brand' AND option_text = 'Puma';

    RAISE NOTICE 'Starting seed data creation...';
    RAISE NOTICE 'Brand attr ID: %, Size attr ID: %, Color attr ID: %', brand_attr_id, size_attr_id, color_attr_id;
    RAISE NOTICE 'Nike option ID: %, Adidas option ID: %, Puma option ID: %', nike_option_id, adidas_option_id, puma_option_id;

    -- ============ GIÀY NAM (MEN) ============
    RAISE NOTICE 'Creating Men shoes...';
    
    -- NIKE MEN (17 sản phẩm)
    FOR i IN 1..17 LOOP
        base_price := 1500000 + (random() * 2000000)::INTEGER; -- Giá từ 1.5M - 3.5M
        
        INSERT INTO product (
            sku, price, status, visibility, category_id, weight, type
        ) VALUES (
            'NIKE-MEN-' || LPAD(i::text, 3, '0'),
            base_price,
            true,
            true,
            men_category_id,
            0.5 + (random() * 0.3), -- Cân nặng 0.5-0.8kg
            'simple'
        ) RETURNING product_id INTO current_product_id;

        -- Thêm mô tả sản phẩm
        INSERT INTO product_description (
            product_description_product_id,
            name,
            description,
            short_description,
            url_key,
            meta_title,
            meta_description,
            meta_keywords
        ) VALUES (
            current_product_id,
            'Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' Men''s',
            'Giày thể thao Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' dành cho nam giới. Thiết kế hiện đại, chất liệu cao cấp, mang lại sự thoải mái tối đa cho người sử dụng.',
            'Giày thể thao Nike nam chính hãng, chất lượng cao',
            'nike-' || lower(replace(shoe_names[((i-1) % array_length(shoe_names, 1)) + 1], ' ', '-')) || '-men-' || LPAD(i::text, 3, '0'),
            'Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' Men''s - Giày thể thao nam',
            'Mua giày Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' nam chính hãng, giá tốt, chất lượng đảm bảo.',
            'nike, giày nike, giày nam, thể thao, ' || lower(shoe_names[((i-1) % array_length(shoe_names, 1)) + 1])
        );

        -- Thêm ảnh sản phẩm (sử dụng ảnh từ dataset)
        INSERT INTO product_image (
            product_image_product_id,
            origin_image,
            thumb_image,
            listing_image,
            single_image,
            is_main
        ) VALUES (
            current_product_id,
            '/images/shoes_dataset/men/nike/image_' || i || '.jpg',
            '/images/shoes_dataset/men/nike/image_' || i || '_thumb.jpg',
            '/images/shoes_dataset/men/nike/image_' || i || '_listing.jpg',
            '/images/shoes_dataset/men/nike/image_' || i || '_single.jpg',
            true
        );

        -- Thêm inventory
        INSERT INTO product_inventory (
            product_inventory_product_id,
            qty,
            manage_stock,
            stock_availability
        ) VALUES (
            current_product_id,
            50 + (random() * 100)::INTEGER, -- Tồn kho 50-150
            true,
            true
        );

        -- Thêm thuộc tính Brand = Nike
        INSERT INTO product_attribute_value_index (
            product_id,
            attribute_id,
            option_id,
            option_text
        ) VALUES (
            current_product_id,
            brand_attr_id,
            nike_option_id,
            'Nike'
        );

        -- Thêm thuộc tính Size (random)
        INSERT INTO product_attribute_value_index (
            product_id,
            attribute_id,
            option_id,
            option_text
        ) VALUES (
            current_product_id,
            size_attr_id,
            4 + (random() * 3)::INTEGER, -- Size option IDs 4,5,6 (XXL,XL,SM)
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'XXL'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'XL'
                 ELSE 'SM' END
        );

        -- Thêm thuộc tính Color (random)
        INSERT INTO product_attribute_value_index (
            product_id,
            attribute_id,
            option_id,
            option_text
        ) VALUES (
            current_product_id,
            color_attr_id,
            1 + (random() * 3)::INTEGER, -- Color option IDs 1,2,3 (White,Black,Yellow)
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'White'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'Black'
                 ELSE 'Yellow' END
        );
    END LOOP;

    -- ADIDAS MEN (17 sản phẩm)
    FOR i IN 1..17 LOOP
        base_price := 1200000 + (random() * 2300000)::INTEGER; -- Giá từ 1.2M - 3.5M
        
        INSERT INTO product (
            sku, price, status, visibility, category_id, weight, type
        ) VALUES (
            'ADIDAS-MEN-' || LPAD(i::text, 3, '0'),
            base_price,
            true,
            true,
            men_category_id,
            0.5 + (random() * 0.3),
            'simple'
        ) RETURNING product_id INTO current_product_id;

        INSERT INTO product_description (
            product_description_product_id,
            name,
            description,
            short_description,
            url_key,
            meta_title,
            meta_description,
            meta_keywords
        ) VALUES (
            current_product_id,
            'Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' Men''s',
            'Giày thể thao Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' dành cho nam giới. Công nghệ tiên tiến, thiết kế đẳng cấp.',
            'Giày thể thao Adidas nam chính hãng',
            'adidas-' || lower(replace(adidas_names[((i-1) % array_length(adidas_names, 1)) + 1], ' ', '-')) || '-men-' || LPAD(i::text, 3, '0'),
            'Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' Men''s - Giày thể thao nam',
            'Mua giày Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' nam chính hãng.',
            'adidas, giày adidas, giày nam, thể thao, ' || lower(adidas_names[((i-1) % array_length(adidas_names, 1)) + 1])
        );

        INSERT INTO product_image (
            product_image_product_id,
            origin_image,
            thumb_image,
            listing_image,
            single_image,
            is_main
        ) VALUES (
            current_product_id,
            '/images/shoes_dataset/men/adidas/image_' || i || '.jpg',
            '/images/shoes_dataset/men/adidas/image_' || i || '_thumb.jpg',
            '/images/shoes_dataset/men/adidas/image_' || i || '_listing.jpg',
            '/images/shoes_dataset/men/adidas/image_' || i || '_single.jpg',
            true
        );

        INSERT INTO product_inventory (
            product_inventory_product_id,
            qty,
            manage_stock,
            stock_availability
        ) VALUES (
            current_product_id,
            50 + (random() * 100)::INTEGER,
            true,
            true
        );

        -- Thuộc tính Brand = Adidas
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, brand_attr_id, adidas_option_id, 'Adidas'
        );

        -- Random Size & Color như Nike
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, size_attr_id, 4 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'XXL'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'XL'
                 ELSE 'SM' END
        );

        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, color_attr_id, 1 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'White'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'Black'
                 ELSE 'Yellow' END
        );
    END LOOP;

    -- PUMA MEN (16 sản phẩm)
    FOR i IN 1..16 LOOP
        base_price := 1000000 + (random() * 2000000)::INTEGER; -- Giá từ 1M - 3M
        
        INSERT INTO product (
            sku, price, status, visibility, category_id, weight, type
        ) VALUES (
            'PUMA-MEN-' || LPAD(i::text, 3, '0'),
            base_price,
            true,
            true,
            men_category_id,
            0.5 + (random() * 0.3),
            'simple'
        ) RETURNING product_id INTO current_product_id;

        INSERT INTO product_description (
            product_description_product_id,
            name,
            description,
            short_description,
            url_key,
            meta_title,
            meta_description,
            meta_keywords
        ) VALUES (
            current_product_id,
            'Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' Men''s',
            'Giày thể thao Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' dành cho nam giới. Phong cách thể thao, bền bỉ.',
            'Giày thể thao Puma nam chính hãng',
            'puma-' || lower(replace(puma_names[((i-1) % array_length(puma_names, 1)) + 1], ' ', '-')) || '-men-' || LPAD(i::text, 3, '0'),
            'Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' Men''s - Giày thể thao nam',
            'Mua giày Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' nam chính hãng.',
            'puma, giày puma, giày nam, thể thao, ' || lower(puma_names[((i-1) % array_length(puma_names, 1)) + 1])
        );

        INSERT INTO product_image (
            product_image_product_id,
            origin_image,
            thumb_image,
            listing_image,
            single_image,
            is_main
        ) VALUES (
            current_product_id,
            '/images/shoes_dataset/men/puma/image_' || i || '.jpg',
            '/images/shoes_dataset/men/puma/image_' || i || '_thumb.jpg',
            '/images/shoes_dataset/men/puma/image_' || i || '_listing.jpg',
            '/images/shoes_dataset/men/puma/image_' || i || '_single.jpg',
            true
        );

        INSERT INTO product_inventory (
            product_inventory_product_id,
            qty,
            manage_stock,
            stock_availability
        ) VALUES (
            current_product_id,
            50 + (random() * 100)::INTEGER,
            true,
            true
        );

        -- Thuộc tính Brand = Puma
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, brand_attr_id, puma_option_id, 'Puma'
        );

        -- Random Size & Color
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, size_attr_id, 4 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'XXL'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'XL'
                 ELSE 'SM' END
        );

        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, color_attr_id, 1 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'White'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'Black'
                 ELSE 'Yellow' END
        );
    END LOOP;

    -- ============ GIÀY NỮ (WOMEN) ============
    RAISE NOTICE 'Creating Women shoes...';
    
    -- NIKE WOMEN (17 sản phẩm)
    FOR i IN 1..17 LOOP
        base_price := 1500000 + (random() * 2000000)::INTEGER;
        
        INSERT INTO product (
            sku, price, status, visibility, category_id, weight, type
        ) VALUES (
            'NIKE-WOMEN-' || LPAD(i::text, 3, '0'),
            base_price,
            true,
            true,
            women_category_id,
            0.4 + (random() * 0.3),
            'simple'
        ) RETURNING product_id INTO current_product_id;

        INSERT INTO product_description (
            product_description_product_id,
            name,
            description,
            short_description,
            url_key,
            meta_title,
            meta_description,
            meta_keywords
        ) VALUES (
            current_product_id,
            'Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' Women''s',
            'Giày thể thao Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' dành cho nữ giới. Thiết kế nữ tính, thời trang và thoải mái.',
            'Giày thể thao Nike nữ chính hãng',
            'nike-' || lower(replace(shoe_names[((i-1) % array_length(shoe_names, 1)) + 1], ' ', '-')) || '-women-' || LPAD(i::text, 3, '0'),
            'Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' Women''s - Giày thể thao nữ',
            'Mua giày Nike ' || shoe_names[((i-1) % array_length(shoe_names, 1)) + 1] || ' nữ chính hãng.',
            'nike, giày nike, giày nữ, thể thao, ' || lower(shoe_names[((i-1) % array_length(shoe_names, 1)) + 1])
        );

        INSERT INTO product_image (
            product_image_product_id,
            origin_image,
            thumb_image,
            listing_image,
            single_image,
            is_main
        ) VALUES (
            current_product_id,
            '/images/shoes_dataset/women/nike/image_' || i || '.jpg',
            '/images/shoes_dataset/women/nike/image_' || i || '_thumb.jpg',
            '/images/shoes_dataset/women/nike/image_' || i || '_listing.jpg',
            '/images/shoes_dataset/women/nike/image_' || i || '_single.jpg',
            true
        );

        INSERT INTO product_inventory (
            product_inventory_product_id,
            qty,
            manage_stock,
            stock_availability
        ) VALUES (
            current_product_id,
            50 + (random() * 100)::INTEGER,
            true,
            true
        );

        -- Thuộc tính Brand = Nike
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, brand_attr_id, nike_option_id, 'Nike'
        );

        -- Random Size & Color
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, size_attr_id, 4 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'XXL'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'XL'
                 ELSE 'SM' END
        );

        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, color_attr_id, 1 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'White'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'Black'
                 ELSE 'Yellow' END
        );
    END LOOP;

    -- ADIDAS WOMEN (17 sản phẩm)
    FOR i IN 1..17 LOOP
        base_price := 1200000 + (random() * 2300000)::INTEGER;
        
        INSERT INTO product (
            sku, price, status, visibility, category_id, weight, type
        ) VALUES (
            'ADIDAS-WOMEN-' || LPAD(i::text, 3, '0'),
            base_price,
            true,
            true,
            women_category_id,
            0.4 + (random() * 0.3),
            'simple'
        ) RETURNING product_id INTO current_product_id;

        INSERT INTO product_description (
            product_description_product_id,
            name,
            description,
            short_description,
            url_key,
            meta_title,
            meta_description,
            meta_keywords
        ) VALUES (
            current_product_id,
            'Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' Women''s',
            'Giày thể thao Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' dành cho nữ giới. Phong cách hiện đại, chất lượng tuyệt vời.',
            'Giày thể thao Adidas nữ chính hãng',
            'adidas-' || lower(replace(adidas_names[((i-1) % array_length(adidas_names, 1)) + 1], ' ', '-')) || '-women-' || LPAD(i::text, 3, '0'),
            'Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' Women''s - Giày thể thao nữ',
            'Mua giày Adidas ' || adidas_names[((i-1) % array_length(adidas_names, 1)) + 1] || ' nữ chính hãng.',
            'adidas, giày adidas, giày nữ, thể thao, ' || lower(adidas_names[((i-1) % array_length(adidas_names, 1)) + 1])
        );

        INSERT INTO product_image (
            product_image_product_id,
            origin_image,
            thumb_image,
            listing_image,
            single_image,
            is_main
        ) VALUES (
            current_product_id,
            '/images/shoes_dataset/women/adidas/image_' || i || '.jpg',
            '/images/shoes_dataset/women/adidas/image_' || i || '_thumb.jpg',
            '/images/shoes_dataset/women/adidas/image_' || i || '_listing.jpg',
            '/images/shoes_dataset/women/adidas/image_' || i || '_single.jpg',
            true
        );

        INSERT INTO product_inventory (
            product_inventory_product_id,
            qty,
            manage_stock,
            stock_availability
        ) VALUES (
            current_product_id,
            50 + (random() * 100)::INTEGER,
            true,
            true
        );

        -- Thuộc tính Brand = Adidas
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, brand_attr_id, adidas_option_id, 'Adidas'
        );

        -- Random Size & Color
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, size_attr_id, 4 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'XXL'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'XL'
                 ELSE 'SM' END
        );

        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, color_attr_id, 1 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'White'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'Black'
                 ELSE 'Yellow' END
        );
    END LOOP;

    -- PUMA WOMEN (16 sản phẩm)
    FOR i IN 1..16 LOOP
        base_price := 1000000 + (random() * 2000000)::INTEGER;
        
        INSERT INTO product (
            sku, price, status, visibility, category_id, weight, type
        ) VALUES (
            'PUMA-WOMEN-' || LPAD(i::text, 3, '0'),
            base_price,
            true,
            true,
            women_category_id,
            0.4 + (random() * 0.3),
            'simple'
        ) RETURNING product_id INTO current_product_id;

        INSERT INTO product_description (
            product_description_product_id,
            name,
            description,
            short_description,
            url_key,
            meta_title,
            meta_description,
            meta_keywords
        ) VALUES (
            current_product_id,
            'Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' Women''s',
            'Giày thể thao Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' dành cho nữ giới. Thiết kế trẻ trung, năng động.',
            'Giày thể thao Puma nữ chính hãng',
            'puma-' || lower(replace(puma_names[((i-1) % array_length(puma_names, 1)) + 1], ' ', '-')) || '-women-' || LPAD(i::text, 3, '0'),
            'Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' Women''s - Giày thể thao nữ',
            'Mua giày Puma ' || puma_names[((i-1) % array_length(puma_names, 1)) + 1] || ' nữ chính hãng.',
            'puma, giày puma, giày nữ, thể thao, ' || lower(puma_names[((i-1) % array_length(puma_names, 1)) + 1])
        );

        INSERT INTO product_image (
            product_image_product_id,
            origin_image,
            thumb_image,
            listing_image,
            single_image,
            is_main
        ) VALUES (
            current_product_id,
            '/images/shoes_dataset/women/puma/image_' || i || '.jpg',
            '/images/shoes_dataset/women/puma/image_' || i || '_thumb.jpg',
            '/images/shoes_dataset/women/puma/image_' || i || '_listing.jpg',
            '/images/shoes_dataset/women/puma/image_' || i || '_single.jpg',
            true
        );

        INSERT INTO product_inventory (
            product_inventory_product_id,
            qty,
            manage_stock,
            stock_availability
        ) VALUES (
            current_product_id,
            50 + (random() * 100)::INTEGER,
            true,
            true
        );

        -- Thuộc tính Brand = Puma
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, brand_attr_id, puma_option_id, 'Puma'
        );

        -- Random Size & Color
        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, size_attr_id, 4 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'XXL'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'XL'
                 ELSE 'SM' END
        );

        INSERT INTO product_attribute_value_index (
            product_id, attribute_id, option_id, option_text
        ) VALUES (
            current_product_id, color_attr_id, 1 + (random() * 3)::INTEGER,
            CASE WHEN (random() * 3)::INTEGER = 0 THEN 'White'
                 WHEN (random() * 3)::INTEGER = 1 THEN 'Black'
                 ELSE 'Yellow' END
        );
    END LOOP;

    RAISE NOTICE 'Seed data creation completed!';
    RAISE NOTICE 'Total products created: 100 (50 Men + 50 Women)';
    RAISE NOTICE 'Nike: 34 products, Adidas: 34 products, Puma: 32 products';

END $$;

-- Kiểm tra kết quả
SELECT 'SUMMARY REPORT' as report_type;

SELECT 
    'Products by Category' as metric,
    cd.name as category,
    COUNT(*) as count
FROM product p
JOIN category_description cd ON p.category_id = cd.category_description_category_id
GROUP BY p.category_id, cd.name
ORDER BY p.category_id;

SELECT 
    'Products by Brand' as metric,
    pavi.option_text as brand,
    COUNT(*) as count
FROM product_attribute_value_index pavi
JOIN attribute a ON pavi.attribute_id = a.attribute_id
WHERE a.attribute_code = 'Brand'
GROUP BY pavi.option_text
ORDER BY pavi.option_text;

SELECT 
    'Total Products' as metric,
    COUNT(*) as total_count
FROM product;

COMMIT;

-- ===================================
-- SEED DATA CREATION COMPLETED
-- Website: Shoe Store EverShop
-- Total: 100 Products
-- Categories: Men (50), Women (50)
-- Brands: Nike, Adidas, Puma
-- ===================================