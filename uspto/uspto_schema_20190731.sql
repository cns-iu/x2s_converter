create table pubref (
	doc_num varchar,
	disclaimer varchar,
	claim_statement varchar,
	class_national varchar,
	produced_date varchar,
	status varchar,
	dtd_version varchar,
	length_grant varchar,
	us_term_extension varchar,
	us_microform_quantity varchar,
	class_ipc_edition varchar,
	prosecution_app varchar,
	doc_id_date varchar,
	main_class varchar,
	prior_disclosure_affidavit_filed varchar,
	country varchar,
	series_code varchar,
	qq varchar,
	invention_title varchar,
	lang varchar,
	class_ipc_main_class varchar,
	no_of_claims varchar,
	ident varchar,
	doc_id_country varchar,
	us_sir_flag varchar,
	class_locarno varchar,
	filename varchar,
	classification varchar,
	pub_date varchar,
	doc_id_kind varchar
);

create table deceased (
	doc_num varchar,
	dead_id_ctr int,
	seq varchar,
	first_name varchar,
	last_name varchar
);

create table us_ref_cit_nplcit (
	doc_num varchar,
	us_nplcit_id_ctr int,
	num varchar,
	othercit varchar
);

create table us_ref_cit_patcit (
	doc_num varchar,
	us_ref_cit_pat_id_ctr int,
	patcit_doc_num varchar,
	patcit_kind varchar,
	patcit_country varchar,
	patcit_name varchar,
	patcit_date varchar,
	patcit_num varchar
);

create table us_applicant (
	doc_num varchar,
	us_appl_id_ctr int,
	addr_state varchar,
	addr_book_last_name varchar,
	addr_country varchar,
	addr_book_country varchar,
	designation varchar,
	country_residence varchar,
	addr_book_state varchar,
	seq varchar,
	addr_book_city varchar,
	app_auth_cat varchar,
	addr_last_name varchar,
	addr_street varchar,
	addr_book_first_name varchar,
	addr_book_street varchar,
	addr_city varchar,
	app_type varchar,
	orgname varchar,
	addr_first_name varchar
);

create table sequence_list_doc (
	doc_num varchar,
	seq_list_id_ctr int,
	file_type varchar,
	carriers varchar,
	file varchar,
	doc_id varchar
);

create table us_ref_cited_class_nat (
	doc_num varchar,
	us_ref_class_nat_id_ctr int,
	country varchar,
	main_class varchar
);

create table applicant (
	doc_num varchar,
	us_app_id_ctr int,
	firstname varchar,
	street varchar,
	lastname varchar,
	country_nationality varchar,
	state varchar,
	designation varchar,
	kind varchar,
	country_residence varchar,
	city varchar,
	mailcode varchar,
	postcode varchar,
	seq varchar,
	country varchar,
	app_auth_cat varchar,
	to_dead_inventor varchar,
	app_type varchar,
	orgname varchar
);

create table us_field_of_class_search_ipcr (
	doc_num varchar,
	us_class_ipcr int,
	us_class_search_ipcr varchar
);

create table description (
	doc_num varchar,
	description_id_ctr int,
	description_txt varchar,
	id varchar
);

create table agents (
	doc_num varchar,
	agents_id_ctr int,
	country varchar,
	firstname varchar,
	orgname varchar,
	reg_type varchar,
	lastname varchar,
	seq varchar
);

create table us_chem (
	doc_num varchar,
	us_id_ctr int,
	idref varchar,
	mol_file varchar,
	cdx_file varchar
);

create table related_doc (
	doc_num varchar,
	related_doc_id_ctr int,
	parent_pct_date varchar,
	parent_status varchar,
	parent_pct_kind varchar,
	date varchar,
	par_grant_doc_num varchar,
	child_doc_number varchar,
	parent_pct_country varchar,
	par_grant_country varchar,
	parent_pct_doc_num varchar,
	parent_doc_num varchar,
	parent_country varchar,
	international_filing_date varchar,
	child_doc_date varchar,
	parent_kind varchar,
	child_country varchar,
	par_grant_kind varchar,
	parent_date varchar,
	child_doc_kind varchar
);

create table continuation (
	doc_num varchar,
	continuation_id_ctr int,
	parent_pct_date varchar,
	parent_status varchar,
	date varchar,
	child_first_name varchar,
	continuation_doc_num varchar,
	kind varchar,
	child_date varchar,
	parent_pct_country varchar,
	parent_pct_doc_num varchar,
	child_doc_num varchar,
	country varchar,
	parent_doc_num varchar,
	parent_country varchar,
	child_kind varchar,
	international_filing_date varchar,
	child_country varchar,
	parent_kind varchar,
	parent_date varchar,
	child_last_name varchar
);

create table related_pub (
	doc_num varchar,
	related_pub_id_ctr int,
	country varchar,
	kind varchar,
	date varchar,
	doc_number varchar
);

create table ref_cit_class_cpc (
	doc_num varchar,
	ref_cite_class_cpc_id_ctr int,
	class_cpc_text varchar
);

create table ref_cit_class_ipc (
	doc_num varchar,
	ref_cit_class_ipc_id_ctr int,
	class_ipc_main_class varchar,
	class_ipc_edition varchar
);

create table inventor (
	doc_num varchar,
	inventor_id int,
	country varchar,
	designation varchar,
	city varchar,
	seq varchar,
	first_name varchar,
	last_name varchar
);

create table us_botanic (
	doc_num varchar,
	us_botanic_id_ctr int,
	variety varchar,
	botanic_latin_name varchar
);

create table us_exemplary_claim (
	doc_num varchar,
	us_exemplary_claim_id_ctr int,
	us_examplary_claim varchar
);

create table assist_examiner (
	doc_num varchar,
	assist_exam_id_ctr int,
	first_name varchar,
	last_name varchar
);

create table appref (
	doc_num varchar,
	appref_id_ctr int,
	country varchar,
	date varchar,
	appref_doc_num varchar,
	type varchar
);

create table drawings (
	doc_num varchar,
	drawing_id_ctr int,
	id varchar
);

create table pct_regional_fil (
	doc_num varchar,
	pct_reg_fil_id_ctr int,
	us371c124_date varchar,
	prf_doc_num varchar,
	country varchar,
	kind varchar,
	date varchar,
	us371c12_date varchar
);

create table us_deceased (
	doc_num varchar,
	us_dead_id_ctr int,
	country varchar,
	street varchar,
	state varchar,
	last_name varchar,
	city varchar,
	postcode varchar,
	seq varchar,
	first_name varchar
);

create table substitution (
	doc_num varchar,
	substitution_id_ctr int,
	parent_status varchar,
	country varchar,
	date varchar,
	child_country varchar,
	kind varchar,
	substitution_doc_num varchar,
	child_doc_num varchar
);

create table figures (
	doc_num varchar,
	figures_id_ctr int,
	num_of_drawing_sheets varchar,
	num_of_figures varchar
);

create table examiner (
	doc_num varchar,
	examiner_id_ctr int,
	department varchar,
	first_name varchar,
	last_name varchar
);

create table ref_cit_category (
	doc_num varchar,
	ref_cit_cat_id_ctr int,
	category varchar
);

create table class_cpc_comb_set (
	doc_num varchar,
	class_cpc_comb_set_id_ctr int,
	group_num varchar
);

create table ref_cited_class_nat (
	doc_num varchar,
	us_ref_class_cited_nat_id_ctr int,
	country varchar,
	main_class varchar
);

create table field_of_search_national (
	doc_num varchar,
	field_of_search_national_id_ctr int,
	national_country varchar,
	national_clasification varchar,
	national_additional varchar
);

create table us_ref_cit_category (
	doc_num varchar,
	us_ref_cit_cat_id_ctr int,
	category varchar
);

create table class_cpc_main (
	doc_num varchar,
	class_cpc_main_id_ctr int,
	class_source varchar,
	action_date varchar,
	schema_orig_code varchar,
	cpc_version_date varchar,
	subgroup varchar,
	section varchar,
	gen_office_country varchar,
	class_value varchar,
	main_group varchar,
	class_status varchar,
	subclass varchar,
	class varchar,
	symbol_postition varchar
);

create table field_of_search_ipc (
	doc_num varchar,
	field_of_search_ipc_id_ctr int,
	class_ipc_main_class varchar,
	class_ipc_edition varchar
);

create table class_cpc_further (
	doc_num varchar,
	class_cpc_further_id_ctr int,
	class_source varchar,
	action_date varchar,
	schema_orig_code varchar,
	cpc_version_date varchar,
	subgroup varchar,
	section varchar,
	gen_office_country varchar,
	symbol_position varchar,
	class_value varchar,
	main_group varchar,
	class_status varchar,
	subclass varchar,
	class varchar
);

create table us_field_of_class_search_cpc (
	doc_num varchar,
	class_cpc_text_id_ctr int,
	text varchar
);

create table us_ref_cit_class_cpc (
	doc_num varchar,
	us_ref_cit_class_cpc_id_ctr int,
	class_cpc_text varchar
);

create table us_related_doc_reexam (
	doc_num varchar,
	us_relate_doc_reexam_ctr int,
	parent_grant_date varchar,
	parent_doc_num varchar,
	parent_country varchar,
	parent_grant_country varchar,
	child_country varchar,
	parent_kind varchar,
	parent_date varchar,
	parent_grant_doc_num varchar,
	child_doc_num varchar,
	parent_grant_kind varchar
);

create table assignee (
	doc_num varchar,
	assignee_id_ctr int,
	addr_book_addr_country varchar,
	addr_book_last_name varchar,
	addr_book_addr_state varchar,
	last_name varchar,
	addr_book_first_name varchar,
	addr_book_role varchar,
	addr_book_orgname varchar,
	orgname varchar,
	role varchar,
	addr_book_addr_city varchar,
	first_name varchar
);

create table ref_cit_nplcit (
	doc_num varchar,
	nplcit_id_ctr int,
	num varchar,
	othercit varchar
);

create table class_ipcr (
	doc_num varchar,
	class_ipcr_id_ctr int,
	class_ipcr_action_date varchar,
	class_ipcr_class varchar,
	class_ipcr_class_level varchar,
	class_ipcr_sub_group varchar,
	class_ipcr_section varchar,
	class_ipcr_date varchar,
	class_ipcr_class_value varchar,
	class_ipcr_position varchar,
	class_ipcr_status varchar,
	class_ipcr_country varchar,
	class_ipcr_subclass varchar,
	class_ipcr_data_status varchar,
	class_ipcr_main_group varchar
);

create table reissue (
	doc_num varchar,
	reissue_id_ctr int,
	parent_pct_date varchar,
	parent_status varchar,
	parent_pct_kind varchar,
	date varchar,
	parent_pct_doc_number varchar,
	child_doc_number varchar,
	reissue_doc_num varchar,
	kind varchar,
	parent_doc_number varchar,
	parent_pct_country varchar,
	country varchar,
	parent_country varchar,
	parent_kind varchar,
	child_country varchar,
	parent_date varchar
);

create table claims (
	doc_num varchar,
	claims_id_ctr int,
	id varchar
);

create table further_class (
	doc_num varchar,
	further_class_id_ctr int,
	further_classification varchar
);

create table us_continuing_reissue (
	doc_num varchar,
	us_cont_reissue_ctr int,
	child_doc_doc_num varchar,
	parent_grant_date varchar,
	parent_grant_country varchar,
	doc_id_country varchar,
	child_doc_country varchar,
	parent_grant_doc_num varchar,
	doc_id_date varchar,
	doc_id_doc_num varchar
);

create table us_prov_app (
	doc_num varchar,
	us_prove_app_id_ctr int,
	us_prov_app_doc_num varchar,
	country varchar,
	kind varchar,
	status varchar,
	date varchar
);

create table us_sequence_list_doc (
	doc_num varchar,
	us_seq_list_doc_id_ctr int,
	file_type varchar,
	carriers varchar,
	file varchar,
	doc_id varchar,
	doc_text varchar
);

create table us_field_of_class_search_cpc_comb (
	doc_num varchar,
	class_cpc_comb_id_ctr int,
	class_cpc_comb_text varchar
);

create table class_national (
	doc_num varchar,
	class_national_id_ctr int,
	country varchar,
	additional varchar,
	main_class varchar
);

create table us_inventor (
	doc_num varchar,
	inventor_id_ctr int,
	country varchar,
	state varchar,
	last_name varchar,
	designation varchar,
	city varchar,
	seq varchar,
	first_name varchar
);

create table class_ipc_further_class (
	doc_num varchar,
	futher_class_id_ctr int,
	class_ipc_further_class varchar
);

create table hague_agreement (
	doc_num varchar,
	hague_agreement_id_ctr int,
	filing_date varchar,
	reg_date varchar,
	reg_num varchar,
	reg_pub_date varchar
);

create table class_cpc_comb_rank (
	doc_num varchar,
	class_cpc_comb_rank_id_ctr int,
	action_date varchar,
	version_indicator_date varchar,
	schema_orig_code varchar,
	subgroup varchar,
	section varchar,
	gen_office_country varchar,
	symbol_position varchar,
	class_value varchar,
	main_group varchar,
	class_status varchar,
	subclass varchar,
	class varchar,
	rank varchar,
	class_data_source varchar
);

create table pct_regional_pub (
	doc_num varchar,
	pct_region_pub_id_ctr int,
	country varchar,
	kind varchar,
	date varchar,
	prp_doc_num varchar
);

create table priority_claim (
	doc_num varchar,
	priority_claim_id_ctr int,
	country varchar,
	kind varchar,
	date varchar,
	priority_claim_doc_num varchar,
	seq varchar
);

create table ref_cit_patcit (
	doc_num varchar,
	ref_cit_pat_id_ctr int,
	patcit_doc_num varchar,
	patcit_kind varchar,
	patcit_country varchar,
	patcit_name varchar,
	patcit_date varchar,
	patcit_num varchar
);

create table us_maths (
	doc_num varchar,
	us_maths_id_ctr int,
	img_content varchar,
	img_wi varchar,
	img_id varchar,
	img_he varchar,
	img_file varchar,
	idrefs varchar,
	img_format varchar,
	nb_file varchar,
	img_alt varchar
);

create table continuation_in_part (
	doc_num varchar,
	cont_in_part_id_ctr int,
	parent_pct_date varchar,
	parent_grant_date varchar,
	parent_status varchar,
	cip_doc_num varchar,
	parent_pct_kind varchar,
	date varchar,
	parent_grant_country varchar,
	kind varchar,
	parent_pct_country varchar,
	parent_grant_doc_num varchar,
	parent_pct_doc_num varchar,
	child_doc_num varchar,
	parent_grant_kind varchar,
	country varchar,
	international_filing_date varchar,
	child_doc_date varchar,
	child_country varchar,
	child_doc_kind varchar
);

create table us_agents (
	doc_num varchar,
	us_agents_id_ctr int,
	country varchar,
	addr_state varchar,
	addr_last_name varchar,
	last_name varchar,
	addr_city varchar,
	reg_type varchar,
	orgname varchar,
	seq varchar,
	first_name varchar,
	addr_first_name varchar
);

create table pubref_abs (
	doc_num varchar,
	pubref_abs_id_ctr int,
	abstract_txt varchar,
	abstract_id varchar
);

create table us_ref_cited_further (
	doc_num varchar,
	us_ref_class_nat_id_ctr int,
	us_ref_cited_further_id_ctr int,
	further_classification varchar
);

create table descrip_of_draw (
	doc_num varchar,
	description_id_ctr int,
	description_draw_id_ctr int,
	description varchar
);

create table claim (
	doc_num varchar,
	claims_id_ctr int,
	claim_id_ctr int,
	num varchar,
	text varchar,
	id varchar
);

create table ref_cited_further (
	doc_num varchar,
	us_ref_class_cited_nat_id_ctr int,
	ref_cited_further_id_ctr int,
	further_classification varchar
);

create table description_heading (
	doc_num varchar,
	description_id_ctr int,
	description_heading_id_ctr int,
	level varchar,
	head_id varchar,
	head_text varchar
);

create table sequence_list_p (
	doc_num varchar,
	seq_list_id_ctr int,
	seq_list_p_id_ctr int,
	num varchar,
	text varchar,
	id varchar
);

create table abstract_p (
	doc_num varchar,
	pubref_abs_id_ctr int,
	abstract_p_id_ctr int,
	num varchar,
	text varchar,
	p_id varchar
);

create table description_p (
	doc_num varchar,
	description_id_ctr int,
	description_p_id_ctr int,
	figref_text_p varchar,
	num varchar,
	id_p varchar
);

create table us_sequence_list_p (
	doc_num varchar,
	us_seq_list_doc_id_ctr int,
	seq_list_p_id_ctr int,
	num varchar,
	text varchar,
	id varchar
);

create table draw_fig (
	doc_num varchar,
	drawing_id_ctr int,
	draw_fig_id_ctr int,
	fig_num varchar,
	fig_id varchar
);

create table dod_head (
	doc_num varchar,
	description_id_ctr int,
	description_draw_id_ctr int,
	dod_head_id_ctr int,
	level varchar,
	heading varchar,
	heading_id varchar
);

create table draw_fig_image (
	doc_num varchar,
	drawing_id_ctr int,
	draw_fig_id_ctr int,
	draw_fig_image_id_ctr int,
	alt varchar,
	he varchar,
	content varchar,
	orientation varchar,
	file varchar,
	format varchar,
	wi varchar,
	id varchar
);

create table dod_p (
	doc_num varchar,
	description_id_ctr int,
	description_draw_id_ctr int,
	dod_p_id_ctr int,
	p_id varchar,
	p_text varchar,
	p_num varchar
);


