--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 9.6.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO lareb;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO lareb;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO lareb;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO lareb;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO lareb;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO lareb;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO lareb;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO lareb;

--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_addresses (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zipcode character varying,
    phone character varying,
    state_name character varying,
    alternative_phone character varying,
    company character varying,
    state_id integer,
    country_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_addresses OWNER TO lareb;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_addresses_id_seq OWNER TO lareb;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_addresses_id_seq OWNED BY public.spree_addresses.id;


--
-- Name: spree_adjustment_reasons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_adjustment_reasons (
    id integer NOT NULL,
    name character varying,
    code character varying,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_adjustment_reasons OWNER TO lareb;

--
-- Name: spree_adjustment_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_adjustment_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_adjustment_reasons_id_seq OWNER TO lareb;

--
-- Name: spree_adjustment_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_adjustment_reasons_id_seq OWNED BY public.spree_adjustment_reasons.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_adjustments (
    id integer NOT NULL,
    source_type character varying,
    source_id integer,
    adjustable_type character varying,
    adjustable_id integer NOT NULL,
    amount numeric(10,2),
    label character varying,
    eligible boolean DEFAULT true,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    order_id integer NOT NULL,
    included boolean DEFAULT false,
    promotion_code_id integer,
    adjustment_reason_id integer,
    finalized boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spree_adjustments OWNER TO lareb;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_adjustments_id_seq OWNER TO lareb;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_adjustments_id_seq OWNED BY public.spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_assets (
    id integer NOT NULL,
    viewable_type character varying,
    viewable_id integer,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    attachment_content_type character varying,
    attachment_file_name character varying,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_assets OWNER TO lareb;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_assets_id_seq OWNER TO lareb;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_assets_id_seq OWNED BY public.spree_assets.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_calculators (
    id integer NOT NULL,
    type character varying,
    calculable_type character varying,
    calculable_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    preferences text
);


ALTER TABLE public.spree_calculators OWNER TO lareb;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_calculators_id_seq OWNER TO lareb;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_calculators_id_seq OWNED BY public.spree_calculators.id;


--
-- Name: spree_cartons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_cartons (
    id integer NOT NULL,
    number character varying,
    external_number character varying,
    stock_location_id integer,
    address_id integer,
    shipping_method_id integer,
    tracking character varying,
    shipped_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    imported_from_shipment_id integer
);


ALTER TABLE public.spree_cartons OWNER TO lareb;

--
-- Name: spree_cartons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_cartons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_cartons_id_seq OWNER TO lareb;

--
-- Name: spree_cartons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_cartons_id_seq OWNED BY public.spree_cartons.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_countries (
    id integer NOT NULL,
    iso_name character varying,
    iso character varying,
    iso3 character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.spree_countries OWNER TO lareb;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_countries_id_seq OWNER TO lareb;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_countries_id_seq OWNED BY public.spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_credit_cards (
    id integer NOT NULL,
    month character varying,
    year character varying,
    cc_type character varying,
    last_digits character varying,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    name character varying,
    user_id integer,
    payment_method_id integer,
    "default" boolean DEFAULT false NOT NULL,
    address_id integer
);


ALTER TABLE public.spree_credit_cards OWNER TO lareb;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_credit_cards_id_seq OWNER TO lareb;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_credit_cards_id_seq OWNED BY public.spree_credit_cards.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_customer_returns (
    id integer NOT NULL,
    number character varying,
    stock_location_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_customer_returns OWNER TO lareb;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_customer_returns_id_seq OWNER TO lareb;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_customer_returns_id_seq OWNED BY public.spree_customer_returns.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_inventory_units (
    id integer NOT NULL,
    state character varying,
    variant_id integer,
    shipment_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    pending boolean DEFAULT true,
    line_item_id integer,
    carton_id integer
);


ALTER TABLE public.spree_inventory_units OWNER TO lareb;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_inventory_units_id_seq OWNER TO lareb;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_inventory_units_id_seq OWNED BY public.spree_inventory_units.id;


--
-- Name: spree_line_item_actions; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_line_item_actions (
    id integer NOT NULL,
    line_item_id integer NOT NULL,
    action_id integer NOT NULL,
    quantity integer DEFAULT 0,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_line_item_actions OWNER TO lareb;

--
-- Name: spree_line_item_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_line_item_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_line_item_actions_id_seq OWNER TO lareb;

--
-- Name: spree_line_item_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_line_item_actions_id_seq OWNED BY public.spree_line_item_actions.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_line_items (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    cost_price numeric(10,2),
    tax_category_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.spree_line_items OWNER TO lareb;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_line_items_id_seq OWNER TO lareb;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_line_items_id_seq OWNED BY public.spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_log_entries (
    id integer NOT NULL,
    source_type character varying,
    source_id integer,
    details text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_log_entries OWNER TO lareb;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_log_entries_id_seq OWNER TO lareb;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_log_entries_id_seq OWNED BY public.spree_log_entries.id;


--
-- Name: spree_option_type_prototypes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_option_type_prototypes (
    id integer NOT NULL,
    prototype_id integer,
    option_type_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_option_type_prototypes OWNER TO lareb;

--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_option_type_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_type_prototypes_id_seq OWNER TO lareb;

--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_option_type_prototypes_id_seq OWNED BY public.spree_option_type_prototypes.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_option_types OWNER TO lareb;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_types_id_seq OWNER TO lareb;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_option_types_id_seq OWNED BY public.spree_option_types.id;


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying,
    presentation character varying,
    option_type_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_option_values OWNER TO lareb;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_values_id_seq OWNER TO lareb;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_option_values_id_seq OWNED BY public.spree_option_values.id;


--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_option_values_variants (
    id integer NOT NULL,
    variant_id integer,
    option_value_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_option_values_variants OWNER TO lareb;

--
-- Name: spree_option_values_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_option_values_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_values_variants_id_seq OWNER TO lareb;

--
-- Name: spree_option_values_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_option_values_variants_id_seq OWNED BY public.spree_option_values_variants.id;


--
-- Name: spree_order_mutexes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_order_mutexes (
    id integer NOT NULL,
    order_id integer NOT NULL,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.spree_order_mutexes OWNER TO lareb;

--
-- Name: spree_order_mutexes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_order_mutexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_order_mutexes_id_seq OWNER TO lareb;

--
-- Name: spree_order_mutexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_order_mutexes_id_seq OWNED BY public.spree_order_mutexes.id;


--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_orders (
    id integer NOT NULL,
    number character varying(32),
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    state character varying,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(10,2) DEFAULT 0.0,
    shipment_state character varying,
    payment_state character varying,
    email character varying,
    special_instructions text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    currency character varying,
    last_ip_address character varying,
    created_by_id integer,
    shipment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    channel character varying DEFAULT 'spree'::character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    item_count integer DEFAULT 0,
    approver_id integer,
    approved_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    guest_token character varying,
    canceled_at timestamp without time zone,
    canceler_id integer,
    store_id integer,
    approver_name character varying,
    frontend_viewable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.spree_orders OWNER TO lareb;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_orders_id_seq OWNER TO lareb;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_orders_id_seq OWNED BY public.spree_orders.id;


--
-- Name: spree_orders_promotions; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_orders_promotions (
    id integer NOT NULL,
    order_id integer,
    promotion_id integer,
    promotion_code_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_orders_promotions OWNER TO lareb;

--
-- Name: spree_orders_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_orders_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_orders_promotions_id_seq OWNER TO lareb;

--
-- Name: spree_orders_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_orders_promotions_id_seq OWNED BY public.spree_orders_promotions.id;


--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_payment_capture_events (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    payment_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_payment_capture_events OWNER TO lareb;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_capture_events_id_seq OWNER TO lareb;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_payment_capture_events_id_seq OWNED BY public.spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_payment_methods (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    auto_capture boolean,
    preferences text,
    preference_source character varying,
    "position" integer DEFAULT 0,
    available_to_users boolean DEFAULT true,
    available_to_admin boolean DEFAULT true
);


ALTER TABLE public.spree_payment_methods OWNER TO lareb;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_methods_id_seq OWNER TO lareb;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_payment_methods_id_seq OWNED BY public.spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_payments (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    source_type character varying,
    source_id integer,
    payment_method_id integer,
    state character varying,
    response_code character varying,
    avs_response character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    number character varying,
    cvv_response_code character varying,
    cvv_response_message character varying
);


ALTER TABLE public.spree_payments OWNER TO lareb;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payments_id_seq OWNER TO lareb;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_payments_id_seq OWNED BY public.spree_payments.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_preferences (
    id integer NOT NULL,
    value text,
    key character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_preferences OWNER TO lareb;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_preferences_id_seq OWNER TO lareb;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_preferences_id_seq OWNED BY public.spree_preferences.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_prices (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    amount numeric(10,2),
    currency character varying,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    country_iso character varying(2)
);


ALTER TABLE public.spree_prices OWNER TO lareb;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prices_id_seq OWNER TO lareb;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_prices_id_seq OWNED BY public.spree_prices.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_product_option_types OWNER TO lareb;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_option_types_id_seq OWNER TO lareb;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_product_option_types_id_seq OWNED BY public.spree_product_option_types.id;


--
-- Name: spree_product_promotion_rules; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_product_promotion_rules (
    id integer NOT NULL,
    product_id integer,
    promotion_rule_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_product_promotion_rules OWNER TO lareb;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_product_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_promotion_rules_id_seq OWNER TO lareb;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_product_promotion_rules_id_seq OWNED BY public.spree_product_promotion_rules.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_product_properties (
    id integer NOT NULL,
    value character varying,
    product_id integer,
    property_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_product_properties OWNER TO lareb;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_properties_id_seq OWNER TO lareb;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_product_properties_id_seq OWNED BY public.spree_product_properties.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_products (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    slug character varying,
    meta_description text,
    meta_keywords character varying,
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    promotionable boolean DEFAULT true,
    meta_title character varying
);


ALTER TABLE public.spree_products OWNER TO lareb;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_id_seq OWNER TO lareb;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_products_id_seq OWNED BY public.spree_products.id;


--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_products_taxons (
    id integer NOT NULL,
    product_id integer,
    taxon_id integer,
    "position" integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_products_taxons OWNER TO lareb;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_products_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_taxons_id_seq OWNER TO lareb;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_products_taxons_id_seq OWNED BY public.spree_products_taxons.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_promotion_action_line_items OWNER TO lareb;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_action_line_items_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_action_line_items_id_seq OWNED BY public.spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_actions (
    id integer NOT NULL,
    promotion_id integer,
    "position" integer,
    type character varying,
    deleted_at timestamp without time zone,
    preferences text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_promotion_actions OWNER TO lareb;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_actions_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_actions_id_seq OWNED BY public.spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    code character varying
);


ALTER TABLE public.spree_promotion_categories OWNER TO lareb;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_categories_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_categories_id_seq OWNED BY public.spree_promotion_categories.id;


--
-- Name: spree_promotion_code_batches; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_code_batches (
    id integer NOT NULL,
    promotion_id integer NOT NULL,
    base_code character varying NOT NULL,
    number_of_codes integer NOT NULL,
    email character varying,
    error character varying,
    state character varying DEFAULT 'pending'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    join_characters character varying DEFAULT '_'::character varying NOT NULL
);


ALTER TABLE public.spree_promotion_code_batches OWNER TO lareb;

--
-- Name: spree_promotion_code_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_code_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_code_batches_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_code_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_code_batches_id_seq OWNED BY public.spree_promotion_code_batches.id;


--
-- Name: spree_promotion_codes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_codes (
    id integer NOT NULL,
    promotion_id integer NOT NULL,
    value character varying NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    promotion_code_batch_id integer
);


ALTER TABLE public.spree_promotion_codes OWNER TO lareb;

--
-- Name: spree_promotion_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_codes_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_codes_id_seq OWNED BY public.spree_promotion_codes.id;


--
-- Name: spree_promotion_rule_taxons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_rule_taxons (
    id integer NOT NULL,
    taxon_id integer,
    promotion_rule_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_promotion_rule_taxons OWNER TO lareb;

--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_rule_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rule_taxons_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_rule_taxons_id_seq OWNED BY public.spree_promotion_rule_taxons.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    product_group_id integer,
    type character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    code character varying,
    preferences text
);


ALTER TABLE public.spree_promotion_rules OWNER TO lareb;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_rules_id_seq OWNED BY public.spree_promotion_rules.id;


--
-- Name: spree_promotion_rules_stores; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_rules_stores (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    promotion_rule_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_promotion_rules_stores OWNER TO lareb;

--
-- Name: spree_promotion_rules_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_rules_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_stores_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_rules_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_rules_stores_id_seq OWNED BY public.spree_promotion_rules_stores.id;


--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotion_rules_users (
    id integer NOT NULL,
    user_id integer,
    promotion_rule_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_promotion_rules_users OWNER TO lareb;

--
-- Name: spree_promotion_rules_users_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotion_rules_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_users_id_seq OWNER TO lareb;

--
-- Name: spree_promotion_rules_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotion_rules_users_id_seq OWNED BY public.spree_promotion_rules_users.id;


--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_promotions (
    id integer NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying,
    type character varying,
    usage_limit integer,
    match_policy character varying DEFAULT 'all'::character varying,
    advertise boolean DEFAULT false,
    path character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    promotion_category_id integer,
    per_code_usage_limit integer,
    apply_automatically boolean DEFAULT false
);


ALTER TABLE public.spree_promotions OWNER TO lareb;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotions_id_seq OWNER TO lareb;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_promotions_id_seq OWNED BY public.spree_promotions.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_properties (
    id integer NOT NULL,
    name character varying,
    presentation character varying NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_properties OWNER TO lareb;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_properties_id_seq OWNER TO lareb;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_properties_id_seq OWNED BY public.spree_properties.id;


--
-- Name: spree_property_prototypes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_property_prototypes (
    id integer NOT NULL,
    prototype_id integer,
    property_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_property_prototypes OWNER TO lareb;

--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_property_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_property_prototypes_id_seq OWNER TO lareb;

--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_property_prototypes_id_seq OWNED BY public.spree_property_prototypes.id;


--
-- Name: spree_prototype_taxons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_prototype_taxons (
    id integer NOT NULL,
    taxon_id integer,
    prototype_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_prototype_taxons OWNER TO lareb;

--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_prototype_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prototype_taxons_id_seq OWNER TO lareb;

--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_prototype_taxons_id_seq OWNED BY public.spree_prototype_taxons.id;


--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_prototypes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_prototypes OWNER TO lareb;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prototypes_id_seq OWNER TO lareb;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_prototypes_id_seq OWNED BY public.spree_prototypes.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_refund_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    code character varying
);


ALTER TABLE public.spree_refund_reasons OWNER TO lareb;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_refund_reasons_id_seq OWNER TO lareb;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_refund_reasons_id_seq OWNED BY public.spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_refunds (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    transaction_id character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    refund_reason_id integer,
    reimbursement_id integer
);


ALTER TABLE public.spree_refunds OWNER TO lareb;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_refunds_id_seq OWNER TO lareb;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_refunds_id_seq OWNED BY public.spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_reimbursement_credits (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    reimbursement_id integer,
    creditable_id integer,
    creditable_type character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_reimbursement_credits OWNER TO lareb;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursement_credits_id_seq OWNER TO lareb;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_reimbursement_credits_id_seq OWNED BY public.spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_reimbursement_types (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    type character varying
);


ALTER TABLE public.spree_reimbursement_types OWNER TO lareb;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursement_types_id_seq OWNER TO lareb;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_reimbursement_types_id_seq OWNED BY public.spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_reimbursements (
    id integer NOT NULL,
    number character varying,
    reimbursement_status character varying,
    customer_return_id integer,
    order_id integer,
    total numeric(10,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_reimbursements OWNER TO lareb;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursements_id_seq OWNER TO lareb;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_reimbursements_id_seq OWNED BY public.spree_reimbursements.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_return_authorizations (
    id integer NOT NULL,
    number character varying,
    state character varying,
    order_id integer,
    memo text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    stock_location_id integer,
    return_reason_id integer
);


ALTER TABLE public.spree_return_authorizations OWNER TO lareb;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_authorizations_id_seq OWNER TO lareb;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_return_authorizations_id_seq OWNED BY public.spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_return_items (
    id integer NOT NULL,
    return_authorization_id integer,
    inventory_unit_id integer,
    exchange_variant_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    reception_status character varying,
    acceptance_status character varying,
    customer_return_id integer,
    reimbursement_id integer,
    exchange_inventory_unit_id integer,
    acceptance_status_errors text,
    preferred_reimbursement_type_id integer,
    override_reimbursement_type_id integer,
    resellable boolean DEFAULT true NOT NULL,
    return_reason_id integer
);


ALTER TABLE public.spree_return_items OWNER TO lareb;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_items_id_seq OWNER TO lareb;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_return_items_id_seq OWNED BY public.spree_return_items.id;


--
-- Name: spree_return_reasons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_return_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_return_reasons OWNER TO lareb;

--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_return_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_reasons_id_seq OWNER TO lareb;

--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_return_reasons_id_seq OWNED BY public.spree_return_reasons.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_roles OWNER TO lareb;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_roles_id_seq OWNER TO lareb;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_roles_id_seq OWNED BY public.spree_roles.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_roles_users (
    id integer NOT NULL,
    role_id integer,
    user_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_roles_users OWNER TO lareb;

--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_roles_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_roles_users_id_seq OWNER TO lareb;

--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_roles_users_id_seq OWNED BY public.spree_roles_users.id;


--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipments (
    id integer NOT NULL,
    tracking character varying,
    number character varying,
    cost numeric(10,2) DEFAULT 0.0,
    shipped_at timestamp without time zone,
    order_id integer,
    deprecated_address_id integer,
    state character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    stock_location_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.spree_shipments OWNER TO lareb;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipments_id_seq OWNER TO lareb;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipments_id_seq OWNED BY public.spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_shipping_categories OWNER TO lareb;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_categories_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_categories_id_seq OWNED BY public.spree_shipping_categories.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_method_categories (
    id integer NOT NULL,
    shipping_method_id integer NOT NULL,
    shipping_category_id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_shipping_method_categories OWNER TO lareb;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_categories_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_method_categories_id_seq OWNED BY public.spree_shipping_method_categories.id;


--
-- Name: spree_shipping_method_stock_locations; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_method_stock_locations (
    id integer NOT NULL,
    shipping_method_id integer,
    stock_location_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_shipping_method_stock_locations OWNER TO lareb;

--
-- Name: spree_shipping_method_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_method_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_stock_locations_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_method_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_method_stock_locations_id_seq OWNED BY public.spree_shipping_method_stock_locations.id;


--
-- Name: spree_shipping_method_zones; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_method_zones (
    id integer NOT NULL,
    shipping_method_id integer,
    zone_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_shipping_method_zones OWNER TO lareb;

--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_method_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_zones_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_method_zones_id_seq OWNED BY public.spree_shipping_method_zones.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_methods (
    id integer NOT NULL,
    name character varying,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    tracking_url character varying,
    admin_name character varying,
    tax_category_id integer,
    code character varying,
    available_to_all boolean DEFAULT true,
    carrier character varying,
    service_level character varying,
    available_to_users boolean DEFAULT true
);


ALTER TABLE public.spree_shipping_methods OWNER TO lareb;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_methods_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_methods_id_seq OWNED BY public.spree_shipping_methods.id;


--
-- Name: spree_shipping_rate_taxes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_rate_taxes (
    id integer NOT NULL,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    tax_rate_id integer,
    shipping_rate_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_rate_taxes OWNER TO lareb;

--
-- Name: spree_shipping_rate_taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_rate_taxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_rate_taxes_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_rate_taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_rate_taxes_id_seq OWNED BY public.spree_shipping_rate_taxes.id;


--
-- Name: spree_shipping_rates; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_shipping_rates (
    id integer NOT NULL,
    shipment_id integer,
    shipping_method_id integer,
    selected boolean DEFAULT false,
    cost numeric(8,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    tax_rate_id integer
);


ALTER TABLE public.spree_shipping_rates OWNER TO lareb;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_rates_id_seq OWNER TO lareb;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_shipping_rates_id_seq OWNED BY public.spree_shipping_rates.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_state_changes (
    id integer NOT NULL,
    name character varying,
    previous_state character varying,
    stateful_id integer,
    user_id integer,
    stateful_type character varying,
    next_state character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_state_changes OWNER TO lareb;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_state_changes_id_seq OWNER TO lareb;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_state_changes_id_seq OWNED BY public.spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_states (
    id integer NOT NULL,
    name character varying,
    abbr character varying,
    country_id integer,
    updated_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.spree_states OWNER TO lareb;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_states_id_seq OWNER TO lareb;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_states_id_seq OWNED BY public.spree_states.id;


--
-- Name: spree_stock_items; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_stock_items (
    id integer NOT NULL,
    stock_location_id integer,
    variant_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    backorderable boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_stock_items OWNER TO lareb;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_stock_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_items_id_seq OWNER TO lareb;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_stock_items_id_seq OWNED BY public.spree_stock_items.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_stock_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    "default" boolean DEFAULT false NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    country_id integer,
    zipcode character varying,
    phone character varying,
    active boolean DEFAULT true,
    backorderable_default boolean DEFAULT false,
    propagate_all_variants boolean DEFAULT true,
    admin_name character varying,
    "position" integer DEFAULT 0,
    restock_inventory boolean DEFAULT true NOT NULL,
    fulfillable boolean DEFAULT true NOT NULL,
    code character varying,
    check_stock_on_transfer boolean DEFAULT true
);


ALTER TABLE public.spree_stock_locations OWNER TO lareb;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_locations_id_seq OWNER TO lareb;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_stock_locations_id_seq OWNED BY public.spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_stock_movements (
    id integer NOT NULL,
    stock_item_id integer,
    quantity integer DEFAULT 0,
    action character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    originator_type character varying,
    originator_id integer
);


ALTER TABLE public.spree_stock_movements OWNER TO lareb;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_movements_id_seq OWNER TO lareb;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_stock_movements_id_seq OWNED BY public.spree_stock_movements.id;


--
-- Name: spree_store_credit_categories; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_credit_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_store_credit_categories OWNER TO lareb;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_credit_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_categories_id_seq OWNER TO lareb;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_credit_categories_id_seq OWNED BY public.spree_store_credit_categories.id;


--
-- Name: spree_store_credit_events; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_credit_events (
    id integer NOT NULL,
    store_credit_id integer NOT NULL,
    action character varying NOT NULL,
    amount numeric(8,2),
    user_total_amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    authorization_code character varying NOT NULL,
    deleted_at timestamp without time zone,
    originator_type character varying,
    originator_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    amount_remaining numeric(8,2) DEFAULT NULL::numeric,
    store_credit_reason_id integer
);


ALTER TABLE public.spree_store_credit_events OWNER TO lareb;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_credit_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_events_id_seq OWNER TO lareb;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_credit_events_id_seq OWNED BY public.spree_store_credit_events.id;


--
-- Name: spree_store_credit_reasons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_credit_reasons (
    id bigint NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_store_credit_reasons OWNER TO lareb;

--
-- Name: spree_store_credit_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_credit_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_reasons_id_seq OWNER TO lareb;

--
-- Name: spree_store_credit_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_credit_reasons_id_seq OWNED BY public.spree_store_credit_reasons.id;


--
-- Name: spree_store_credit_types; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_credit_types (
    id integer NOT NULL,
    name character varying,
    priority integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_store_credit_types OWNER TO lareb;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_credit_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_types_id_seq OWNER TO lareb;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_credit_types_id_seq OWNED BY public.spree_store_credit_types.id;


--
-- Name: spree_store_credits; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_credits (
    id integer NOT NULL,
    user_id integer,
    category_id integer,
    created_by_id integer,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_used numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_authorized numeric(8,2) DEFAULT 0.0 NOT NULL,
    currency character varying,
    memo text,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    type_id integer,
    invalidated_at timestamp without time zone
);


ALTER TABLE public.spree_store_credits OWNER TO lareb;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credits_id_seq OWNER TO lareb;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_credits_id_seq OWNED BY public.spree_store_credits.id;


--
-- Name: spree_store_payment_methods; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_payment_methods (
    id integer NOT NULL,
    store_id integer NOT NULL,
    payment_method_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_store_payment_methods OWNER TO lareb;

--
-- Name: spree_store_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_payment_methods_id_seq OWNER TO lareb;

--
-- Name: spree_store_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_payment_methods_id_seq OWNED BY public.spree_store_payment_methods.id;


--
-- Name: spree_store_shipping_methods; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_store_shipping_methods (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    shipping_method_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_store_shipping_methods OWNER TO lareb;

--
-- Name: spree_store_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_store_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_shipping_methods_id_seq OWNER TO lareb;

--
-- Name: spree_store_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_store_shipping_methods_id_seq OWNED BY public.spree_store_shipping_methods.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_stores (
    id integer NOT NULL,
    name character varying,
    url character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying,
    mail_from_address character varying,
    default_currency character varying,
    code character varying,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    cart_tax_country_iso character varying,
    available_locales character varying
);


ALTER TABLE public.spree_stores OWNER TO lareb;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stores_id_seq OWNER TO lareb;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_stores_id_seq OWNED BY public.spree_stores.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_tax_categories (
    id integer NOT NULL,
    name character varying,
    description character varying,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    tax_code character varying
);


ALTER TABLE public.spree_tax_categories OWNER TO lareb;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_categories_id_seq OWNER TO lareb;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_tax_categories_id_seq OWNED BY public.spree_tax_categories.id;


--
-- Name: spree_tax_rate_tax_categories; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_tax_rate_tax_categories (
    id integer NOT NULL,
    tax_category_id integer NOT NULL,
    tax_rate_id integer NOT NULL
);


ALTER TABLE public.spree_tax_rate_tax_categories OWNER TO lareb;

--
-- Name: spree_tax_rate_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_tax_rate_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_rate_tax_categories_id_seq OWNER TO lareb;

--
-- Name: spree_tax_rate_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_tax_rate_tax_categories_id_seq OWNED BY public.spree_tax_rate_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    included_in_price boolean DEFAULT false,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    name character varying,
    show_rate_in_label boolean DEFAULT true,
    deleted_at timestamp without time zone,
    starts_at timestamp without time zone,
    expires_at timestamp without time zone
);


ALTER TABLE public.spree_tax_rates OWNER TO lareb;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_rates_id_seq OWNER TO lareb;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_tax_rates_id_seq OWNED BY public.spree_tax_rates.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_taxonomies (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_taxonomies OWNER TO lareb;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxonomies_id_seq OWNER TO lareb;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_taxonomies_id_seq OWNED BY public.spree_taxonomies.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying NOT NULL,
    permalink character varying,
    taxonomy_id integer,
    lft integer,
    rgt integer,
    icon_file_name character varying,
    icon_content_type character varying,
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    depth integer
);


ALTER TABLE public.spree_taxons OWNER TO lareb;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxons_id_seq OWNER TO lareb;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_taxons_id_seq OWNED BY public.spree_taxons.id;


--
-- Name: spree_unit_cancels; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_unit_cancels (
    id integer NOT NULL,
    inventory_unit_id integer NOT NULL,
    reason character varying,
    created_by character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_unit_cancels OWNER TO lareb;

--
-- Name: spree_unit_cancels_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_unit_cancels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_unit_cancels_id_seq OWNER TO lareb;

--
-- Name: spree_unit_cancels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_unit_cancels_id_seq OWNED BY public.spree_unit_cancels.id;


--
-- Name: spree_user_addresses; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_user_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL,
    "default" boolean DEFAULT false,
    archived boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_user_addresses OWNER TO lareb;

--
-- Name: spree_user_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_user_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_user_addresses_id_seq OWNER TO lareb;

--
-- Name: spree_user_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_user_addresses_id_seq OWNED BY public.spree_user_addresses.id;


--
-- Name: spree_user_stock_locations; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_user_stock_locations (
    id integer NOT NULL,
    user_id integer,
    stock_location_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_user_stock_locations OWNER TO lareb;

--
-- Name: spree_user_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_user_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_user_stock_locations_id_seq OWNER TO lareb;

--
-- Name: spree_user_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_user_stock_locations_id_seq OWNED BY public.spree_user_stock_locations.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_users (
    id integer NOT NULL,
    encrypted_password character varying(128),
    password_salt character varying(128),
    email character varying,
    remember_token character varying,
    persistence_token character varying,
    reset_password_token character varying,
    perishable_token character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    login character varying,
    ship_address_id integer,
    bill_address_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    spree_api_key character varying(48),
    authentication_token character varying,
    unlock_token character varying,
    locked_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    deleted_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE public.spree_users OWNER TO lareb;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_users_id_seq OWNER TO lareb;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_users_id_seq OWNED BY public.spree_users.id;


--
-- Name: spree_variant_property_rule_conditions; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_variant_property_rule_conditions (
    id integer NOT NULL,
    option_value_id integer,
    variant_property_rule_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_variant_property_rule_conditions OWNER TO lareb;

--
-- Name: spree_variant_property_rule_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_variant_property_rule_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variant_property_rule_conditions_id_seq OWNER TO lareb;

--
-- Name: spree_variant_property_rule_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_variant_property_rule_conditions_id_seq OWNED BY public.spree_variant_property_rule_conditions.id;


--
-- Name: spree_variant_property_rule_values; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_variant_property_rule_values (
    id integer NOT NULL,
    value text,
    "position" integer DEFAULT 0,
    property_id integer,
    variant_property_rule_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_variant_property_rule_values OWNER TO lareb;

--
-- Name: spree_variant_property_rule_values_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_variant_property_rule_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variant_property_rule_values_id_seq OWNER TO lareb;

--
-- Name: spree_variant_property_rule_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_variant_property_rule_values_id_seq OWNED BY public.spree_variant_property_rule_values.id;


--
-- Name: spree_variant_property_rules; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_variant_property_rules (
    id integer NOT NULL,
    product_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_variant_property_rules OWNER TO lareb;

--
-- Name: spree_variant_property_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_variant_property_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variant_property_rules_id_seq OWNER TO lareb;

--
-- Name: spree_variant_property_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_variant_property_rules_id_seq OWNED BY public.spree_variant_property_rules.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_variants (
    id integer NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    cost_price numeric(10,2),
    "position" integer,
    cost_currency character varying,
    track_inventory boolean DEFAULT true,
    tax_category_id integer,
    updated_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.spree_variants OWNER TO lareb;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variants_id_seq OWNER TO lareb;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_variants_id_seq OWNED BY public.spree_variants.id;


--
-- Name: spree_wallet_payment_sources; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_wallet_payment_sources (
    id integer NOT NULL,
    user_id integer NOT NULL,
    payment_source_type character varying NOT NULL,
    payment_source_id integer NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_wallet_payment_sources OWNER TO lareb;

--
-- Name: spree_wallet_payment_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_wallet_payment_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_wallet_payment_sources_id_seq OWNER TO lareb;

--
-- Name: spree_wallet_payment_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_wallet_payment_sources_id_seq OWNED BY public.spree_wallet_payment_sources.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_zone_members (
    id integer NOT NULL,
    zoneable_type character varying,
    zoneable_id integer,
    zone_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_zone_members OWNER TO lareb;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zone_members_id_seq OWNER TO lareb;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_zone_members_id_seq OWNED BY public.spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: lareb
--

CREATE TABLE public.spree_zones (
    id integer NOT NULL,
    name character varying,
    description character varying,
    zone_members_count integer DEFAULT 0,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.spree_zones OWNER TO lareb;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: lareb
--

CREATE SEQUENCE public.spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zones_id_seq OWNER TO lareb;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lareb
--

ALTER SEQUENCE public.spree_zones_id_seq OWNED BY public.spree_zones.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: spree_addresses id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_addresses ALTER COLUMN id SET DEFAULT nextval('public.spree_addresses_id_seq'::regclass);


--
-- Name: spree_adjustment_reasons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_adjustment_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_adjustment_reasons_id_seq'::regclass);


--
-- Name: spree_adjustments id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_adjustments ALTER COLUMN id SET DEFAULT nextval('public.spree_adjustments_id_seq'::regclass);


--
-- Name: spree_assets id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_assets ALTER COLUMN id SET DEFAULT nextval('public.spree_assets_id_seq'::regclass);


--
-- Name: spree_calculators id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_calculators ALTER COLUMN id SET DEFAULT nextval('public.spree_calculators_id_seq'::regclass);


--
-- Name: spree_cartons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_cartons ALTER COLUMN id SET DEFAULT nextval('public.spree_cartons_id_seq'::regclass);


--
-- Name: spree_countries id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_countries ALTER COLUMN id SET DEFAULT nextval('public.spree_countries_id_seq'::regclass);


--
-- Name: spree_credit_cards id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('public.spree_credit_cards_id_seq'::regclass);


--
-- Name: spree_customer_returns id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('public.spree_customer_returns_id_seq'::regclass);


--
-- Name: spree_inventory_units id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('public.spree_inventory_units_id_seq'::regclass);


--
-- Name: spree_line_item_actions id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_line_item_actions ALTER COLUMN id SET DEFAULT nextval('public.spree_line_item_actions_id_seq'::regclass);


--
-- Name: spree_line_items id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_line_items_id_seq'::regclass);


--
-- Name: spree_log_entries id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_log_entries ALTER COLUMN id SET DEFAULT nextval('public.spree_log_entries_id_seq'::regclass);


--
-- Name: spree_option_type_prototypes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_type_prototypes ALTER COLUMN id SET DEFAULT nextval('public.spree_option_type_prototypes_id_seq'::regclass);


--
-- Name: spree_option_types id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_types ALTER COLUMN id SET DEFAULT nextval('public.spree_option_types_id_seq'::regclass);


--
-- Name: spree_option_values id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_values ALTER COLUMN id SET DEFAULT nextval('public.spree_option_values_id_seq'::regclass);


--
-- Name: spree_option_values_variants id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_values_variants ALTER COLUMN id SET DEFAULT nextval('public.spree_option_values_variants_id_seq'::regclass);


--
-- Name: spree_order_mutexes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_order_mutexes ALTER COLUMN id SET DEFAULT nextval('public.spree_order_mutexes_id_seq'::regclass);


--
-- Name: spree_orders id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_orders ALTER COLUMN id SET DEFAULT nextval('public.spree_orders_id_seq'::regclass);


--
-- Name: spree_orders_promotions id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_orders_promotions ALTER COLUMN id SET DEFAULT nextval('public.spree_orders_promotions_id_seq'::regclass);


--
-- Name: spree_payment_capture_events id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_capture_events_id_seq'::regclass);


--
-- Name: spree_payment_methods id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_methods_id_seq'::regclass);


--
-- Name: spree_payments id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_payments ALTER COLUMN id SET DEFAULT nextval('public.spree_payments_id_seq'::regclass);


--
-- Name: spree_preferences id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_preferences ALTER COLUMN id SET DEFAULT nextval('public.spree_preferences_id_seq'::regclass);


--
-- Name: spree_prices id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_prices ALTER COLUMN id SET DEFAULT nextval('public.spree_prices_id_seq'::regclass);


--
-- Name: spree_product_option_types id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('public.spree_product_option_types_id_seq'::regclass);


--
-- Name: spree_product_promotion_rules id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_product_promotion_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_product_promotion_rules_id_seq'::regclass);


--
-- Name: spree_product_properties id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_product_properties ALTER COLUMN id SET DEFAULT nextval('public.spree_product_properties_id_seq'::regclass);


--
-- Name: spree_products id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_products ALTER COLUMN id SET DEFAULT nextval('public.spree_products_id_seq'::regclass);


--
-- Name: spree_products_taxons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_products_taxons ALTER COLUMN id SET DEFAULT nextval('public.spree_products_taxons_id_seq'::regclass);


--
-- Name: spree_promotion_action_line_items id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: spree_promotion_actions id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_actions_id_seq'::regclass);


--
-- Name: spree_promotion_categories id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_categories_id_seq'::regclass);


--
-- Name: spree_promotion_code_batches id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_code_batches ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_code_batches_id_seq'::regclass);


--
-- Name: spree_promotion_codes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_codes ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_codes_id_seq'::regclass);


--
-- Name: spree_promotion_rule_taxons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rule_taxons ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rule_taxons_id_seq'::regclass);


--
-- Name: spree_promotion_rules id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rules_id_seq'::regclass);


--
-- Name: spree_promotion_rules_stores id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rules_stores ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rules_stores_id_seq'::regclass);


--
-- Name: spree_promotion_rules_users id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rules_users ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rules_users_id_seq'::regclass);


--
-- Name: spree_promotions id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotions ALTER COLUMN id SET DEFAULT nextval('public.spree_promotions_id_seq'::regclass);


--
-- Name: spree_properties id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_properties ALTER COLUMN id SET DEFAULT nextval('public.spree_properties_id_seq'::regclass);


--
-- Name: spree_property_prototypes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_property_prototypes ALTER COLUMN id SET DEFAULT nextval('public.spree_property_prototypes_id_seq'::regclass);


--
-- Name: spree_prototype_taxons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_prototype_taxons ALTER COLUMN id SET DEFAULT nextval('public.spree_prototype_taxons_id_seq'::regclass);


--
-- Name: spree_prototypes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_prototypes ALTER COLUMN id SET DEFAULT nextval('public.spree_prototypes_id_seq'::regclass);


--
-- Name: spree_refund_reasons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_refund_reasons_id_seq'::regclass);


--
-- Name: spree_refunds id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_refunds ALTER COLUMN id SET DEFAULT nextval('public.spree_refunds_id_seq'::regclass);


--
-- Name: spree_reimbursement_credits id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('public.spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: spree_reimbursement_types id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('public.spree_reimbursement_types_id_seq'::regclass);


--
-- Name: spree_reimbursements id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('public.spree_reimbursements_id_seq'::regclass);


--
-- Name: spree_return_authorizations id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('public.spree_return_authorizations_id_seq'::regclass);


--
-- Name: spree_return_items id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_return_items ALTER COLUMN id SET DEFAULT nextval('public.spree_return_items_id_seq'::regclass);


--
-- Name: spree_return_reasons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_return_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_return_reasons_id_seq'::regclass);


--
-- Name: spree_roles id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_roles ALTER COLUMN id SET DEFAULT nextval('public.spree_roles_id_seq'::regclass);


--
-- Name: spree_roles_users id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_roles_users ALTER COLUMN id SET DEFAULT nextval('public.spree_roles_users_id_seq'::regclass);


--
-- Name: spree_shipments id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipments ALTER COLUMN id SET DEFAULT nextval('public.spree_shipments_id_seq'::regclass);


--
-- Name: spree_shipping_categories id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_categories_id_seq'::regclass);


--
-- Name: spree_shipping_method_categories id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: spree_shipping_method_stock_locations id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_method_stock_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_method_stock_locations_id_seq'::regclass);


--
-- Name: spree_shipping_method_zones id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_method_zones ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_method_zones_id_seq'::regclass);


--
-- Name: spree_shipping_methods id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_methods_id_seq'::regclass);


--
-- Name: spree_shipping_rate_taxes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_rate_taxes ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_rate_taxes_id_seq'::regclass);


--
-- Name: spree_shipping_rates id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_rates ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_rates_id_seq'::regclass);


--
-- Name: spree_state_changes id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_state_changes ALTER COLUMN id SET DEFAULT nextval('public.spree_state_changes_id_seq'::regclass);


--
-- Name: spree_states id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_states ALTER COLUMN id SET DEFAULT nextval('public.spree_states_id_seq'::regclass);


--
-- Name: spree_stock_items id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stock_items ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_items_id_seq'::regclass);


--
-- Name: spree_stock_locations id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_locations_id_seq'::regclass);


--
-- Name: spree_stock_movements id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_movements_id_seq'::regclass);


--
-- Name: spree_store_credit_categories id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_categories_id_seq'::regclass);


--
-- Name: spree_store_credit_events id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_events ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_events_id_seq'::regclass);


--
-- Name: spree_store_credit_reasons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_reasons_id_seq'::regclass);


--
-- Name: spree_store_credit_types id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_types ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_types_id_seq'::regclass);


--
-- Name: spree_store_credits id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credits ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credits_id_seq'::regclass);


--
-- Name: spree_store_payment_methods id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.spree_store_payment_methods_id_seq'::regclass);


--
-- Name: spree_store_shipping_methods id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_shipping_methods ALTER COLUMN id SET DEFAULT nextval('public.spree_store_shipping_methods_id_seq'::regclass);


--
-- Name: spree_stores id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stores ALTER COLUMN id SET DEFAULT nextval('public.spree_stores_id_seq'::regclass);


--
-- Name: spree_tax_categories id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_categories_id_seq'::regclass);


--
-- Name: spree_tax_rate_tax_categories id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_rate_tax_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_rate_tax_categories_id_seq'::regclass);


--
-- Name: spree_tax_rates id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_rates_id_seq'::regclass);


--
-- Name: spree_taxonomies id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('public.spree_taxonomies_id_seq'::regclass);


--
-- Name: spree_taxons id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_taxons ALTER COLUMN id SET DEFAULT nextval('public.spree_taxons_id_seq'::regclass);


--
-- Name: spree_unit_cancels id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_unit_cancels ALTER COLUMN id SET DEFAULT nextval('public.spree_unit_cancels_id_seq'::regclass);


--
-- Name: spree_user_addresses id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_user_addresses ALTER COLUMN id SET DEFAULT nextval('public.spree_user_addresses_id_seq'::regclass);


--
-- Name: spree_user_stock_locations id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_user_stock_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_user_stock_locations_id_seq'::regclass);


--
-- Name: spree_users id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_users ALTER COLUMN id SET DEFAULT nextval('public.spree_users_id_seq'::regclass);


--
-- Name: spree_variant_property_rule_conditions id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variant_property_rule_conditions ALTER COLUMN id SET DEFAULT nextval('public.spree_variant_property_rule_conditions_id_seq'::regclass);


--
-- Name: spree_variant_property_rule_values id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variant_property_rule_values ALTER COLUMN id SET DEFAULT nextval('public.spree_variant_property_rule_values_id_seq'::regclass);


--
-- Name: spree_variant_property_rules id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variant_property_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_variant_property_rules_id_seq'::regclass);


--
-- Name: spree_variants id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variants ALTER COLUMN id SET DEFAULT nextval('public.spree_variants_id_seq'::regclass);


--
-- Name: spree_wallet_payment_sources id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_wallet_payment_sources ALTER COLUMN id SET DEFAULT nextval('public.spree_wallet_payment_sources_id_seq'::regclass);


--
-- Name: spree_zone_members id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_zone_members ALTER COLUMN id SET DEFAULT nextval('public.spree_zone_members_id_seq'::regclass);


--
-- Name: spree_zones id; Type: DEFAULT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_zones ALTER COLUMN id SET DEFAULT nextval('public.spree_zones_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: spree_addresses spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustment_reasons spree_adjustment_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_adjustment_reasons
    ADD CONSTRAINT spree_adjustment_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_assets spree_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_assets
    ADD CONSTRAINT spree_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_cartons spree_cartons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_cartons
    ADD CONSTRAINT spree_cartons_pkey PRIMARY KEY (id);


--
-- Name: spree_countries spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_inventory_units spree_inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_inventory_units
    ADD CONSTRAINT spree_inventory_units_pkey PRIMARY KEY (id);


--
-- Name: spree_line_item_actions spree_line_item_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_line_item_actions
    ADD CONSTRAINT spree_line_item_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_prototypes spree_option_type_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_type_prototypes
    ADD CONSTRAINT spree_option_type_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_variants spree_option_values_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_option_values_variants
    ADD CONSTRAINT spree_option_values_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_order_mutexes spree_order_mutexes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_order_mutexes
    ADD CONSTRAINT spree_order_mutexes_pkey PRIMARY KEY (id);


--
-- Name: spree_orders spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_promotions spree_orders_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_orders_promotions
    ADD CONSTRAINT spree_orders_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payments spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_prices spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_promotion_rules spree_product_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_product_promotion_rules
    ADD CONSTRAINT spree_product_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_product_properties spree_product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_product_properties
    ADD CONSTRAINT spree_product_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_products spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_taxons spree_products_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_products_taxons
    ADD CONSTRAINT spree_products_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_code_batches spree_promotion_code_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_code_batches
    ADD CONSTRAINT spree_promotion_code_batches_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_codes spree_promotion_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_codes
    ADD CONSTRAINT spree_promotion_codes_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rule_taxons spree_promotion_rule_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rule_taxons
    ADD CONSTRAINT spree_promotion_rule_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_stores spree_promotion_rules_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rules_stores
    ADD CONSTRAINT spree_promotion_rules_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_users spree_promotion_rules_users_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_rules_users
    ADD CONSTRAINT spree_promotion_rules_users_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_properties spree_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_properties
    ADD CONSTRAINT spree_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_property_prototypes spree_property_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_property_prototypes
    ADD CONSTRAINT spree_property_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_prototype_taxons spree_prototype_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_prototype_taxons
    ADD CONSTRAINT spree_prototype_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_prototypes spree_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_prototypes
    ADD CONSTRAINT spree_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_return_reasons spree_return_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_return_reasons
    ADD CONSTRAINT spree_return_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_roles spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_users spree_roles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_roles_users
    ADD CONSTRAINT spree_roles_users_pkey PRIMARY KEY (id);


--
-- Name: spree_shipments spree_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipments
    ADD CONSTRAINT spree_shipments_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_categories spree_shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_categories
    ADD CONSTRAINT spree_shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_stock_locations spree_shipping_method_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_method_stock_locations
    ADD CONSTRAINT spree_shipping_method_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_zones spree_shipping_method_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_method_zones
    ADD CONSTRAINT spree_shipping_method_zones_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_methods spree_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_methods
    ADD CONSTRAINT spree_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rate_taxes spree_shipping_rate_taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_rate_taxes
    ADD CONSTRAINT spree_shipping_rate_taxes_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rates spree_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_shipping_rates
    ADD CONSTRAINT spree_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_items spree_stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stock_items
    ADD CONSTRAINT spree_stock_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_categories spree_store_credit_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_categories
    ADD CONSTRAINT spree_store_credit_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_events spree_store_credit_events_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_events
    ADD CONSTRAINT spree_store_credit_events_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_reasons spree_store_credit_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_reasons
    ADD CONSTRAINT spree_store_credit_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_types spree_store_credit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credit_types
    ADD CONSTRAINT spree_store_credit_types_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credits spree_store_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_credits
    ADD CONSTRAINT spree_store_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_store_payment_methods spree_store_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_payment_methods
    ADD CONSTRAINT spree_store_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_store_shipping_methods spree_store_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_store_shipping_methods
    ADD CONSTRAINT spree_store_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_stores spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rate_tax_categories spree_tax_rate_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_rate_tax_categories
    ADD CONSTRAINT spree_tax_rate_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons spree_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_taxons
    ADD CONSTRAINT spree_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_unit_cancels spree_unit_cancels_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_unit_cancels
    ADD CONSTRAINT spree_unit_cancels_pkey PRIMARY KEY (id);


--
-- Name: spree_user_addresses spree_user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_user_addresses
    ADD CONSTRAINT spree_user_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_user_stock_locations spree_user_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_user_stock_locations
    ADD CONSTRAINT spree_user_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_users spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_property_rule_conditions spree_variant_property_rule_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variant_property_rule_conditions
    ADD CONSTRAINT spree_variant_property_rule_conditions_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_property_rule_values spree_variant_property_rule_values_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variant_property_rule_values
    ADD CONSTRAINT spree_variant_property_rule_values_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_property_rules spree_variant_property_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variant_property_rules
    ADD CONSTRAINT spree_variant_property_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_variants spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_wallet_payment_sources spree_wallet_payment_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_wallet_payment_sources
    ADD CONSTRAINT spree_wallet_payment_sources_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: lareb
--

-- -- CREATE UNIQUE INDEX email_idx_unique ON public.spree_users USING btree (email);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: lareb
--

-- -- CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: lareb
--

-- -- CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_addresses_on_firstname ON public.spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_addresses_on_lastname ON public.spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_adjustments_on_order_id ON public.spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_assets_on_viewable_id ON public.spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_assets_on_viewable_type_and_type ON public.spree_assets USING btree (viewable_type, type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_inventory_units_on_shipment_id ON public.spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_inventory_units_on_variant_id ON public.spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON public.spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_product_properties_on_product_id ON public.spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_products_promotion_rules_on_product_id ON public.spree_product_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON public.spree_product_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_promotion_rules_on_product_group_id ON public.spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON public.spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_promotion_rules_users_on_user_id ON public.spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_refunds_on_refund_reason_id ON public.spree_refunds USING btree (refund_reason_id);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON public.spree_return_authorizations USING btree (return_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_return_items_on_customer_return_id ON public.spree_return_items USING btree (customer_return_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_shipments_on_number ON public.spree_shipments USING btree (number);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_addresses_on_country_id ON public.spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_addresses_on_state_id ON public.spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustment_reasons_on_active; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustment_reasons_on_active ON public.spree_adjustment_reasons USING btree (active);


--
-- Name: index_spree_adjustment_reasons_on_code; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustment_reasons_on_code ON public.spree_adjustment_reasons USING btree (code);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON public.spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustments_on_eligible ON public.spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustments_on_order_id ON public.spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_promotion_code_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustments_on_promotion_code_id ON public.spree_adjustments USING btree (promotion_code_id);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON public.spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON public.spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_calculators_on_id_and_type ON public.spree_calculators USING btree (id, type);


--
-- Name: index_spree_cartons_on_external_number; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_cartons_on_external_number ON public.spree_cartons USING btree (external_number);


--
-- Name: index_spree_cartons_on_imported_from_shipment_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_cartons_on_imported_from_shipment_id ON public.spree_cartons USING btree (imported_from_shipment_id);


--
-- Name: index_spree_cartons_on_number; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_cartons_on_number ON public.spree_cartons USING btree (number);


--
-- Name: index_spree_cartons_on_stock_location_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_cartons_on_stock_location_id ON public.spree_cartons USING btree (stock_location_id);


--
-- Name: index_spree_countries_on_iso; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_countries_on_iso ON public.spree_countries USING btree (iso);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_credit_cards_on_payment_method_id ON public.spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_credit_cards_on_user_id ON public.spree_credit_cards USING btree (user_id);


--
-- Name: index_spree_inventory_units_on_carton_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_inventory_units_on_carton_id ON public.spree_inventory_units USING btree (carton_id);


--
-- Name: index_spree_inventory_units_on_line_item_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_inventory_units_on_line_item_id ON public.spree_inventory_units USING btree (line_item_id);


--
-- Name: index_spree_line_item_actions_on_action_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_line_item_actions_on_action_id ON public.spree_line_item_actions USING btree (action_id);


--
-- Name: index_spree_line_item_actions_on_line_item_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_line_item_actions_on_line_item_id ON public.spree_line_item_actions USING btree (line_item_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_line_items_on_order_id ON public.spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_line_items_on_variant_id ON public.spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON public.spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_option_types_on_position ON public.spree_option_types USING btree ("position");


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_option_values_on_option_type_id ON public.spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_option_values_on_position ON public.spree_option_values USING btree ("position");


--
-- Name: index_spree_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_option_values_variants_on_variant_id ON public.spree_option_values_variants USING btree (variant_id);


--
-- Name: index_spree_order_mutexes_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_order_mutexes_on_order_id ON public.spree_order_mutexes USING btree (order_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_approver_id ON public.spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_bill_address_id ON public.spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_completed_at ON public.spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_created_by_id ON public.spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_guest_token; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_guest_token ON public.spree_orders USING btree (guest_token);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_number ON public.spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_ship_address_id ON public.spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_user_id ON public.spree_orders USING btree (user_id);


--
-- Name: index_spree_orders_on_user_id_and_created_by_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_on_user_id_and_created_by_id ON public.spree_orders USING btree (user_id, created_by_id);


--
-- Name: index_spree_orders_promotions_on_order_id_and_promotion_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_promotions_on_order_id_and_promotion_id ON public.spree_orders_promotions USING btree (order_id, promotion_id);


--
-- Name: index_spree_orders_promotions_on_promotion_code_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_orders_promotions_on_promotion_code_id ON public.spree_orders_promotions USING btree (promotion_code_id);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_payment_capture_events_on_payment_id ON public.spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_payment_methods_on_id_and_type ON public.spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payments_on_number; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_payments_on_number ON public.spree_payments USING btree (number);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_payments_on_order_id ON public.spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_payments_on_payment_method_id ON public.spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_payments_on_source_id_and_source_type ON public.spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_preferences_on_key ON public.spree_preferences USING btree (key);


--
-- Name: index_spree_prices_on_country_iso; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_prices_on_country_iso ON public.spree_prices USING btree (country_iso);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_prices_on_variant_id_and_currency ON public.spree_prices USING btree (variant_id, currency);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_product_option_types_on_option_type_id ON public.spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_product_option_types_on_position ON public.spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_product_option_types_on_product_id ON public.spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_properties_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_product_properties_on_position ON public.spree_product_properties USING btree ("position");


--
-- Name: index_spree_product_properties_on_property_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_product_properties_on_property_id ON public.spree_product_properties USING btree (property_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_products_on_available_on ON public.spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_products_on_deleted_at ON public.spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_products_on_name ON public.spree_products USING btree (name);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_products_on_slug ON public.spree_products USING btree (slug);


--
-- Name: index_spree_products_taxons_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_products_taxons_on_position ON public.spree_products_taxons USING btree ("position");


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_products_taxons_on_product_id ON public.spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_products_taxons_on_taxon_id ON public.spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON public.spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON public.spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_actions_on_deleted_at ON public.spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_actions_on_id_and_type ON public.spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_actions_on_promotion_id ON public.spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_code_batches_on_promotion_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_code_batches_on_promotion_id ON public.spree_promotion_code_batches USING btree (promotion_id);


--
-- Name: index_spree_promotion_codes_on_promotion_code_batch_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_codes_on_promotion_code_batch_id ON public.spree_promotion_codes USING btree (promotion_code_batch_id);


--
-- Name: index_spree_promotion_codes_on_promotion_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_codes_on_promotion_id ON public.spree_promotion_codes USING btree (promotion_id);


--
-- Name: index_spree_promotion_codes_on_value; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_promotion_codes_on_value ON public.spree_promotion_codes USING btree (value);


--
-- Name: index_spree_promotion_rule_taxons_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_rule_taxons_on_promotion_rule_id ON public.spree_promotion_rule_taxons USING btree (promotion_rule_id);


--
-- Name: index_spree_promotion_rule_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_rule_taxons_on_taxon_id ON public.spree_promotion_rule_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_rules_on_promotion_id ON public.spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotion_rules_stores_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_rules_stores_on_promotion_rule_id ON public.spree_promotion_rules_stores USING btree (promotion_rule_id);


--
-- Name: index_spree_promotion_rules_stores_on_store_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotion_rules_stores_on_store_id ON public.spree_promotion_rules_stores USING btree (store_id);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotions_on_advertise ON public.spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_apply_automatically; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotions_on_apply_automatically ON public.spree_promotions USING btree (apply_automatically);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotions_on_expires_at ON public.spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotions_on_id_and_type ON public.spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotions_on_promotion_category_id ON public.spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_promotions_on_starts_at ON public.spree_promotions USING btree (starts_at);


--
-- Name: index_spree_prototype_taxons_on_prototype_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_prototype_taxons_on_prototype_id ON public.spree_prototype_taxons USING btree (prototype_id);


--
-- Name: index_spree_prototype_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_prototype_taxons_on_taxon_id ON public.spree_prototype_taxons USING btree (taxon_id);


--
-- Name: index_spree_refunds_on_payment_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_refunds_on_payment_id ON public.spree_refunds USING btree (payment_id);


--
-- Name: index_spree_refunds_on_reimbursement_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_refunds_on_reimbursement_id ON public.spree_refunds USING btree (reimbursement_id);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_reimbursement_types_on_type ON public.spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_reimbursements_on_customer_return_id ON public.spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_reimbursements_on_order_id ON public.spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_return_items_on_exchange_inventory_unit_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_return_items_on_exchange_inventory_unit_id ON public.spree_return_items USING btree (exchange_inventory_unit_id);


--
-- Name: index_spree_roles_on_name; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_roles_on_name ON public.spree_roles USING btree (name);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_roles_users_on_role_id ON public.spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_roles_users_on_user_id ON public.spree_roles_users USING btree (user_id);


--
-- Name: index_spree_roles_users_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_roles_users_on_user_id_and_role_id ON public.spree_roles_users USING btree (user_id, role_id);


--
-- Name: index_spree_shipments_on_deprecated_address_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipments_on_deprecated_address_id ON public.spree_shipments USING btree (deprecated_address_id);


--
-- Name: index_spree_shipments_on_order_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipments_on_order_id ON public.spree_shipments USING btree (order_id);


--
-- Name: index_spree_shipments_on_stock_location_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipments_on_stock_location_id ON public.spree_shipments USING btree (stock_location_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON public.spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_shipping_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipping_methods_on_tax_category_id ON public.spree_shipping_methods USING btree (tax_category_id);


--
-- Name: index_spree_shipping_rate_taxes_on_shipping_rate_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipping_rate_taxes_on_shipping_rate_id ON public.spree_shipping_rate_taxes USING btree (shipping_rate_id);


--
-- Name: index_spree_shipping_rate_taxes_on_tax_rate_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_shipping_rate_taxes_on_tax_rate_id ON public.spree_shipping_rate_taxes USING btree (tax_rate_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON public.spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_state_changes_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_state_changes_on_user_id ON public.spree_state_changes USING btree (user_id);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_states_on_country_id ON public.spree_states USING btree (country_id);


--
-- Name: index_spree_stock_items_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stock_items_on_deleted_at ON public.spree_stock_items USING btree (deleted_at);


--
-- Name: index_spree_stock_items_on_stock_location_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stock_items_on_stock_location_id ON public.spree_stock_items USING btree (stock_location_id);


--
-- Name: index_spree_stock_items_on_variant_id_and_stock_location_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_stock_items_on_variant_id_and_stock_location_id ON public.spree_stock_items USING btree (variant_id, stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stock_locations_on_country_id ON public.spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stock_locations_on_state_id ON public.spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_movements_on_stock_item_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stock_movements_on_stock_item_id ON public.spree_stock_movements USING btree (stock_item_id);


--
-- Name: index_spree_store_credit_events_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_credit_events_on_deleted_at ON public.spree_store_credit_events USING btree (deleted_at);


--
-- Name: index_spree_store_credit_events_on_store_credit_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_credit_events_on_store_credit_id ON public.spree_store_credit_events USING btree (store_credit_id);


--
-- Name: index_spree_store_credit_types_on_priority; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_credit_types_on_priority ON public.spree_store_credit_types USING btree (priority);


--
-- Name: index_spree_store_credits_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_credits_on_deleted_at ON public.spree_store_credits USING btree (deleted_at);


--
-- Name: index_spree_store_credits_on_type_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_credits_on_type_id ON public.spree_store_credits USING btree (type_id);


--
-- Name: index_spree_store_credits_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_credits_on_user_id ON public.spree_store_credits USING btree (user_id);


--
-- Name: index_spree_store_payment_methods_on_payment_method_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_payment_methods_on_payment_method_id ON public.spree_store_payment_methods USING btree (payment_method_id);


--
-- Name: index_spree_store_payment_methods_on_store_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_payment_methods_on_store_id ON public.spree_store_payment_methods USING btree (store_id);


--
-- Name: index_spree_store_shipping_methods_on_shipping_method_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_shipping_methods_on_shipping_method_id ON public.spree_store_shipping_methods USING btree (shipping_method_id);


--
-- Name: index_spree_store_shipping_methods_on_store_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_store_shipping_methods_on_store_id ON public.spree_store_shipping_methods USING btree (store_id);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stores_on_code ON public.spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_stores_on_default ON public.spree_stores USING btree ("default");


--
-- Name: index_spree_tax_rate_tax_categories_on_tax_category_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_tax_rate_tax_categories_on_tax_category_id ON public.spree_tax_rate_tax_categories USING btree (tax_category_id);


--
-- Name: index_spree_tax_rate_tax_categories_on_tax_rate_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_tax_rate_tax_categories_on_tax_rate_id ON public.spree_tax_rate_tax_categories USING btree (tax_rate_id);


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_tax_rates_on_deleted_at ON public.spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_tax_rates_on_zone_id ON public.spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_taxonomies_on_position ON public.spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxons_on_lft; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_taxons_on_lft ON public.spree_taxons USING btree (lft);


--
-- Name: index_spree_taxons_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_taxons_on_position ON public.spree_taxons USING btree ("position");


--
-- Name: index_spree_taxons_on_rgt; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_taxons_on_rgt ON public.spree_taxons USING btree (rgt);


--
-- Name: index_spree_unit_cancels_on_inventory_unit_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_unit_cancels_on_inventory_unit_id ON public.spree_unit_cancels USING btree (inventory_unit_id);


--
-- Name: index_spree_user_addresses_on_address_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_user_addresses_on_address_id ON public.spree_user_addresses USING btree (address_id);


--
-- Name: index_spree_user_addresses_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_user_addresses_on_user_id ON public.spree_user_addresses USING btree (user_id);


--
-- Name: index_spree_user_addresses_on_user_id_and_address_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_user_addresses_on_user_id_and_address_id ON public.spree_user_addresses USING btree (user_id, address_id);


--
-- Name: index_spree_user_stock_locations_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_user_stock_locations_on_user_id ON public.spree_user_stock_locations USING btree (user_id);


--
-- Name: index_spree_users_on_deleted_at; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_users_on_deleted_at ON public.spree_users USING btree (deleted_at);


--
-- Name: index_spree_users_on_reset_password_token_solidus_auth_devise; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_users_on_reset_password_token_solidus_auth_devise ON public.spree_users USING btree (reset_password_token);


--
-- Name: index_spree_users_on_spree_api_key; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_users_on_spree_api_key ON public.spree_users USING btree (spree_api_key);


--
-- Name: index_spree_variant_prop_rule_conditions_on_rule_and_optval; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variant_prop_rule_conditions_on_rule_and_optval ON public.spree_variant_property_rule_conditions USING btree (variant_property_rule_id, option_value_id);


--
-- Name: index_spree_variant_property_rule_values_on_property_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variant_property_rule_values_on_property_id ON public.spree_variant_property_rule_values USING btree (property_id);


--
-- Name: index_spree_variant_property_rule_values_on_rule; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variant_property_rule_values_on_rule ON public.spree_variant_property_rule_values USING btree (variant_property_rule_id);


--
-- Name: index_spree_variant_property_rules_on_product_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variant_property_rules_on_product_id ON public.spree_variant_property_rules USING btree (product_id);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variants_on_position ON public.spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variants_on_product_id ON public.spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variants_on_sku ON public.spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variants_on_tax_category_id ON public.spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_variants_on_track_inventory ON public.spree_variants USING btree (track_inventory);


--
-- Name: index_spree_wallet_payment_sources_on_source_and_user; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX index_spree_wallet_payment_sources_on_source_and_user ON public.spree_wallet_payment_sources USING btree (user_id, payment_source_id, payment_source_type);


--
-- Name: index_spree_wallet_payment_sources_on_user_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_wallet_payment_sources_on_user_id ON public.spree_wallet_payment_sources USING btree (user_id);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_zone_members_on_zone_id ON public.spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_on_zoneable_id_and_zoneable_type; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_spree_zone_members_on_zoneable_id_and_zoneable_type ON public.spree_zone_members USING btree (zoneable_id, zoneable_type);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_taxons_on_parent_id ON public.spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_taxons_on_permalink ON public.spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX index_taxons_on_taxonomy_id ON public.spree_taxons USING btree (taxonomy_id);


--
-- Name: shipping_method_id_spree_sm_sl; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX shipping_method_id_spree_sm_sl ON public.spree_shipping_method_stock_locations USING btree (shipping_method_id);


--
-- Name: spree_shipping_rates_join_index; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX spree_shipping_rates_join_index ON public.spree_shipping_rates USING btree (shipment_id, shipping_method_id);


--
-- Name: sstock_location_id_spree_sm_sl; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX sstock_location_id_spree_sm_sl ON public.spree_shipping_method_stock_locations USING btree (stock_location_id);


--
-- Name: stock_item_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE INDEX stock_item_by_loc_and_var_id ON public.spree_stock_items USING btree (stock_location_id, variant_id);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: lareb
--

-- CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON public.spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


--
-- Name: spree_tax_rate_tax_categories fk_rails_3e6fe87e12; Type: FK CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_rate_tax_categories
    ADD CONSTRAINT fk_rails_3e6fe87e12 FOREIGN KEY (tax_rate_id) REFERENCES public.spree_tax_rates(id);


--
-- Name: spree_tax_rate_tax_categories fk_rails_499313ce8e; Type: FK CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_tax_rate_tax_categories
    ADD CONSTRAINT fk_rails_499313ce8e FOREIGN KEY (tax_category_id) REFERENCES public.spree_tax_categories(id);


--
-- Name: spree_wallet_payment_sources fk_rails_5dd6e027c5; Type: FK CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_wallet_payment_sources
    ADD CONSTRAINT fk_rails_5dd6e027c5 FOREIGN KEY (user_id) REFERENCES public.spree_users(id);


--
-- Name: spree_promotion_code_batches fk_rails_c217102f50; Type: FK CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_code_batches
    ADD CONSTRAINT fk_rails_c217102f50 FOREIGN KEY (promotion_id) REFERENCES public.spree_promotions(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: spree_promotion_codes fk_rails_e306e312d9; Type: FK CONSTRAINT; Schema: public; Owner: lareb
--

ALTER TABLE public.spree_promotion_codes
    ADD CONSTRAINT fk_rails_e306e312d9 FOREIGN KEY (promotion_code_batch_id) REFERENCES public.spree_promotion_code_batches(id);


--
-- PostgreSQL database dump complete
--
