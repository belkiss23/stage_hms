--
-- PostgreSQL database dump
--

\restrict IyU5weguI9z9iRiRp0utCSI3ajLLZ3v1eJGwBN9sJXLZlnm71LuokfhgDH1ZSXK

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.9

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

--
-- Name: analytics; Type: SCHEMA; Schema: -; Owner: belkiss
--

CREATE SCHEMA analytics;


ALTER SCHEMA analytics OWNER TO belkiss;

--
-- Name: replica; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA replica;


ALTER SCHEMA replica OWNER TO postgres;

--
-- Name: source; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA source;


ALTER SCHEMA source OWNER TO postgres;

--
-- Name: warehouse; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA warehouse;


ALTER SCHEMA warehouse OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: absence_declaration; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.absence_declaration (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    _ab_cdc_lsn numeric,
    fk_employee bigint,
    fk_end_date date,
    fk_position bigint,
    fk_department bigint,
    fk_start_date date,
    absent_days_count bigint,
    fk_absence_reason bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    absent_hours_count numeric
);


ALTER TABLE replica.absence_declaration OWNER TO belkiss;

--
-- Name: absence_reason; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.absence_reason (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    _ab_cdc_lsn numeric,
    absence_reason character varying,
    nk_absence_reason bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    supporting_document boolean
);


ALTER TABLE replica.absence_reason OWNER TO belkiss;

--
-- Name: acs_lab_test; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.acs_lab_test (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    code character varying,
    name character varying,
    acs_tat bigint,
    _ab_cdc_lsn numeric,
    contains_formula boolean,
    result_value_type character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.acs_lab_test OWNER TO belkiss;

--
-- Name: acs_lab_test_uom; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.acs_lab_test_uom (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    code character varying,
    name character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.acs_lab_test_uom OWNER TO belkiss;

--
-- Name: acs_laboratory; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.acs_laboratory (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    active boolean,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    is_collection_center boolean
);


ALTER TABLE replica.acs_laboratory OWNER TO belkiss;

--
-- Name: acs_laboratory_request; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.acs_laboratory_request (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    date timestamp without time zone,
    name character varying,
    urgent boolean,
    panel_id bigint,
    total_tat numeric,
    patient_id bigint,
    _ab_cdc_lsn numeric,
    total_price numeric,
    physician_id bigint,
    lab_doctor_id bigint,
    laboratory_id bigint,
    payment_state character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    referring_doctor_id bigint,
    collection_center_id bigint,
    referring_hospital_id bigint
);


ALTER TABLE replica.acs_laboratory_request OWNER TO belkiss;

--
-- Name: acs_laboratory_sample_type; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.acs_laboratory_sample_type (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.acs_laboratory_sample_type OWNER TO belkiss;

--
-- Name: acs_patient_laboratory_sample; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.acs_patient_laboratory_sample (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    date timestamp without time zone,
    name character varying,
    state character varying,
    patient_id bigint,
    request_id bigint,
    _ab_cdc_lsn numeric,
    container_name character varying,
    sample_type_id bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.acs_patient_laboratory_sample OWNER TO belkiss;

--
-- Name: attendance; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.attendance (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    _ab_cdc_lsn numeric,
    fk_employee bigint,
    fk_position bigint,
    worked_hours numeric,
    check_in_time time without time zone,
    fk_department bigint,
    check_out_time time without time zone,
    overtime_hours numeric,
    fk_absence_reason bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.attendance OWNER TO belkiss;

--
-- Name: bank; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.bank (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    bank_fees numeric,
    _ab_cdc_lsn numeric,
    fk_customer bigint,
    fk_supplier bigint,
    cash_in_amount numeric,
    cash_out_amount numeric,
    fk_payment_method bigint,
    transaction_count bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    closing_bank_balance numeric,
    opening_bank_balance numeric,
    fk_financial_transaction_type bigint
);


ALTER TABLE replica.bank OWNER TO belkiss;

--
-- Name: candidature; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.candidature (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    candidate character varying,
    _ab_cdc_lsn numeric,
    fk_position bigint,
    fk_department bigint,
    hiring_status character varying,
    recruiter_name character varying,
    hiring_decision character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.candidature OWNER TO belkiss;

--
-- Name: cash; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.cash (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    _ab_cdc_lsn numeric,
    fk_customer bigint,
    cash_in_amount numeric,
    cash_out_amount numeric,
    fk_payment_method bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    closing_cash_balance numeric,
    opening_cash_balance numeric,
    cash_transaction_count bigint,
    fk_financial_transaction_type bigint
);


ALTER TABLE replica.cash OWNER TO belkiss;

--
-- Name: contract; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.contract (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    salary numeric,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    fk_contract bigint,
    fk_employee bigint,
    fk_end_date date,
    fk_position bigint,
    nk_contract bigint,
    sk_contract bigint,
    fk_start_date date,
    type_contract character varying,
    working_hours numeric,
    status_contract character varying,
    probation_period bigint,
    contract_duration bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.contract OWNER TO belkiss;

--
-- Name: customer; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.customer (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    name character varying,
    email character varying,
    address character varying,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    nk_customer bigint,
    sk_customer character varying,
    bank_account character varying,
    phone_number character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.customer OWNER TO belkiss;

--
-- Name: customer_request; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.customer_request (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_customer bigint,
    total_amount numeric,
    fk_payment_method bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    requested_quantity numeric,
    amount_excluding_tax numeric
);


ALTER TABLE replica.customer_request OWNER TO belkiss;

--
-- Name: delivery; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.delivery (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_customer bigint,
    fk_warehouse bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    delivered_quantity numeric,
    remaining_quantity numeric,
    fk_storage_location bigint
);


ALTER TABLE replica.delivery OWNER TO belkiss;

--
-- Name: department; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.department (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    location character varying,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    description character varying,
    nk_department bigint,
    sk_department bigint,
    name_department character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    manager_department character varying
);


ALTER TABLE replica.department OWNER TO belkiss;

--
-- Name: employee; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.employee (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    cv character varying,
    ccp character varying,
    email character varying,
    address character varying,
    valid_to timestamp without time zone,
    hire_date date,
    birth_date date,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    nk_employee bigint,
    sk_employee bigint,
    phone_number character varying,
    name_employee character varying,
    marital_status character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    social_security_number character varying
);


ALTER TABLE replica.employee OWNER TO belkiss;

--
-- Name: employee_assignment; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.employee_assignment (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    _ab_cdc_lsn numeric,
    fk_employee bigint,
    fk_end_date date,
    fk_position bigint,
    fk_department bigint,
    fk_start_date date,
    assignment_rate numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    assignment_duration bigint
);


ALTER TABLE replica.employee_assignment OWNER TO belkiss;

--
-- Name: financial_transaction_type; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.financial_transaction_type (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    _ab_cdc_lsn numeric,
    transaction_name character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    cash_flow_direction character varying,
    nk_financial_transaction_type bigint
);


ALTER TABLE replica.financial_transaction_type OWNER TO belkiss;

--
-- Name: hms_patient; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.hms_patient (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    email character varying,
    gender character varying,
    mobile character varying,
    address character varying,
    last_name character varying,
    birth_date date,
    first_name character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.hms_patient OWNER TO belkiss;

--
-- Name: hms_physician; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.hms_physician (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    email character varying,
    specialty character varying,
    _ab_cdc_lsn numeric,
    phone_number character varying,
    name_physician character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.hms_physician OWNER TO belkiss;

--
-- Name: inventory; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.inventory (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    quantity numeric,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_warehouse bigint,
    closing_stock numeric,
    opening_stock numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    fk_storage_location bigint,
    fk_inventory_transaction_type bigint
);


ALTER TABLE replica.inventory OWNER TO belkiss;

--
-- Name: inventory_transaction_type; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.inventory_transaction_type (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    transaction_category character varying,
    nk_inventory_transaction_type bigint
);


ALTER TABLE replica.inventory_transaction_type OWNER TO belkiss;

--
-- Name: lab_bilan; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.lab_bilan (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    _ab_cdc_lsn numeric,
    report_header character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.lab_bilan OWNER TO belkiss;

--
-- Name: lab_test_critearea; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.lab_test_critearea (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    remark character varying,
    result character varying,
    test_id bigint,
    printable boolean,
    is_formule boolean,
    lab_uom_id bigint,
    num_result numeric,
    patient_id bigint,
    request_id bigint,
    _ab_cdc_lsn numeric,
    normal_range character varying,
    result_value_type character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    test_criteria_template_id bigint
);


ALTER TABLE replica.lab_test_critearea OWNER TO belkiss;

--
-- Name: lab_test_criteria_template; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.lab_test_criteria_template (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    code character varying,
    name character varying,
    _ab_cdc_lsn numeric,
    apply_range_to character varying,
    result_value_type character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.lab_test_criteria_template OWNER TO belkiss;

--
-- Name: lab_test_normal_range; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.lab_test_normal_range (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    gender character varying,
    age_max bigint,
    age_min bigint,
    age_unit character varying,
    is_formule boolean,
    _ab_cdc_lsn numeric,
    normal_range character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.lab_test_normal_range OWNER TO belkiss;

--
-- Name: lab_unit; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.lab_unit (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    code character varying,
    name character varying,
    col_name character varying,
    col_result character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.lab_unit OWNER TO belkiss;

--
-- Name: laboratory_equipements; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.laboratory_equipements (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    status character varying,
    ip_address character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.laboratory_equipements OWNER TO belkiss;

--
-- Name: laboratory_group; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.laboratory_group (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    method character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.laboratory_group OWNER TO belkiss;

--
-- Name: laboratory_group_line; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.laboratory_group_line (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    test_id bigint,
    panel_id bigint,
    sale_price numeric,
    _ab_cdc_lsn numeric,
    instruction character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.laboratory_group_line OWNER TO belkiss;

--
-- Name: laboratory_request_line; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.laboratory_request_line (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    test_id bigint,
    quantity bigint,
    request_id bigint,
    sale_price numeric,
    _ab_cdc_lsn numeric,
    instruction character varying,
    amount_total numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.laboratory_request_line OWNER TO belkiss;

--
-- Name: leave; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.leave (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    nk_leave bigint,
    leave_type character varying,
    _ab_cdc_lsn numeric,
    request_status character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.leave OWNER TO belkiss;

--
-- Name: leave_request; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.leave_request (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_leave bigint,
    _ab_cdc_lsn numeric,
    fk_employee bigint,
    fk_end_date date,
    fk_position bigint,
    fk_department bigint,
    fk_start_date date,
    leave_days_count bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.leave_request OWNER TO belkiss;

--
-- Name: loan_assignment; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.loan_assignment (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    _ab_cdc_lsn numeric,
    fk_employee bigint,
    fk_end_date date,
    fk_position bigint,
    fk_department bigint,
    fk_start_date date,
    loan_duration bigint,
    fk_loan_status bigint,
    total_loan_amount numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    monthly_payment_amount numeric
);


ALTER TABLE replica.loan_assignment OWNER TO belkiss;

--
-- Name: loan_status; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.loan_status (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    _ab_cdc_lsn numeric,
    loan_status character varying,
    nk_loan_status bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    loan_repayment_status character varying
);


ALTER TABLE replica.loan_status OWNER TO belkiss;

--
-- Name: patient_laboratory_test; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.patient_laboratory_test (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    state character varying,
    report character varying,
    test_id bigint,
    diagnosis character varying,
    equipement bigint,
    patient_id bigint,
    request_id bigint,
    _ab_cdc_lsn numeric,
    main_unit_id bigint,
    physician_id bigint,
    date_analysis timestamp without time zone,
    laboratory_id bigint,
    date_requested timestamp without time zone,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    collection_center_id bigint
);


ALTER TABLE replica.patient_laboratory_test OWNER TO belkiss;

--
-- Name: payment; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.payment (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    _ab_cdc_lsn numeric,
    fk_customer bigint,
    fk_supplier bigint,
    payment_count bigint,
    payment_amount numeric,
    payment_status character varying,
    penalty_amount numeric,
    discount_amount numeric,
    remaining_amount numeric,
    fk_payment_method bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    payment_delay_days bigint,
    fk_financial_transaction_type bigint
);


ALTER TABLE replica.payment OWNER TO belkiss;

--
-- Name: payment_method; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.payment_method (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    _ab_cdc_lsn numeric,
    payment_terms character varying,
    online_payment boolean,
    online_signature boolean,
    nk_payment_method bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.payment_method OWNER TO belkiss;

--
-- Name: payroll; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.payroll (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    bonus numeric,
    fk_date date,
    allowances numeric,
    deductions numeric,
    net_salary numeric,
    _ab_cdc_lsn numeric,
    base_salary numeric,
    fk_contract bigint,
    fk_employee bigint,
    fk_position bigint,
    fk_department bigint,
    fk_loan_status bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.payroll OWNER TO belkiss;

--
-- Name: position; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica."position" (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    base_salary numeric,
    description character varying,
    nk_position bigint,
    sk_position bigint,
    fk_department bigint,
    position_title character varying,
    hierarchy_level bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica."position" OWNER TO belkiss;

--
-- Name: product; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.product (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    category character varying,
    tax_rate numeric,
    valid_to timestamp without time zone,
    packaging character varying,
    cost_price numeric,
    is_current boolean,
    nk_product bigint,
    sk_product character varying,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    description character varying,
    name_product character varying,
    product_type character varying,
    selling_price numeric,
    unit_of_measure character varying,
    reference_product character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    purchase_unit_of_measure character varying
);


ALTER TABLE replica.product OWNER TO belkiss;

--
-- Name: proforma_request; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.proforma_request (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_supplier bigint,
    total_amount numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    requested_quantity numeric,
    amount_excluding_tax numeric
);


ALTER TABLE replica.proforma_request OWNER TO belkiss;

--
-- Name: purchase; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.purchase (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_supplier bigint,
    total_amount numeric,
    ordered_quantity numeric,
    fk_payment_method bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    unit_purchase_price numeric,
    amount_excluding_tax numeric
);


ALTER TABLE replica.purchase OWNER TO belkiss;

--
-- Name: receipt; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.receipt (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_supplier bigint,
    fk_warehouse bigint,
    received_quantity numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    fk_storage_location bigint
);


ALTER TABLE replica.receipt OWNER TO belkiss;

--
-- Name: res_partner; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.res_partner (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    name character varying,
    _ab_cdc_lsn numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.res_partner OWNER TO belkiss;

--
-- Name: sales; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.sales (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    fk_date date,
    fk_product bigint,
    _ab_cdc_lsn numeric,
    fk_customer bigint,
    total_amount numeric,
    profit_margin numeric,
    quantity_sold numeric,
    fk_payment_method bigint,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    unit_selling_price numeric,
    amount_excluding_tax numeric,
    profit_margin_percentage numeric
);


ALTER TABLE replica.sales OWNER TO belkiss;

--
-- Name: storage_location; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.storage_location (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    city character varying,
    zone character varying,
    aisle character varying,
    shelf character varying,
    region character varying,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    fk_warehouse bigint,
    shelf_section character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    nk_storage_location bigint,
    sk_storage_location character varying
);


ALTER TABLE replica.storage_location OWNER TO belkiss;

--
-- Name: supplier; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.supplier (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    name character varying,
    email character varying,
    address character varying,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    nk_supplier bigint,
    sk_supplier character varying,
    phone_number character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.supplier OWNER TO belkiss;

--
-- Name: training; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.training (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    location character varying,
    _ab_cdc_lsn numeric,
    nk_training bigint,
    training_type character varying,
    training_title character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.training OWNER TO belkiss;

--
-- Name: training_participation; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.training_participation (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    id bigint,
    _ab_cdc_lsn numeric,
    fk_employee bigint,
    fk_end_date date,
    fk_position bigint,
    fk_training bigint,
    fk_department bigint,
    fk_start_date date,
    training_cost numeric,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying,
    training_days_count bigint
);


ALTER TABLE replica.training_participation OWNER TO belkiss;

--
-- Name: warehouse; Type: TABLE; Schema: replica; Owner: belkiss
--

CREATE TABLE replica.warehouse (
    _airbyte_raw_id character varying NOT NULL,
    _airbyte_extracted_at timestamp with time zone NOT NULL,
    _airbyte_meta jsonb NOT NULL,
    _airbyte_generation_id bigint NOT NULL,
    address character varying,
    valid_to timestamp without time zone,
    is_current boolean,
    valid_from timestamp without time zone,
    _ab_cdc_lsn numeric,
    nk_warehouse bigint,
    sk_warehouse character varying,
    name_warehouse character varying,
    number_warehouse character varying,
    _ab_cdc_deleted_at character varying,
    _ab_cdc_updated_at character varying
);


ALTER TABLE replica.warehouse OWNER TO belkiss;

--
-- Name: absence_declaration; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.absence_declaration (
    id integer NOT NULL,
    fk_start_date date,
    fk_end_date date,
    fk_employee integer,
    fk_department integer,
    fk_position integer,
    fk_absence_reason integer,
    absent_days_count integer,
    absent_hours_count numeric(8,2)
);


ALTER TABLE source.absence_declaration OWNER TO postgres;

--
-- Name: absence_reason; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.absence_reason (
    nk_absence_reason integer NOT NULL,
    absence_reason character varying(255),
    supporting_document boolean
);


ALTER TABLE source.absence_reason OWNER TO postgres;

--
-- Name: acs_lab_test; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.acs_lab_test (
    id integer NOT NULL,
    code character varying(100),
    name character varying(255),
    result_value_type character varying(50),
    acs_tat integer,
    contains_formula boolean
);


ALTER TABLE source.acs_lab_test OWNER TO postgres;

--
-- Name: acs_lab_test_uom; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.acs_lab_test_uom (
    id integer NOT NULL,
    name character varying(100),
    code character varying(50)
);


ALTER TABLE source.acs_lab_test_uom OWNER TO postgres;

--
-- Name: acs_laboratory; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.acs_laboratory (
    id integer NOT NULL,
    is_collection_center boolean,
    active boolean
);


ALTER TABLE source.acs_laboratory OWNER TO postgres;

--
-- Name: acs_laboratory_request; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.acs_laboratory_request (
    id integer NOT NULL,
    date timestamp without time zone,
    patient_id integer,
    physician_id integer,
    lab_doctor_id integer,
    referring_doctor_id integer,
    referring_hospital_id integer,
    laboratory_id integer,
    collection_center_id integer,
    name character varying(255),
    payment_state character varying(50),
    urgent boolean,
    total_price numeric(12,2),
    total_tat numeric(12,2),
    panel_id integer
);


ALTER TABLE source.acs_laboratory_request OWNER TO postgres;

--
-- Name: acs_laboratory_sample_type; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.acs_laboratory_sample_type (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE source.acs_laboratory_sample_type OWNER TO postgres;

--
-- Name: acs_patient_laboratory_sample; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.acs_patient_laboratory_sample (
    id integer NOT NULL,
    request_id integer,
    date timestamp without time zone,
    patient_id integer,
    sample_type_id integer,
    name character varying(255),
    state character varying(50),
    container_name character varying(255)
);


ALTER TABLE source.acs_patient_laboratory_sample OWNER TO postgres;

--
-- Name: attendance; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.attendance (
    id integer NOT NULL,
    fk_date date,
    fk_employee integer,
    fk_department integer,
    fk_position integer,
    fk_absence_reason integer,
    check_in_time time without time zone,
    check_out_time time without time zone,
    worked_hours numeric(6,2),
    overtime_hours numeric(6,2)
);


ALTER TABLE source.attendance OWNER TO postgres;

--
-- Name: bank; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.bank (
    id integer NOT NULL,
    fk_date date,
    fk_customer integer,
    fk_supplier integer,
    fk_payment_method integer,
    fk_financial_transaction_type integer,
    cash_in_amount numeric(14,2),
    cash_out_amount numeric(14,2),
    opening_bank_balance numeric(14,2),
    closing_bank_balance numeric(14,2),
    bank_fees numeric(12,2),
    transaction_count integer
);


ALTER TABLE source.bank OWNER TO postgres;

--
-- Name: candidature; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.candidature (
    id integer NOT NULL,
    fk_date date,
    fk_position integer,
    fk_department integer,
    candidate character varying(255),
    hiring_status character varying(100),
    hiring_decision character varying(100),
    recruiter_name character varying(255)
);


ALTER TABLE source.candidature OWNER TO postgres;

--
-- Name: cash; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.cash (
    id integer NOT NULL,
    fk_date date,
    fk_customer integer,
    fk_payment_method integer,
    fk_financial_transaction_type integer,
    cash_in_amount numeric(14,2),
    cash_out_amount numeric(14,2),
    opening_cash_balance numeric(14,2),
    closing_cash_balance numeric(14,2),
    cash_transaction_count integer
);


ALTER TABLE source.cash OWNER TO postgres;

--
-- Name: contract; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.contract (
    sk_contract integer,
    nk_contract integer NOT NULL,
    type_contract character varying(100),
    probation_period integer,
    status_contract character varying(50),
    working_hours numeric(6,2),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean,
    fk_start_date date,
    fk_end_date date,
    fk_employee integer,
    fk_position integer,
    fk_contract integer,
    salary numeric(12,2),
    contract_duration integer
);


ALTER TABLE source.contract OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.customer (
    sk_customer character varying(64),
    nk_customer integer NOT NULL,
    name character varying(255),
    address text,
    phone_number character varying(50),
    email character varying(255),
    bank_account character varying(100),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.customer OWNER TO postgres;

--
-- Name: customer_request; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.customer_request (
    id integer NOT NULL,
    fk_date date,
    fk_customer integer,
    fk_product integer,
    fk_payment_method integer,
    requested_quantity numeric(12,2),
    total_amount numeric(14,2),
    amount_excluding_tax numeric(14,2)
);


ALTER TABLE source.customer_request OWNER TO postgres;

--
-- Name: delivery; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.delivery (
    id integer NOT NULL,
    fk_date date,
    fk_customer integer,
    fk_product integer,
    fk_warehouse integer,
    fk_storage_location integer,
    delivered_quantity numeric(12,2),
    remaining_quantity numeric(12,2)
);


ALTER TABLE source.delivery OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.department (
    sk_department integer,
    nk_department integer NOT NULL,
    name_department character varying(255),
    description text,
    manager_department character varying(255),
    location character varying(255),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.department OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.employee (
    sk_employee integer,
    nk_employee integer NOT NULL,
    name_employee character varying(255),
    birth_date date,
    address text,
    email character varying(255),
    phone_number character varying(50),
    marital_status character varying(50),
    social_security_number character varying(100),
    ccp character varying(100),
    hire_date date,
    cv text,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.employee OWNER TO postgres;

--
-- Name: employee_assignment; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.employee_assignment (
    id integer NOT NULL,
    fk_start_date date,
    fk_end_date date,
    fk_employee integer,
    fk_position integer,
    fk_department integer,
    assignment_duration integer,
    assignment_rate numeric(6,2)
);


ALTER TABLE source.employee_assignment OWNER TO postgres;

--
-- Name: financial_transaction_type; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.financial_transaction_type (
    nk_financial_transaction_type integer NOT NULL,
    transaction_name character varying(255),
    cash_flow_direction character varying(50)
);


ALTER TABLE source.financial_transaction_type OWNER TO postgres;

--
-- Name: hms_patient; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.hms_patient (
    id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    birth_date date,
    gender character varying(20),
    address text,
    mobile character varying(50),
    email character varying(255)
);


ALTER TABLE source.hms_patient OWNER TO postgres;

--
-- Name: hms_physician; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.hms_physician (
    id integer NOT NULL,
    specialty character varying(150),
    email character varying(255),
    name_physician character varying(255),
    phone_number character varying(50)
);


ALTER TABLE source.hms_physician OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.inventory (
    id integer NOT NULL,
    fk_date date,
    fk_product integer,
    fk_warehouse integer,
    fk_storage_location integer,
    fk_inventory_transaction_type integer,
    quantity numeric(12,2),
    opening_stock numeric(12,2),
    closing_stock numeric(12,2)
);


ALTER TABLE source.inventory OWNER TO postgres;

--
-- Name: inventory_transaction_type; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.inventory_transaction_type (
    nk_inventory_transaction_type integer NOT NULL,
    transaction_category character varying(100)
);


ALTER TABLE source.inventory_transaction_type OWNER TO postgres;

--
-- Name: lab_bilan; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.lab_bilan (
    id integer NOT NULL,
    name character varying(255),
    report_header text
);


ALTER TABLE source.lab_bilan OWNER TO postgres;

--
-- Name: lab_test_critearea; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.lab_test_critearea (
    id integer NOT NULL,
    request_id integer,
    test_id integer,
    name character varying(255),
    result text,
    num_result double precision,
    result_value_type character varying(50),
    normal_range character varying(255),
    lab_uom_id integer,
    remark text,
    is_formule boolean,
    printable boolean,
    test_criteria_template_id integer,
    patient_id integer
);


ALTER TABLE source.lab_test_critearea OWNER TO postgres;

--
-- Name: lab_test_criteria_template; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.lab_test_criteria_template (
    id integer NOT NULL,
    code character varying(100),
    name character varying(255),
    result_value_type character varying(50),
    apply_range_to character varying(50)
);


ALTER TABLE source.lab_test_criteria_template OWNER TO postgres;

--
-- Name: lab_test_normal_range; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.lab_test_normal_range (
    id integer NOT NULL,
    age_min integer,
    age_max integer,
    age_unit character varying(50),
    gender character varying(20),
    normal_range character varying(255),
    is_formule boolean
);


ALTER TABLE source.lab_test_normal_range OWNER TO postgres;

--
-- Name: lab_unit; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.lab_unit (
    id integer NOT NULL,
    code character varying(100),
    name character varying(255),
    col_name character varying(255),
    col_result character varying(255)
);


ALTER TABLE source.lab_unit OWNER TO postgres;

--
-- Name: laboratory_equipements; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.laboratory_equipements (
    id integer NOT NULL,
    name character varying(255),
    ip_address character varying(50),
    status character varying(50)
);


ALTER TABLE source.laboratory_equipements OWNER TO postgres;

--
-- Name: laboratory_group; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.laboratory_group (
    id integer NOT NULL,
    name character varying(255),
    method character varying(255)
);


ALTER TABLE source.laboratory_group OWNER TO postgres;

--
-- Name: laboratory_group_line; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.laboratory_group_line (
    id integer NOT NULL,
    test_id integer,
    panel_id integer,
    sale_price double precision,
    instruction text
);


ALTER TABLE source.laboratory_group_line OWNER TO postgres;

--
-- Name: laboratory_request_line; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.laboratory_request_line (
    id integer NOT NULL,
    request_id integer,
    test_id integer,
    quantity integer,
    sale_price double precision,
    amount_total double precision,
    instruction text
);


ALTER TABLE source.laboratory_request_line OWNER TO postgres;

--
-- Name: leave; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.leave (
    nk_leave integer NOT NULL,
    leave_type character varying(100),
    request_status character varying(50)
);


ALTER TABLE source.leave OWNER TO postgres;

--
-- Name: leave_request; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.leave_request (
    id integer NOT NULL,
    fk_start_date date,
    fk_end_date date,
    fk_leave integer,
    fk_employee integer,
    fk_department integer,
    fk_position integer,
    leave_days_count integer
);


ALTER TABLE source.leave_request OWNER TO postgres;

--
-- Name: loan_assignment; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.loan_assignment (
    id integer NOT NULL,
    fk_start_date date,
    fk_end_date date,
    fk_employee integer,
    fk_department integer,
    fk_position integer,
    fk_loan_status integer,
    total_loan_amount numeric(12,2),
    loan_duration integer,
    monthly_payment_amount numeric(12,2)
);


ALTER TABLE source.loan_assignment OWNER TO postgres;

--
-- Name: loan_status; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.loan_status (
    nk_loan_status integer NOT NULL,
    loan_status character varying(100),
    loan_repayment_status character varying(100)
);


ALTER TABLE source.loan_status OWNER TO postgres;

--
-- Name: patient_laboratory_test; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.patient_laboratory_test (
    id integer NOT NULL,
    request_id integer,
    date_requested timestamp without time zone,
    date_analysis timestamp without time zone,
    patient_id integer,
    test_id integer,
    physician_id integer,
    equipement integer,
    main_unit_id integer,
    laboratory_id integer,
    collection_center_id integer,
    name character varying(255),
    state character varying(50),
    diagnosis text,
    report text
);


ALTER TABLE source.patient_laboratory_test OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.payment (
    id integer NOT NULL,
    fk_date date,
    fk_customer integer,
    fk_supplier integer,
    fk_payment_method integer,
    fk_financial_transaction_type integer,
    payment_amount numeric(14,2),
    remaining_amount numeric(14,2),
    discount_amount numeric(14,2),
    penalty_amount numeric(14,2),
    payment_status character varying(50),
    payment_count integer,
    payment_delay_days integer
);


ALTER TABLE source.payment OWNER TO postgres;

--
-- Name: payment_method; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.payment_method (
    nk_payment_method integer NOT NULL,
    payment_terms character varying(100),
    online_payment boolean,
    online_signature boolean
);


ALTER TABLE source.payment_method OWNER TO postgres;

--
-- Name: payroll; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.payroll (
    id integer NOT NULL,
    fk_date date,
    fk_employee integer,
    fk_department integer,
    fk_position integer,
    fk_contract integer,
    fk_loan_status integer,
    base_salary numeric(12,2),
    bonus numeric(12,2),
    allowances numeric(12,2),
    deductions numeric(12,2),
    net_salary numeric(12,2)
);


ALTER TABLE source.payroll OWNER TO postgres;

--
-- Name: position; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source."position" (
    sk_position integer,
    nk_position integer NOT NULL,
    fk_department integer,
    position_title character varying(255),
    description text,
    hierarchy_level integer,
    base_salary numeric(12,2),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source."position" OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.product (
    sk_product character varying(64),
    nk_product integer NOT NULL,
    name_product character varying(255),
    reference_product character varying(100),
    description text,
    cost_price numeric(12,2),
    selling_price numeric(12,2),
    unit_of_measure character varying(100),
    packaging character varying(100),
    category character varying(100),
    product_type character varying(100),
    purchase_unit_of_measure character varying(100),
    tax_rate numeric(6,2),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.product OWNER TO postgres;

--
-- Name: proforma_request; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.proforma_request (
    id integer NOT NULL,
    fk_date date,
    fk_supplier integer,
    fk_product integer,
    requested_quantity numeric(12,2),
    total_amount numeric(14,2),
    amount_excluding_tax numeric(14,2)
);


ALTER TABLE source.proforma_request OWNER TO postgres;

--
-- Name: purchase; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.purchase (
    id integer NOT NULL,
    fk_date date,
    fk_supplier integer,
    fk_product integer,
    fk_payment_method integer,
    total_amount numeric(14,2),
    amount_excluding_tax numeric(14,2),
    unit_purchase_price numeric(12,2),
    ordered_quantity numeric(12,2)
);


ALTER TABLE source.purchase OWNER TO postgres;

--
-- Name: receipt; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.receipt (
    id integer NOT NULL,
    fk_date date,
    fk_supplier integer,
    fk_product integer,
    fk_warehouse integer,
    fk_storage_location integer,
    received_quantity numeric(12,2)
);


ALTER TABLE source.receipt OWNER TO postgres;

--
-- Name: res_partner; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.res_partner (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE source.res_partner OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.sales (
    id integer NOT NULL,
    fk_date date,
    fk_customer integer,
    fk_product integer,
    fk_payment_method integer,
    total_amount numeric(14,2),
    amount_excluding_tax numeric(14,2),
    profit_margin numeric(14,2),
    profit_margin_percentage numeric(8,2),
    unit_selling_price numeric(12,2),
    quantity_sold numeric(12,2)
);


ALTER TABLE source.sales OWNER TO postgres;

--
-- Name: storage_location; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.storage_location (
    sk_storage_location character varying(64),
    nk_storage_location integer NOT NULL,
    fk_warehouse integer,
    region character varying(100),
    city character varying(100),
    zone character varying(100),
    aisle character varying(50),
    shelf_section character varying(50),
    shelf character varying(50),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.storage_location OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.supplier (
    sk_supplier character varying(64),
    nk_supplier integer NOT NULL,
    name character varying(255),
    address text,
    email character varying(255),
    phone_number character varying(50),
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.supplier OWNER TO postgres;

--
-- Name: training; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.training (
    nk_training integer NOT NULL,
    training_title character varying(255),
    location character varying(255),
    training_type character varying(100)
);


ALTER TABLE source.training OWNER TO postgres;

--
-- Name: training_participation; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.training_participation (
    id integer NOT NULL,
    fk_start_date date,
    fk_end_date date,
    fk_training integer,
    fk_employee integer,
    fk_department integer,
    fk_position integer,
    training_cost numeric(12,2),
    training_days_count integer
);


ALTER TABLE source.training_participation OWNER TO postgres;

--
-- Name: warehouse; Type: TABLE; Schema: source; Owner: postgres
--

CREATE TABLE source.warehouse (
    sk_warehouse character varying(64),
    nk_warehouse integer NOT NULL,
    name_warehouse character varying(255),
    number_warehouse character varying(50),
    address text,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    is_current boolean
);


ALTER TABLE source.warehouse OWNER TO postgres;

--
-- Name: bridge_panel_test; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.bridge_panel_test (
    nk_panel_test bigint,
    fk_panel text,
    fk_test text,
    sale_price numeric,
    instruction character varying
);


ALTER TABLE warehouse.bridge_panel_test OWNER TO belkiss;

--
-- Name: dim_absence_reason; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_absence_reason (
    nk_absence_reason bigint,
    absence_reason character varying,
    supporting_document boolean
);


ALTER TABLE warehouse.dim_absence_reason OWNER TO belkiss;

--
-- Name: dim_contract; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_contract (
    sk_contract text,
    nk_contract bigint,
    type_contract character varying,
    probation_period bigint,
    status_contract character varying,
    working_hours numeric,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_contract OWNER TO belkiss;

--
-- Name: dim_customer; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_customer (
    sk_customer text,
    nk_customer bigint,
    name character varying,
    address character varying,
    phone_number character varying,
    email character varying,
    bank_account character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_customer OWNER TO belkiss;

--
-- Name: dim_date; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_date (
    sk_date text,
    date_value date,
    day_number integer,
    day_name text,
    week_number integer,
    month_number integer,
    month_name text,
    quarter_number integer,
    year_number integer,
    is_weekend boolean
);


ALTER TABLE warehouse.dim_date OWNER TO belkiss;

--
-- Name: dim_department; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_department (
    sk_department text,
    nk_department bigint,
    name_department character varying,
    description character varying,
    manager_department character varying,
    location character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_department OWNER TO belkiss;

--
-- Name: dim_employee; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_employee (
    sk_employee text,
    nk_employee bigint,
    name_employee character varying,
    birth_date date,
    address character varying,
    email character varying,
    phone_number character varying,
    marital_status character varying,
    social_security_number character varying,
    ccp character varying,
    hire_date date,
    cv character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_employee OWNER TO belkiss;

--
-- Name: dim_equipment; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_equipment (
    sk_equipment text,
    nk_equipment bigint,
    equipment_name character varying,
    ip_address character varying,
    equipment_status character varying
);


ALTER TABLE warehouse.dim_equipment OWNER TO belkiss;

--
-- Name: dim_financial_transaction_type; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_financial_transaction_type (
    nk_financial_transaction_type bigint,
    transaction_name character varying,
    cash_flow_direction character varying
);


ALTER TABLE warehouse.dim_financial_transaction_type OWNER TO belkiss;

--
-- Name: dim_inventory_transaction_type; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_inventory_transaction_type (
    nk_inventory_transaction_type bigint,
    transaction_category character varying
);


ALTER TABLE warehouse.dim_inventory_transaction_type OWNER TO belkiss;

--
-- Name: dim_lab_bilan; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_lab_bilan (
    sk_lab_report text,
    nk_lab_report bigint,
    report_name character varying,
    report_header character varying
);


ALTER TABLE warehouse.dim_lab_bilan OWNER TO belkiss;

--
-- Name: dim_lab_unit; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_lab_unit (
    sk_lab_unit text,
    nk_lab_unit bigint,
    lab_unit_code character varying,
    lab_unit_name character varying,
    col_name character varying,
    col_result character varying
);


ALTER TABLE warehouse.dim_lab_unit OWNER TO belkiss;

--
-- Name: dim_laboratory; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_laboratory (
    sk_laboratory text,
    nk_laboratory bigint,
    is_collection_center boolean,
    is_active boolean
);


ALTER TABLE warehouse.dim_laboratory OWNER TO belkiss;

--
-- Name: dim_leave; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_leave (
    nk_leave bigint,
    leave_type character varying,
    request_status character varying
);


ALTER TABLE warehouse.dim_leave OWNER TO belkiss;

--
-- Name: dim_loan_status; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_loan_status (
    nk_loan_status bigint,
    loan_status character varying,
    loan_repayment_status character varying
);


ALTER TABLE warehouse.dim_loan_status OWNER TO belkiss;

--
-- Name: dim_panel; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_panel (
    sk_panel text,
    nk_panel bigint,
    panel_name character varying,
    panel_method character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_panel OWNER TO belkiss;

--
-- Name: dim_patient; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_patient (
    sk_patient text,
    nk_patient bigint,
    first_name character varying,
    last_name character varying,
    birth_date date,
    gender character varying,
    address character varying,
    mobile character varying,
    email character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_patient OWNER TO belkiss;

--
-- Name: dim_payment_method; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_payment_method (
    nk_payment_method bigint,
    payment_terms character varying,
    online_payment boolean,
    online_signature boolean
);


ALTER TABLE warehouse.dim_payment_method OWNER TO belkiss;

--
-- Name: dim_physician; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_physician (
    sk_physician text,
    nk_physician bigint,
    name_physician character varying,
    specialty character varying,
    email character varying,
    phone_number character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_physician OWNER TO belkiss;

--
-- Name: dim_position; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_position (
    sk_position text,
    nk_position bigint,
    fk_department bigint,
    position_title character varying,
    description character varying,
    hierarchy_level bigint,
    base_salary numeric,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_position OWNER TO belkiss;

--
-- Name: dim_product; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_product (
    sk_product text,
    nk_product bigint,
    name_product character varying,
    reference_product character varying,
    description character varying,
    cost_price numeric,
    selling_price numeric,
    unit_of_measure character varying,
    packaging character varying,
    category character varying,
    product_type character varying,
    purchase_unit_of_measure character varying,
    tax_rate numeric,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_product OWNER TO belkiss;

--
-- Name: dim_reference_range; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_reference_range (
    sk_referance_range text,
    nk_reference_range bigint,
    age_min bigint,
    age_max bigint,
    age_unit character varying,
    gender character varying,
    reference_range character varying,
    is_formula_based boolean
);


ALTER TABLE warehouse.dim_reference_range OWNER TO belkiss;

--
-- Name: dim_referral_partner; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_referral_partner (
    sk_referral_partner text,
    nk_referral_partner bigint,
    referral_partner_name character varying
);


ALTER TABLE warehouse.dim_referral_partner OWNER TO belkiss;

--
-- Name: dim_referring_doctor; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_referring_doctor (
    sk_referring_doctor text,
    nk_referring_doctor bigint,
    referring_doctor_name character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_referring_doctor OWNER TO belkiss;

--
-- Name: dim_sample_type; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_sample_type (
    sk_sample_type text,
    nk_sample_type bigint,
    sample_type_name character varying
);


ALTER TABLE warehouse.dim_sample_type OWNER TO belkiss;

--
-- Name: dim_storage_location; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_storage_location (
    sk_storage_location text,
    nk_storage_location bigint,
    fk_warehouse bigint,
    region character varying,
    city character varying,
    zone character varying,
    aisle character varying,
    shelf_section character varying,
    shelf character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_storage_location OWNER TO belkiss;

--
-- Name: dim_supplier; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_supplier (
    sk_supplier text,
    nk_supplier bigint,
    name character varying,
    address character varying,
    email character varying,
    phone_number character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_supplier OWNER TO belkiss;

--
-- Name: dim_test; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_test (
    sk_test text,
    nk_test bigint,
    test_code character varying,
    test_name character varying,
    result_value_type character varying,
    expected_turnaround_time bigint,
    contains_formula boolean
);


ALTER TABLE warehouse.dim_test OWNER TO belkiss;

--
-- Name: dim_test_parameter; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_test_parameter (
    sk_test_parameter text,
    nk_test_parameter bigint,
    parameter_code character varying,
    parameter_name character varying,
    result_value_type character varying,
    apply_range_to character varying
);


ALTER TABLE warehouse.dim_test_parameter OWNER TO belkiss;

--
-- Name: dim_training; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_training (
    nk_training bigint,
    training_title character varying,
    location character varying,
    training_type character varying
);


ALTER TABLE warehouse.dim_training OWNER TO belkiss;

--
-- Name: dim_unit_of_measure; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_unit_of_measure (
    sk_unit_of_measure text,
    nk_unit_of_measure bigint,
    unit_code character varying,
    unit_name character varying
);


ALTER TABLE warehouse.dim_unit_of_measure OWNER TO belkiss;

--
-- Name: dim_warehouse; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.dim_warehouse (
    sk_warehouse text,
    nk_warehouse bigint,
    name_warehouse character varying,
    number_warehouse character varying,
    address character varying,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    is_current boolean
);


ALTER TABLE warehouse.dim_warehouse OWNER TO belkiss;

--
-- Name: fact_absence_declaration; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_absence_declaration (
    nk_absence_declaration bigint,
    fk_start_date text,
    fk_end_date text,
    fk_employee text,
    fk_department text,
    fk_position text,
    fk_absence_reason bigint,
    absent_days_count bigint,
    absent_hours_count numeric
);


ALTER TABLE warehouse.fact_absence_declaration OWNER TO belkiss;

--
-- Name: fact_attendance; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_attendance (
    nk_attendance bigint,
    fk_date text,
    fk_employee text,
    fk_department text,
    fk_position text,
    fk_absence_reason bigint,
    check_in_time time without time zone,
    check_out_time time without time zone,
    worked_hours numeric,
    overtime_hours numeric
);


ALTER TABLE warehouse.fact_attendance OWNER TO belkiss;

--
-- Name: fact_bank; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_bank (
    nk_bank bigint,
    fk_date text,
    fk_customer text,
    fk_supplier text,
    fk_payment_method bigint,
    fk_financial_transaction_type bigint,
    cash_in_amount numeric,
    cash_out_amount numeric,
    opening_bank_balance numeric,
    closing_bank_balance numeric,
    bank_fees numeric,
    transaction_count bigint
);


ALTER TABLE warehouse.fact_bank OWNER TO belkiss;

--
-- Name: fact_candidature; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_candidature (
    nk_candidature bigint,
    fk_date text,
    fk_position text,
    fk_department text,
    candidate character varying,
    hiring_status character varying,
    hiring_decision character varying,
    recruiter_name character varying
);


ALTER TABLE warehouse.fact_candidature OWNER TO belkiss;

--
-- Name: fact_cash; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_cash (
    nk_cash bigint,
    fk_date text,
    fk_customer text,
    fk_payment_method bigint,
    fk_financial_transaction_type bigint,
    cash_in_amount numeric,
    cash_out_amount numeric,
    opening_cash_balance numeric,
    closing_cash_balance numeric,
    cash_transaction_count bigint
);


ALTER TABLE warehouse.fact_cash OWNER TO belkiss;

--
-- Name: fact_contract; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_contract (
    nk_contract_fact bigint,
    fk_start_date text,
    fk_end_date text,
    fk_employee text,
    fk_position text,
    fk_contract text,
    salary numeric,
    contract_duration bigint
);


ALTER TABLE warehouse.fact_contract OWNER TO belkiss;

--
-- Name: fact_customer_request; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_customer_request (
    nk_customer_request bigint,
    fk_date text,
    fk_customer text,
    fk_product text,
    fk_payment_method bigint,
    requested_quantity numeric,
    total_amount numeric,
    amount_excluding_tax numeric
);


ALTER TABLE warehouse.fact_customer_request OWNER TO belkiss;

--
-- Name: fact_delivery; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_delivery (
    nk_delivery bigint,
    fk_date text,
    fk_customer text,
    fk_product text,
    fk_warehouse text,
    fk_storage_location text,
    delivered_quantity numeric,
    remaining_quantity numeric
);


ALTER TABLE warehouse.fact_delivery OWNER TO belkiss;

--
-- Name: fact_employee_assignment; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_employee_assignment (
    nk_employee_assignment bigint,
    fk_start_date text,
    fk_end_date text,
    fk_employee text,
    fk_position text,
    fk_department text,
    assignment_duration bigint,
    assignment_rate numeric
);


ALTER TABLE warehouse.fact_employee_assignment OWNER TO belkiss;

--
-- Name: fact_inventory; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_inventory (
    nk_inventory bigint,
    fk_date text,
    fk_product text,
    fk_warehouse text,
    fk_storage_location text,
    fk_inventory_transaction_type bigint,
    quantity numeric,
    opening_stock numeric,
    closing_stock numeric
);


ALTER TABLE warehouse.fact_inventory OWNER TO belkiss;

--
-- Name: fact_lab_request; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_lab_request (
    nk_lab_request bigint,
    fk_date text,
    fk_patient text,
    fk_physician text,
    fk_referring_doctor text,
    fk_referral_partner text,
    fk_laboratory text,
    fk_collection_center text,
    request_reference character varying,
    payment_state character varying,
    urgent boolean,
    total_price numeric,
    total_tat numeric,
    urgent_requests_count integer,
    paid_requests_count integer,
    total_requests_count integer
);


ALTER TABLE warehouse.fact_lab_request OWNER TO belkiss;

--
-- Name: fact_lab_result; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_lab_result (
    nk_lab_result bigint,
    nk_lab_request bigint,
    fk_requested_date text,
    fk_analysis_date text,
    fk_patient text,
    fk_test text,
    fk_physician text,
    fk_equipment text,
    fk_lab_unit text,
    fk_laboratory text,
    fk_collection_center text,
    result_reference character varying,
    result_status character varying,
    diagnosis character varying,
    report character varying,
    completed_results_count integer,
    cancelled_results_count integer,
    total_results_count integer
);


ALTER TABLE warehouse.fact_lab_result OWNER TO belkiss;

--
-- Name: fact_lab_sample; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_lab_sample (
    nk_lab_sample bigint,
    nk_lab_request bigint,
    fk_date text,
    fk_patient text,
    fk_sample_type text,
    sample_reference character varying,
    sample_status character varying,
    container_name character varying,
    total_samples_count integer
);


ALTER TABLE warehouse.fact_lab_sample OWNER TO belkiss;

--
-- Name: fact_leave_request; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_leave_request (
    nk_leave_request bigint,
    fk_start_date text,
    fk_end_date text,
    fk_leave bigint,
    fk_employee text,
    fk_department text,
    fk_position text,
    leave_days_count bigint
);


ALTER TABLE warehouse.fact_leave_request OWNER TO belkiss;

--
-- Name: fact_loan_assignment; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_loan_assignment (
    nk_loan_assignment bigint,
    fk_start_date text,
    fk_end_date text,
    fk_employee text,
    fk_department text,
    fk_position text,
    fk_loan_status bigint,
    total_loan_amount numeric,
    loan_duration bigint,
    monthly_payment_amount numeric
);


ALTER TABLE warehouse.fact_loan_assignment OWNER TO belkiss;

--
-- Name: fact_parameter_result; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_parameter_result (
    nk_parameter_result bigint,
    nk_lab_result bigint,
    nk_lab_request bigint,
    fk_test text,
    fk_test_parameter text,
    fk_unit_of_measure text,
    parameter_result_name character varying,
    result_value character varying,
    numeric_result_value numeric,
    result_value_type character varying,
    normal_range character varying,
    remark character varying,
    is_formule boolean,
    printable boolean,
    abnormal_results_count integer,
    total_parameter_results_count integer
);


ALTER TABLE warehouse.fact_parameter_result OWNER TO belkiss;

--
-- Name: fact_payment; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_payment (
    nk_payment bigint,
    fk_date text,
    fk_customer text,
    fk_supplier text,
    fk_payment_method bigint,
    fk_financial_transaction_type bigint,
    payment_amount numeric,
    remaining_amount numeric,
    discount_amount numeric,
    penalty_amount numeric,
    payment_status character varying,
    payment_count bigint,
    payment_delay_days bigint
);


ALTER TABLE warehouse.fact_payment OWNER TO belkiss;

--
-- Name: fact_payroll; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_payroll (
    nk_payroll bigint,
    fk_date text,
    fk_employee text,
    fk_department text,
    fk_position text,
    fk_contract text,
    fk_loan_status bigint,
    base_salary numeric,
    bonus numeric,
    allowances numeric,
    deductions numeric,
    net_salary numeric
);


ALTER TABLE warehouse.fact_payroll OWNER TO belkiss;

--
-- Name: fact_proforma_request; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_proforma_request (
    nk_proforma_request bigint,
    fk_date text,
    fk_supplier text,
    fk_product text,
    requested_quantity numeric,
    total_amount numeric,
    amount_excluding_tax numeric
);


ALTER TABLE warehouse.fact_proforma_request OWNER TO belkiss;

--
-- Name: fact_purchase; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_purchase (
    nk_purchase bigint,
    fk_date text,
    fk_supplier text,
    fk_product text,
    fk_payment_method bigint,
    total_amount numeric,
    amount_excluding_tax numeric,
    unit_purchase_price numeric,
    ordered_quantity numeric
);


ALTER TABLE warehouse.fact_purchase OWNER TO belkiss;

--
-- Name: fact_receipt; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_receipt (
    nk_receipt bigint,
    fk_date text,
    fk_supplier text,
    fk_product text,
    fk_warehouse text,
    fk_storage_location text,
    received_quantity numeric
);


ALTER TABLE warehouse.fact_receipt OWNER TO belkiss;

--
-- Name: fact_requested_test; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_requested_test (
    nk_requested_test bigint,
    nk_lab_request bigint,
    fk_test text,
    quantity bigint,
    sale_price numeric,
    amount_total numeric,
    instruction character varying
);


ALTER TABLE warehouse.fact_requested_test OWNER TO belkiss;

--
-- Name: fact_sales; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_sales (
    nk_sales bigint,
    fk_date text,
    fk_customer text,
    fk_product text,
    fk_payment_method bigint,
    total_amount numeric,
    amount_excluding_tax numeric,
    profit_margin numeric,
    profit_margin_percentage numeric,
    unit_selling_price numeric,
    quantity_sold numeric
);


ALTER TABLE warehouse.fact_sales OWNER TO belkiss;

--
-- Name: fact_training_participation; Type: TABLE; Schema: warehouse; Owner: belkiss
--

CREATE TABLE warehouse.fact_training_participation (
    nk_training_participation bigint,
    fk_start_date text,
    fk_end_date text,
    fk_training bigint,
    fk_employee text,
    fk_department text,
    fk_position text,
    training_cost numeric,
    training_days_count bigint
);


ALTER TABLE warehouse.fact_training_participation OWNER TO belkiss;

--
-- Name: kpi_inventory; Type: VIEW; Schema: warehouse; Owner: belkiss
--

CREATE VIEW warehouse.kpi_inventory AS
 WITH inventory_agg AS (
         SELECT fact_inventory.fk_date,
            fact_inventory.fk_product,
            fact_inventory.fk_warehouse,
            fact_inventory.fk_storage_location,
            sum(fact_inventory.opening_stock) AS total_opening_stock,
            sum(fact_inventory.closing_stock) AS total_closing_stock,
            sum(fact_inventory.quantity) AS total_stock_movement,
            avg(((fact_inventory.opening_stock + fact_inventory.closing_stock) / 2.0)) AS average_inventory
           FROM warehouse.fact_inventory
          GROUP BY fact_inventory.fk_date, fact_inventory.fk_product, fact_inventory.fk_warehouse, fact_inventory.fk_storage_location
        )
 SELECT fk_date,
    fk_product,
    fk_warehouse,
    fk_storage_location,
    total_opening_stock,
    total_closing_stock,
    total_stock_movement,
    average_inventory,
    ((total_closing_stock - total_opening_stock) / NULLIF(total_opening_stock, (0)::numeric)) AS stock_variation_ratio,
    (total_stock_movement / NULLIF(average_inventory, (0)::numeric)) AS inventory_turnover_ratio,
        CASE
            WHEN (total_closing_stock > (0)::numeric) THEN 1.0
            ELSE 0.0
        END AS stock_availability_ratio,
        CASE
            WHEN (total_closing_stock = (0)::numeric) THEN 1.0
            ELSE 0.0
        END AS stockout_ratio
   FROM inventory_agg;


ALTER VIEW warehouse.kpi_inventory OWNER TO belkiss;

--
-- Name: kpi_purchase; Type: VIEW; Schema: warehouse; Owner: belkiss
--

CREATE VIEW warehouse.kpi_purchase AS
 WITH purchase_agg AS (
         SELECT fact_purchase.fk_date,
            fact_purchase.fk_product,
            fact_purchase.fk_supplier,
            sum(fact_purchase.total_amount) AS total_purchase_amount,
            sum(fact_purchase.ordered_quantity) AS total_ordered_quantity,
            count(*) AS purchase_count
           FROM warehouse.fact_purchase
          GROUP BY fact_purchase.fk_date, fact_purchase.fk_product, fact_purchase.fk_supplier
        )
 SELECT fk_date,
    fk_product,
    fk_supplier,
    total_purchase_amount,
    total_ordered_quantity,
    purchase_count,
    (total_purchase_amount / NULLIF(total_ordered_quantity, (0)::numeric)) AS average_purchase_price,
    (total_purchase_amount / (NULLIF(purchase_count, 0))::numeric) AS average_purchase_order_value,
    (total_purchase_amount / NULLIF(sum(total_purchase_amount) OVER (PARTITION BY fk_date), (0)::numeric)) AS supplier_contribution_ratio,
    ((total_purchase_amount - lag(total_purchase_amount) OVER (PARTITION BY fk_product ORDER BY fk_date)) / NULLIF(lag(total_purchase_amount) OVER (PARTITION BY fk_product ORDER BY fk_date), (0)::numeric)) AS purchase_growth_rate
   FROM purchase_agg;


ALTER VIEW warehouse.kpi_purchase OWNER TO belkiss;

--
-- Name: absence_declaration absence_declaration_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.absence_declaration
    ADD CONSTRAINT absence_declaration_pkey PRIMARY KEY (id);


--
-- Name: absence_reason absence_reason_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.absence_reason
    ADD CONSTRAINT absence_reason_pkey PRIMARY KEY (nk_absence_reason);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: candidature candidature_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.candidature
    ADD CONSTRAINT candidature_pkey PRIMARY KEY (id);


--
-- Name: cash cash_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.cash
    ADD CONSTRAINT cash_pkey PRIMARY KEY (id);


--
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (nk_contract);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (nk_customer);


--
-- Name: customer_request customer_request_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.customer_request
    ADD CONSTRAINT customer_request_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (nk_department);


--
-- Name: employee_assignment employee_assignment_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.employee_assignment
    ADD CONSTRAINT employee_assignment_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (nk_employee);


--
-- Name: financial_transaction_type financial_transaction_type_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.financial_transaction_type
    ADD CONSTRAINT financial_transaction_type_pkey PRIMARY KEY (nk_financial_transaction_type);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: inventory_transaction_type inventory_transaction_type_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.inventory_transaction_type
    ADD CONSTRAINT inventory_transaction_type_pkey PRIMARY KEY (nk_inventory_transaction_type);


--
-- Name: leave leave_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.leave
    ADD CONSTRAINT leave_pkey PRIMARY KEY (nk_leave);


--
-- Name: leave_request leave_request_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.leave_request
    ADD CONSTRAINT leave_request_pkey PRIMARY KEY (id);


--
-- Name: loan_assignment loan_assignment_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.loan_assignment
    ADD CONSTRAINT loan_assignment_pkey PRIMARY KEY (id);


--
-- Name: loan_status loan_status_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.loan_status
    ADD CONSTRAINT loan_status_pkey PRIMARY KEY (nk_loan_status);


--
-- Name: payment_method payment_method_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (nk_payment_method);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payroll payroll_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (id);


--
-- Name: acs_lab_test pk_acs_lab_test; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.acs_lab_test
    ADD CONSTRAINT pk_acs_lab_test PRIMARY KEY (id);


--
-- Name: acs_lab_test_uom pk_acs_lab_test_uom; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.acs_lab_test_uom
    ADD CONSTRAINT pk_acs_lab_test_uom PRIMARY KEY (id);


--
-- Name: acs_laboratory pk_acs_laboratory; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.acs_laboratory
    ADD CONSTRAINT pk_acs_laboratory PRIMARY KEY (id);


--
-- Name: acs_laboratory_request pk_acs_laboratory_request; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.acs_laboratory_request
    ADD CONSTRAINT pk_acs_laboratory_request PRIMARY KEY (id);


--
-- Name: acs_laboratory_sample_type pk_acs_laboratory_sample_type; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.acs_laboratory_sample_type
    ADD CONSTRAINT pk_acs_laboratory_sample_type PRIMARY KEY (id);


--
-- Name: acs_patient_laboratory_sample pk_acs_patient_laboratory_sample; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.acs_patient_laboratory_sample
    ADD CONSTRAINT pk_acs_patient_laboratory_sample PRIMARY KEY (id);


--
-- Name: hms_patient pk_hms_patient; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.hms_patient
    ADD CONSTRAINT pk_hms_patient PRIMARY KEY (id);


--
-- Name: hms_physician pk_hms_physician; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.hms_physician
    ADD CONSTRAINT pk_hms_physician PRIMARY KEY (id);


--
-- Name: lab_bilan pk_lab_bilan; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.lab_bilan
    ADD CONSTRAINT pk_lab_bilan PRIMARY KEY (id);


--
-- Name: lab_test_critearea pk_lab_test_critearea; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.lab_test_critearea
    ADD CONSTRAINT pk_lab_test_critearea PRIMARY KEY (id);


--
-- Name: lab_test_criteria_template pk_lab_test_criteria_template; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.lab_test_criteria_template
    ADD CONSTRAINT pk_lab_test_criteria_template PRIMARY KEY (id);


--
-- Name: lab_test_normal_range pk_lab_test_normal_range; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.lab_test_normal_range
    ADD CONSTRAINT pk_lab_test_normal_range PRIMARY KEY (id);


--
-- Name: lab_unit pk_lab_unit; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.lab_unit
    ADD CONSTRAINT pk_lab_unit PRIMARY KEY (id);


--
-- Name: laboratory_equipements pk_laboratory_equipements; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.laboratory_equipements
    ADD CONSTRAINT pk_laboratory_equipements PRIMARY KEY (id);


--
-- Name: laboratory_group pk_laboratory_group; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.laboratory_group
    ADD CONSTRAINT pk_laboratory_group PRIMARY KEY (id);


--
-- Name: laboratory_group_line pk_laboratory_group_line; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.laboratory_group_line
    ADD CONSTRAINT pk_laboratory_group_line PRIMARY KEY (id);


--
-- Name: laboratory_request_line pk_laboratory_request_line; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.laboratory_request_line
    ADD CONSTRAINT pk_laboratory_request_line PRIMARY KEY (id);


--
-- Name: patient_laboratory_test pk_patient_laboratory_test; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.patient_laboratory_test
    ADD CONSTRAINT pk_patient_laboratory_test PRIMARY KEY (id);


--
-- Name: res_partner pk_res_partner; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.res_partner
    ADD CONSTRAINT pk_res_partner PRIMARY KEY (id);


--
-- Name: position position_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (nk_position);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (nk_product);


--
-- Name: proforma_request proforma_request_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.proforma_request
    ADD CONSTRAINT proforma_request_pkey PRIMARY KEY (id);


--
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- Name: receipt receipt_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.receipt
    ADD CONSTRAINT receipt_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: storage_location storage_location_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.storage_location
    ADD CONSTRAINT storage_location_pkey PRIMARY KEY (nk_storage_location);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (nk_supplier);


--
-- Name: training_participation training_participation_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.training_participation
    ADD CONSTRAINT training_participation_pkey PRIMARY KEY (id);


--
-- Name: training training_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.training
    ADD CONSTRAINT training_pkey PRIMARY KEY (nk_training);


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: source; Owner: postgres
--

ALTER TABLE ONLY source.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (nk_warehouse);


--
-- Name: idx_cursor_absence_declaration; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_absence_declaration ON replica.absence_declaration USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_absence_reason; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_absence_reason ON replica.absence_reason USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_acs_lab_test; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_acs_lab_test ON replica.acs_lab_test USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_acs_lab_test_uom; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_acs_lab_test_uom ON replica.acs_lab_test_uom USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_acs_laboratory; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_acs_laboratory ON replica.acs_laboratory USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_acs_laboratory_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_acs_laboratory_request ON replica.acs_laboratory_request USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_acs_laboratory_sample_type; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_acs_laboratory_sample_type ON replica.acs_laboratory_sample_type USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_acs_patient_laboratory_sample; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_acs_patient_laboratory_sample ON replica.acs_patient_laboratory_sample USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_attendance; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_attendance ON replica.attendance USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_bank; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_bank ON replica.bank USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_candidature; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_candidature ON replica.candidature USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_cash; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_cash ON replica.cash USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_customer_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_customer_request ON replica.customer_request USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_delivery; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_delivery ON replica.delivery USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_employee_assignment; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_employee_assignment ON replica.employee_assignment USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_financial_transaction_type; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_financial_transaction_type ON replica.financial_transaction_type USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_inventory; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_inventory ON replica.inventory USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_inventory_transaction_type; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_inventory_transaction_type ON replica.inventory_transaction_type USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_lab_bilan; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_lab_bilan ON replica.lab_bilan USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_lab_test_critearea; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_lab_test_critearea ON replica.lab_test_critearea USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_lab_test_criteria_template; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_lab_test_criteria_template ON replica.lab_test_criteria_template USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_lab_test_normal_range; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_lab_test_normal_range ON replica.lab_test_normal_range USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_lab_unit; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_lab_unit ON replica.lab_unit USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_laboratory_equipements; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_laboratory_equipements ON replica.laboratory_equipements USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_laboratory_group_line; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_laboratory_group_line ON replica.laboratory_group_line USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_laboratory_request_line; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_laboratory_request_line ON replica.laboratory_request_line USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_leave; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_leave ON replica.leave USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_leave_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_leave_request ON replica.leave_request USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_loan_assignment; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_loan_assignment ON replica.loan_assignment USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_loan_status; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_loan_status ON replica.loan_status USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_patient_laboratory_test; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_patient_laboratory_test ON replica.patient_laboratory_test USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_payment; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_payment ON replica.payment USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_payment_method; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_payment_method ON replica.payment_method USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_payroll; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_payroll ON replica.payroll USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_proforma_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_proforma_request ON replica.proforma_request USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_purchase; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_purchase ON replica.purchase USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_receipt; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_receipt ON replica.receipt USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaabsence_laration3b5bc7b290c261b215aae2c05badc; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaabsence_laration3b5bc7b290c261b215aae2c05badc ON replica.absence_declaration USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaabsence_reason3aa0198074d5e38b751bcf88d71f8cc; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaabsence_reason3aa0198074d5e38b751bcf88d71f8cc ON replica.absence_reason USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaacs_lab_test_uom05027d6f77811f0eecf19585c3422; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaacs_lab_test_uom05027d6f77811f0eecf19585c3422 ON replica.acs_lab_test_uom USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaacs_lab_testbc0fa2948b8d7045fea74b6e08ab3f25; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaacs_lab_testbc0fa2948b8d7045fea74b6e08ab3f25 ON replica.acs_lab_test USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaacs_labo_request9d074273e0a760a97fdf6312ac9a6; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaacs_labo_request9d074273e0a760a97fdf6312ac9a6 ON replica.acs_laboratory_request USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaacs_labople_type8df7acd9705a3fb54d1b5d40bdb2a; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaacs_labople_type8df7acd9705a3fb54d1b5d40bdb2a ON replica.acs_laboratory_sample_type USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaacs_laboratory5976895afad82eeedddb198557a31ad; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaacs_laboratory5976895afad82eeedddb198557a31ad ON replica.acs_laboratory USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaacs_patiy_sample0c1a4e64cd4a2748cfd9ffb851296; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaacs_patiy_sample0c1a4e64cd4a2748cfd9ffb851296 ON replica.acs_patient_laboratory_sample USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicaattendancea8d73f56a5ae710a0e54486018d6ef3f; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicaattendancea8d73f56a5ae710a0e54486018d6ef3f ON replica.attendance USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicabank90b9e63159bdc9886269a47dec97348f; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicabank90b9e63159bdc9886269a47dec97348f ON replica.bank USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicacandidaturefbfec013a7a0a92bbd4dcabc4e4e851b; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicacandidaturefbfec013a7a0a92bbd4dcabc4e4e851b ON replica.candidature USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicacashace3efab10395895c20ebf235f1a2890; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicacashace3efab10395895c20ebf235f1a2890 ON replica.cash USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicacustomer_request66c0fd4920a0d5a6643a4ec4317a9; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicacustomer_request66c0fd4920a0d5a6643a4ec4317a9 ON replica.customer_request USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_replicadelivery92b01be08450a81fd196d929c7215c39; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_replicadelivery92b01be08450a81fd196d929c7215c39 ON replica.delivery USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_sales; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_sales ON replica.sales USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_training; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_training ON replica.training USING btree (_ab_cdc_lsn);


--
-- Name: idx_cursor_training_participation; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_cursor_training_participation ON replica.training_participation USING btree (_ab_cdc_lsn);


--
-- Name: idx_extracted_at_replicaabsence_laration3b5bc7b290c261b215aae2c; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaabsence_laration3b5bc7b290c261b215aae2c ON replica.absence_declaration USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaabsence_reason3aa0198074d5e38b751bcf88d; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaabsence_reason3aa0198074d5e38b751bcf88d ON replica.absence_reason USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaacs_lab_test_uom05027d6f77811f0eecf1958; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaacs_lab_test_uom05027d6f77811f0eecf1958 ON replica.acs_lab_test_uom USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaacs_lab_testbc0fa2948b8d7045fea74b6e08a; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaacs_lab_testbc0fa2948b8d7045fea74b6e08a ON replica.acs_lab_test USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaacs_labo_request9d074273e0a760a97fdf631; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaacs_labo_request9d074273e0a760a97fdf631 ON replica.acs_laboratory_request USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaacs_labople_type8df7acd9705a3fb54d1b5d4; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaacs_labople_type8df7acd9705a3fb54d1b5d4 ON replica.acs_laboratory_sample_type USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaacs_laboratory5976895afad82eeedddb19855; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaacs_laboratory5976895afad82eeedddb19855 ON replica.acs_laboratory USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaacs_patiy_sample0c1a4e64cd4a2748cfd9ffb; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaacs_patiy_sample0c1a4e64cd4a2748cfd9ffb ON replica.acs_patient_laboratory_sample USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaattendancea8d73f56a5ae710a0e54486018d6e; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaattendancea8d73f56a5ae710a0e54486018d6e ON replica.attendance USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicabank90b9e63159bdc9886269a47dec97348f; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicabank90b9e63159bdc9886269a47dec97348f ON replica.bank USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicacandidaturefbfec013a7a0a92bbd4dcabc4e4e; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicacandidaturefbfec013a7a0a92bbd4dcabc4e4e ON replica.candidature USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicacashace3efab10395895c20ebf235f1a2890; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicacashace3efab10395895c20ebf235f1a2890 ON replica.cash USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicacontractcaf63d89dde97b8e506b83c0b3a2464; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicacontractcaf63d89dde97b8e506b83c0b3a2464 ON replica.contract USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicacustomer70c341bc0159ff3b2d4a056af038edf; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicacustomer70c341bc0159ff3b2d4a056af038edf ON replica.customer USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicacustomer_request66c0fd4920a0d5a6643a4ec; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicacustomer_request66c0fd4920a0d5a6643a4ec ON replica.customer_request USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicadelivery92b01be08450a81fd196d929c7215c3; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicadelivery92b01be08450a81fd196d929c7215c3 ON replica.delivery USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicadepartment9808f744d70f4258a47cb0b1a2704; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicadepartment9808f744d70f4258a47cb0b1a2704 ON replica.department USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaemployee308da9c625f44cca41190aa68f92899; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaemployee308da9c625f44cca41190aa68f92899 ON replica.employee USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaemployeesignment76cbb7ebbd2b30d66195d0c; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaemployeesignment76cbb7ebbd2b30d66195d0c ON replica.employee_assignment USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicafinanciaion_typed23f38f6d281a91d4e67e86; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicafinanciaion_typed23f38f6d281a91d4e67e86 ON replica.financial_transaction_type USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicahms_patient4c16b364f7c2d3a1833fbc3956c9; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicahms_patient4c16b364f7c2d3a1833fbc3956c9 ON replica.hms_patient USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicahms_physician5e96b3ec36548f4a08d5895c96; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicahms_physician5e96b3ec36548f4a08d5895c96 ON replica.hms_physician USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicainventorion_type0b57ca59c1fef3b349e59e1; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicainventorion_type0b57ca59c1fef3b349e59e1 ON replica.inventory_transaction_type USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicainventorybe0818ca1600410cc44bc24bd7f419; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicainventorybe0818ca1600410cc44bc24bd7f419 ON replica.inventory USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalab_bilan029053d2ee31a1cac41553e245f139; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalab_bilan029053d2ee31a1cac41553e245f139 ON replica.lab_bilan USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalab_testal_rangefddf95b10736508eda83ff1; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalab_testal_rangefddf95b10736508eda83ff1 ON replica.lab_test_normal_range USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalab_testriteareaab4b1e684ffd0a7e29f87fc; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalab_testriteareaab4b1e684ffd0a7e29f87fc ON replica.lab_test_critearea USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalab_testtemplated11b449b0d282e54b5ecbb4; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalab_testtemplated11b449b0d282e54b5ecbb4 ON replica.lab_test_criteria_template USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalab_unitdfb8a27d166e878dfbabba32ee70202; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalab_unitdfb8a27d166e878dfbabba32ee70202 ON replica.lab_unit USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalaboratoest_line23be13c5eb0f25dce04b3fe; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalaboratoest_line23be13c5eb0f25dce04b3fe ON replica.laboratory_request_line USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalaboratoipements3cfdeba96d327d7ffae0e84; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalaboratoipements3cfdeba96d327d7ffae0e84 ON replica.laboratory_equipements USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalaboratooup_line1b4aff5608058d0c6b7eed4; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalaboratooup_line1b4aff5608058d0c6b7eed4 ON replica.laboratory_group_line USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicalaboratory_group54d8b168681134d0b2db7d3; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicalaboratory_group54d8b168681134d0b2db7d3 ON replica.laboratory_group USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaleave07b6fea051721d52091634749d309a5e; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaleave07b6fea051721d52091634749d309a5e ON replica.leave USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaleave_requestb729198690dbf81cffae03668b; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaleave_requestb729198690dbf81cffae03668b ON replica.leave_request USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaloan_assignmentb5ccb92a3889439f90869b4d; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaloan_assignmentb5ccb92a3889439f90869b4d ON replica.loan_assignment USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaloan_status9c9fc3135baf7900f1e06ae6a0a9; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaloan_status9c9fc3135baf7900f1e06ae6a0a9 ON replica.loan_status USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicapatient_ory_teste225329663baad17962fdc9; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicapatient_ory_teste225329663baad17962fdc9 ON replica.patient_laboratory_test USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicapayment_method513293b26d5b01cac4b4e3190; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicapayment_method513293b26d5b01cac4b4e3190 ON replica.payment_method USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicapaymente9dfb5f44d7a83422261fc5aaf685765; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicapaymente9dfb5f44d7a83422261fc5aaf685765 ON replica.payment USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicapayroll411ae29eec9edfa351584687ac93bd65; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicapayroll411ae29eec9edfa351584687ac93bd65 ON replica.payroll USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicapositionaf9e1e82a20cc36308dd379c75bf400; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicapositionaf9e1e82a20cc36308dd379c75bf400 ON replica."position" USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaproduct68bf8fe26663448e10901dbe4e4f9b27; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaproduct68bf8fe26663448e10901dbe4e4f9b27 ON replica.product USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicaproforma_request6a1d2ba1a975b5e006525dd; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicaproforma_request6a1d2ba1a975b5e006525dd ON replica.proforma_request USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicapurchase6c3ee7873e05e573cfde1c7748131be; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicapurchase6c3ee7873e05e573cfde1c7748131be ON replica.purchase USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicareceipt4e467cc767cb9926668f114bd2bc07b3; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicareceipt4e467cc767cb9926668f114bd2bc07b3 ON replica.receipt USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicares_partner43573c2277fed8f9d8629857e6a2; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicares_partner43573c2277fed8f9d8629857e6a2 ON replica.res_partner USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicasales5e7c0fbf60295bc2a58e9e0ee3a56ae2; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicasales5e7c0fbf60295bc2a58e9e0ee3a56ae2 ON replica.sales USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicastorage_location29d1d8695da07aca9198030; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicastorage_location29d1d8695da07aca9198030 ON replica.storage_location USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicasupplier26d853f342b15dc73e4031a473163e7; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicasupplier26d853f342b15dc73e4031a473163e7 ON replica.supplier USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicatrainingcipationb8eb7e9075704990e35f536; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicatrainingcipationb8eb7e9075704990e35f536 ON replica.training_participation USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicatrainingd300dc753a70d2abdd62b5660c83b2a; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicatrainingd300dc753a70d2abdd62b5660c83b2a ON replica.training USING btree (_airbyte_extracted_at);


--
-- Name: idx_extracted_at_replicawarehousede3bd4e775416f9a8d2193d0c3cd69; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_extracted_at_replicawarehousede3bd4e775416f9a8d2193d0c3cd69 ON replica.warehouse USING btree (_airbyte_extracted_at);


--
-- Name: idx_pk_absence_declaration; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_absence_declaration ON replica.absence_declaration USING btree (id);


--
-- Name: idx_pk_absence_reason; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_absence_reason ON replica.absence_reason USING btree (nk_absence_reason);


--
-- Name: idx_pk_acs_lab_test; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_acs_lab_test ON replica.acs_lab_test USING btree (id);


--
-- Name: idx_pk_acs_lab_test_uom; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_acs_lab_test_uom ON replica.acs_lab_test_uom USING btree (id);


--
-- Name: idx_pk_acs_laboratory; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_acs_laboratory ON replica.acs_laboratory USING btree (id);


--
-- Name: idx_pk_acs_laboratory_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_acs_laboratory_request ON replica.acs_laboratory_request USING btree (id);


--
-- Name: idx_pk_acs_laboratory_sample_type; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_acs_laboratory_sample_type ON replica.acs_laboratory_sample_type USING btree (id);


--
-- Name: idx_pk_acs_patient_laboratory_sample; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_acs_patient_laboratory_sample ON replica.acs_patient_laboratory_sample USING btree (id);


--
-- Name: idx_pk_attendance; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_attendance ON replica.attendance USING btree (id);


--
-- Name: idx_pk_bank; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_bank ON replica.bank USING btree (id);


--
-- Name: idx_pk_candidature; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_candidature ON replica.candidature USING btree (id);


--
-- Name: idx_pk_cash; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_cash ON replica.cash USING btree (id);


--
-- Name: idx_pk_customer_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_customer_request ON replica.customer_request USING btree (id);


--
-- Name: idx_pk_delivery; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_delivery ON replica.delivery USING btree (id);


--
-- Name: idx_pk_employee_assignment; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_employee_assignment ON replica.employee_assignment USING btree (id);


--
-- Name: idx_pk_financial_transaction_type; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_financial_transaction_type ON replica.financial_transaction_type USING btree (nk_financial_transaction_type);


--
-- Name: idx_pk_inventory; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_inventory ON replica.inventory USING btree (id);


--
-- Name: idx_pk_inventory_transaction_type; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_inventory_transaction_type ON replica.inventory_transaction_type USING btree (nk_inventory_transaction_type);


--
-- Name: idx_pk_lab_bilan; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_lab_bilan ON replica.lab_bilan USING btree (id);


--
-- Name: idx_pk_lab_test_critearea; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_lab_test_critearea ON replica.lab_test_critearea USING btree (id);


--
-- Name: idx_pk_lab_test_criteria_template; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_lab_test_criteria_template ON replica.lab_test_criteria_template USING btree (id);


--
-- Name: idx_pk_lab_test_normal_range; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_lab_test_normal_range ON replica.lab_test_normal_range USING btree (id);


--
-- Name: idx_pk_lab_unit; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_lab_unit ON replica.lab_unit USING btree (id);


--
-- Name: idx_pk_laboratory_equipements; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_laboratory_equipements ON replica.laboratory_equipements USING btree (id);


--
-- Name: idx_pk_laboratory_group_line; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_laboratory_group_line ON replica.laboratory_group_line USING btree (id);


--
-- Name: idx_pk_laboratory_request_line; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_laboratory_request_line ON replica.laboratory_request_line USING btree (id);


--
-- Name: idx_pk_leave; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_leave ON replica.leave USING btree (nk_leave);


--
-- Name: idx_pk_leave_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_leave_request ON replica.leave_request USING btree (id);


--
-- Name: idx_pk_loan_assignment; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_loan_assignment ON replica.loan_assignment USING btree (id);


--
-- Name: idx_pk_loan_status; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_loan_status ON replica.loan_status USING btree (nk_loan_status);


--
-- Name: idx_pk_patient_laboratory_test; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_patient_laboratory_test ON replica.patient_laboratory_test USING btree (id);


--
-- Name: idx_pk_payment; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_payment ON replica.payment USING btree (id);


--
-- Name: idx_pk_payment_method; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_payment_method ON replica.payment_method USING btree (nk_payment_method);


--
-- Name: idx_pk_payroll; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_payroll ON replica.payroll USING btree (id);


--
-- Name: idx_pk_proforma_request; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_proforma_request ON replica.proforma_request USING btree (id);


--
-- Name: idx_pk_purchase; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_purchase ON replica.purchase USING btree (id);


--
-- Name: idx_pk_receipt; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_receipt ON replica.receipt USING btree (id);


--
-- Name: idx_pk_replicaabsence_laration3b5bc7b290c261b215aae2c05badcc77; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaabsence_laration3b5bc7b290c261b215aae2c05badcc77 ON replica.absence_declaration USING btree (id);


--
-- Name: idx_pk_replicaabsence_reason3aa0198074d5e38b751bcf88d71f8cc5; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaabsence_reason3aa0198074d5e38b751bcf88d71f8cc5 ON replica.absence_reason USING btree (nk_absence_reason);


--
-- Name: idx_pk_replicaacs_lab_test_uom05027d6f77811f0eecf19585c3422a16; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaacs_lab_test_uom05027d6f77811f0eecf19585c3422a16 ON replica.acs_lab_test_uom USING btree (id);


--
-- Name: idx_pk_replicaacs_lab_testbc0fa2948b8d7045fea74b6e08ab3f25; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaacs_lab_testbc0fa2948b8d7045fea74b6e08ab3f25 ON replica.acs_lab_test USING btree (id);


--
-- Name: idx_pk_replicaacs_labo_request9d074273e0a760a97fdf6312ac9a61d2; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaacs_labo_request9d074273e0a760a97fdf6312ac9a61d2 ON replica.acs_laboratory_request USING btree (id);


--
-- Name: idx_pk_replicaacs_labople_type8df7acd9705a3fb54d1b5d40bdb2aae1; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaacs_labople_type8df7acd9705a3fb54d1b5d40bdb2aae1 ON replica.acs_laboratory_sample_type USING btree (id);


--
-- Name: idx_pk_replicaacs_laboratory5976895afad82eeedddb198557a31ad8; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaacs_laboratory5976895afad82eeedddb198557a31ad8 ON replica.acs_laboratory USING btree (id);


--
-- Name: idx_pk_replicaacs_patiy_sample0c1a4e64cd4a2748cfd9ffb8512965bc; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaacs_patiy_sample0c1a4e64cd4a2748cfd9ffb8512965bc ON replica.acs_patient_laboratory_sample USING btree (id);


--
-- Name: idx_pk_replicaattendancea8d73f56a5ae710a0e54486018d6ef3f; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicaattendancea8d73f56a5ae710a0e54486018d6ef3f ON replica.attendance USING btree (id);


--
-- Name: idx_pk_replicabank90b9e63159bdc9886269a47dec97348f; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicabank90b9e63159bdc9886269a47dec97348f ON replica.bank USING btree (id);


--
-- Name: idx_pk_replicacandidaturefbfec013a7a0a92bbd4dcabc4e4e851b; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicacandidaturefbfec013a7a0a92bbd4dcabc4e4e851b ON replica.candidature USING btree (id);


--
-- Name: idx_pk_replicacashace3efab10395895c20ebf235f1a2890; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicacashace3efab10395895c20ebf235f1a2890 ON replica.cash USING btree (id);


--
-- Name: idx_pk_replicacustomer_request66c0fd4920a0d5a6643a4ec4317a9ecb; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicacustomer_request66c0fd4920a0d5a6643a4ec4317a9ecb ON replica.customer_request USING btree (id);


--
-- Name: idx_pk_replicadelivery92b01be08450a81fd196d929c7215c39; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_replicadelivery92b01be08450a81fd196d929c7215c39 ON replica.delivery USING btree (id);


--
-- Name: idx_pk_sales; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_sales ON replica.sales USING btree (id);


--
-- Name: idx_pk_training; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_training ON replica.training USING btree (nk_training);


--
-- Name: idx_pk_training_participation; Type: INDEX; Schema: replica; Owner: belkiss
--

CREATE INDEX idx_pk_training_participation ON replica.training_participation USING btree (id);


--
-- Name: airbyte_publication; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION airbyte_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION airbyte_publication OWNER TO postgres;

--
-- Name: airbyte_publication source; Type: PUBLICATION TABLES IN SCHEMA; Schema: source; Owner: postgres
--

ALTER PUBLICATION airbyte_publication ADD TABLES IN SCHEMA source;


--
-- PostgreSQL database dump complete
--

\unrestrict IyU5weguI9z9iRiRp0utCSI3ajLLZ3v1eJGwBN9sJXLZlnm71LuokfhgDH1ZSXK

