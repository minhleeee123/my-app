--
-- PostgreSQL database dump
--

\restrict gSRkRPOAoY85IyNsJk3Cv7hfmbWmcZ3fvRzyL00Gm88raj8xV9AKelPQ9OaTz1W

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-10-08 19:34:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.product_inventory DROP CONSTRAINT "PRODUCT_INVENTORY_PRODUCT_ID_CONSTANTSRAINT";
ALTER TABLE ONLY public.product DROP CONSTRAINT "PRODUCT_CATEGORY_ID_CONSTRAINT";
ALTER TABLE ONLY public.shipping_zone_method DROP CONSTRAINT "FK_ZONE_METHOD";
ALTER TABLE ONLY public.tax_rate DROP CONSTRAINT "FK_TAX_RATE_TAX_CLASS";
ALTER TABLE ONLY public.product DROP CONSTRAINT "FK_TAX_CLASS";
ALTER TABLE ONLY public.shipping_zone_province DROP CONSTRAINT "FK_SHIPPING_ZONE_PROVINCE";
ALTER TABLE ONLY public.reset_password_token DROP CONSTRAINT "FK_RESET_PASSWORD_TOKEN_CUSTOMER";
ALTER TABLE ONLY public.product DROP CONSTRAINT "FK_PRODUCT_VARIANT_GROUP";
ALTER TABLE ONLY public.product_image DROP CONSTRAINT "FK_PRODUCT_IMAGE_LINK";
ALTER TABLE ONLY public.product_description DROP CONSTRAINT "FK_PRODUCT_DESCRIPTION";
ALTER TABLE ONLY public.product_custom_option DROP CONSTRAINT "FK_PRODUCT_CUSTOM_OPTION";
ALTER TABLE ONLY public.product_collection DROP CONSTRAINT "FK_PRODUCT_COLLECTION_LINK";
ALTER TABLE ONLY public.product_attribute_value_index DROP CONSTRAINT "FK_PRODUCT_ATTRIBUTE_LINK";
ALTER TABLE ONLY public.product DROP CONSTRAINT "FK_PRODUCT_ATTRIBUTE_GROUP";
ALTER TABLE ONLY public.payment_transaction DROP CONSTRAINT "FK_PAYMENT_TRANSACTION_ORDER";
ALTER TABLE ONLY public.shipment DROP CONSTRAINT "FK_ORDER_SHIPMENT";
ALTER TABLE ONLY public.order_activity DROP CONSTRAINT "FK_ORDER_ACTIVITY";
ALTER TABLE ONLY public.order_item DROP CONSTRAINT "FK_ORDER";
ALTER TABLE ONLY public.shipping_zone_method DROP CONSTRAINT "FK_METHOD_ZONE";
ALTER TABLE ONLY public.attribute_group_link DROP CONSTRAINT "FK_GROUP_LINK";
ALTER TABLE ONLY public.product_custom_option_value DROP CONSTRAINT "FK_CUSTOM_OPTION_VALUE";
ALTER TABLE ONLY public.customer DROP CONSTRAINT "FK_CUSTOMER_GROUP";
ALTER TABLE ONLY public.customer_address DROP CONSTRAINT "FK_CUSTOMER_ADDRESS";
ALTER TABLE ONLY public.product_collection DROP CONSTRAINT "FK_COLLECTION_PRODUCT_LINK";
ALTER TABLE ONLY public.cms_page_description DROP CONSTRAINT "FK_CMS_PAGE_DESCRIPTION";
ALTER TABLE ONLY public.category_description DROP CONSTRAINT "FK_CATEGORY_DESCRIPTION";
ALTER TABLE ONLY public.cart DROP CONSTRAINT "FK_CART_SHIPPING_ZONE";
ALTER TABLE ONLY public.cart_item DROP CONSTRAINT "FK_CART_ITEM_PRODUCT";
ALTER TABLE ONLY public.cart_item DROP CONSTRAINT "FK_CART_ITEM";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "FK_ATTRIBUTE_VARIANT_TWO";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "FK_ATTRIBUTE_VARIANT_THREE";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "FK_ATTRIBUTE_VARIANT_ONE";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "FK_ATTRIBUTE_VARIANT_FOUR";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "FK_ATTRIBUTE_VARIANT_FIVE";
ALTER TABLE ONLY public.product_attribute_value_index DROP CONSTRAINT "FK_ATTRIBUTE_VALUE_LINK";
ALTER TABLE ONLY public.product_attribute_value_index DROP CONSTRAINT "FK_ATTRIBUTE_OPTION_VALUE_LINK";
ALTER TABLE ONLY public.attribute_option DROP CONSTRAINT "FK_ATTRIBUTE_OPTION";
ALTER TABLE ONLY public.attribute_group_link DROP CONSTRAINT "FK_ATTRIBUTE_LINK";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "FK_ATTRIBUTE_GROUP_VARIANT";
DROP TRIGGER "TRIGGER_UPDATE_COUPON_USED_TIME_AFTER_CREATE_ORDER" ON public."order";
DROP TRIGGER "TRIGGER_PRODUCT_AFTER_UPDATE" ON public.product;
DROP TRIGGER "TRIGGER_AFTER_UPDATE_ATTRIBUTE" ON public.attribute;
DROP TRIGGER "TRIGGER_AFTER_REMOVE_ATTRIBUTE_FROM_GROUP" ON public.attribute_group_link;
DROP TRIGGER "TRIGGER_AFTER_INSERT_PRODUCT" ON public.product;
DROP TRIGGER "TRIGGER_AFTER_INSERT_ORDER_ITEM" ON public.order_item;
DROP TRIGGER "TRIGGER_AFTER_DELETE_ATTRIBUTE_OPTION" ON public.attribute_option;
DROP TRIGGER "TRIGGER_AFTER_ATTRIBUTE_OPTION_UPDATE" ON public.attribute_option;
DROP TRIGGER "SET_DEFAULT_CUSTOMER_GROUP" ON public.customer;
DROP TRIGGER "PRODUCT_IMAGE_ADDED" ON public.product_image;
DROP TRIGGER "PREVENT_DELETING_THE_DEFAULT_TAX_CLASS" ON public.tax_class;
DROP TRIGGER "PREVENT_DELETING_THE_DEFAULT_CUSTOMER_GROUP" ON public.customer_group;
DROP TRIGGER "PREVENT_DELETING_THE_DEFAULT_ATTRIBUTE_GROUP" ON public.attribute_group;
DROP TRIGGER "PREVENT_CHANGING_ATTRIBUTE_GROUP_OF_PRODUCT_WITH_VARIANTS" ON public.product;
DROP TRIGGER "DELETE_SUB_CATEGORIES_TRIGGER" ON public.category;
DROP TRIGGER "BUILD_PRODUCT_URL_KEY_TRIGGER" ON public.product_description;
DROP TRIGGER "BUILD_CATEGORY_URL_KEY_TRIGGER" ON public.category_description;
DROP TRIGGER "ADD_PRODUCT_UPDATED_EVENT_TRIGGER" ON public.product;
DROP TRIGGER "ADD_PRODUCT_DELETED_EVENT_TRIGGER" ON public.product;
DROP TRIGGER "ADD_PRODUCT_CREATED_EVENT_TRIGGER" ON public.product;
DROP TRIGGER "ADD_ORDER_CREATED_EVENT_TRIGGER" ON public."order";
DROP TRIGGER "ADD_INVENTORY_UPDATED_EVENT_TRIGGER" ON public.product_inventory;
DROP TRIGGER "ADD_CUSTOMER_UPDATED_EVENT_TRIGGER" ON public.customer;
DROP TRIGGER "ADD_CUSTOMER_DELETED_EVENT_TRIGGER" ON public.customer;
DROP TRIGGER "ADD_CUSTOMER_CREATED_EVENT_TRIGGER" ON public.customer;
DROP TRIGGER "ADD_CATEGORY_UPDATED_EVENT_TRIGGER" ON public.category;
DROP TRIGGER "ADD_CATEGORY_DELETED_EVENT_TRIGGER" ON public.category;
DROP TRIGGER "ADD_CATEGORY_CREATED_EVENT_TRIGGER" ON public.category;
DROP INDEX public."PRODUCT_SEARCH_INDEX";
DROP INDEX public."IDX_SESSION_EXPIRE";
DROP INDEX public."FK_ZONE_METHOD";
DROP INDEX public."FK_SHIPPING_ZONE_PROVINCE";
DROP INDEX public."FK_PRODUCT_VARIANT_GROUP";
DROP INDEX public."FK_PRODUCT_IMAGE_LINK";
DROP INDEX public."FK_PRODUCT_DESCRIPTION";
DROP INDEX public."FK_PRODUCT_CUSTOM_OPTION";
DROP INDEX public."FK_PRODUCT_COLLECTION_LINK";
DROP INDEX public."FK_PRODUCT_ATTRIBUTE_LINK";
DROP INDEX public."FK_PRODUCT_ATTRIBUTE_GROUP";
DROP INDEX public."FK_PAYMENT_TRANSACTION_ORDER";
DROP INDEX public."FK_ORDER_SHIPMENT";
DROP INDEX public."FK_ORDER_ACTIVITY";
DROP INDEX public."FK_ORDER";
DROP INDEX public."FK_METHOD_ZONE";
DROP INDEX public."FK_GROUP_LINK";
DROP INDEX public."FK_CUSTOM_OPTION_VALUE";
DROP INDEX public."FK_CUSTOMER_GROUP";
DROP INDEX public."FK_CUSTOMER_ADDRESS";
DROP INDEX public."FK_COLLECTION_PRODUCT_LINK";
DROP INDEX public."FK_CMS_PAGE_DESCRIPTION";
DROP INDEX public."FK_CATEGORY_DESCRIPTION";
DROP INDEX public."FK_CART_SHIPPING_ZONE";
DROP INDEX public."FK_CART_ITEM_PRODUCT";
DROP INDEX public."FK_CART_ITEM";
DROP INDEX public."FK_ATTRIBUTE_VARIANT_TWO";
DROP INDEX public."FK_ATTRIBUTE_VARIANT_THREE";
DROP INDEX public."FK_ATTRIBUTE_VARIANT_ONE";
DROP INDEX public."FK_ATTRIBUTE_VARIANT_FOUR";
DROP INDEX public."FK_ATTRIBUTE_VARIANT_FIVE";
DROP INDEX public."FK_ATTRIBUTE_VALUE_LINK";
DROP INDEX public."FK_ATTRIBUTE_OPTION_VALUE_LINK";
DROP INDEX public."FK_ATTRIBUTE_OPTION";
DROP INDEX public."FK_ATTRIBUTE_LINK";
DROP INDEX public."FK_ATTRIBUTE_GROUP_VARIANT";
ALTER TABLE ONLY public.widget DROP CONSTRAINT widget_pkey;
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT variant_group_pkey;
ALTER TABLE ONLY public.url_rewrite DROP CONSTRAINT url_rewrite_pkey;
ALTER TABLE ONLY public.tax_rate DROP CONSTRAINT tax_rate_pkey;
ALTER TABLE ONLY public.tax_class DROP CONSTRAINT tax_class_pkey;
ALTER TABLE ONLY public.shipping_zone_province DROP CONSTRAINT shipping_zone_province_pkey;
ALTER TABLE ONLY public.shipping_zone DROP CONSTRAINT shipping_zone_pkey;
ALTER TABLE ONLY public.shipping_zone_method DROP CONSTRAINT shipping_zone_method_pkey;
ALTER TABLE ONLY public.shipping_method DROP CONSTRAINT shipping_method_pkey;
ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_pkey;
ALTER TABLE ONLY public.setting DROP CONSTRAINT setting_pkey;
ALTER TABLE ONLY public.reset_password_token DROP CONSTRAINT reset_password_token_pkey;
ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
ALTER TABLE ONLY public.product_inventory DROP CONSTRAINT product_inventory_pkey;
ALTER TABLE ONLY public.product_image DROP CONSTRAINT product_image_pkey;
ALTER TABLE ONLY public.product_description DROP CONSTRAINT product_description_pkey;
ALTER TABLE ONLY public.product_custom_option_value DROP CONSTRAINT product_custom_option_value_pkey;
ALTER TABLE ONLY public.product_custom_option DROP CONSTRAINT product_custom_option_pkey;
ALTER TABLE ONLY public.product_collection DROP CONSTRAINT product_collection_pkey;
ALTER TABLE ONLY public.product_attribute_value_index DROP CONSTRAINT product_attribute_value_index_pkey;
ALTER TABLE ONLY public.payment_transaction DROP CONSTRAINT payment_transaction_pkey;
ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_pkey;
ALTER TABLE ONLY public.order_address DROP CONSTRAINT order_address_pkey;
ALTER TABLE ONLY public.order_activity DROP CONSTRAINT order_activity_pkey;
ALTER TABLE ONLY public.migration DROP CONSTRAINT migration_pkey;
ALTER TABLE ONLY public.event DROP CONSTRAINT event_pkey;
ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
ALTER TABLE ONLY public.customer_group DROP CONSTRAINT customer_group_pkey;
ALTER TABLE ONLY public.customer_address DROP CONSTRAINT customer_address_pkey;
ALTER TABLE ONLY public.coupon DROP CONSTRAINT coupon_pkey;
ALTER TABLE ONLY public.collection DROP CONSTRAINT collection_pkey;
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT cms_page_pkey;
ALTER TABLE ONLY public.cms_page_description DROP CONSTRAINT cms_page_description_pkey;
ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
ALTER TABLE ONLY public.category_description DROP CONSTRAINT category_description_pkey;
ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_pkey;
ALTER TABLE ONLY public.cart_address DROP CONSTRAINT cart_address_pkey;
ALTER TABLE ONLY public.attribute DROP CONSTRAINT attribute_pkey;
ALTER TABLE ONLY public.attribute_option DROP CONSTRAINT attribute_option_pkey;
ALTER TABLE ONLY public.attribute_group DROP CONSTRAINT attribute_group_pkey;
ALTER TABLE ONLY public.attribute_group_link DROP CONSTRAINT attribute_group_link_pkey;
ALTER TABLE ONLY public.admin_user DROP CONSTRAINT admin_user_pkey;
ALTER TABLE ONLY public.widget DROP CONSTRAINT "WIDGET_UUID";
ALTER TABLE ONLY public.variant_group DROP CONSTRAINT "VARIANT_GROUP_UUID_UNIQUE";
ALTER TABLE ONLY public.url_rewrite DROP CONSTRAINT "URL_REWRITE_PATH_UNIQUE";
ALTER TABLE ONLY public.cms_page_description DROP CONSTRAINT "URL_KEY_UNIQUE";
ALTER TABLE ONLY public.payment_transaction DROP CONSTRAINT "UNQ_PAYMENT_TRANSACTION_ID_ORDER_ID";
ALTER TABLE ONLY public.tax_rate DROP CONSTRAINT "TAX_RATE_UUID_UNIQUE";
ALTER TABLE ONLY public.tax_rate DROP CONSTRAINT "TAX_RATE_PRIORITY_UNIQUE";
ALTER TABLE ONLY public.tax_class DROP CONSTRAINT "TAX_CLASS_UUID_UNIQUE";
ALTER TABLE ONLY public.shipping_zone DROP CONSTRAINT "SHIPPING_ZONE_UUID_UNIQUE";
ALTER TABLE ONLY public.shipping_zone_province DROP CONSTRAINT "SHIPPING_ZONE_PROVINCE_UUID_UNIQUE";
ALTER TABLE ONLY public.shipping_zone_province DROP CONSTRAINT "SHIPPING_ZONE_PROVINCE_PROVINCE_UNIQUE";
ALTER TABLE ONLY public.shipping_method DROP CONSTRAINT "SHIPPING_METHOD_UUID_UNIQUE";
ALTER TABLE ONLY public.shipping_method DROP CONSTRAINT "SHIPPING_METHOD_NAME_UNIQUE";
ALTER TABLE ONLY public.shipment DROP CONSTRAINT "SHIPMENT_UUID_UNIQUE";
ALTER TABLE ONLY public.setting DROP CONSTRAINT "SETTING_UUID_UNIQUE";
ALTER TABLE ONLY public.setting DROP CONSTRAINT "SETTING_NAME_UNIQUE";
ALTER TABLE ONLY public.session DROP CONSTRAINT "SESSION_PKEY";
ALTER TABLE ONLY public.product DROP CONSTRAINT "PRODUCT_UUID_UNIQUE";
ALTER TABLE ONLY public.product_description DROP CONSTRAINT "PRODUCT_URL_KEY_UNIQUE";
ALTER TABLE ONLY public.product DROP CONSTRAINT "PRODUCT_SKU_UNIQUE";
ALTER TABLE ONLY public.product_inventory DROP CONSTRAINT "PRODUCT_INVENTORY_PRODUCT_ID_UNIQUE";
ALTER TABLE ONLY public.product_description DROP CONSTRAINT "PRODUCT_ID_UNIQUE";
ALTER TABLE ONLY public.product_custom_option_value DROP CONSTRAINT "PRODUCT_CUSTOM_OPTION_VALUE_UUID_UNIQUE";
ALTER TABLE ONLY public.product_custom_option DROP CONSTRAINT "PRODUCT_CUSTOM_OPTION_UUID_UNIQUE";
ALTER TABLE ONLY public.product_collection DROP CONSTRAINT "PRODUCT_COLLECTION_UNIQUE";
ALTER TABLE ONLY public.payment_transaction DROP CONSTRAINT "PAYMENT_TRANSACTION_UUID_UNIQUE";
ALTER TABLE ONLY public.cms_page_description DROP CONSTRAINT "PAGE_ID_UNIQUE";
ALTER TABLE ONLY public."order" DROP CONSTRAINT "ORDER_UUID_UNIQUE";
ALTER TABLE ONLY public."order" DROP CONSTRAINT "ORDER_NUMBER_UNIQUE";
ALTER TABLE ONLY public.order_item DROP CONSTRAINT "ORDER_ITEM_UUID_UNIQUE";
ALTER TABLE ONLY public.order_address DROP CONSTRAINT "ORDER_ADDRESS_UUID_UNIQUE";
ALTER TABLE ONLY public.order_activity DROP CONSTRAINT "ORDER_ACTIVITY_UUID_UNIQUE";
ALTER TABLE ONLY public.product_attribute_value_index DROP CONSTRAINT "OPTION_VALUE_UNIQUE";
ALTER TABLE ONLY public.migration DROP CONSTRAINT "MODULE_UNIQUE";
ALTER TABLE ONLY public.shipping_zone_method DROP CONSTRAINT "METHOD_ZONE_UNIQUE";
ALTER TABLE ONLY public.event DROP CONSTRAINT "EVENT_UUID";
ALTER TABLE ONLY public.customer DROP CONSTRAINT "EMAIL_UNIQUE";
ALTER TABLE ONLY public.customer DROP CONSTRAINT "CUSTOMER_UUID_UNIQUE";
ALTER TABLE ONLY public.customer_address DROP CONSTRAINT "CUSTOMER_ADDRESS_UUID_UNIQUE";
ALTER TABLE ONLY public.coupon DROP CONSTRAINT "COUPON_UUID_UNIQUE";
ALTER TABLE ONLY public.coupon DROP CONSTRAINT "COUPON_UNIQUE";
ALTER TABLE ONLY public.collection DROP CONSTRAINT "COLLECTION_UUID_UNIQUE";
ALTER TABLE ONLY public.collection DROP CONSTRAINT "COLLECTION_CODE_UNIQUE";
ALTER TABLE ONLY public.cms_page DROP CONSTRAINT "CMS_PAGE_UUID";
ALTER TABLE ONLY public.category DROP CONSTRAINT "CATEGORY_UUID_UNIQUE";
ALTER TABLE ONLY public.category_description DROP CONSTRAINT "CATEGORY_URL_KEY_UNIQUE";
ALTER TABLE ONLY public.category_description DROP CONSTRAINT "CATEGORY_ID_UNIQUE";
ALTER TABLE ONLY public.cart DROP CONSTRAINT "CART_UUID_UNIQUE";
ALTER TABLE ONLY public.cart_item DROP CONSTRAINT "CART_ITEM_UUID_UNIQUE";
ALTER TABLE ONLY public.cart_address DROP CONSTRAINT "CART_ADDRESS_UUID_UNIQUE";
ALTER TABLE ONLY public.attribute_option DROP CONSTRAINT "ATTRIBUTE_OPTION_UUID_UNIQUE";
ALTER TABLE ONLY public.attribute_group DROP CONSTRAINT "ATTRIBUTE_GROUP_UUID_UNIQUE";
ALTER TABLE ONLY public.attribute_group_link DROP CONSTRAINT "ATTRIBUTE_GROUP_LINK_UNIQUE";
ALTER TABLE ONLY public.attribute DROP CONSTRAINT "ATTRIBUTE_CODE_UUID_UNIQUE";
ALTER TABLE ONLY public.attribute DROP CONSTRAINT "ATTRIBUTE_CODE_UNIQUE";
ALTER TABLE ONLY public.admin_user DROP CONSTRAINT "ADMIN_USER_UUID_UNIQUE";
ALTER TABLE ONLY public.admin_user DROP CONSTRAINT "ADMIN_USER_EMAIL_UNIQUE";
DROP TABLE public.widget;
DROP TABLE public.variant_group;
DROP TABLE public.url_rewrite;
DROP TABLE public.tax_rate;
DROP TABLE public.tax_class;
DROP TABLE public.shipping_zone_province;
DROP TABLE public.shipping_zone_method;
DROP TABLE public.shipping_zone;
DROP TABLE public.shipping_method;
DROP TABLE public.shipment;
DROP TABLE public.setting;
DROP TABLE public.session;
DROP TABLE public.reset_password_token;
DROP TABLE public.product_inventory;
DROP TABLE public.product_image;
DROP TABLE public.product_description;
DROP TABLE public.product_custom_option_value;
DROP TABLE public.product_custom_option;
DROP TABLE public.product_collection;
DROP TABLE public.product_attribute_value_index;
DROP TABLE public.product;
DROP TABLE public.payment_transaction;
DROP TABLE public.order_item;
DROP TABLE public.order_address;
DROP TABLE public.order_activity;
DROP TABLE public."order";
DROP TABLE public.migration;
DROP TABLE public.event;
DROP TABLE public.customer_group;
DROP TABLE public.customer_address;
DROP TABLE public.customer;
DROP TABLE public.coupon;
DROP TABLE public.collection;
DROP TABLE public.cms_page_description;
DROP TABLE public.cms_page;
DROP TABLE public.category_description;
DROP TABLE public.category;
DROP TABLE public.cart_item;
DROP TABLE public.cart_address;
DROP TABLE public.cart;
DROP TABLE public.attribute_option;
DROP TABLE public.attribute_group_link;
DROP TABLE public.attribute_group;
DROP TABLE public.attribute;
DROP TABLE public.admin_user;
DROP FUNCTION public.update_variant_group_visibility();
DROP FUNCTION public.update_product_attribute_option_value_text();
DROP FUNCTION public.update_attribute_index_and_variant_group_visibility();
DROP FUNCTION public.set_default_customer_group();
DROP FUNCTION public.set_coupon_used_time();
DROP FUNCTION public.remove_attribute_from_group();
DROP FUNCTION public.reduce_product_stock_when_order_placed();
DROP FUNCTION public.product_image_insert_trigger();
DROP FUNCTION public.prevent_delete_default_tax_class();
DROP FUNCTION public.prevent_delete_default_customer_group();
DROP FUNCTION public.prevent_delete_default_attribute_group();
DROP FUNCTION public.prevent_change_attribute_group();
DROP FUNCTION public.delete_variant_group_after_attribute_type_changed();
DROP FUNCTION public.delete_sub_categories();
DROP FUNCTION public.delete_product_attribute_value_index();
DROP FUNCTION public.build_url_key();
DROP FUNCTION public.add_product_updated_event();
DROP FUNCTION public.add_product_inventory_updated_event();
DROP FUNCTION public.add_product_deleted_event();
DROP FUNCTION public.add_product_created_event();
DROP FUNCTION public.add_order_created_event();
DROP FUNCTION public.add_customer_updated_event();
DROP FUNCTION public.add_customer_deleted_event();
DROP FUNCTION public.add_customer_created_event();
DROP FUNCTION public.add_category_updated_event();
DROP FUNCTION public.add_category_deleted_event();
DROP FUNCTION public.add_category_created_event();
--
-- TOC entry 317 (class 1255 OID 16921)
-- Name: add_category_created_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_category_created_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('category_created', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 319 (class 1255 OID 16925)
-- Name: add_category_deleted_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_category_deleted_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('category_deleted', row_to_json(OLD));
      RETURN OLD;
    END;
    $$;


--
-- TOC entry 318 (class 1255 OID 16923)
-- Name: add_category_updated_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_category_updated_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('category_updated', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 330 (class 1255 OID 17440)
-- Name: add_customer_created_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_customer_created_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('customer_created', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 332 (class 1255 OID 17444)
-- Name: add_customer_deleted_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_customer_deleted_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('customer_deleted', row_to_json(OLD));
      RETURN OLD;
    END;
    $$;


--
-- TOC entry 331 (class 1255 OID 17442)
-- Name: add_customer_updated_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_customer_updated_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('customer_updated', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 327 (class 1255 OID 17306)
-- Name: add_order_created_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_order_created_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('order_created', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 320 (class 1255 OID 16927)
-- Name: add_product_created_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_product_created_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('product_created', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 322 (class 1255 OID 16931)
-- Name: add_product_deleted_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_product_deleted_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('product_deleted', row_to_json(OLD));
      RETURN OLD;
    END;
    $$;


--
-- TOC entry 324 (class 1255 OID 16956)
-- Name: add_product_inventory_updated_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_product_inventory_updated_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('inventory_updated', json_build_object('old', row_to_json(OLD), 'new', row_to_json(NEW)));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 321 (class 1255 OID 16929)
-- Name: add_product_updated_event(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.add_product_updated_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO event (name, data)
      VALUES ('product_updated', row_to_json(NEW));
      RETURN NEW;
    END;
    $$;


--
-- TOC entry 316 (class 1255 OID 16903)
-- Name: build_url_key(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.build_url_key() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
      url_key TEXT;
    BEGIN
      IF(NEW.url_key IS NULL) THEN
        url_key = regexp_replace(NEW.name, '[^a-zA-Z0-9]+', '-', 'g');
        url_key = regexp_replace(url_key, '^-|-$', '', 'g');
        url_key = lower(url_key);
        url_key = url_key || '-' || (SELECT floor(random() * 1000000)::text);
        NEW.url_key = url_key;
      ELSE
        IF (NEW.url_key ~ '[/\#]') THEN
          RAISE EXCEPTION 'Invalid url_key: %', NEW.url_key;
        END IF;
      END IF;
      RETURN NEW;
    END;
    $_$;


--
-- TOC entry 312 (class 1255 OID 16886)
-- Name: delete_product_attribute_value_index(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_product_attribute_value_index() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        DELETE FROM "product_attribute_value_index" WHERE "product_attribute_value_index".option_id = OLD.attribute_option_id AND "product_attribute_value_index"."attribute_id" = OLD.attribute_id;
        RETURN OLD;
      END;
      $$;


--
-- TOC entry 323 (class 1255 OID 16954)
-- Name: delete_sub_categories(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_sub_categories() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
      sub_categories RECORD;
    BEGIN
      FOR sub_categories IN
        WITH RECURSIVE sub_categories AS (
          SELECT * FROM category WHERE parent_id = OLD.category_id
          UNION
          SELECT c.* FROM category c
          INNER JOIN sub_categories sc ON c.parent_id = sc.category_id
        ) SELECT * FROM sub_categories
      LOOP
        DELETE FROM category WHERE category_id = sub_categories.category_id;
      END LOOP;
      RETURN OLD;
    END;
    $$;


--
-- TOC entry 314 (class 1255 OID 16894)
-- Name: delete_variant_group_after_attribute_type_changed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_variant_group_after_attribute_type_changed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF (OLD.type = 'select' AND NEW.type <> 'select') THEN
          DELETE FROM "variant_group" WHERE ("variant_group".attribute_one = OLD.attribute_id OR "variant_group".attribute_two = OLD.attribute_id OR "variant_group".attribute_three = OLD.attribute_id OR "variant_group".attribute_four = OLD.attribute_id OR "variant_group".attribute_five = OLD.attribute_id);
        END IF;
        RETURN NEW;
      END
      $$;


--
-- TOC entry 309 (class 1255 OID 16880)
-- Name: prevent_change_attribute_group(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.prevent_change_attribute_group() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF OLD.group_id != NEW.group_id AND OLD.variant_group_id IS NOT NULL THEN
          RAISE EXCEPTION 'Cannot change attribute group of product with variants';
        END IF;
        RETURN NEW;
      END;
      $$;


--
-- TOC entry 308 (class 1255 OID 16878)
-- Name: prevent_delete_default_attribute_group(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.prevent_delete_default_attribute_group() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF OLD.attribute_group_id = 1 THEN
          RAISE EXCEPTION 'Cannot delete default attribute group';
        END IF;
        RETURN OLD;
      END;
      $$;


--
-- TOC entry 328 (class 1255 OID 17436)
-- Name: prevent_delete_default_customer_group(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.prevent_delete_default_customer_group() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF OLD.customer_group_id = 1 THEN
          RAISE EXCEPTION 'Cannot delete default customer group';
        END IF;
        RETURN OLD;
      END;
      $$;


--
-- TOC entry 334 (class 1255 OID 17573)
-- Name: prevent_delete_default_tax_class(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.prevent_delete_default_tax_class() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF OLD.tax_class_id = 1 THEN
          RAISE EXCEPTION 'Cannot delete default tax class';
        END IF;
        RETURN OLD;
      END;
      $$;


--
-- TOC entry 325 (class 1255 OID 16960)
-- Name: product_image_insert_trigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.product_image_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        INSERT INTO event (name, data)
        VALUES ('product_image_added', row_to_json(NEW));
        RETURN NEW;
      END;
      $$;


--
-- TOC entry 326 (class 1255 OID 17211)
-- Name: reduce_product_stock_when_order_placed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reduce_product_stock_when_order_placed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        UPDATE product_inventory SET qty = qty - NEW.qty WHERE product_inventory_product_id = NEW.product_id AND manage_stock = TRUE;
        RETURN NEW;
      END
      $$;


--
-- TOC entry 310 (class 1255 OID 16882)
-- Name: remove_attribute_from_group(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.remove_attribute_from_group() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        DELETE FROM product_attribute_value_index WHERE product_attribute_value_index.attribute_id = OLD.attribute_id AND product_attribute_value_index.product_id IN (SELECT product.product_id FROM product WHERE product.group_id = OLD.group_id);
        DELETE FROM variant_group WHERE variant_group.attribute_group_id = OLD.group_id AND (variant_group.attribute_one = OLD.attribute_id OR variant_group.attribute_two = OLD.attribute_id OR variant_group.attribute_three = OLD.attribute_id OR variant_group.attribute_four = OLD.attribute_id OR variant_group.attribute_five = OLD.attribute_id);
        RETURN OLD;
      END;
      $$;


--
-- TOC entry 333 (class 1255 OID 17502)
-- Name: set_coupon_used_time(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_coupon_used_time() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        UPDATE "coupon" SET used_time = used_time + 1 WHERE coupon = NEW.coupon;
        RETURN NEW;
      END;
      $$;


--
-- TOC entry 329 (class 1255 OID 17438)
-- Name: set_default_customer_group(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_default_customer_group() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF NEW.group_id IS NULL THEN
          NEW.group_id = 1;
        END IF;
        RETURN NEW;
      END;
      $$;


--
-- TOC entry 315 (class 1255 OID 16891)
-- Name: update_attribute_index_and_variant_group_visibility(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_attribute_index_and_variant_group_visibility() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        DELETE FROM "product_attribute_value_index"
        WHERE "product_attribute_value_index"."product_id" = NEW.product_id 
        AND "product_attribute_value_index"."attribute_id" NOT IN (SELECT "attribute_group_link"."attribute_id" FROM "attribute_group_link" WHERE "attribute_group_link"."group_id" = NEW.group_id);
        UPDATE "variant_group" SET visibility = COALESCE((SELECT bool_or(visibility) FROM "product" WHERE "product"."variant_group_id" = NEW.variant_group_id AND "product"."status" = TRUE GROUP BY "product"."variant_group_id"), FALSE) WHERE "variant_group"."variant_group_id" = NEW.variant_group_id;
        RETURN NEW;
      END;
      $$;


--
-- TOC entry 311 (class 1255 OID 16884)
-- Name: update_product_attribute_option_value_text(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_product_attribute_option_value_text() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        UPDATE "product_attribute_value_index" SET "option_text" = NEW.option_text
        WHERE "product_attribute_value_index".option_id = NEW.attribute_option_id AND "product_attribute_value_index".attribute_id = NEW.attribute_id;
        RETURN NEW;
      END;
      $$;


--
-- TOC entry 313 (class 1255 OID 16888)
-- Name: update_variant_group_visibility(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_variant_group_visibility() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        UPDATE "variant_group" SET visibility = (SELECT bool_or(visibility) FROM "product" WHERE "product"."variant_group_id" = NEW.variant_group_id AND "product"."status" = TRUE) WHERE "variant_group"."variant_group_id" = NEW.variant_group_id;
        RETURN NEW;
      END;
      $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: admin_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_user (
    admin_user_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    status boolean DEFAULT true NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    full_name character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: admin_user_admin_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.admin_user ALTER COLUMN admin_user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.admin_user_admin_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16471)
-- Name: attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribute (
    attribute_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    attribute_code character varying NOT NULL,
    attribute_name character varying NOT NULL,
    type character varying NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    display_on_frontend boolean DEFAULT false NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    is_filterable boolean DEFAULT false NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16470)
-- Name: attribute_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.attribute ALTER COLUMN attribute_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attribute_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16519)
-- Name: attribute_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribute_group (
    attribute_group_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    group_name text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 230 (class 1259 OID 16518)
-- Name: attribute_group_attribute_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.attribute_group ALTER COLUMN attribute_group_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attribute_group_attribute_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 16535)
-- Name: attribute_group_link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribute_group_link (
    attribute_group_link_id integer NOT NULL,
    attribute_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 16534)
-- Name: attribute_group_link_attribute_group_link_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.attribute_group_link ALTER COLUMN attribute_group_link_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attribute_group_link_attribute_group_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16497)
-- Name: attribute_option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribute_option (
    attribute_option_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    attribute_id integer NOT NULL,
    attribute_code character varying NOT NULL,
    option_text character varying NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 16496)
-- Name: attribute_option_attribute_option_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.attribute_option ALTER COLUMN attribute_option_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attribute_option_attribute_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 16963)
-- Name: cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    sid character varying,
    currency character varying NOT NULL,
    customer_id integer,
    customer_group_id smallint,
    customer_email character varying,
    customer_full_name character varying,
    user_ip character varying,
    status boolean DEFAULT false NOT NULL,
    coupon character varying,
    shipping_fee_excl_tax numeric(12,4) DEFAULT NULL::numeric,
    shipping_fee_incl_tax numeric(12,4) DEFAULT NULL::numeric,
    discount_amount numeric(12,4) DEFAULT NULL::numeric,
    sub_total numeric(12,4) NOT NULL,
    sub_total_incl_tax numeric(12,4) NOT NULL,
    sub_total_with_discount numeric(12,4) NOT NULL,
    sub_total_with_discount_incl_tax numeric(12,4) NOT NULL,
    total_qty integer NOT NULL,
    total_weight numeric(12,4) DEFAULT NULL::numeric,
    tax_amount numeric(12,4) NOT NULL,
    tax_amount_before_discount numeric(12,4) NOT NULL,
    shipping_tax_amount numeric(12,4) NOT NULL,
    grand_total numeric(12,4) NOT NULL,
    shipping_method character varying,
    shipping_method_name character varying,
    shipping_zone_id integer,
    shipping_address_id integer,
    payment_method character varying,
    payment_method_name character varying,
    billing_address_id integer,
    shipping_note text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    total_tax_amount numeric(12,4)
);


--
-- TOC entry 263 (class 1259 OID 16994)
-- Name: cart_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_address (
    cart_address_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    full_name character varying,
    postcode character varying,
    telephone character varying,
    country character varying,
    province character varying,
    city character varying,
    address_1 character varying,
    address_2 character varying
);


--
-- TOC entry 262 (class 1259 OID 16993)
-- Name: cart_address_cart_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cart_address ALTER COLUMN cart_address_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cart_address_cart_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 16962)
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cart ALTER COLUMN cart_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cart_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 265 (class 1259 OID 17007)
-- Name: cart_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_item (
    cart_item_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    product_sku character varying NOT NULL,
    product_name text NOT NULL,
    thumbnail character varying,
    product_weight numeric(12,4) DEFAULT NULL::numeric,
    product_price numeric(12,4) NOT NULL,
    product_price_incl_tax numeric(12,4) NOT NULL,
    qty integer NOT NULL,
    final_price numeric(12,4) NOT NULL,
    final_price_incl_tax numeric(12,4) NOT NULL,
    tax_percent numeric(12,4) NOT NULL,
    tax_amount numeric(12,4) NOT NULL,
    tax_amount_before_discount numeric(12,4) NOT NULL,
    discount_amount numeric(12,4) NOT NULL,
    line_total numeric(12,4) CONSTRAINT cart_item_sub_total_not_null NOT NULL,
    line_total_with_discount numeric(12,4) NOT NULL,
    line_total_incl_tax numeric(12,4) CONSTRAINT cart_item_total_not_null NOT NULL,
    line_total_with_discount_incl_tax numeric(12,4) NOT NULL,
    variant_group_id integer,
    variant_options text,
    product_custom_options text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 264 (class 1259 OID 17006)
-- Name: cart_item_cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cart_item ALTER COLUMN cart_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cart_item_cart_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 16776)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    status boolean NOT NULL,
    parent_id integer,
    include_in_nav boolean NOT NULL,
    "position" smallint,
    show_products boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 248 (class 1259 OID 16775)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.category ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 16815)
-- Name: category_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category_description (
    category_description_id integer NOT NULL,
    category_description_category_id integer NOT NULL,
    name character varying NOT NULL,
    short_description text,
    description text,
    image character varying,
    meta_title text,
    meta_keywords text,
    meta_description text,
    url_key character varying NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 16814)
-- Name: category_description_category_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.category_description ALTER COLUMN category_description_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_description_category_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 287 (class 1259 OID 17309)
-- Name: cms_page; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cms_page (
    cms_page_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    status boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 286 (class 1259 OID 17308)
-- Name: cms_page_cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cms_page ALTER COLUMN cms_page_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cms_page_cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 289 (class 1259 OID 17325)
-- Name: cms_page_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cms_page_description (
    cms_page_description_id integer NOT NULL,
    cms_page_description_cms_page_id integer,
    url_key character varying NOT NULL,
    name character varying NOT NULL,
    content text,
    meta_title character varying,
    meta_keywords character varying,
    meta_description text
);


--
-- TOC entry 288 (class 1259 OID 17324)
-- Name: cms_page_description_cms_page_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cms_page_description ALTER COLUMN cms_page_description_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cms_page_description_cms_page_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 16837)
-- Name: collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection (
    collection_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    description text,
    code character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 252 (class 1259 OID 16836)
-- Name: collection_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.collection ALTER COLUMN collection_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.collection_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 301 (class 1259 OID 17473)
-- Name: coupon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupon (
    coupon_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    status boolean DEFAULT true NOT NULL,
    description character varying NOT NULL,
    discount_amount numeric(12,4) NOT NULL,
    free_shipping boolean DEFAULT false NOT NULL,
    discount_type character varying DEFAULT '1'::character varying NOT NULL,
    coupon character varying NOT NULL,
    used_time integer DEFAULT 0 NOT NULL,
    target_products jsonb,
    condition jsonb,
    user_condition jsonb,
    buyx_gety jsonb,
    max_uses_time_per_coupon integer,
    max_uses_time_per_customer integer,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "POSITIVE_DISCOUNT_AMOUNT" CHECK ((discount_amount >= (0)::numeric)),
    CONSTRAINT "VALID_PERCENTAGE_DISCOUNT" CHECK (((discount_amount <= (100)::numeric) OR ((discount_type)::text <> 'percentage'::text)))
);


--
-- TOC entry 300 (class 1259 OID 17472)
-- Name: coupon_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.coupon ALTER COLUMN coupon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coupon_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 295 (class 1259 OID 17386)
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    group_id integer DEFAULT 1,
    email character varying NOT NULL,
    password character varying NOT NULL,
    full_name character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 297 (class 1259 OID 17414)
-- Name: customer_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_address (
    customer_address_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id integer NOT NULL,
    full_name character varying,
    telephone character varying,
    address_1 character varying,
    address_2 character varying,
    postcode character varying,
    city character varying,
    province character varying,
    country character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    is_default boolean
);


--
-- TOC entry 296 (class 1259 OID 17413)
-- Name: customer_address_customer_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer_address ALTER COLUMN customer_address_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_address_customer_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 294 (class 1259 OID 17385)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 293 (class 1259 OID 17372)
-- Name: customer_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_group (
    customer_group_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    group_name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 292 (class 1259 OID 17371)
-- Name: customer_group_customer_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer_group ALTER COLUMN customer_group_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_group_customer_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16456)
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    data json,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 224 (class 1259 OID 16455)
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.event ALTER COLUMN event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16411)
-- Name: migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migration (
    migration_id integer NOT NULL,
    module character varying NOT NULL,
    version character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 221 (class 1259 OID 16410)
-- Name: migration_migration_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.migration ALTER COLUMN migration_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.migration_migration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 17052)
-- Name: order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."order" (
    order_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    integration_order_id character varying,
    sid character varying,
    order_number character varying NOT NULL,
    status character varying NOT NULL,
    cart_id integer NOT NULL,
    currency character varying NOT NULL,
    customer_id integer,
    customer_email character varying,
    customer_full_name character varying,
    user_ip character varying,
    user_agent character varying,
    coupon character varying,
    shipping_fee_excl_tax numeric(12,4) DEFAULT NULL::numeric,
    shipping_fee_incl_tax numeric(12,4) DEFAULT NULL::numeric,
    discount_amount numeric(12,4) DEFAULT NULL::numeric,
    sub_total numeric(12,4) NOT NULL,
    sub_total_incl_tax numeric(12,4) NOT NULL,
    sub_total_with_discount numeric(12,4) NOT NULL,
    sub_total_with_discount_incl_tax numeric(12,4) NOT NULL,
    total_qty integer NOT NULL,
    total_weight numeric(12,4) DEFAULT NULL::numeric,
    tax_amount numeric(12,4) NOT NULL,
    tax_amount_before_discount numeric(12,4) NOT NULL,
    shipping_tax_amount numeric(12,4) NOT NULL,
    shipping_note text,
    grand_total numeric(12,4) NOT NULL,
    shipping_method character varying,
    shipping_method_name character varying,
    shipping_address_id integer,
    payment_method character varying,
    payment_method_name character varying,
    billing_address_id integer,
    shipment_status character varying,
    payment_status character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    total_tax_amount numeric(12,4)
);


--
-- TOC entry 269 (class 1259 OID 17090)
-- Name: order_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_activity (
    order_activity_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    order_activity_order_id integer NOT NULL,
    comment text NOT NULL,
    customer_notified boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 268 (class 1259 OID 17089)
-- Name: order_activity_order_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.order_activity ALTER COLUMN order_activity_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_activity_order_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 271 (class 1259 OID 17115)
-- Name: order_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_address (
    order_address_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    full_name character varying,
    postcode character varying,
    telephone character varying,
    country character varying,
    province character varying,
    city character varying,
    address_1 character varying,
    address_2 character varying
);


--
-- TOC entry 270 (class 1259 OID 17114)
-- Name: order_address_order_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.order_address ALTER COLUMN order_address_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_address_order_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 17128)
-- Name: order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_item (
    order_item_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    order_item_order_id integer NOT NULL,
    product_id integer NOT NULL,
    referer integer,
    product_sku character varying NOT NULL,
    product_name text NOT NULL,
    thumbnail character varying,
    product_weight numeric(12,4) DEFAULT NULL::numeric,
    product_price numeric(12,4) NOT NULL,
    product_price_incl_tax numeric(12,4) NOT NULL,
    qty integer NOT NULL,
    final_price numeric(12,4) NOT NULL,
    final_price_incl_tax numeric(12,4) NOT NULL,
    tax_percent numeric(12,4) NOT NULL,
    tax_amount numeric(12,4) NOT NULL,
    tax_amount_before_discount numeric(12,4) NOT NULL,
    discount_amount numeric(12,4) NOT NULL,
    line_total numeric(12,4) CONSTRAINT order_item_sub_total_not_null NOT NULL,
    line_total_with_discount numeric(12,4) NOT NULL,
    line_total_incl_tax numeric(12,4) CONSTRAINT order_item_total_not_null NOT NULL,
    line_total_with_discount_incl_tax numeric(12,4) NOT NULL,
    variant_group_id integer,
    variant_options text,
    product_custom_options text,
    requested_data text
);


--
-- TOC entry 272 (class 1259 OID 17127)
-- Name: order_item_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.order_item ALTER COLUMN order_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_item_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 266 (class 1259 OID 17051)
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."order" ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 275 (class 1259 OID 17165)
-- Name: payment_transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_transaction (
    payment_transaction_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    payment_transaction_order_id integer NOT NULL,
    transaction_id character varying,
    transaction_type character varying NOT NULL,
    amount numeric(12,4) NOT NULL,
    parent_transaction_id character varying,
    payment_action character varying,
    additional_information text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 274 (class 1259 OID 17164)
-- Name: payment_transaction_payment_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.payment_transaction ALTER COLUMN payment_transaction_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_transaction_payment_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 16608)
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    type character varying DEFAULT 'simple'::character varying NOT NULL,
    variant_group_id integer,
    visibility boolean DEFAULT true NOT NULL,
    group_id integer DEFAULT 1,
    sku character varying NOT NULL,
    price numeric(12,4) NOT NULL,
    weight numeric(12,4) DEFAULT NULL::numeric,
    tax_class smallint,
    status boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    category_id integer,
    CONSTRAINT "UNSIGNED_PRICE" CHECK ((price >= (0)::numeric)),
    CONSTRAINT "UNSIGNED_WEIGHT" CHECK ((weight >= (0)::numeric))
);


--
-- TOC entry 239 (class 1259 OID 16652)
-- Name: product_attribute_value_index; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_attribute_value_index (
    product_attribute_value_index_id integer CONSTRAINT product_attribute_value_ind_product_attribute_value_in_not_null NOT NULL,
    product_id integer NOT NULL,
    attribute_id integer NOT NULL,
    option_id integer,
    option_text text
);


--
-- TOC entry 238 (class 1259 OID 16651)
-- Name: product_attribute_value_index_product_attribute_value_index_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_attribute_value_index ALTER COLUMN product_attribute_value_index_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_attribute_value_index_product_attribute_value_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 16856)
-- Name: product_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_collection (
    product_collection_id integer NOT NULL,
    collection_id integer NOT NULL,
    product_id integer NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 16855)
-- Name: product_collection_product_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_collection ALTER COLUMN product_collection_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_collection_product_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 16687)
-- Name: product_custom_option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_custom_option (
    product_custom_option_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    product_custom_option_product_id integer NOT NULL,
    option_name character varying NOT NULL,
    option_type character varying NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    sort_order integer
);


--
-- TOC entry 240 (class 1259 OID 16686)
-- Name: product_custom_option_product_custom_option_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_custom_option ALTER COLUMN product_custom_option_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_custom_option_product_custom_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 243 (class 1259 OID 16711)
-- Name: product_custom_option_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_custom_option_value (
    product_custom_option_value_id integer CONSTRAINT product_custom_option_value_product_custom_option_valu_not_null NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    option_id integer NOT NULL,
    extra_price numeric(12,4) DEFAULT NULL::numeric,
    sort_order integer,
    value character varying NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 16710)
-- Name: product_custom_option_value_product_custom_option_value_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_custom_option_value ALTER COLUMN product_custom_option_value_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_custom_option_value_product_custom_option_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 16733)
-- Name: product_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_description (
    product_description_id integer NOT NULL,
    product_description_product_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    short_description text,
    url_key character varying NOT NULL,
    meta_title text,
    meta_description text,
    meta_keywords text
);


--
-- TOC entry 244 (class 1259 OID 16732)
-- Name: product_description_product_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_description ALTER COLUMN product_description_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_description_product_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 16755)
-- Name: product_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_image (
    product_image_id integer NOT NULL,
    product_image_product_id integer NOT NULL,
    origin_image character varying CONSTRAINT product_image_image_not_null NOT NULL,
    thumb_image text,
    listing_image text,
    single_image text,
    is_main boolean DEFAULT false
);


--
-- TOC entry 246 (class 1259 OID 16754)
-- Name: product_image_product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_image ALTER COLUMN product_image_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_image_product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 16934)
-- Name: product_inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_inventory (
    product_inventory_id integer NOT NULL,
    product_inventory_product_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    manage_stock boolean DEFAULT false NOT NULL,
    stock_availability boolean DEFAULT false NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 16933)
-- Name: product_inventory_product_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_inventory ALTER COLUMN product_inventory_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_inventory_product_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16607)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 299 (class 1259 OID 17447)
-- Name: reset_password_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reset_password_token (
    reset_password_token_id integer NOT NULL,
    customer_id integer NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 298 (class 1259 OID 17446)
-- Name: reset_password_token_reset_password_token_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reset_password_token ALTER COLUMN reset_password_token_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reset_password_token_reset_password_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16444)
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 303 (class 1259 OID 17537)
-- Name: setting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.setting (
    setting_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    value text,
    is_json boolean DEFAULT false NOT NULL
);


--
-- TOC entry 302 (class 1259 OID 17536)
-- Name: setting_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.setting ALTER COLUMN setting_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.setting_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 277 (class 1259 OID 17190)
-- Name: shipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipment (
    shipment_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    shipment_order_id integer NOT NULL,
    carrier character varying,
    tracking_number character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 276 (class 1259 OID 17189)
-- Name: shipment_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.shipment ALTER COLUMN shipment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipment_shipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 17258)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_method (
    shipping_method_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 17257)
-- Name: shipping_method_shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.shipping_method ALTER COLUMN shipping_method_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipping_method_shipping_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 17214)
-- Name: shipping_zone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_zone (
    shipping_zone_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    country character varying NOT NULL
);


--
-- TOC entry 285 (class 1259 OID 17274)
-- Name: shipping_zone_method; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_zone_method (
    shipping_zone_method_id integer NOT NULL,
    method_id integer NOT NULL,
    zone_id integer NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    cost numeric(12,4) DEFAULT NULL::numeric,
    calculate_api character varying,
    condition_type character varying,
    max numeric(12,4) DEFAULT NULL::numeric,
    min numeric(12,4) DEFAULT NULL::numeric,
    price_based_cost jsonb,
    weight_based_cost jsonb
);


--
-- TOC entry 284 (class 1259 OID 17273)
-- Name: shipping_zone_method_shipping_zone_method_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.shipping_zone_method ALTER COLUMN shipping_zone_method_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipping_zone_method_shipping_zone_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 17235)
-- Name: shipping_zone_province; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_zone_province (
    shipping_zone_province_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    zone_id integer NOT NULL,
    province character varying NOT NULL
);


--
-- TOC entry 280 (class 1259 OID 17234)
-- Name: shipping_zone_province_shipping_zone_province_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.shipping_zone_province ALTER COLUMN shipping_zone_province_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipping_zone_province_shipping_zone_province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 278 (class 1259 OID 17213)
-- Name: shipping_zone_shipping_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.shipping_zone ALTER COLUMN shipping_zone_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipping_zone_shipping_zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 305 (class 1259 OID 17555)
-- Name: tax_class; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_class (
    tax_class_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 304 (class 1259 OID 17554)
-- Name: tax_class_tax_class_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tax_class ALTER COLUMN tax_class_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tax_class_tax_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 307 (class 1259 OID 17576)
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_rate (
    tax_rate_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    tax_class_id integer,
    country character varying DEFAULT '*'::character varying NOT NULL,
    province character varying DEFAULT '*'::character varying NOT NULL,
    postcode character varying DEFAULT '*'::character varying NOT NULL,
    rate numeric(12,4) NOT NULL,
    is_compound boolean DEFAULT false NOT NULL,
    priority integer NOT NULL,
    CONSTRAINT "UNSIGNED_PRIORITY" CHECK ((priority >= 0)),
    CONSTRAINT "UNSIGNED_RATE" CHECK ((rate >= (0)::numeric))
);


--
-- TOC entry 306 (class 1259 OID 17575)
-- Name: tax_rate_tax_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tax_rate ALTER COLUMN tax_rate_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tax_rate_tax_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 16907)
-- Name: url_rewrite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url_rewrite (
    url_rewrite_id integer NOT NULL,
    language character varying DEFAULT 'en'::character varying NOT NULL,
    request_path character varying NOT NULL,
    target_path character varying NOT NULL,
    entity_uuid uuid,
    entity_type character varying
);


--
-- TOC entry 256 (class 1259 OID 16906)
-- Name: url_rewrite_url_rewrite_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.url_rewrite ALTER COLUMN url_rewrite_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.url_rewrite_url_rewrite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16558)
-- Name: variant_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.variant_group (
    variant_group_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    attribute_group_id integer NOT NULL,
    attribute_one integer,
    attribute_two integer,
    attribute_three integer,
    attribute_four integer,
    attribute_five integer,
    visibility boolean DEFAULT false NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 16557)
-- Name: variant_group_variant_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.variant_group ALTER COLUMN variant_group_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.variant_group_variant_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 291 (class 1259 OID 17346)
-- Name: widget; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.widget (
    widget_id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    route jsonb DEFAULT '[]'::jsonb NOT NULL,
    area jsonb DEFAULT '[]'::jsonb NOT NULL,
    sort_order integer DEFAULT 1 NOT NULL,
    settings jsonb DEFAULT '{}'::jsonb NOT NULL,
    status boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 290 (class 1259 OID 17345)
-- Name: widget_widget_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.widget ALTER COLUMN widget_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.widget_widget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5680 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: admin_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_user (admin_user_id, uuid, status, email, password, full_name, created_at, updated_at) FROM stdin;
1	3dfceebe-9de1-4fc4-9003-8fc796e76cff	t	admin@dev.com	$2a$10$/uX9x.0pyNug/ZrswpqX3eeqdtZY2Dur6WrkSWLUm9St1J7ZwRIau	minh	2025-10-02 02:52:10.707072+07	2025-10-02 02:52:10.707072+07
2	d086e4ce-e0fc-4cb2-8911-ac8c4649952d	t	admin@admin.com	$2a$10$BLNpdcLqPMUi7DmIxpPwReE0mcUkBVx1sncx3S9XyBvtxKnJpcCQC	Lê Quang Minh	2025-10-02 15:49:12.672425+07	2025-10-02 15:49:12.672425+07
\.


--
-- TOC entry 5687 (class 0 OID 16471)
-- Dependencies: 227
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attribute (attribute_id, uuid, attribute_code, attribute_name, type, is_required, display_on_frontend, sort_order, is_filterable) FROM stdin;
1	39cb13d6-a81d-40e6-acee-887164e2d0b5	color	Color	select	f	t	0	t
2	8bbd54ca-16a6-473b-86b9-f84f7457a6ff	size	Size	select	f	t	0	t
\.


--
-- TOC entry 5691 (class 0 OID 16519)
-- Dependencies: 231
-- Data for Name: attribute_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attribute_group (attribute_group_id, uuid, group_name, created_at, updated_at) FROM stdin;
1	f48d6540-b230-4b52-8ebe-5ce55eabe5db	Default	2025-10-02 02:52:28.848317+07	2025-10-02 02:52:28.848317+07
\.


--
-- TOC entry 5693 (class 0 OID 16535)
-- Dependencies: 233
-- Data for Name: attribute_group_link; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attribute_group_link (attribute_group_link_id, attribute_id, group_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- TOC entry 5689 (class 0 OID 16497)
-- Dependencies: 229
-- Data for Name: attribute_option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attribute_option (attribute_option_id, uuid, attribute_id, attribute_code, option_text) FROM stdin;
1	2fa01c70-ec40-4263-9df0-b1c0ccd5ccd9	1	color	White
2	4e04490e-6d01-4157-ac89-3b9c62c7f10c	1	color	Black
3	ab746901-164b-4436-81cf-1828518fa0ec	1	color	Yellow
4	17220a68-c287-4e3c-82cb-2adc5a35a401	2	size	XXL
5	0572b62a-29c7-45d9-b551-4b69140411c6	2	size	XL
6	37490b8c-2508-4375-b678-e9b874582317	2	size	SM
\.


--
-- TOC entry 5721 (class 0 OID 16963)
-- Dependencies: 261
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cart (cart_id, uuid, sid, currency, customer_id, customer_group_id, customer_email, customer_full_name, user_ip, status, coupon, shipping_fee_excl_tax, shipping_fee_incl_tax, discount_amount, sub_total, sub_total_incl_tax, sub_total_with_discount, sub_total_with_discount_incl_tax, total_qty, total_weight, tax_amount, tax_amount_before_discount, shipping_tax_amount, grand_total, shipping_method, shipping_method_name, shipping_zone_id, shipping_address_id, payment_method, payment_method_name, billing_address_id, shipping_note, created_at, updated_at, total_tax_amount) FROM stdin;
\.


--
-- TOC entry 5723 (class 0 OID 16994)
-- Dependencies: 263
-- Data for Name: cart_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cart_address (cart_address_id, uuid, full_name, postcode, telephone, country, province, city, address_1, address_2) FROM stdin;
\.


--
-- TOC entry 5725 (class 0 OID 17007)
-- Dependencies: 265
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cart_item (cart_item_id, uuid, cart_id, product_id, product_sku, product_name, thumbnail, product_weight, product_price, product_price_incl_tax, qty, final_price, final_price_incl_tax, tax_percent, tax_amount, tax_amount_before_discount, discount_amount, line_total, line_total_with_discount, line_total_incl_tax, line_total_with_discount_incl_tax, variant_group_id, variant_options, product_custom_options, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5709 (class 0 OID 16776)
-- Dependencies: 249
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category (category_id, uuid, status, parent_id, include_in_nav, "position", show_products, created_at, updated_at) FROM stdin;
1	f5934549-dc32-496b-b11d-5f321926d896	t	\N	t	\N	t	2025-10-02 02:52:28.848317+07	2025-10-02 02:52:28.848317+07
2	7797ce90-661f-44a9-97eb-069cd5cb1e4d	t	\N	t	\N	t	2025-10-02 02:52:28.848317+07	2025-10-02 02:52:28.848317+07
3	aad2fdf4-5a90-4113-b498-337ecc61be57	t	\N	t	\N	t	2025-10-02 02:52:28.848317+07	2025-10-02 02:52:28.848317+07
4	b52d2f3d-04ef-4ee6-b4c5-9b02ea11414d	t	\N	t	1	t	2025-10-04 15:23:56.573458+07	2025-10-04 15:23:56.573458+07
5	15215354-b8ea-4f21-826d-2d8c358bef1c	t	\N	t	1	t	2025-10-04 15:23:56.594319+07	2025-10-04 15:23:56.594319+07
6	ca9b7e08-b492-4acb-853f-481fa1de901c	t	\N	t	1	t	2025-10-04 15:23:56.596847+07	2025-10-04 15:23:56.596847+07
7	225e8df5-2d57-47f8-a035-028b4614fbc2	t	\N	t	1	t	2025-10-04 15:23:56.600477+07	2025-10-04 15:23:56.600477+07
\.


--
-- TOC entry 5711 (class 0 OID 16815)
-- Dependencies: 251
-- Data for Name: category_description; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category_description (category_description_id, category_description_category_id, name, short_description, description, image, meta_title, meta_keywords, meta_description, url_key) FROM stdin;
1	1	Kids	\N	Kids	\N	Kids	Kids	Kids	kids
2	2	Women	\N	Women	\N	Women	Women	Women	women
3	3	Men	\N	Men	\N	Men	Men	Men	men
4	4	Điện thoại	\N	Điện thoại thông minh cao cấp	\N	Điện thoại	\N	Điện thoại thông minh cao cấp	dien-thoai
5	5	Laptop	\N	Máy tính xách tay cho mọi nhu cầu	\N	Laptop	\N	Máy tính xách tay cho mọi nhu cầu	laptop
6	6	Tablet	\N	Máy tính bảng di động	\N	Tablet	\N	Máy tính bảng di động	tablet
7	7	Phụ kiện	\N	Phụ kiện công nghệ	\N	Phụ kiện	\N	Phụ kiện công nghệ	phu-kien
\.


--
-- TOC entry 5747 (class 0 OID 17309)
-- Dependencies: 287
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cms_page (cms_page_id, uuid, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5749 (class 0 OID 17325)
-- Dependencies: 289
-- Data for Name: cms_page_description; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cms_page_description (cms_page_description_id, cms_page_description_cms_page_id, url_key, name, content, meta_title, meta_keywords, meta_description) FROM stdin;
\.


--
-- TOC entry 5713 (class 0 OID 16837)
-- Dependencies: 253
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collection (collection_id, uuid, name, description, code, created_at, updated_at) FROM stdin;
1	c630b30a-a9cf-499a-9628-a346985d5693	Featured Products	\N	homepage	2025-10-02 02:52:29.219216+07	2025-10-02 02:52:29.219216+07
\.


--
-- TOC entry 5761 (class 0 OID 17473)
-- Dependencies: 301
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coupon (coupon_id, uuid, status, description, discount_amount, free_shipping, discount_type, coupon, used_time, target_products, condition, user_condition, buyx_gety, max_uses_time_per_coupon, max_uses_time_per_customer, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5755 (class 0 OID 17386)
-- Dependencies: 295
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer (customer_id, uuid, status, group_id, email, password, full_name, created_at, updated_at) FROM stdin;
1	4fe7daca-7f13-4169-97f2-2eef1d2bb6cb	1	1	minh00plus@gmail.com	$2a$10$1Zx8Vv/xBkisac2ArOLSkugb1jIxWKramc6pzrclhu855I1ZJAMp6	minh lê	2025-10-08 19:21:34.661646+07	2025-10-08 19:21:34.661646+07
\.


--
-- TOC entry 5757 (class 0 OID 17414)
-- Dependencies: 297
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_address (customer_address_id, uuid, customer_id, full_name, telephone, address_1, address_2, postcode, city, province, country, created_at, updated_at, is_default) FROM stdin;
\.


--
-- TOC entry 5753 (class 0 OID 17372)
-- Dependencies: 293
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_group (customer_group_id, uuid, group_name, created_at, updated_at) FROM stdin;
1	a16d8939-0ea8-4ba4-b056-ef9181992e25	Default	2025-10-02 02:52:29.732441+07	2025-10-02 02:52:29.732441+07
\.


--
-- TOC entry 5685 (class 0 OID 16456)
-- Dependencies: 225
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event (event_id, uuid, name, data, created_at) FROM stdin;
28	8689e2d4-8d61-48ad-9a86-7f6f0fc35b5d	customer_created	{"customer_id":1,"uuid":"4fe7daca-7f13-4169-97f2-2eef1d2bb6cb","status":1,"group_id":1,"email":"minh00plus@gmail.com","password":"$2a$10$1Zx8Vv/xBkisac2ArOLSkugb1jIxWKramc6pzrclhu855I1ZJAMp6","full_name":"minh lê","created_at":"2025-10-08T12:21:34.661646+00:00","updated_at":"2025-10-08T12:21:34.661646+00:00"}	2025-10-08 19:21:34.661646+07
29	4dccc3b6-c397-4246-a66b-32707d3168bc	customer_registered	{"customer_id":1,"uuid":"4fe7daca-7f13-4169-97f2-2eef1d2bb6cb","status":1,"group_id":1,"email":"minh00plus@gmail.com","full_name":"minh lê","created_at":"2025-10-08T12:21:34.661Z","updated_at":"2025-10-08T12:21:34.661Z","insertId":1}	2025-10-08 19:21:35.042729+07
\.


--
-- TOC entry 5682 (class 0 OID 16411)
-- Dependencies: 222
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migration (migration_id, module, version, created_at, updated_at) FROM stdin;
1	auth	1.0.1	2025-10-02 02:52:28.758737+07	2025-10-02 02:52:28.758737+07
3	base	1.0.1	2025-10-02 02:52:28.827658+07	2025-10-02 02:52:28.827658+07
4	catalog	1.0.7	2025-10-02 02:52:28.848317+07	2025-10-02 02:52:28.848317+07
12	checkout	1.0.6	2025-10-02 02:52:29.429989+07	2025-10-02 02:52:29.429989+07
19	cms	1.1.1	2025-10-02 02:52:29.654796+07	2025-10-02 02:52:29.654796+07
22	customer	1.0.3	2025-10-02 02:52:29.732441+07	2025-10-02 02:52:29.732441+07
26	oms	1.0.1	2025-10-02 02:52:29.829621+07	2025-10-02 02:52:29.829621+07
28	promotion	1.0.1	2025-10-02 02:52:29.863474+07	2025-10-02 02:52:29.863474+07
30	setting	1.0.0	2025-10-02 02:52:29.940757+07	2025-10-02 02:52:29.940757+07
31	tax	1.0.0	2025-10-02 02:52:29.962628+07	2025-10-02 02:52:29.962628+07
\.


--
-- TOC entry 5727 (class 0 OID 17052)
-- Dependencies: 267
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."order" (order_id, uuid, integration_order_id, sid, order_number, status, cart_id, currency, customer_id, customer_email, customer_full_name, user_ip, user_agent, coupon, shipping_fee_excl_tax, shipping_fee_incl_tax, discount_amount, sub_total, sub_total_incl_tax, sub_total_with_discount, sub_total_with_discount_incl_tax, total_qty, total_weight, tax_amount, tax_amount_before_discount, shipping_tax_amount, shipping_note, grand_total, shipping_method, shipping_method_name, shipping_address_id, payment_method, payment_method_name, billing_address_id, shipment_status, payment_status, created_at, updated_at, total_tax_amount) FROM stdin;
\.


--
-- TOC entry 5729 (class 0 OID 17090)
-- Dependencies: 269
-- Data for Name: order_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_activity (order_activity_id, uuid, order_activity_order_id, comment, customer_notified, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5731 (class 0 OID 17115)
-- Dependencies: 271
-- Data for Name: order_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_address (order_address_id, uuid, full_name, postcode, telephone, country, province, city, address_1, address_2) FROM stdin;
\.


--
-- TOC entry 5733 (class 0 OID 17128)
-- Dependencies: 273
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_item (order_item_id, uuid, order_item_order_id, product_id, referer, product_sku, product_name, thumbnail, product_weight, product_price, product_price_incl_tax, qty, final_price, final_price_incl_tax, tax_percent, tax_amount, tax_amount_before_discount, discount_amount, line_total, line_total_with_discount, line_total_incl_tax, line_total_with_discount_incl_tax, variant_group_id, variant_options, product_custom_options, requested_data) FROM stdin;
\.


--
-- TOC entry 5735 (class 0 OID 17165)
-- Dependencies: 275
-- Data for Name: payment_transaction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payment_transaction (payment_transaction_id, uuid, payment_transaction_order_id, transaction_id, transaction_type, amount, parent_transaction_id, payment_action, additional_information, created_at) FROM stdin;
\.


--
-- TOC entry 5697 (class 0 OID 16608)
-- Dependencies: 237
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product (product_id, uuid, type, variant_group_id, visibility, group_id, sku, price, weight, tax_class, status, created_at, updated_at, category_id) FROM stdin;
1	d161a1de-73be-4731-8418-51d357a8e343	simple	\N	t	1	FMD-12345	100.0000	100.0000	\N	t	2025-10-02 02:52:29.219216+07	2025-10-02 02:52:29.219216+07	\N
2	66e66d81-512a-4381-b05d-a915999af98a	simple	\N	t	1	CLL-98765	120.0000	120.0000	\N	t	2025-10-02 02:52:29.219216+07	2025-10-02 02:52:29.219216+07	\N
3	d2608332-c6c1-4891-8718-63bf34364079	simple	\N	t	1	DSJ-54321	120.0000	120.0000	\N	t	2025-10-02 02:52:29.219216+07	2025-10-02 02:52:29.219216+07	\N
4	b582910b-8530-421f-a1a4-435f5b900d06	simple	\N	t	1	SCS-24680	90.0000	90.0000	\N	t	2025-10-02 02:52:29.219216+07	2025-10-02 02:52:29.219216+07	\N
5	eadce5f8-dea5-456f-a399-3f3efd4558b4	simple	\N	t	1	IPHONE-14-PRO-MAX	1099.0000	0.2400	1	t	2025-10-04 15:23:56.610366+07	2025-10-04 15:23:56.610366+07	4
6	33a2973c-e109-43e2-a486-5feb59550108	simple	\N	t	1	SAMSUNG-S23-ULTRA	999.0000	0.2340	1	t	2025-10-04 15:23:56.641361+07	2025-10-04 15:23:56.641361+07	4
7	97fc156d-305a-4f23-9cee-02372dab814d	simple	\N	t	1	MACBOOK-PRO-14-M2	1999.0000	1.6000	1	t	2025-10-04 15:23:56.646909+07	2025-10-04 15:23:56.646909+07	5
8	6f237417-b0b3-4380-a668-ac692fed3c8c	simple	\N	t	1	DELL-XPS-13-PLUS	1299.0000	1.2400	1	t	2025-10-04 15:23:56.651633+07	2025-10-04 15:23:56.651633+07	5
9	cd6d679c-738c-4016-ae02-2a52372a4c94	simple	\N	t	1	IPAD-PRO-129-M2	1099.0000	0.6820	1	t	2025-10-04 15:23:56.656771+07	2025-10-04 15:23:56.656771+07	6
10	343b9831-e832-4888-b28b-15ac01a24e29	simple	\N	t	1	SAMSUNG-TAB-S8-ULTRA	899.0000	0.7260	1	t	2025-10-04 15:23:56.662194+07	2025-10-04 15:23:56.662194+07	6
11	8d72d8de-b6fc-45bd-9d4d-eb7e1f3f1c3f	simple	\N	t	1	AIRPODS-PRO-2ND	249.0000	0.0500	1	t	2025-10-04 15:23:56.668139+07	2025-10-04 15:23:56.668139+07	7
12	f44659aa-af46-41d5-bf84-e5ffbfa3e4e6	simple	\N	t	1	SONY-WH1000XM5	399.0000	0.2500	1	t	2025-10-04 15:23:56.675093+07	2025-10-04 15:23:56.675093+07	7
\.


--
-- TOC entry 5699 (class 0 OID 16652)
-- Dependencies: 239
-- Data for Name: product_attribute_value_index; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_attribute_value_index (product_attribute_value_index_id, product_id, attribute_id, option_id, option_text) FROM stdin;
\.


--
-- TOC entry 5715 (class 0 OID 16856)
-- Dependencies: 255
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_collection (product_collection_id, collection_id, product_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
\.


--
-- TOC entry 5701 (class 0 OID 16687)
-- Dependencies: 241
-- Data for Name: product_custom_option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_custom_option (product_custom_option_id, uuid, product_custom_option_product_id, option_name, option_type, is_required, sort_order) FROM stdin;
\.


--
-- TOC entry 5703 (class 0 OID 16711)
-- Dependencies: 243
-- Data for Name: product_custom_option_value; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_custom_option_value (product_custom_option_value_id, uuid, option_id, extra_price, sort_order, value) FROM stdin;
\.


--
-- TOC entry 5705 (class 0 OID 16733)
-- Dependencies: 245
-- Data for Name: product_description; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_description (product_description_id, product_description_product_id, name, description, short_description, url_key, meta_title, meta_description, meta_keywords) FROM stdin;
1	1	Floral Maxi Dress	Embrace the beauty of nature with our Floral Maxi Dress. This flowing dress features a stunning floral pattern that captures the essence of a blossoming garden. The lightweight fabric ensures comfort and breathability, making it perfect for both casual outings and special occasions. The dress is designed with a cinched waist and a v-neckline for a flattering silhouette. Elevate your style with this elegant and vibrant piece.	\N	floral-maxi-dress	Floral Maxi Dress	Floral Maxi Dress	Floral Maxi Dress
2	2	Classic Leather Loafers	Step into timeless elegance with our Classic Leather Loafers. Crafted from premium genuine leather, these loafers offer both style and comfort. The traditional design features a sleek and simple silhouette that pairs effortlessly with both formal and casual attire. The cushioned insole provides all-day support, making these loafers a versatile addition to your footwear collection.	\N	classic-leather-loafers	Classic Leather Loafers	Classic Leather Loafers	Classic Leather Loafers
3	3	Denim Skinny Jeans	Experience the perfect blend of style and comfort with our Denim Skinny Jeans. These jeans are designed to hug your curves while allowing for ease of movement. The high-quality denim fabric offers durability and a flattering fit. The classic five-pocket design adds a touch of versatility, making these jeans a wardrobe staple for various occasions.	\N	denim-skinny-jeans	Denim Skinny Jeans	Denim Skinny Jeans	Denim Skinny Jeans
4	4	Striped Cotton Sweater	Stay cozy and chic with our Striped Cotton Sweater. This lightweight sweater features a timeless striped pattern that adds a pop of style to your outfit. The breathable cotton fabric makes it an excellent choice for layering during transitional seasons. The relaxed fit and ribbed cuffs ensure a comfortable and flattering look, whether you're lounging at home or going out for a casual day.	\N	striped-cotton-sweater	Striped Cotton Sweater	Striped Cotton Sweater	Striped Cotton Sweater
5	5	iPhone 14 Pro Max	iPhone 14 Pro Max với màn hình Dynamic Island và camera 48MP chuyên nghiệp	iPhone 14 Pro Max - Điện thoại thông minh cao cấp nhất của Apple	iphone-14-pro-max	iPhone 14 Pro Max - Mua ngay tại EverShop	iPhone 14 Pro Max với công nghệ tiên tiến, camera chuyên nghiệp và hiệu năng vượt trội	\N
6	6	Samsung Galaxy S23 Ultra	Samsung Galaxy S23 Ultra với bút S Pen tích hợp và camera zoom 100x	Samsung Galaxy S23 Ultra - Flagship Android mạnh mẽ nhất	samsung-galaxy-s23-ultra	Samsung Galaxy S23 Ultra - Mua ngay tại EverShop	Samsung Galaxy S23 Ultra với S Pen, camera zoom siêu xa và hiệu năng đỉnh cao	\N
7	7	MacBook Pro 14 inch M2	MacBook Pro 14 inch với chip M2 Pro mạnh mẽ, màn hình Liquid Retina XDR	MacBook Pro 14 inch M2 - Laptop chuyên nghiệp cho sáng tạo	macbook-pro-14-m2	MacBook Pro 14 inch M2 - Mua ngay tại EverShop	MacBook Pro 14 inch với chip M2 Pro, hiệu năng vượt trội cho công việc chuyên nghiệp	\N
8	8	Dell XPS 13 Plus	Dell XPS 13 Plus với thiết kế premium, màn hình InfinityEdge và hiệu năng Intel thế hệ 12	Dell XPS 13 Plus - Ultrabook cao cấp cho doanh nhân	dell-xps-13-plus	Dell XPS 13 Plus - Mua ngay tại EverShop	Dell XPS 13 Plus với thiết kế mỏng nhẹ, hiệu năng mạnh mẽ cho công việc	\N
9	9	iPad Pro 12.9 inch M2	iPad Pro 12.9 inch với chip M2, màn hình Liquid Retina XDR và hỗ trợ Apple Pencil	iPad Pro 12.9 inch M2 - Máy tính bảng chuyên nghiệp	ipad-pro-129-m2	iPad Pro 12.9 inch M2 - Mua ngay tại EverShop	iPad Pro 12.9 inch với chip M2, hiệu năng laptop trong thân hình tablet	\N
10	10	Samsung Galaxy Tab S8 Ultra	Samsung Galaxy Tab S8 Ultra với màn hình 14.6 inch Super AMOLED và S Pen	Samsung Galaxy Tab S8 Ultra - Tablet Android cao cấp	samsung-galaxy-tab-s8-ultra	Samsung Galaxy Tab S8 Ultra - Mua ngay tại EverShop	Samsung Galaxy Tab S8 Ultra với màn hình lớn và S Pen cho công việc sáng tạo	\N
11	11	AirPods Pro 2nd Gen	AirPods Pro thế hệ 2 với chip H2, chống ồn chủ động nâng cao và âm thanh Spatial Audio	AirPods Pro 2nd Gen - Tai nghe không dây cao cấp	airpods-pro-2nd-gen	AirPods Pro 2nd Gen - Mua ngay tại EverShop	AirPods Pro thế hệ 2 với chống ồn vượt trội và chất lượng âm thanh đỉnh cao	\N
12	12	Sony WH-1000XM5	Sony WH-1000XM5 với chống ồn hàng đầu thế giới và thời lượng pin 30 giờ	Sony WH-1000XM5 - Tai nghe chống ồn tốt nhất	sony-wh-1000xm5	Sony WH-1000XM5 - Mua ngay tại EverShop	Sony WH-1000XM5 với công nghệ chống ồn V1 và chất lượng âm thanh Hi-Res	\N
\.


--
-- TOC entry 5707 (class 0 OID 16755)
-- Dependencies: 247
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_image (product_image_id, product_image_product_id, origin_image, thumb_image, listing_image, single_image, is_main) FROM stdin;
1	5	/media/products/iphone14promax.jpg	/assets/media/products/iphone14promax-thumb.jpg	/assets/media/products/iphone14promax-listing.jpg	/assets/media/products/iphone14promax-single.jpg	t
3	7	/media/products/macbook-pro-14.jpg	/assets/media/products/macbook-pro-14-thumb.jpg	/assets/media/products/macbook-pro-14-listing.jpg	/assets/media/products/macbook-pro-14-single.jpg	t
2	6	/media/products/samsung-s23-ultra.jpg	/assets/media/products/samsung-s23-ultra-thumb.jpg	/assets/media/products/samsung-s23-ultra-listing.jpg	/assets/media/products/samsung-s23-ultra-single.jpg	t
4	8	/media/products/dell-xps-13-plus.jpg	/assets/media/products/dell-xps-13-plus-thumb.jpg	/assets/media/products/dell-xps-13-plus-listing.jpg	/assets/media/products/dell-xps-13-plus-single.jpg	t
6	10	/media/products/samsung-tab-s8-ultra.jpg	/assets/media/products/samsung-tab-s8-ultra-thumb.jpg	/assets/media/products/samsung-tab-s8-ultra-listing.jpg	/assets/media/products/samsung-tab-s8-ultra-single.jpg	t
5	9	/media/products/ipad-pro-129.jpg	/assets/media/products/ipad-pro-129-thumb.jpg	/assets/media/products/ipad-pro-129-listing.jpg	/assets/media/products/ipad-pro-129-single.jpg	t
7	11	/media/products/airpods-pro-2nd.jpg	/assets/media/products/airpods-pro-2nd-thumb.jpg	/assets/media/products/airpods-pro-2nd-listing.jpg	/assets/media/products/airpods-pro-2nd-single.jpg	t
8	12	/media/products/sony-wh1000xm5.jpg	/assets/media/products/sony-wh1000xm5-thumb.jpg	/assets/media/products/sony-wh1000xm5-listing.jpg	/assets/media/products/sony-wh1000xm5-single.jpg	t
\.


--
-- TOC entry 5719 (class 0 OID 16934)
-- Dependencies: 259
-- Data for Name: product_inventory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_inventory (product_inventory_id, product_inventory_product_id, qty, manage_stock, stock_availability) FROM stdin;
1	1	100	t	t
2	2	120	t	t
3	3	90	t	t
4	4	150	t	t
5	5	50	t	t
6	6	40	t	t
7	7	25	t	t
8	8	30	t	t
9	9	35	t	t
10	10	20	t	t
11	11	100	t	t
12	12	60	t	t
\.


--
-- TOC entry 5759 (class 0 OID 17447)
-- Dependencies: 299
-- Data for Name: reset_password_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reset_password_token (reset_password_token_id, customer_id, token, created_at) FROM stdin;
\.


--
-- TOC entry 5683 (class 0 OID 16444)
-- Dependencies: 223
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.session (sid, sess, expire) FROM stdin;
p4B4TBnt0p2qkTGt9khMMCO3UI8b6NXi	{"cookie":{"originalMaxAge":86400000,"expires":"2025-10-09T12:18:46.459Z","secure":false,"httpOnly":true,"path":"/"},"notifications":[],"customerID":1}	2025-10-09 12:21:55
5Mh5So3mAfoV-ki6gWUBtTG9EhTwxiJT	{"cookie":{"originalMaxAge":86400000,"expires":"2025-10-09T12:18:58.078Z","secure":false,"httpOnly":true,"path":"/"},"notifications":[],"userID":2}	2025-10-09 12:21:10
\.


--
-- TOC entry 5763 (class 0 OID 17537)
-- Dependencies: 303
-- Data for Name: setting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.setting (setting_id, uuid, name, value, is_json) FROM stdin;
\.


--
-- TOC entry 5737 (class 0 OID 17190)
-- Dependencies: 277
-- Data for Name: shipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipment (shipment_id, uuid, shipment_order_id, carrier, tracking_number, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5743 (class 0 OID 17258)
-- Dependencies: 283
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipping_method (shipping_method_id, uuid, name) FROM stdin;
\.


--
-- TOC entry 5739 (class 0 OID 17214)
-- Dependencies: 279
-- Data for Name: shipping_zone; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipping_zone (shipping_zone_id, uuid, name, country) FROM stdin;
\.


--
-- TOC entry 5745 (class 0 OID 17274)
-- Dependencies: 285
-- Data for Name: shipping_zone_method; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipping_zone_method (shipping_zone_method_id, method_id, zone_id, is_enabled, cost, calculate_api, condition_type, max, min, price_based_cost, weight_based_cost) FROM stdin;
\.


--
-- TOC entry 5741 (class 0 OID 17235)
-- Dependencies: 281
-- Data for Name: shipping_zone_province; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipping_zone_province (shipping_zone_province_id, uuid, zone_id, province) FROM stdin;
\.


--
-- TOC entry 5765 (class 0 OID 17555)
-- Dependencies: 305
-- Data for Name: tax_class; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_class (tax_class_id, uuid, name) FROM stdin;
1	d60eae15-32ed-480d-a039-889766f50915	Taxable Goods
\.


--
-- TOC entry 5767 (class 0 OID 17576)
-- Dependencies: 307
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_rate (tax_rate_id, uuid, name, tax_class_id, country, province, postcode, rate, is_compound, priority) FROM stdin;
1	3d9b6e1c-2f74-457c-a1c2-1db1a01fd1c3	Tax	1	*	*	*	0.0000	f	0
\.


--
-- TOC entry 5717 (class 0 OID 16907)
-- Dependencies: 257
-- Data for Name: url_rewrite; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.url_rewrite (url_rewrite_id, language, request_path, target_path, entity_uuid, entity_type) FROM stdin;
1	en	/kids	/category/f5934549-dc32-496b-b11d-5f321926d896	f5934549-dc32-496b-b11d-5f321926d896	category
2	en	/women	/category/7797ce90-661f-44a9-97eb-069cd5cb1e4d	7797ce90-661f-44a9-97eb-069cd5cb1e4d	category
3	en	/men	/category/aad2fdf4-5a90-4113-b498-337ecc61be57	aad2fdf4-5a90-4113-b498-337ecc61be57	category
4	en	/floral-maxi-dress	/product/d161a1de-73be-4731-8418-51d357a8e343	d161a1de-73be-4731-8418-51d357a8e343	product
5	en	/classic-leather-loafers	/product/66e66d81-512a-4381-b05d-a915999af98a	66e66d81-512a-4381-b05d-a915999af98a	product
6	en	/denim-skinny-jeans	/product/d2608332-c6c1-4891-8718-63bf34364079	d2608332-c6c1-4891-8718-63bf34364079	product
7	en	/striped-cotton-sweater	/product/b582910b-8530-421f-a1a4-435f5b900d06	b582910b-8530-421f-a1a4-435f5b900d06	product
8	en	/dien-thoai	/category/b52d2f3d-04ef-4ee6-b4c5-9b02ea11414d	b52d2f3d-04ef-4ee6-b4c5-9b02ea11414d	category
9	en	/laptop	/category/15215354-b8ea-4f21-826d-2d8c358bef1c	15215354-b8ea-4f21-826d-2d8c358bef1c	category
10	en	/tablet	/category/ca9b7e08-b492-4acb-853f-481fa1de901c	ca9b7e08-b492-4acb-853f-481fa1de901c	category
11	en	/laptop/macbook-pro-14-m2	/product/97fc156d-305a-4f23-9cee-02372dab814d	97fc156d-305a-4f23-9cee-02372dab814d	product
14	en	/phu-kien	/category/225e8df5-2d57-47f8-a035-028b4614fbc2	225e8df5-2d57-47f8-a035-028b4614fbc2	category
12	en	/dien-thoai/iphone-14-pro-max	/product/eadce5f8-dea5-456f-a399-3f3efd4558b4	eadce5f8-dea5-456f-a399-3f3efd4558b4	product
16	en	/dien-thoai/samsung-galaxy-s23-ultra	/product/33a2973c-e109-43e2-a486-5feb59550108	33a2973c-e109-43e2-a486-5feb59550108	product
18	en	/laptop/dell-xps-13-plus	/product/6f237417-b0b3-4380-a668-ac692fed3c8c	6f237417-b0b3-4380-a668-ac692fed3c8c	product
19	en	/tablet/ipad-pro-129-m2	/product/cd6d679c-738c-4016-ae02-2a52372a4c94	cd6d679c-738c-4016-ae02-2a52372a4c94	product
22	en	/phu-kien/sony-wh-1000xm5	/product/f44659aa-af46-41d5-bf84-e5ffbfa3e4e6	f44659aa-af46-41d5-bf84-e5ffbfa3e4e6	product
21	en	/phu-kien/airpods-pro-2nd-gen	/product/8d72d8de-b6fc-45bd-9d4d-eb7e1f3f1c3f	8d72d8de-b6fc-45bd-9d4d-eb7e1f3f1c3f	product
20	en	/tablet/samsung-galaxy-tab-s8-ultra	/product/343b9831-e832-4888-b28b-15ac01a24e29	343b9831-e832-4888-b28b-15ac01a24e29	product
\.


--
-- TOC entry 5695 (class 0 OID 16558)
-- Dependencies: 235
-- Data for Name: variant_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.variant_group (variant_group_id, uuid, attribute_group_id, attribute_one, attribute_two, attribute_three, attribute_four, attribute_five, visibility) FROM stdin;
\.


--
-- TOC entry 5751 (class 0 OID 17346)
-- Dependencies: 291
-- Data for Name: widget; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.widget (widget_id, uuid, name, type, route, area, sort_order, settings, status, created_at, updated_at) FROM stdin;
1	000198a5-afec-4c4b-9dba-144c1145be58	Main menu	basic_menu	["all"]	["header"]	1	{"menus": [{"id": "hanhk3km0m8nt2b", "url": "javascript:void(0)", "name": "Shop ❤️", "type": "custom", "uuid": "javascript:void(0)", "children": [{"id": "hanhk3km0m8nt2c", "url": "/men", "name": "Men", "type": "custom", "uuid": "/men"}, {"id": "hanhk3km0m8nt2d", "url": "/women", "name": "Women", "type": "custom", "uuid": "/women"}]}, {"id": "hanhk3km0m8nt2e", "url": "/page/about-us", "name": "About us", "type": "custom", "uuid": "/page/about-us", "children": []}], "isMain": "1", "className": ""}	t	2025-10-02 02:52:29.704177+07	2025-10-02 02:52:29.704177+07
2	947a9fca-a1b8-4775-82b5-d3c2c1024b30	Featured categories	text_block	["homepage"]	["content"]	10	{"text": "[{\\"id\\":\\"r__c13ffd49-f39e-40d7-8d67-d345c0a018c1\\",\\"size\\":3,\\"columns\\":[{\\"id\\":\\"c__6dffc7a4-4378-4247-8ffd-07d956ce4939\\",\\"size\\":1,\\"data\\":{\\"time\\":1725357550597,\\"blocks\\":[{\\"id\\":\\"PjJh9eW0O7\\",\\"type\\":\\"header\\",\\"data\\":{\\"text\\":\\"Kids shoes collection\\",\\"level\\":3}},{\\"id\\":\\"CHsT6VaRCw\\",\\"type\\":\\"paragraph\\",\\"data\\":{\\"text\\":\\"Constructed from luxury nylons, leathers, and custom hardware, featuring sport details such as hidden breathing vents, waterproof + antimicrobial linings, and more.\\"}},{\\"id\\":\\"-0lRctONo9\\",\\"type\\":\\"raw\\",\\"data\\":{\\"html\\":\\"&lt;a href=\\\\\\"/kids\\\\\\" class=\\\\\\"button primary\\\\\\"&gt;&lt;span&gt;Shop kids&lt;/span&gt;&lt;/a&gt;\\"}}],\\"version\\":\\"2.30.2\\"}},{\\"id\\":\\"c__ca76b2e3-65e3-4eb3-83cb-7ffdfba41208\\",\\"size\\":1,\\"data\\":{\\"time\\":1725357550599,\\"blocks\\":[{\\"id\\":\\"2K_v3fp7Dd\\",\\"type\\":\\"header\\",\\"data\\":{\\"text\\":\\"Women shoes collection\\",\\"level\\":3}},{\\"id\\":\\"XiPHWtWbZm\\",\\"type\\":\\"paragraph\\",\\"data\\":{\\"text\\":\\"Constructed from luxury nylons, leathers, and custom hardware, featuring sport details such as hidden breathing vents, waterproof + antimicrobial linings, and more.\\"}},{\\"id\\":\\"f9KXlEkYmu\\",\\"type\\":\\"raw\\",\\"data\\":{\\"html\\":\\"&lt;a href=\\\\\\"/women\\\\\\" class=\\\\\\"button primary\\\\\\"&gt;&lt;span&gt;Shop women&lt;/span&gt;&lt;/a&gt;\\"}}],\\"version\\":\\"2.30.2\\"}},{\\"id\\":\\"c__2872ebd9-7f79-442b-bade-6c19d74220ef\\",\\"size\\":1,\\"data\\":{\\"time\\":1725357550612,\\"blocks\\":[{\\"id\\":\\"mxTqYRjSTw\\",\\"type\\":\\"header\\",\\"data\\":{\\"text\\":\\"Men shoes collection\\",\\"level\\":3}},{\\"id\\":\\"p-frIk8CU-\\",\\"type\\":\\"paragraph\\",\\"data\\":{\\"text\\":\\"Constructed from luxury nylons, leathers, and custom hardware, featuring sport details such as hidden breathing vents, waterproof + antimicrobial linings, and more.\\"}},{\\"id\\":\\"AoCaoHwyWd\\",\\"type\\":\\"raw\\",\\"data\\":{\\"html\\":\\"&lt;a href=\\\\\\"/men\\\\\\" class=\\\\\\"button primary\\\\\\"&gt;&lt;span&gt;Shop men&lt;/span&gt;&lt;/a&gt;\\"}}],\\"version\\":\\"2.30.2\\"}}]}]", "className": "page-width"}	t	2025-10-02 02:52:29.704177+07	2025-10-02 02:52:29.704177+07
3	35aa8643-9619-47c8-8073-b47d5271b3e5	Featured Products	collection_products	["homepage"]	["content"]	20	{"count": 4, "collection": "homepage"}	t	2025-10-02 02:52:29.704177+07	2025-10-02 02:52:29.704177+07
4	2bbf0a14-cc21-4762-b921-445f532c26db	Main banner	text_block	["homepage"]	["content"]	5	{"text": "[{\\"id\\":\\"r__63dcb2ab-c2a4-40fc-a995-105bf1484b06\\",\\"size\\":1,\\"columns\\":[{\\"id\\":\\"c__354832f1-6fe1-4845-8cbb-7e094082810e\\",\\"size\\":1,\\"data\\":{\\"time\\":1725374404621,\\"blocks\\":[{\\"id\\":\\"KRtRWBBVvm\\",\\"type\\":\\"raw\\",\\"data\\":{\\"html\\":\\"&lt;div style=\\\\\\"height: 500px; margin-top: -3rem; background: linear-gradient(135deg, #aad3ff, #0056b3); display: flex; align-items: center; justify-content: center;\\\\\\"&gt;\\\\n  &lt;div style=\\\\\\"display: flex; align-items: center; max-width: 1200px; width: 100%; padding: 0 20px;\\\\\\"&gt;\\\\n    &lt;div style=\\\\\\"flex: 1; text-align: center;\\\\\\"&gt;\\\\n      &lt;svg width=\\\\\\"300\\\\\\" height=\\\\\\"300\\\\\\" viewBox=\\\\\\"0 0 128 146\\\\\\" fill=\\\\\\"none\\\\\\" xmlns=\\\\\\"http://www.w3.org/2000/svg\\\\\\" style=\\\\\\"fill: #0056b3; color: #0056b3;\\\\\\"&gt;\\\\n        &lt;path d=\\\\\\"M32.388 18.0772L1.15175 36.1544L1.05206 72.5081L0.985596 108.895L32.4213 127.039C49.7009 137.008 63.9567 145.182 64.1228 145.182C64.289 145.182 72.8956 140.264 83.2966 134.283C93.6644 128.268 107.82 120.127 114.732 116.139L127.26 108.895V101.119V93.3102L126.529 93.7089C126.097 93.9415 111.941 102.083 95.06 111.853C78.1459 121.622 64.156 129.531 63.9567 129.498C63.724 129.431 52.5587 123.051 39.1005 115.275L14.6099 101.152V72.5746V43.9967L25.6756 37.6165C31.7234 34.1274 42.8223 27.7472 50.2991 23.4273C57.7426 19.1073 63.9899 15.585 64.1228 15.585C64.2557 15.585 72.9288 20.5362 83.3963 26.5841L113.902 43.9967L118.713 41.1657L127.26 36.1544L113.902 28.5447C103.334 22.2974 64.3554 -0.033191 64.0231 3.90721e-05C63.8237 3.90721e-05 49.568 8.14142 32.388 18.0772Z\\\\\\" fill=\\\\\\"#0056b3\\\\\\"&gt;&lt;/path&gt;\\\\n        &lt;path d=\\\\\\"M96.0237 54.1983C78.9434 64.0677 64.721 72.2423 64.4219 72.3088C64.0896 72.4084 55.7488 67.7562 44.8826 61.509L25.9082 50.543V58.4186L25.9414 66.2609L44.3841 76.8945C54.5193 82.743 63.1591 87.6611 63.5911 87.8272C64.2557 88.0598 68.9079 85.5011 95.5585 70.1156C112.705 60.1798 126.861 51.9719 127.027 51.839C127.16 51.7061 127.227 48.1505 127.194 43.9302L127.094 36.2541L96.0237 54.1983Z\\\\\\" fill=\\\\\\"#0056b3\\\\\\"&gt;&lt;/path&gt;\\\\n        &lt;path d=\\\\\\"M123.771 66.7261C121.943 67.7562 107.854 75.8976 92.4349 84.8033C77.0161 93.7089 64.289 100.986 64.1228 100.986C63.9567 100.986 55.3501 96.0683 44.9491 90.0869L26.0744 79.1874L25.9747 86.8303C25.9082 92.6788 26.0079 94.5729 26.307 94.872C26.9383 95.4369 63.7241 116.604 64.1228 116.604C64.4551 116.604 126.496 80.8821 127.027 80.4169C127.16 80.284 127.227 76.7284 127.194 72.4749L127.094 64.7987L123.771 66.7261Z\\\\\\" fill=\\\\\\"#0056b3\\\\\\"&gt;&lt;/path&gt;\\\\n      &lt;/svg&gt;\\\\n    &lt;/div&gt;\\\\n    \\\\n    &lt;div style=\\\\\\"flex: 1; text-align: left; padding: 20px;\\\\\\"&gt;\\\\n      <h1 style=\\\\\\"font-size: 3.5rem; color: #fff;\\\\\\">Your Heading Here</h1>\\\\n      &lt;p style=\\\\\\"font-size: 1.5rem; color: #fff; margin: 20px 0;\\\\\\"&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultricies sodales mi, at ornare elit semper ac.&lt;/p&gt;\\\\n      &lt;a href=\\\\\\"#\\\\\\" style=\\\\\\"display: inline-block; padding: 10px 20px; background-color: #fff; color: #0056b3; text-decoration: none; border-radius: 5px; font-weight: bold;\\\\\\"&gt;SHOP NOW&lt;/a&gt;\\\\n    &lt;/div&gt;\\\\n  &lt;/div&gt;\\\\n&lt;/div&gt;\\\\n\\"}}],\\"version\\":\\"2.30.2\\"}}]}]", "className": ""}	t	2025-10-02 02:52:29.704177+07	2025-10-02 02:52:29.704177+07
\.


--
-- TOC entry 5773 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_user_admin_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_user_admin_user_id_seq', 8, true);


--
-- TOC entry 5774 (class 0 OID 0)
-- Dependencies: 226
-- Name: attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attribute_attribute_id_seq', 2, true);


--
-- TOC entry 5775 (class 0 OID 0)
-- Dependencies: 230
-- Name: attribute_group_attribute_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attribute_group_attribute_group_id_seq', 1, true);


--
-- TOC entry 5776 (class 0 OID 0)
-- Dependencies: 232
-- Name: attribute_group_link_attribute_group_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attribute_group_link_attribute_group_link_id_seq', 2, true);


--
-- TOC entry 5777 (class 0 OID 0)
-- Dependencies: 228
-- Name: attribute_option_attribute_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.attribute_option_attribute_option_id_seq', 6, true);


--
-- TOC entry 5778 (class 0 OID 0)
-- Dependencies: 262
-- Name: cart_address_cart_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cart_address_cart_address_id_seq', 1, false);


--
-- TOC entry 5779 (class 0 OID 0)
-- Dependencies: 260
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 1, false);


--
-- TOC entry 5780 (class 0 OID 0)
-- Dependencies: 264
-- Name: cart_item_cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cart_item_cart_item_id_seq', 1, false);


--
-- TOC entry 5781 (class 0 OID 0)
-- Dependencies: 248
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_category_id_seq', 7, true);


--
-- TOC entry 5782 (class 0 OID 0)
-- Dependencies: 250
-- Name: category_description_category_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_description_category_description_id_seq', 7, true);


--
-- TOC entry 5783 (class 0 OID 0)
-- Dependencies: 286
-- Name: cms_page_cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cms_page_cms_page_id_seq', 1, false);


--
-- TOC entry 5784 (class 0 OID 0)
-- Dependencies: 288
-- Name: cms_page_description_cms_page_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cms_page_description_cms_page_description_id_seq', 1, false);


--
-- TOC entry 5785 (class 0 OID 0)
-- Dependencies: 252
-- Name: collection_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_collection_id_seq', 1, true);


--
-- TOC entry 5786 (class 0 OID 0)
-- Dependencies: 300
-- Name: coupon_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupon_coupon_id_seq', 1, false);


--
-- TOC entry 5787 (class 0 OID 0)
-- Dependencies: 296
-- Name: customer_address_customer_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_address_customer_address_id_seq', 1, false);


--
-- TOC entry 5788 (class 0 OID 0)
-- Dependencies: 294
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, true);


--
-- TOC entry 5789 (class 0 OID 0)
-- Dependencies: 292
-- Name: customer_group_customer_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_group_customer_group_id_seq', 1, true);


--
-- TOC entry 5790 (class 0 OID 0)
-- Dependencies: 224
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_event_id_seq', 29, true);


--
-- TOC entry 5791 (class 0 OID 0)
-- Dependencies: 221
-- Name: migration_migration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migration_migration_id_seq', 31, true);


--
-- TOC entry 5792 (class 0 OID 0)
-- Dependencies: 268
-- Name: order_activity_order_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_activity_order_activity_id_seq', 1, false);


--
-- TOC entry 5793 (class 0 OID 0)
-- Dependencies: 270
-- Name: order_address_order_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_address_order_address_id_seq', 1, false);


--
-- TOC entry 5794 (class 0 OID 0)
-- Dependencies: 272
-- Name: order_item_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_item_order_item_id_seq', 1, false);


--
-- TOC entry 5795 (class 0 OID 0)
-- Dependencies: 266
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);


--
-- TOC entry 5796 (class 0 OID 0)
-- Dependencies: 274
-- Name: payment_transaction_payment_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payment_transaction_payment_transaction_id_seq', 1, false);


--
-- TOC entry 5797 (class 0 OID 0)
-- Dependencies: 238
-- Name: product_attribute_value_index_product_attribute_value_index_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_attribute_value_index_product_attribute_value_index_seq', 1, false);


--
-- TOC entry 5798 (class 0 OID 0)
-- Dependencies: 254
-- Name: product_collection_product_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_collection_product_collection_id_seq', 4, true);


--
-- TOC entry 5799 (class 0 OID 0)
-- Dependencies: 240
-- Name: product_custom_option_product_custom_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_custom_option_product_custom_option_id_seq', 1, false);


--
-- TOC entry 5800 (class 0 OID 0)
-- Dependencies: 242
-- Name: product_custom_option_value_product_custom_option_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_custom_option_value_product_custom_option_value_id_seq', 1, false);


--
-- TOC entry 5801 (class 0 OID 0)
-- Dependencies: 244
-- Name: product_description_product_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_description_product_description_id_seq', 12, true);


--
-- TOC entry 5802 (class 0 OID 0)
-- Dependencies: 246
-- Name: product_image_product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_image_product_image_id_seq', 8, true);


--
-- TOC entry 5803 (class 0 OID 0)
-- Dependencies: 258
-- Name: product_inventory_product_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_inventory_product_inventory_id_seq', 12, true);


--
-- TOC entry 5804 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_product_id_seq', 12, true);


--
-- TOC entry 5805 (class 0 OID 0)
-- Dependencies: 298
-- Name: reset_password_token_reset_password_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reset_password_token_reset_password_token_id_seq', 1, false);


--
-- TOC entry 5806 (class 0 OID 0)
-- Dependencies: 302
-- Name: setting_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.setting_setting_id_seq', 1, false);


--
-- TOC entry 5807 (class 0 OID 0)
-- Dependencies: 276
-- Name: shipment_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipment_shipment_id_seq', 1, false);


--
-- TOC entry 5808 (class 0 OID 0)
-- Dependencies: 282
-- Name: shipping_method_shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipping_method_shipping_method_id_seq', 1, false);


--
-- TOC entry 5809 (class 0 OID 0)
-- Dependencies: 284
-- Name: shipping_zone_method_shipping_zone_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipping_zone_method_shipping_zone_method_id_seq', 1, false);


--
-- TOC entry 5810 (class 0 OID 0)
-- Dependencies: 280
-- Name: shipping_zone_province_shipping_zone_province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipping_zone_province_shipping_zone_province_id_seq', 1, false);


--
-- TOC entry 5811 (class 0 OID 0)
-- Dependencies: 278
-- Name: shipping_zone_shipping_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipping_zone_shipping_zone_id_seq', 1, false);


--
-- TOC entry 5812 (class 0 OID 0)
-- Dependencies: 304
-- Name: tax_class_tax_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tax_class_tax_class_id_seq', 1, true);


--
-- TOC entry 5813 (class 0 OID 0)
-- Dependencies: 306
-- Name: tax_rate_tax_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tax_rate_tax_rate_id_seq', 1, true);


--
-- TOC entry 5814 (class 0 OID 0)
-- Dependencies: 256
-- Name: url_rewrite_url_rewrite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_rewrite_url_rewrite_id_seq', 27, true);


--
-- TOC entry 5815 (class 0 OID 0)
-- Dependencies: 234
-- Name: variant_group_variant_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.variant_group_variant_group_id_seq', 1, false);


--
-- TOC entry 5816 (class 0 OID 0)
-- Dependencies: 290
-- Name: widget_widget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.widget_widget_id_seq', 4, true);


--
-- TOC entry 5228 (class 2606 OID 16407)
-- Name: admin_user ADMIN_USER_EMAIL_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT "ADMIN_USER_EMAIL_UNIQUE" UNIQUE (email);


--
-- TOC entry 5230 (class 2606 OID 16409)
-- Name: admin_user ADMIN_USER_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT "ADMIN_USER_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5245 (class 2606 OID 16493)
-- Name: attribute ATTRIBUTE_CODE_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT "ATTRIBUTE_CODE_UNIQUE" UNIQUE (attribute_code);


--
-- TOC entry 5247 (class 2606 OID 16495)
-- Name: attribute ATTRIBUTE_CODE_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT "ATTRIBUTE_CODE_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5260 (class 2606 OID 16544)
-- Name: attribute_group_link ATTRIBUTE_GROUP_LINK_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_group_link
    ADD CONSTRAINT "ATTRIBUTE_GROUP_LINK_UNIQUE" UNIQUE (attribute_id, group_id);


--
-- TOC entry 5256 (class 2606 OID 16533)
-- Name: attribute_group ATTRIBUTE_GROUP_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_group
    ADD CONSTRAINT "ATTRIBUTE_GROUP_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5251 (class 2606 OID 16511)
-- Name: attribute_option ATTRIBUTE_OPTION_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_option
    ADD CONSTRAINT "ATTRIBUTE_OPTION_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5348 (class 2606 OID 17005)
-- Name: cart_address CART_ADDRESS_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_address
    ADD CONSTRAINT "CART_ADDRESS_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5352 (class 2606 OID 17038)
-- Name: cart_item CART_ITEM_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "CART_ITEM_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5343 (class 2606 OID 16992)
-- Name: cart CART_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "CART_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5316 (class 2606 OID 16827)
-- Name: category_description CATEGORY_ID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT "CATEGORY_ID_UNIQUE" UNIQUE (category_description_category_id);


--
-- TOC entry 5318 (class 2606 OID 16829)
-- Name: category_description CATEGORY_URL_KEY_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT "CATEGORY_URL_KEY_UNIQUE" UNIQUE (url_key);


--
-- TOC entry 5312 (class 2606 OID 16790)
-- Name: category CATEGORY_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "CATEGORY_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5413 (class 2606 OID 17323)
-- Name: cms_page CMS_PAGE_UUID; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT "CMS_PAGE_UUID" UNIQUE (uuid);


--
-- TOC entry 5323 (class 2606 OID 16852)
-- Name: collection COLLECTION_CODE_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "COLLECTION_CODE_UNIQUE" UNIQUE (code);


--
-- TOC entry 5325 (class 2606 OID 16854)
-- Name: collection COLLECTION_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "COLLECTION_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5444 (class 2606 OID 17501)
-- Name: coupon COUPON_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT "COUPON_UNIQUE" UNIQUE (coupon);


--
-- TOC entry 5446 (class 2606 OID 17499)
-- Name: coupon COUPON_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT "COUPON_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5437 (class 2606 OID 17429)
-- Name: customer_address CUSTOMER_ADDRESS_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT "CUSTOMER_ADDRESS_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5430 (class 2606 OID 17406)
-- Name: customer CUSTOMER_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "CUSTOMER_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5432 (class 2606 OID 17404)
-- Name: customer EMAIL_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "EMAIL_UNIQUE" UNIQUE (email);


--
-- TOC entry 5241 (class 2606 OID 16469)
-- Name: event EVENT_UUID; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "EVENT_UUID" UNIQUE (uuid);


--
-- TOC entry 5409 (class 2606 OID 17292)
-- Name: shipping_zone_method METHOD_ZONE_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "METHOD_ZONE_UNIQUE" UNIQUE (zone_id, method_id);


--
-- TOC entry 5234 (class 2606 OID 16424)
-- Name: migration MODULE_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT "MODULE_UNIQUE" UNIQUE (module);


--
-- TOC entry 5287 (class 2606 OID 16667)
-- Name: product_attribute_value_index OPTION_VALUE_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_attribute_value_index
    ADD CONSTRAINT "OPTION_VALUE_UNIQUE" UNIQUE (product_id, attribute_id, option_id);


--
-- TOC entry 5365 (class 2606 OID 17107)
-- Name: order_activity ORDER_ACTIVITY_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_activity
    ADD CONSTRAINT "ORDER_ACTIVITY_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5369 (class 2606 OID 17126)
-- Name: order_address ORDER_ADDRESS_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_address
    ADD CONSTRAINT "ORDER_ADDRESS_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5374 (class 2606 OID 17157)
-- Name: order_item ORDER_ITEM_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "ORDER_ITEM_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5358 (class 2606 OID 17088)
-- Name: order ORDER_NUMBER_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "ORDER_NUMBER_UNIQUE" UNIQUE (order_number);


--
-- TOC entry 5360 (class 2606 OID 17086)
-- Name: order ORDER_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "ORDER_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5418 (class 2606 OID 17336)
-- Name: cms_page_description PAGE_ID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT "PAGE_ID_UNIQUE" UNIQUE (cms_page_description_cms_page_id);


--
-- TOC entry 5379 (class 2606 OID 17180)
-- Name: payment_transaction PAYMENT_TRANSACTION_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "PAYMENT_TRANSACTION_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5331 (class 2606 OID 16865)
-- Name: product_collection PRODUCT_COLLECTION_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "PRODUCT_COLLECTION_UNIQUE" UNIQUE (collection_id, product_id);


--
-- TOC entry 5292 (class 2606 OID 16703)
-- Name: product_custom_option PRODUCT_CUSTOM_OPTION_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_custom_option
    ADD CONSTRAINT "PRODUCT_CUSTOM_OPTION_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5297 (class 2606 OID 16725)
-- Name: product_custom_option_value PRODUCT_CUSTOM_OPTION_VALUE_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_custom_option_value
    ADD CONSTRAINT "PRODUCT_CUSTOM_OPTION_VALUE_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5302 (class 2606 OID 16745)
-- Name: product_description PRODUCT_ID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT "PRODUCT_ID_UNIQUE" UNIQUE (product_description_product_id);


--
-- TOC entry 5339 (class 2606 OID 16948)
-- Name: product_inventory PRODUCT_INVENTORY_PRODUCT_ID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_inventory
    ADD CONSTRAINT "PRODUCT_INVENTORY_PRODUCT_ID_UNIQUE" UNIQUE (product_inventory_product_id);


--
-- TOC entry 5278 (class 2606 OID 16638)
-- Name: product PRODUCT_SKU_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PRODUCT_SKU_UNIQUE" UNIQUE (sku);


--
-- TOC entry 5305 (class 2606 OID 16747)
-- Name: product_description PRODUCT_URL_KEY_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT "PRODUCT_URL_KEY_UNIQUE" UNIQUE (url_key);


--
-- TOC entry 5280 (class 2606 OID 16636)
-- Name: product PRODUCT_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PRODUCT_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5239 (class 2606 OID 16453)
-- Name: session SESSION_PKEY; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "SESSION_PKEY" PRIMARY KEY (sid);


--
-- TOC entry 5450 (class 2606 OID 17553)
-- Name: setting SETTING_NAME_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT "SETTING_NAME_UNIQUE" UNIQUE (name);


--
-- TOC entry 5452 (class 2606 OID 17551)
-- Name: setting SETTING_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT "SETTING_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5386 (class 2606 OID 17204)
-- Name: shipment SHIPMENT_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT "SHIPMENT_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5401 (class 2606 OID 17272)
-- Name: shipping_method SHIPPING_METHOD_NAME_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "SHIPPING_METHOD_NAME_UNIQUE" UNIQUE (name);


--
-- TOC entry 5403 (class 2606 OID 17270)
-- Name: shipping_method SHIPPING_METHOD_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "SHIPPING_METHOD_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5395 (class 2606 OID 17250)
-- Name: shipping_zone_province SHIPPING_ZONE_PROVINCE_PROVINCE_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT "SHIPPING_ZONE_PROVINCE_PROVINCE_UNIQUE" UNIQUE (province);


--
-- TOC entry 5397 (class 2606 OID 17248)
-- Name: shipping_zone_province SHIPPING_ZONE_PROVINCE_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT "SHIPPING_ZONE_PROVINCE_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5390 (class 2606 OID 17227)
-- Name: shipping_zone SHIPPING_ZONE_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone
    ADD CONSTRAINT "SHIPPING_ZONE_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5456 (class 2606 OID 17567)
-- Name: tax_class TAX_CLASS_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_class
    ADD CONSTRAINT "TAX_CLASS_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5460 (class 2606 OID 17602)
-- Name: tax_rate TAX_RATE_PRIORITY_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "TAX_RATE_PRIORITY_UNIQUE" UNIQUE (priority, tax_class_id);


--
-- TOC entry 5462 (class 2606 OID 17600)
-- Name: tax_rate TAX_RATE_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "TAX_RATE_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5381 (class 2606 OID 17182)
-- Name: payment_transaction UNQ_PAYMENT_TRANSACTION_ID_ORDER_ID; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "UNQ_PAYMENT_TRANSACTION_ID_ORDER_ID" UNIQUE (payment_transaction_order_id, transaction_id);


--
-- TOC entry 5420 (class 2606 OID 17338)
-- Name: cms_page_description URL_KEY_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT "URL_KEY_UNIQUE" UNIQUE (url_key);


--
-- TOC entry 5335 (class 2606 OID 16920)
-- Name: url_rewrite URL_REWRITE_PATH_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url_rewrite
    ADD CONSTRAINT "URL_REWRITE_PATH_UNIQUE" UNIQUE (language, entity_uuid);


--
-- TOC entry 5272 (class 2606 OID 16570)
-- Name: variant_group VARIANT_GROUP_UUID_UNIQUE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "VARIANT_GROUP_UUID_UNIQUE" UNIQUE (uuid);


--
-- TOC entry 5424 (class 2606 OID 17369)
-- Name: widget WIDGET_UUID; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widget
    ADD CONSTRAINT "WIDGET_UUID" UNIQUE (uuid);


--
-- TOC entry 5232 (class 2606 OID 16405)
-- Name: admin_user admin_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT admin_user_pkey PRIMARY KEY (admin_user_id);


--
-- TOC entry 5264 (class 2606 OID 16542)
-- Name: attribute_group_link attribute_group_link_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_group_link
    ADD CONSTRAINT attribute_group_link_pkey PRIMARY KEY (attribute_group_link_id);


--
-- TOC entry 5258 (class 2606 OID 16531)
-- Name: attribute_group attribute_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_group
    ADD CONSTRAINT attribute_group_pkey PRIMARY KEY (attribute_group_id);


--
-- TOC entry 5254 (class 2606 OID 16509)
-- Name: attribute_option attribute_option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_option
    ADD CONSTRAINT attribute_option_pkey PRIMARY KEY (attribute_option_id);


--
-- TOC entry 5249 (class 2606 OID 16491)
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (attribute_id);


--
-- TOC entry 5350 (class 2606 OID 17003)
-- Name: cart_address cart_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_address
    ADD CONSTRAINT cart_address_pkey PRIMARY KEY (cart_address_id);


--
-- TOC entry 5356 (class 2606 OID 17036)
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cart_item_id);


--
-- TOC entry 5346 (class 2606 OID 16990)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- TOC entry 5321 (class 2606 OID 16825)
-- Name: category_description category_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT category_description_pkey PRIMARY KEY (category_description_id);


--
-- TOC entry 5314 (class 2606 OID 16788)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 5422 (class 2606 OID 17334)
-- Name: cms_page_description cms_page_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT cms_page_description_pkey PRIMARY KEY (cms_page_description_id);


--
-- TOC entry 5415 (class 2606 OID 17321)
-- Name: cms_page cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (cms_page_id);


--
-- TOC entry 5327 (class 2606 OID 16850)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (collection_id);


--
-- TOC entry 5448 (class 2606 OID 17497)
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (coupon_id);


--
-- TOC entry 5440 (class 2606 OID 17427)
-- Name: customer_address customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (customer_address_id);


--
-- TOC entry 5428 (class 2606 OID 17384)
-- Name: customer_group customer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT customer_group_pkey PRIMARY KEY (customer_group_id);


--
-- TOC entry 5435 (class 2606 OID 17402)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 5243 (class 2606 OID 16467)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5236 (class 2606 OID 16422)
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (migration_id);


--
-- TOC entry 5367 (class 2606 OID 17105)
-- Name: order_activity order_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_activity
    ADD CONSTRAINT order_activity_pkey PRIMARY KEY (order_activity_id);


--
-- TOC entry 5371 (class 2606 OID 17124)
-- Name: order_address order_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_address
    ADD CONSTRAINT order_address_pkey PRIMARY KEY (order_address_id);


--
-- TOC entry 5376 (class 2606 OID 17155)
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 5362 (class 2606 OID 17084)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 5383 (class 2606 OID 17178)
-- Name: payment_transaction payment_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT payment_transaction_pkey PRIMARY KEY (payment_transaction_id);


--
-- TOC entry 5289 (class 2606 OID 16663)
-- Name: product_attribute_value_index product_attribute_value_index_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_attribute_value_index
    ADD CONSTRAINT product_attribute_value_index_pkey PRIMARY KEY (product_attribute_value_index_id);


--
-- TOC entry 5333 (class 2606 OID 16863)
-- Name: product_collection product_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_pkey PRIMARY KEY (product_collection_id);


--
-- TOC entry 5294 (class 2606 OID 16701)
-- Name: product_custom_option product_custom_option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_custom_option
    ADD CONSTRAINT product_custom_option_pkey PRIMARY KEY (product_custom_option_id);


--
-- TOC entry 5299 (class 2606 OID 16723)
-- Name: product_custom_option_value product_custom_option_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_custom_option_value
    ADD CONSTRAINT product_custom_option_value_pkey PRIMARY KEY (product_custom_option_value_id);


--
-- TOC entry 5307 (class 2606 OID 16743)
-- Name: product_description product_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT product_description_pkey PRIMARY KEY (product_description_id);


--
-- TOC entry 5310 (class 2606 OID 16766)
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (product_image_id);


--
-- TOC entry 5341 (class 2606 OID 16946)
-- Name: product_inventory product_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_inventory
    ADD CONSTRAINT product_inventory_pkey PRIMARY KEY (product_inventory_id);


--
-- TOC entry 5282 (class 2606 OID 16634)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 5442 (class 2606 OID 17458)
-- Name: reset_password_token reset_password_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reset_password_token
    ADD CONSTRAINT reset_password_token_pkey PRIMARY KEY (reset_password_token_id);


--
-- TOC entry 5454 (class 2606 OID 17549)
-- Name: setting setting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT setting_pkey PRIMARY KEY (setting_id);


--
-- TOC entry 5388 (class 2606 OID 17202)
-- Name: shipment shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (shipment_id);


--
-- TOC entry 5405 (class 2606 OID 17268)
-- Name: shipping_method shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_pkey PRIMARY KEY (shipping_method_id);


--
-- TOC entry 5411 (class 2606 OID 17290)
-- Name: shipping_zone_method shipping_zone_method_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT shipping_zone_method_pkey PRIMARY KEY (shipping_zone_method_id);


--
-- TOC entry 5392 (class 2606 OID 17225)
-- Name: shipping_zone shipping_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone
    ADD CONSTRAINT shipping_zone_pkey PRIMARY KEY (shipping_zone_id);


--
-- TOC entry 5399 (class 2606 OID 17246)
-- Name: shipping_zone_province shipping_zone_province_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT shipping_zone_province_pkey PRIMARY KEY (shipping_zone_province_id);


--
-- TOC entry 5458 (class 2606 OID 17565)
-- Name: tax_class tax_class_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_class
    ADD CONSTRAINT tax_class_pkey PRIMARY KEY (tax_class_id);


--
-- TOC entry 5464 (class 2606 OID 17598)
-- Name: tax_rate tax_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT tax_rate_pkey PRIMARY KEY (tax_rate_id);


--
-- TOC entry 5337 (class 2606 OID 16918)
-- Name: url_rewrite url_rewrite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url_rewrite
    ADD CONSTRAINT url_rewrite_pkey PRIMARY KEY (url_rewrite_id);


--
-- TOC entry 5274 (class 2606 OID 16568)
-- Name: variant_group variant_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT variant_group_pkey PRIMARY KEY (variant_group_id);


--
-- TOC entry 5426 (class 2606 OID 17367)
-- Name: widget widget_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widget
    ADD CONSTRAINT widget_pkey PRIMARY KEY (widget_id);


--
-- TOC entry 5265 (class 1259 OID 16606)
-- Name: FK_ATTRIBUTE_GROUP_VARIANT; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_GROUP_VARIANT" ON public.variant_group USING btree (attribute_group_id);


--
-- TOC entry 5261 (class 1259 OID 16556)
-- Name: FK_ATTRIBUTE_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_LINK" ON public.attribute_group_link USING btree (attribute_id);


--
-- TOC entry 5252 (class 1259 OID 16517)
-- Name: FK_ATTRIBUTE_OPTION; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_OPTION" ON public.attribute_option USING btree (attribute_id);


--
-- TOC entry 5283 (class 1259 OID 16684)
-- Name: FK_ATTRIBUTE_OPTION_VALUE_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_OPTION_VALUE_LINK" ON public.product_attribute_value_index USING btree (option_id);


--
-- TOC entry 5284 (class 1259 OID 16683)
-- Name: FK_ATTRIBUTE_VALUE_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_VALUE_LINK" ON public.product_attribute_value_index USING btree (attribute_id);


--
-- TOC entry 5266 (class 1259 OID 16605)
-- Name: FK_ATTRIBUTE_VARIANT_FIVE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_VARIANT_FIVE" ON public.variant_group USING btree (attribute_five);


--
-- TOC entry 5267 (class 1259 OID 16604)
-- Name: FK_ATTRIBUTE_VARIANT_FOUR; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_VARIANT_FOUR" ON public.variant_group USING btree (attribute_four);


--
-- TOC entry 5268 (class 1259 OID 16601)
-- Name: FK_ATTRIBUTE_VARIANT_ONE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_VARIANT_ONE" ON public.variant_group USING btree (attribute_one);


--
-- TOC entry 5269 (class 1259 OID 16603)
-- Name: FK_ATTRIBUTE_VARIANT_THREE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_VARIANT_THREE" ON public.variant_group USING btree (attribute_three);


--
-- TOC entry 5270 (class 1259 OID 16602)
-- Name: FK_ATTRIBUTE_VARIANT_TWO; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ATTRIBUTE_VARIANT_TWO" ON public.variant_group USING btree (attribute_two);


--
-- TOC entry 5353 (class 1259 OID 17049)
-- Name: FK_CART_ITEM; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CART_ITEM" ON public.cart_item USING btree (cart_id);


--
-- TOC entry 5354 (class 1259 OID 17050)
-- Name: FK_CART_ITEM_PRODUCT; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CART_ITEM_PRODUCT" ON public.cart_item USING btree (product_id);


--
-- TOC entry 5344 (class 1259 OID 17233)
-- Name: FK_CART_SHIPPING_ZONE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CART_SHIPPING_ZONE" ON public.cart USING btree (shipping_zone_id);


--
-- TOC entry 5319 (class 1259 OID 16835)
-- Name: FK_CATEGORY_DESCRIPTION; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CATEGORY_DESCRIPTION" ON public.category_description USING btree (category_description_category_id);


--
-- TOC entry 5416 (class 1259 OID 17344)
-- Name: FK_CMS_PAGE_DESCRIPTION; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CMS_PAGE_DESCRIPTION" ON public.cms_page_description USING btree (cms_page_description_cms_page_id);


--
-- TOC entry 5328 (class 1259 OID 16876)
-- Name: FK_COLLECTION_PRODUCT_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_COLLECTION_PRODUCT_LINK" ON public.product_collection USING btree (collection_id);


--
-- TOC entry 5438 (class 1259 OID 17435)
-- Name: FK_CUSTOMER_ADDRESS; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CUSTOMER_ADDRESS" ON public.customer_address USING btree (customer_id);


--
-- TOC entry 5433 (class 1259 OID 17412)
-- Name: FK_CUSTOMER_GROUP; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CUSTOMER_GROUP" ON public.customer USING btree (group_id);


--
-- TOC entry 5295 (class 1259 OID 16731)
-- Name: FK_CUSTOM_OPTION_VALUE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_CUSTOM_OPTION_VALUE" ON public.product_custom_option_value USING btree (option_id);


--
-- TOC entry 5262 (class 1259 OID 16555)
-- Name: FK_GROUP_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_GROUP_LINK" ON public.attribute_group_link USING btree (group_id);


--
-- TOC entry 5406 (class 1259 OID 17304)
-- Name: FK_METHOD_ZONE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_METHOD_ZONE" ON public.shipping_zone_method USING btree (method_id);


--
-- TOC entry 5372 (class 1259 OID 17163)
-- Name: FK_ORDER; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ORDER" ON public.order_item USING btree (order_item_order_id);


--
-- TOC entry 5363 (class 1259 OID 17113)
-- Name: FK_ORDER_ACTIVITY; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ORDER_ACTIVITY" ON public.order_activity USING btree (order_activity_order_id);


--
-- TOC entry 5384 (class 1259 OID 17210)
-- Name: FK_ORDER_SHIPMENT; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ORDER_SHIPMENT" ON public.shipment USING btree (shipment_order_id);


--
-- TOC entry 5377 (class 1259 OID 17188)
-- Name: FK_PAYMENT_TRANSACTION_ORDER; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PAYMENT_TRANSACTION_ORDER" ON public.payment_transaction USING btree (payment_transaction_order_id);


--
-- TOC entry 5275 (class 1259 OID 16649)
-- Name: FK_PRODUCT_ATTRIBUTE_GROUP; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_ATTRIBUTE_GROUP" ON public.product USING btree (group_id);


--
-- TOC entry 5285 (class 1259 OID 16685)
-- Name: FK_PRODUCT_ATTRIBUTE_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_ATTRIBUTE_LINK" ON public.product_attribute_value_index USING btree (product_id);


--
-- TOC entry 5329 (class 1259 OID 16877)
-- Name: FK_PRODUCT_COLLECTION_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_COLLECTION_LINK" ON public.product_collection USING btree (product_id);


--
-- TOC entry 5290 (class 1259 OID 16709)
-- Name: FK_PRODUCT_CUSTOM_OPTION; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_CUSTOM_OPTION" ON public.product_custom_option USING btree (product_custom_option_product_id);


--
-- TOC entry 5300 (class 1259 OID 16753)
-- Name: FK_PRODUCT_DESCRIPTION; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_DESCRIPTION" ON public.product_description USING btree (product_description_product_id);


--
-- TOC entry 5308 (class 1259 OID 16774)
-- Name: FK_PRODUCT_IMAGE_LINK; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_IMAGE_LINK" ON public.product_image USING btree (product_image_product_id);


--
-- TOC entry 5276 (class 1259 OID 16650)
-- Name: FK_PRODUCT_VARIANT_GROUP; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_PRODUCT_VARIANT_GROUP" ON public.product USING btree (variant_group_id);


--
-- TOC entry 5393 (class 1259 OID 17256)
-- Name: FK_SHIPPING_ZONE_PROVINCE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_SHIPPING_ZONE_PROVINCE" ON public.shipping_zone_province USING btree (zone_id);


--
-- TOC entry 5407 (class 1259 OID 17303)
-- Name: FK_ZONE_METHOD; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FK_ZONE_METHOD" ON public.shipping_zone_method USING btree (zone_id);


--
-- TOC entry 5237 (class 1259 OID 16454)
-- Name: IDX_SESSION_EXPIRE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_SESSION_EXPIRE" ON public.session USING btree (expire);


--
-- TOC entry 5303 (class 1259 OID 16958)
-- Name: PRODUCT_SEARCH_INDEX; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "PRODUCT_SEARCH_INDEX" ON public.product_description USING gin (to_tsvector('simple'::regconfig, (((name)::text || ' '::text) || description)));


--
-- TOC entry 5517 (class 2620 OID 16922)
-- Name: category ADD_CATEGORY_CREATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_CATEGORY_CREATED_EVENT_TRIGGER" AFTER INSERT ON public.category FOR EACH ROW EXECUTE FUNCTION public.add_category_created_event();


--
-- TOC entry 5518 (class 2620 OID 16926)
-- Name: category ADD_CATEGORY_DELETED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_CATEGORY_DELETED_EVENT_TRIGGER" AFTER DELETE ON public.category FOR EACH ROW EXECUTE FUNCTION public.add_category_deleted_event();


--
-- TOC entry 5519 (class 2620 OID 16924)
-- Name: category ADD_CATEGORY_UPDATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_CATEGORY_UPDATED_EVENT_TRIGGER" AFTER UPDATE ON public.category FOR EACH ROW EXECUTE FUNCTION public.add_category_updated_event();


--
-- TOC entry 5527 (class 2620 OID 17441)
-- Name: customer ADD_CUSTOMER_CREATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_CUSTOMER_CREATED_EVENT_TRIGGER" AFTER INSERT ON public.customer FOR EACH ROW EXECUTE FUNCTION public.add_customer_created_event();


--
-- TOC entry 5528 (class 2620 OID 17445)
-- Name: customer ADD_CUSTOMER_DELETED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_CUSTOMER_DELETED_EVENT_TRIGGER" AFTER DELETE ON public.customer FOR EACH ROW EXECUTE FUNCTION public.add_customer_deleted_event();


--
-- TOC entry 5529 (class 2620 OID 17443)
-- Name: customer ADD_CUSTOMER_UPDATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_CUSTOMER_UPDATED_EVENT_TRIGGER" AFTER UPDATE ON public.customer FOR EACH ROW EXECUTE FUNCTION public.add_customer_updated_event();


--
-- TOC entry 5522 (class 2620 OID 16957)
-- Name: product_inventory ADD_INVENTORY_UPDATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_INVENTORY_UPDATED_EVENT_TRIGGER" AFTER UPDATE ON public.product_inventory FOR EACH ROW EXECUTE FUNCTION public.add_product_inventory_updated_event();


--
-- TOC entry 5523 (class 2620 OID 17307)
-- Name: order ADD_ORDER_CREATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_ORDER_CREATED_EVENT_TRIGGER" AFTER INSERT ON public."order" FOR EACH ROW EXECUTE FUNCTION public.add_order_created_event();


--
-- TOC entry 5509 (class 2620 OID 16928)
-- Name: product ADD_PRODUCT_CREATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_PRODUCT_CREATED_EVENT_TRIGGER" AFTER INSERT ON public.product FOR EACH ROW EXECUTE FUNCTION public.add_product_created_event();


--
-- TOC entry 5510 (class 2620 OID 16932)
-- Name: product ADD_PRODUCT_DELETED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_PRODUCT_DELETED_EVENT_TRIGGER" AFTER DELETE ON public.product FOR EACH ROW EXECUTE FUNCTION public.add_product_deleted_event();


--
-- TOC entry 5511 (class 2620 OID 16930)
-- Name: product ADD_PRODUCT_UPDATED_EVENT_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "ADD_PRODUCT_UPDATED_EVENT_TRIGGER" AFTER UPDATE ON public.product FOR EACH ROW EXECUTE FUNCTION public.add_product_updated_event();


--
-- TOC entry 5521 (class 2620 OID 16904)
-- Name: category_description BUILD_CATEGORY_URL_KEY_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "BUILD_CATEGORY_URL_KEY_TRIGGER" BEFORE INSERT OR UPDATE ON public.category_description FOR EACH ROW EXECUTE FUNCTION public.build_url_key();


--
-- TOC entry 5515 (class 2620 OID 16905)
-- Name: product_description BUILD_PRODUCT_URL_KEY_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "BUILD_PRODUCT_URL_KEY_TRIGGER" BEFORE INSERT OR UPDATE ON public.product_description FOR EACH ROW EXECUTE FUNCTION public.build_url_key();


--
-- TOC entry 5520 (class 2620 OID 16955)
-- Name: category DELETE_SUB_CATEGORIES_TRIGGER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "DELETE_SUB_CATEGORIES_TRIGGER" AFTER DELETE ON public.category FOR EACH ROW EXECUTE FUNCTION public.delete_sub_categories();


--
-- TOC entry 5512 (class 2620 OID 16881)
-- Name: product PREVENT_CHANGING_ATTRIBUTE_GROUP_OF_PRODUCT_WITH_VARIANTS; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "PREVENT_CHANGING_ATTRIBUTE_GROUP_OF_PRODUCT_WITH_VARIANTS" BEFORE UPDATE ON public.product FOR EACH ROW EXECUTE FUNCTION public.prevent_change_attribute_group();


--
-- TOC entry 5507 (class 2620 OID 16879)
-- Name: attribute_group PREVENT_DELETING_THE_DEFAULT_ATTRIBUTE_GROUP; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "PREVENT_DELETING_THE_DEFAULT_ATTRIBUTE_GROUP" BEFORE DELETE ON public.attribute_group FOR EACH ROW EXECUTE FUNCTION public.prevent_delete_default_attribute_group();


--
-- TOC entry 5526 (class 2620 OID 17437)
-- Name: customer_group PREVENT_DELETING_THE_DEFAULT_CUSTOMER_GROUP; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "PREVENT_DELETING_THE_DEFAULT_CUSTOMER_GROUP" BEFORE DELETE ON public.customer_group FOR EACH ROW EXECUTE FUNCTION public.prevent_delete_default_customer_group();


--
-- TOC entry 5531 (class 2620 OID 17574)
-- Name: tax_class PREVENT_DELETING_THE_DEFAULT_TAX_CLASS; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "PREVENT_DELETING_THE_DEFAULT_TAX_CLASS" BEFORE DELETE ON public.tax_class FOR EACH ROW EXECUTE FUNCTION public.prevent_delete_default_tax_class();


--
-- TOC entry 5516 (class 2620 OID 16961)
-- Name: product_image PRODUCT_IMAGE_ADDED; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "PRODUCT_IMAGE_ADDED" AFTER INSERT ON public.product_image FOR EACH ROW EXECUTE FUNCTION public.product_image_insert_trigger();


--
-- TOC entry 5530 (class 2620 OID 17439)
-- Name: customer SET_DEFAULT_CUSTOMER_GROUP; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "SET_DEFAULT_CUSTOMER_GROUP" BEFORE INSERT ON public.customer FOR EACH ROW EXECUTE FUNCTION public.set_default_customer_group();


--
-- TOC entry 5505 (class 2620 OID 16885)
-- Name: attribute_option TRIGGER_AFTER_ATTRIBUTE_OPTION_UPDATE; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "TRIGGER_AFTER_ATTRIBUTE_OPTION_UPDATE" AFTER UPDATE ON public.attribute_option FOR EACH ROW EXECUTE FUNCTION public.update_product_attribute_option_value_text();


--
-- TOC entry 5506 (class 2620 OID 16887)
-- Name: attribute_option TRIGGER_AFTER_DELETE_ATTRIBUTE_OPTION; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "TRIGGER_AFTER_DELETE_ATTRIBUTE_OPTION" AFTER DELETE ON public.attribute_option FOR EACH ROW EXECUTE FUNCTION public.delete_product_attribute_value_index();


--
-- TOC entry 5525 (class 2620 OID 17305)
-- Name: order_item TRIGGER_AFTER_INSERT_ORDER_ITEM; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "TRIGGER_AFTER_INSERT_ORDER_ITEM" AFTER INSERT ON public.order_item FOR EACH ROW EXECUTE FUNCTION public.reduce_product_stock_when_order_placed();


--
-- TOC entry 5513 (class 2620 OID 16889)
-- Name: product TRIGGER_AFTER_INSERT_PRODUCT; Type: TRIGGER; Schema: public; Owner: -
--

CREATE CONSTRAINT TRIGGER "TRIGGER_AFTER_INSERT_PRODUCT" AFTER INSERT ON public.product DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE FUNCTION public.update_variant_group_visibility();


--
-- TOC entry 5508 (class 2620 OID 16883)
-- Name: attribute_group_link TRIGGER_AFTER_REMOVE_ATTRIBUTE_FROM_GROUP; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "TRIGGER_AFTER_REMOVE_ATTRIBUTE_FROM_GROUP" AFTER DELETE ON public.attribute_group_link FOR EACH ROW EXECUTE FUNCTION public.remove_attribute_from_group();


--
-- TOC entry 5504 (class 2620 OID 16895)
-- Name: attribute TRIGGER_AFTER_UPDATE_ATTRIBUTE; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "TRIGGER_AFTER_UPDATE_ATTRIBUTE" AFTER UPDATE ON public.attribute FOR EACH ROW EXECUTE FUNCTION public.delete_variant_group_after_attribute_type_changed();


--
-- TOC entry 5514 (class 2620 OID 16896)
-- Name: product TRIGGER_PRODUCT_AFTER_UPDATE; Type: TRIGGER; Schema: public; Owner: -
--

CREATE CONSTRAINT TRIGGER "TRIGGER_PRODUCT_AFTER_UPDATE" AFTER UPDATE ON public.product DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.update_attribute_index_and_variant_group_visibility();


--
-- TOC entry 5524 (class 2620 OID 17503)
-- Name: order TRIGGER_UPDATE_COUPON_USED_TIME_AFTER_CREATE_ORDER; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "TRIGGER_UPDATE_COUPON_USED_TIME_AFTER_CREATE_ORDER" AFTER INSERT ON public."order" FOR EACH ROW EXECUTE FUNCTION public.set_coupon_used_time();


--
-- TOC entry 5468 (class 2606 OID 16571)
-- Name: variant_group FK_ATTRIBUTE_GROUP_VARIANT; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_ATTRIBUTE_GROUP_VARIANT" FOREIGN KEY (attribute_group_id) REFERENCES public.attribute_group(attribute_group_id) ON DELETE CASCADE;


--
-- TOC entry 5466 (class 2606 OID 16545)
-- Name: attribute_group_link FK_ATTRIBUTE_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_group_link
    ADD CONSTRAINT "FK_ATTRIBUTE_LINK" FOREIGN KEY (attribute_id) REFERENCES public.attribute(attribute_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5465 (class 2606 OID 16512)
-- Name: attribute_option FK_ATTRIBUTE_OPTION; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_option
    ADD CONSTRAINT "FK_ATTRIBUTE_OPTION" FOREIGN KEY (attribute_id) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5478 (class 2606 OID 16668)
-- Name: product_attribute_value_index FK_ATTRIBUTE_OPTION_VALUE_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_attribute_value_index
    ADD CONSTRAINT "FK_ATTRIBUTE_OPTION_VALUE_LINK" FOREIGN KEY (option_id) REFERENCES public.attribute_option(attribute_option_id) ON DELETE CASCADE;


--
-- TOC entry 5479 (class 2606 OID 16673)
-- Name: product_attribute_value_index FK_ATTRIBUTE_VALUE_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_attribute_value_index
    ADD CONSTRAINT "FK_ATTRIBUTE_VALUE_LINK" FOREIGN KEY (attribute_id) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5469 (class 2606 OID 16576)
-- Name: variant_group FK_ATTRIBUTE_VARIANT_FIVE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_ATTRIBUTE_VARIANT_FIVE" FOREIGN KEY (attribute_five) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5470 (class 2606 OID 16581)
-- Name: variant_group FK_ATTRIBUTE_VARIANT_FOUR; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_ATTRIBUTE_VARIANT_FOUR" FOREIGN KEY (attribute_four) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5471 (class 2606 OID 16586)
-- Name: variant_group FK_ATTRIBUTE_VARIANT_ONE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_ATTRIBUTE_VARIANT_ONE" FOREIGN KEY (attribute_one) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5472 (class 2606 OID 16591)
-- Name: variant_group FK_ATTRIBUTE_VARIANT_THREE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_ATTRIBUTE_VARIANT_THREE" FOREIGN KEY (attribute_three) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5473 (class 2606 OID 16596)
-- Name: variant_group FK_ATTRIBUTE_VARIANT_TWO; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_ATTRIBUTE_VARIANT_TWO" FOREIGN KEY (attribute_two) REFERENCES public.attribute(attribute_id) ON DELETE CASCADE;


--
-- TOC entry 5490 (class 2606 OID 17039)
-- Name: cart_item FK_CART_ITEM; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_CART_ITEM" FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5491 (class 2606 OID 17044)
-- Name: cart_item FK_CART_ITEM_PRODUCT; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_CART_ITEM_PRODUCT" FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 5489 (class 2606 OID 17228)
-- Name: cart FK_CART_SHIPPING_ZONE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_CART_SHIPPING_ZONE" FOREIGN KEY (shipping_zone_id) REFERENCES public.shipping_zone(shipping_zone_id) ON DELETE SET NULL;


--
-- TOC entry 5485 (class 2606 OID 16830)
-- Name: category_description FK_CATEGORY_DESCRIPTION; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT "FK_CATEGORY_DESCRIPTION" FOREIGN KEY (category_description_category_id) REFERENCES public.category(category_id) ON DELETE CASCADE;


--
-- TOC entry 5499 (class 2606 OID 17339)
-- Name: cms_page_description FK_CMS_PAGE_DESCRIPTION; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT "FK_CMS_PAGE_DESCRIPTION" FOREIGN KEY (cms_page_description_cms_page_id) REFERENCES public.cms_page(cms_page_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5486 (class 2606 OID 16866)
-- Name: product_collection FK_COLLECTION_PRODUCT_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "FK_COLLECTION_PRODUCT_LINK" FOREIGN KEY (collection_id) REFERENCES public.collection(collection_id) ON DELETE CASCADE;


--
-- TOC entry 5501 (class 2606 OID 17430)
-- Name: customer_address FK_CUSTOMER_ADDRESS; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT "FK_CUSTOMER_ADDRESS" FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON DELETE CASCADE;


--
-- TOC entry 5500 (class 2606 OID 17407)
-- Name: customer FK_CUSTOMER_GROUP; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "FK_CUSTOMER_GROUP" FOREIGN KEY (group_id) REFERENCES public.customer_group(customer_group_id) ON DELETE SET NULL;


--
-- TOC entry 5482 (class 2606 OID 16726)
-- Name: product_custom_option_value FK_CUSTOM_OPTION_VALUE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_custom_option_value
    ADD CONSTRAINT "FK_CUSTOM_OPTION_VALUE" FOREIGN KEY (option_id) REFERENCES public.product_custom_option(product_custom_option_id) ON DELETE CASCADE;


--
-- TOC entry 5467 (class 2606 OID 16550)
-- Name: attribute_group_link FK_GROUP_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_group_link
    ADD CONSTRAINT "FK_GROUP_LINK" FOREIGN KEY (group_id) REFERENCES public.attribute_group(attribute_group_id) ON DELETE CASCADE;


--
-- TOC entry 5497 (class 2606 OID 17298)
-- Name: shipping_zone_method FK_METHOD_ZONE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "FK_METHOD_ZONE" FOREIGN KEY (method_id) REFERENCES public.shipping_method(shipping_method_id) ON DELETE CASCADE;


--
-- TOC entry 5493 (class 2606 OID 17158)
-- Name: order_item FK_ORDER; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_ORDER" FOREIGN KEY (order_item_order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;


--
-- TOC entry 5492 (class 2606 OID 17108)
-- Name: order_activity FK_ORDER_ACTIVITY; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_activity
    ADD CONSTRAINT "FK_ORDER_ACTIVITY" FOREIGN KEY (order_activity_order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;


--
-- TOC entry 5495 (class 2606 OID 17205)
-- Name: shipment FK_ORDER_SHIPMENT; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT "FK_ORDER_SHIPMENT" FOREIGN KEY (shipment_order_id) REFERENCES public."order"(order_id) ON DELETE CASCADE;


--
-- TOC entry 5494 (class 2606 OID 17183)
-- Name: payment_transaction FK_PAYMENT_TRANSACTION_ORDER; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "FK_PAYMENT_TRANSACTION_ORDER" FOREIGN KEY (payment_transaction_order_id) REFERENCES public."order"(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5474 (class 2606 OID 16639)
-- Name: product FK_PRODUCT_ATTRIBUTE_GROUP; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_PRODUCT_ATTRIBUTE_GROUP" FOREIGN KEY (group_id) REFERENCES public.attribute_group(attribute_group_id) ON DELETE SET NULL;


--
-- TOC entry 5480 (class 2606 OID 16678)
-- Name: product_attribute_value_index FK_PRODUCT_ATTRIBUTE_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_attribute_value_index
    ADD CONSTRAINT "FK_PRODUCT_ATTRIBUTE_LINK" FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 5487 (class 2606 OID 16871)
-- Name: product_collection FK_PRODUCT_COLLECTION_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "FK_PRODUCT_COLLECTION_LINK" FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 5481 (class 2606 OID 16704)
-- Name: product_custom_option FK_PRODUCT_CUSTOM_OPTION; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_custom_option
    ADD CONSTRAINT "FK_PRODUCT_CUSTOM_OPTION" FOREIGN KEY (product_custom_option_product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 5483 (class 2606 OID 16748)
-- Name: product_description FK_PRODUCT_DESCRIPTION; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT "FK_PRODUCT_DESCRIPTION" FOREIGN KEY (product_description_product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 5484 (class 2606 OID 16769)
-- Name: product_image FK_PRODUCT_IMAGE_LINK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT "FK_PRODUCT_IMAGE_LINK" FOREIGN KEY (product_image_product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 5475 (class 2606 OID 16644)
-- Name: product FK_PRODUCT_VARIANT_GROUP; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_PRODUCT_VARIANT_GROUP" FOREIGN KEY (variant_group_id) REFERENCES public.variant_group(variant_group_id) ON DELETE SET NULL;


--
-- TOC entry 5502 (class 2606 OID 17459)
-- Name: reset_password_token FK_RESET_PASSWORD_TOKEN_CUSTOMER; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reset_password_token
    ADD CONSTRAINT "FK_RESET_PASSWORD_TOKEN_CUSTOMER" FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON DELETE CASCADE;


--
-- TOC entry 5496 (class 2606 OID 17251)
-- Name: shipping_zone_province FK_SHIPPING_ZONE_PROVINCE; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT "FK_SHIPPING_ZONE_PROVINCE" FOREIGN KEY (zone_id) REFERENCES public.shipping_zone(shipping_zone_id) ON DELETE CASCADE;


--
-- TOC entry 5476 (class 2606 OID 17568)
-- Name: product FK_TAX_CLASS; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_TAX_CLASS" FOREIGN KEY (tax_class) REFERENCES public.tax_class(tax_class_id) ON DELETE SET NULL;


--
-- TOC entry 5503 (class 2606 OID 17603)
-- Name: tax_rate FK_TAX_RATE_TAX_CLASS; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_TAX_RATE_TAX_CLASS" FOREIGN KEY (tax_class_id) REFERENCES public.tax_class(tax_class_id) ON DELETE CASCADE;


--
-- TOC entry 5498 (class 2606 OID 17293)
-- Name: shipping_zone_method FK_ZONE_METHOD; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "FK_ZONE_METHOD" FOREIGN KEY (zone_id) REFERENCES public.shipping_zone(shipping_zone_id) ON DELETE CASCADE;


--
-- TOC entry 5477 (class 2606 OID 16898)
-- Name: product PRODUCT_CATEGORY_ID_CONSTRAINT; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PRODUCT_CATEGORY_ID_CONSTRAINT" FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON DELETE SET NULL;


--
-- TOC entry 5488 (class 2606 OID 16949)
-- Name: product_inventory PRODUCT_INVENTORY_PRODUCT_ID_CONSTANTSRAINT; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_inventory
    ADD CONSTRAINT "PRODUCT_INVENTORY_PRODUCT_ID_CONSTANTSRAINT" FOREIGN KEY (product_inventory_product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


-- Completed on 2025-10-08 19:34:24

--
-- PostgreSQL database dump complete
--

\unrestrict gSRkRPOAoY85IyNsJk3Cv7hfmbWmcZ3fvRzyL00Gm88raj8xV9AKelPQ9OaTz1W

