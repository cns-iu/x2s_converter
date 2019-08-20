create table ct_master (
	nct_id varchar,
	study_first_submitted varchar,
	detailed_description varchar,
	disposition_first_posted varchar,
	study_type varchar,
	target_duration varchar,
	primary_completion_date varchar,
	study_first_posted varchar,
	has_expanded_access varchar,
	results_first_posted_type varchar,
	number_of_arms varchar,
	last_update_posted_type varchar,
	results_first_submitted_qc varchar,
	brief_title varchar,
	acronym varchar,
	enrollment_type varchar,
	overall_status varchar,
	number_of_groups varchar,
	study_first_submitted_qc varchar,
	last_update_posted varchar,
	verification_date varchar,
	disposition_first_submitted_qc varchar,
	source varchar,
	results_first_posted varchar,
	completion_date varchar,
	last_update_submitted_qc varchar,
	official_title varchar,
	enrollment varchar,
	brief_summary varchar,
	deposition_first_posted_type varchar,
	biospec_retention varchar,
	phase varchar,
	results_first_submitted varchar,
	biospec_desc varchar,
	start_date varchar,
	disposition_first_submitted varchar,
	last_known_status varchar,
	start_date_type varchar,
	why_stopped varchar,
	completion_date_type varchar,
	last_update_submitted varchar,
	study_first_posted_type varchar,
	primary_completion_date_type varchar
);

create table ct_other_outcome (
	nct_id varchar,
	oth_out_id_ctr int,
	time_frame varchar,
	measure varchar,
	description varchar
);

create table ct_expanded_access (
	nct_id varchar,
	exp_acc_id_ctr int,
	type_treatment varchar,
	type_intermediate varchar,
	type_individual varchar
);

create table ct_condition_browse (
	nct_id varchar,
	cond_brow_id_ctr int,
	mesh_term varchar
);

create table ct_references (
	nct_id varchar,
	ref_id_ctr int,
	pmid varchar,
	citation varchar
);

create table ct_overall_official (
	nct_id varchar,
	over_off_id_ctr int,
	middle_name varchar,
	affiliation varchar,
	role varchar,
	degrees varchar,
	last_name varchar,
	first_name varchar
);

create table ct_responsible_party (
	nct_id varchar,
	ref_party_id_ctr int,
	investigator_full_name varchar,
	investigator_affiliation varchar,
	name_title varchar,
	responsible_party_type varchar,
	investigator_title varchar,
	organization varchar
);

create table ct_collaborator_sponsors (
	nct_id varchar,
	lead_coll_id_ctr int,
	agency_class varchar,
	agency varchar
);

create table ct_results_references (
	nct_id varchar,
	results_ref_id_ctr int,
	pmid varchar,
	citation varchar
);

create table ct_lead_sponsors (
	nct_id varchar,
	lead_id_ctr int,
	agency_class varchar,
	agency varchar
);

create table ct_oversight_info (
	nct_id varchar,
	oversight_id_ctr int,
	has_dmc varchar,
	is_us_export varchar,
	is_unapproved_device varchar,
	is_fda_regulated_device varchar,
	is_fda_regulated_drug varchar,
	is_ppsd varchar
);

create table ct_study_doc (
	nct_id varchar,
	study_doc_id_ctr int,
	doc_url varchar,
	doc_type varchar,
	doc_comment varchar,
	doc_id varchar
);

create table ct_pending_results_returned (
	nct_id varchar,
	pend_result_return_id_ctr int,
	returned_date varchar
);

create table ct_location_countries (
	nct_id varchar,
	loc_country_id_ctr int,
	country varchar
);

create table ct_arm_group (
	nct_id varchar,
	arm_grp_id_ctr int,
	arm_group_type varchar,
	description varchar,
	arm_group_label varchar
);

create table ct_patient_data (
	nct_id varchar,
	patient_id_ctr int,
	ipd_access_criteria varchar,
	ipd_time_frame varchar,
	sharing_ipd varchar,
	ipd_url varchar,
	ipd_description varchar
);

create table ct_pending_results_submission_canceled (
	nct_id varchar,
	pend_result_sub_can_id_ctr int,
	submission_canceled_date varchar
);

create table ct_eligibility (
	nct_id varchar,
	eligibility_id_ctr int,
	study_pop varchar,
	gender_based varchar,
	maximum_age varchar,
	healthy_volunteers varchar,
	sampling_method varchar,
	minimum_age varchar,
	gender_description varchar,
	criteria varchar,
	gender varchar
);

create table ct_keyword (
	nct_id varchar,
	keyword_id_ctr int,
	keyword varchar
);

create table ct_links (
	nct_id varchar,
	links_id_ctr int,
	url varchar,
	link_desc varchar
);

create table ct_study_design_info (
	nct_id varchar,
	study_design_id_ctr int,
	time_perspective varchar,
	masking_description varchar,
	intervention_model varchar,
	observational_model varchar,
	intervention_model_description varchar,
	primary_purpose varchar,
	masking varchar,
	allocation varchar
);

create table ct_secondary_outcome (
	nct_id varchar,
	sec_out_id_ctr int,
	time_frame varchar,
	measure varchar,
	description varchar
);

create table ct_primary_outcome (
	nct_id varchar,
	pri_out_id_ctr int,
	time_frame varchar,
	measure varchar,
	description varchar
);

create table ct_pending_results_submitted (
	nct_id varchar,
	pend_result_sub_id_ctr int,
	submitted_date varchar
);

create table ct_overall_contact_backup (
	nct_id varchar,
	over_cont_bck_id_ctr int,
	middle_name varchar,
	phone varchar,
	degrees varchar,
	last_name varchar,
	phone_ext varchar,
	email varchar,
	first_name varchar
);

create table ct_results (
	nct_id varchar,
	cr_id_ctr int,
	poc_phone varchar,
	recruitment_details varchar,
	poc_email varchar,
	pi_employee varchar,
	poc_name_or_title varchar,
	poc_organization varchar,
	restrictive_agreement varchar,
	limitations_and_caveats varchar,
	pre_assignment_details varchar
);

create table ct_intervention_browse (
	nct_id varchar,
	intervention_brow_id_ctr int,
	mesh_term varchar
);

create table ct_location (
	nct_id varchar,
	loc_ctr int,
	status varchar
);

create table ct_id_info (
	nct_id varchar,
	id_info_ctr int,
	org_study_id varchar
);

create table ct_removed_countries (
	nct_id varchar,
	rm_country_id_ctr int,
	country varchar
);

create table ct_required_header (
	nct_id varchar,
	rh_ctr int,
	download_date varchar,
	url varchar,
	link_text varchar
);

create table ct_patient_provided_doc (
	nct_id varchar,
	ct_pat_prov_doc_id_ctr int,
	doc_url varchar,
	doc_has_icf varchar,
	doc_type varchar,
	doc_has_sap varchar,
	doc_date varchar,
	doc_has_protocol varchar
);

create table ct_overall_contact (
	nct_id varchar,
	over_cont_id_ctr int,
	middle_name varchar,
	phone varchar,
	degrees varchar,
	last_name varchar,
	phone_ext varchar,
	email varchar,
	first_name varchar
);

create table ct_intervention (
	nct_id varchar,
	intervention_id_ctr int,
	intervention_type varchar,
	description varchar,
	intervention_name varchar
);

create table ct_condition (
	nct_id varchar,
	condition_id_ctr int,
	condition varchar
);

create table ct_results_period (
	nct_id varchar,
	cr_id_ctr int,
	ctp_ctr int,
	title varchar
);

create table ct_patient_data_info_type (
	nct_id varchar,
	patient_id_ctr int,
	ipd_info_ctr int,
	ipd_info_type varchar
);

create table ct_nct_aliases (
	nct_id varchar,
	id_info_ctr int,
	nct_alias_ctr int,
	nct_alias varchar
);

create table ct_location_investigator (
	nct_id varchar,
	loc_ctr int,
	loc_invest_id_ctr int,
	middle_name varchar,
	affiliation varchar,
	role varchar,
	degrees varchar,
	last_name varchar,
	first_name varchar
);

create table ct_facility (
	nct_id varchar,
	loc_ctr int,
	fid_ctr int,
	name varchar
);

create table ct_results_group (
	nct_id varchar,
	cr_id_ctr int,
	ctg_ctr int,
	group_id varchar,
	title varchar,
	description varchar
);

create table ct_intervention_other_name (
	nct_id varchar,
	intervention_id_ctr int,
	cion_ctr int,
	other_name varchar
);

create table ct_results_baseline_measures (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	population varchar,
	description varchar,
	params varchar,
	unit_analyzed varchar,
	title varchar,
	dispersion varchar,
	units varchar
);

create table ct_results_baseline_groups (
	nct_id varchar,
	cr_id_ctr int,
	group_ctr int,
	ctbg_id varchar,
	title varchar,
	description varchar
);

create table ct_results_baseline_analyzed (
	nct_id varchar,
	cr_id_ctr int,
	ctba_ctr int,
	scope varchar,
	units varchar
);

create table ct_results_reported_events (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	time_frame varchar,
	description varchar
);

create table ct_results_baseline (
	nct_id varchar,
	cr_id_ctr int,
	ct_results_baseline_id_ctr int,
	population varchar
);

create table ct_secondary_id (
	nct_id varchar,
	id_info_ctr int,
	sec_id_ctr int,
	secondary_id varchar
);

create table ct_results_outcomes (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	population varchar,
	time_frame varchar,
	posting_date varchar,
	description varchar,
	type varchar,
	title varchar,
	safety_issue varchar
);

create table ct_location_contact (
	nct_id varchar,
	loc_ctr int,
	loc_cont_id_ctr int,
	middle_name varchar,
	phone varchar,
	degrees varchar,
	last_name varchar,
	phone_ext varchar,
	email varchar,
	first_name varchar
);

create table ct_location_contact_backup (
	nct_id varchar,
	loc_ctr int,
	loc_cont_bck_id_ctr int,
	middle_name varchar,
	phone varchar,
	degrees varchar,
	last_name varchar,
	phone_ext varchar,
	email varchar,
	first_name varchar
);

create table ct_intervention_agl (
	nct_id varchar,
	intervention_id_ctr int,
	iagl_ctr int,
	arm_group_label varchar
);

create table ct_results_events_other (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	reo_ctr int,
	default_vocab varchar,
	frequency_threshold varchar,
	default_assessment varchar
);

create table ct_results_baseline_measure_class (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bmc_ctr int,
	title varchar
);

create table ct_results_baseline_analyzed_count (
	nct_id varchar,
	cr_id_ctr int,
	ctba_ctr int,
	bac_ctr int,
	group_id varchar,
	value varchar
);

create table ct_results_outcome_analysis (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	oa_ctr int,
	p_value varchar,
	non_inferiority_type varchar,
	ci_n_sides varchar,
	param_type varchar,
	dispersion_type varchar,
	dispersion_value varchar,
	method_desc varchar,
	non_inferiority_desc varchar,
	groups_desc varchar,
	p_value_desc varchar,
	method varchar,
	ci_upper_limit_na_comment varchar,
	ci_upper_limit varchar,
	param_value varchar,
	ci_lower_limit varchar,
	estimate_desc varchar,
	other_analysis_desc varchar,
	ci_percent varchar
);

create table ct_results_period_milestones (
	nct_id varchar,
	cr_id_ctr int,
	ctp_ctr int,
	ctpm_ctr int,
	title varchar
);

create table ct_results_baseline_measure_analyzed (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bma_ctr int,
	scope varchar,
	units varchar
);

create table ct_fac_address (
	nct_id varchar,
	loc_ctr int,
	fid_ctr int,
	faid_ctr int,
	country varchar,
	zip varchar,
	city varchar,
	state varchar
);

create table ct_results_outcome_measures (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	population varchar,
	description varchar,
	units_analyzed varchar,
	title varchar,
	param varchar,
	dispersion varchar,
	units varchar
);

create table ct_results_period_drops (
	nct_id varchar,
	cr_id_ctr int,
	ctp_ctr int,
	ctpd_ctr int,
	title varchar
);

create table ct_results_outcomes_groups (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocg_ctr int,
	group_id varchar,
	title varchar,
	description varchar
);

create table ct_results_events_serious (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	res_ctr int,
	default_vocab varchar,
	frequency_threshold varchar,
	default_assessment varchar
);

create table ct_results_reported_events_groups (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	reg_ctr int,
	group_id varchar,
	title varchar,
	description varchar
);

create table ct_results_events_other_categories (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	reo_ctr int,
	reoc_ctr int,
	title varchar
);

create table ct_results_outcome_measure_analyzed (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	ocma_ctr int,
	scope varchar,
	units varchar
);

create table ct_results_outcome_analysis_group (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	oa_ctr int,
	oag_ctr int,
	group_id varchar
);

create table ct_results_period_drops_participants (
	nct_id varchar,
	cr_id_ctr int,
	ctp_ctr int,
	ctpd_ctr int,
	ctpdp_ctr int,
	count varchar,
	group_id varchar
);

create table ct_results_events_serious_categories (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	res_ctr int,
	resc_ctr int,
	title varchar
);

create table ct_results_baseline_measure_analyzed_count (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bma_ctr int,
	bmac_ctr int,
	group_id varchar,
	value varchar
);

create table ct_results_period_participants (
	nct_id varchar,
	cr_id_ctr int,
	ctp_ctr int,
	ctpm_ctr int,
	ctpmp_ctr int,
	count varchar,
	participants varchar,
	group_id varchar
);

create table ct_results_baseline_measure_class_analyzed (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bmc_ctr int,
	bmca_ctr int,
	scope varchar,
	units varchar
);

create table ct_results_outcome_measure_class (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	occ_ctr int,
	title varchar
);

create table ct_results_baseline_measure_categories (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bmc_ctr int,
	bmcc_ctr int,
	title varchar
);

create table ct_results_baseline_measure_values (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bmc_ctr int,
	bmcc_ctr int,
	bmccm_ctr int,
	spread varchar,
	group_id varchar,
	value varchar,
	measurement varchar,
	upper_limit varchar,
	lower_limit varchar
);

create table ct_results_baseline_measure_class_analyzed_count (
	nct_id varchar,
	cr_id_ctr int,
	bm_ctr int,
	bmc_ctr int,
	bmca_ctr int,
	bmcac_ctr int,
	group_id varchar,
	value varchar
);

create table ct_results_outcome_measure_class_analyzed (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	occ_ctr int,
	occa_ctr int,
	scope varchar,
	units varchar
);

create table ct_results_events_other_categories_events (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	reo_ctr int,
	reoc_ctr int,
	reoce_ctr int,
	assessment varchar,
	description varchar,
	vocab varchar,
	sub_title varchar
);

create table ct_results_events_serious_categories_events (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	res_ctr int,
	resc_ctr int,
	resce_ctr int,
	assessment varchar,
	description varchar,
	vocab varchar,
	sub_title varchar
);

create table ct_results_outcome_measure_class_categories (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	occ_ctr int,
	occc_ctr int,
	title varchar
);

create table ct_results_outcome_measure_analyzed_count (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	ocma_ctr int,
	ocmac_ctr int,
	group_id varchar,
	value varchar
);

create table ct_results_outcome_measure_class_categories_measurement (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	occ_ctr int,
	occc_ctr int,
	occcm_ctr int,
	spread varchar,
	group_id varchar,
	value varchar,
	measurement varchar,
	upper_limit varchar,
	lower_limit varchar
);

create table ct_results_outcome_measure_class_analyzed_count (
	nct_id varchar,
	cr_id_ctr int,
	oc_ctr int,
	ocm_ctr int,
	occ_ctr int,
	occa_ctr int,
	occac_ctr int,
	group_id varchar,
	value varchar
);

create table ct_results_events_other_categories_events_counts (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	reo_ctr int,
	reoc_ctr int,
	reoce_ctr int,
	reocec_ctr int,
	group_id varchar,
	events varchar,
	subjects_at_risk varchar,
	subjects_affected varchar
);

create table ct_results_events_serious_categories_events_counts (
	nct_id varchar,
	cr_id_ctr int,
	re_ctr int,
	res_ctr int,
	resc_ctr int,
	resce_ctr int,
	rescec_ctr int,
	group_id varchar,
	events varchar,
	subjects_at_risk varchar,
	subjects_affected varchar
);


