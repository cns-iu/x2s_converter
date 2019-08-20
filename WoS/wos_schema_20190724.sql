create table wos_summary (
	uid varchar,
	edate varchar,
	reviewed_language_count varchar,
	bib_pagecount_type varchar,
	name_count varchar,
	xsi_type varchar,
	address_count varchar,
	model varchar,
	pubmonth varchar,
	title_count varchar,
	reviewed_year varchar,
	normalized_doctype_count varchar,
	bib_id varchar,
	issue varchar,
	item_ids_avail varchar,
	conference_count varchar,
	sortdate varchar,
	abstract_count varchar,
	reference_count varchar,
	special_issue varchar,
	descriptive_ref_count varchar,
	keyword_count varchar,
	coverdate varchar,
	book_notes_count varchar,
	book_pages varchar,
	supplement varchar,
	subheadings_count varchar,
	pubday varchar,
	grants_count varchar,
	bib_pagecount varchar,
	is_archive varchar,
	language_count varchar,
	coll_id varchar,
	book_chapters varchar,
	normalized_language_count varchar,
	item_coll_id varchar,
	subjects_count varchar,
	part_no varchar,
	season varchar,
	disclaimer varchar,
	fund_ack varchar,
	keywords_plus_count varchar,
	pubyear varchar,
	city varchar,
	has_abstract varchar,
	pubtype varchar,
	medium varchar,
	item_ids varchar,
	voliss varchar,
	doctype_count varchar,
	country varchar,
	grants_complete varchar,
	vol varchar,
	reviewed_author_count varchar,
	chapterlist_count varchar,
	headings_count varchar,
	filename varchar,
	contributor_count varchar,
	indicator varchar,
	inpi varchar
);

create table wos_subheadings (
	uid varchar,
	subheading_id int,
	subheading varchar
);

create table wos_chapters (
	uid varchar,
	chapter_id int,
	chapter_uid varchar,
	chapter varchar
);

create table wos_page (
	uid varchar,
	page_id int,
	page_end varchar,
	page_begin varchar,
	page_count varchar,
	page_value varchar
);

create table wos_contributors (
	uid varchar,
	contrib_id int,
	seq_no varchar,
	dais_id varchar,
	r_id_tr varchar,
	last_name varchar,
	display varchar,
	lang_id varchar,
	orcid_id_tr varchar,
	suffix varchar,
	initials varchar,
	middle_name varchar,
	r_id varchar,
	display_name varchar,
	full_name varchar,
	orcid_id varchar,
	reprint varchar,
	wos_standard varchar,
	role varchar,
	prefix varchar,
	first_name varchar
);

create table wos_doctypes (
	uid varchar,
	doctype_id int,
	doctype varchar,
	code varchar
);

create table wos_reprint_addresses (
	uid varchar,
	reprint_addr_id int,
	count varchar
);

create table wos_book_notes (
	uid varchar,
	note_id int,
	book_note varchar
);

create table wos_titles (
	uid varchar,
	title_id int,
	title_type varchar,
	lang_id varchar,
	title varchar,
	non_english varchar,
	translated varchar
);

create table wos_keywords (
	uid varchar,
	keyword_id int,
	keyword varchar,
	keyword_language varchar
);

create table wos_reviewed_authors (
	uid varchar,
	author_id int,
	author varchar
);

create table wos_addresses (
	uid varchar,
	addr_id int,
	cited_date varchar,
	name_count varchar,
	country_lang_id varchar,
	street varchar,
	url_date_info varchar,
	street_lang_id varchar,
	url_type varchar,
	state varchar,
	province_lang_id varchar,
	city varchar,
	addr_no varchar,
	full_address varchar,
	url_revised_date varchar,
	url varchar,
	organization_count varchar,
	province varchar,
	country varchar,
	laboratory varchar,
	url_create_date varchar,
	state_lang_id varchar,
	post_num_lang_id varchar,
	suborganization_count varchar,
	addr_type varchar,
	post_num varchar,
	city_lang_id varchar
);

create table wos_abstracts (
	uid varchar,
	abstract_id int,
	wos_abstract_count varchar,
	copyright_information varchar,
	abstract_language varchar,
	wos_abstract_text varchar
);

create table wos_conference (
	uid varchar,
	conf_record_id int,
	conf_type varchar,
	conf_location_count varchar,
	conf_date_count varchar,
	conf_title_count varchar,
	lang_id varchar,
	conf_id varchar,
	conf_info_count varchar,
	sponsor_count varchar
);

create table wos_publisher (
	uid varchar,
	publisher_id int,
	cited_date varchar,
	name_count varchar,
	country_lang_id varchar,
	street varchar,
	url_date_info varchar,
	street_lang_id varchar,
	url_type varchar,
	state varchar,
	province_lang_id varchar,
	city varchar,
	addr_no varchar,
	full_address varchar,
	url_revised_date varchar,
	url varchar,
	organization_count varchar,
	province varchar,
	country varchar,
	laboratory varchar,
	url_create_date varchar,
	state_lang_id varchar,
	post_num_lang_id varchar,
	suborganization_count varchar,
	post_num varchar,
	city_lang_id varchar
);

create table wos_dynamic_identifiers (
	uid varchar,
	dynamic_id int,
	self_ind varchar,
	identifier_value varchar,
	identifier_type varchar
);

create table wos_grants (
	uid varchar,
	grant_id int,
	country varchar,
	acronym varchar,
	grant_info_language varchar,
	grant_id_count varchar,
	grant_agency_preferred varchar,
	grant_info varchar,
	investigator varchar,
	alt_agency_count varchar,
	grant_agency varchar,
	grant_agency_lang_id varchar
);

create table wos_normalized_doctypes (
	uid varchar,
	doctype_id int,
	doctype varchar,
	code varchar
);

create table wos_keywords_plus (
	uid varchar,
	keyword_id int,
	keyword_plus varchar,
	keyword_language varchar
);

create table wos_references (
	uid varchar,
	ref_ctr int,
	volume varchar,
	page varchar,
	cited_title varchar,
	patent_no varchar,
	assignee varchar,
	art_no varchar,
	cited_work varchar,
	cited_author varchar,
	doi varchar,
	ref_id varchar,
	year varchar
);

create table wos_edition (
	uid varchar,
	edition_ctr int,
	edition varchar
);

create table wos_subjects (
	uid varchar,
	subject_id int,
	subject varchar,
	edition varchar,
	code varchar,
	ascatype varchar
);

create table wos_headings (
	uid varchar,
	heading_id int,
	heading varchar
);

create table wos_summary_names (
	uid varchar,
	name_id int,
	seq_no varchar,
	dais_id varchar,
	r_id_tr varchar,
	last_name varchar,
	display varchar,
	orcid_id_tr varchar,
	lang_id varchar,
	suffix varchar,
	addr_no_raw varchar,
	initials varchar,
	middle_name varchar,
	r_id varchar,
	display_name varchar,
	full_name varchar,
	orcid_id varchar,
	reprint varchar,
	wos_standard varchar,
	role varchar,
	first_name varchar,
	prefix varchar
);

create table wos_book_desc (
	uid varchar,
	desc_id int,
	price_volumes varchar,
	bk_desc varchar,
	price_desc varchar,
	bk_amount varchar,
	bk_binding varchar,
	bk_volumes varchar,
	bk_currency varchar,
	currency varchar,
	bk_publisher varchar,
	amount varchar,
	bk_ordering varchar,
	bk_prepay varchar
);

create table wos_languages (
	uid varchar,
	language_id int,
	language varchar,
	status varchar,
	language_type varchar
);

create table wos_item_reprint_addresses (
	uid varchar,
	addr_id int,
	cited_date varchar,
	name_count varchar,
	country_lang_id varchar,
	street varchar,
	url_date_info varchar,
	street_lang_id varchar,
	url_type varchar,
	state varchar,
	province_lang_id varchar,
	city varchar,
	addr_no varchar,
	full_address varchar,
	url_revised_date varchar,
	url varchar,
	organization_count varchar,
	province varchar,
	country varchar,
	laboratory varchar,
	url_create_date varchar,
	state_lang_id varchar,
	post_num_lang_id varchar,
	suborganization_count varchar,
	addr_type varchar,
	post_num varchar,
	city_lang_id varchar
);

create table wos_normalized_languages (
	uid varchar,
	language_id int,
	language varchar,
	status varchar,
	language_type varchar
);

create table wos_reviewed_languages (
	uid varchar,
	language_id int,
	language varchar,
	status varchar,
	language_type varchar
);

create table wos_reprint_address_email_addr (
	uid varchar,
	addr_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_conf_title (
	uid varchar,
	conf_record_id int,
	title_id int,
	lang_id varchar,
	conf_title varchar
);

create table wos_address_names (
	uid varchar,
	addr_id int,
	name_id int,
	seq_no varchar,
	dais_id varchar,
	r_id_tr varchar,
	last_name varchar,
	display varchar,
	orcid_id_tr varchar,
	lang_id varchar,
	suffix varchar,
	addr_no_raw varchar,
	initials varchar,
	middle_name varchar,
	r_id varchar,
	display_name varchar,
	full_name varchar,
	orcid_id varchar,
	reprint varchar,
	wos_standard varchar,
	role varchar,
	first_name varchar,
	prefix varchar
);

create table wos_summary_names_email_addr (
	uid varchar,
	name_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_reprint_address_dois (
	uid varchar,
	addr_id int,
	doi_id int,
	doi varchar
);

create table wos_conf_date (
	uid varchar,
	conf_record_id int,
	date_id int,
	conf_date varchar,
	lang_id varchar,
	display_date varchar,
	conf_end varchar,
	conf_start varchar
);

create table wos_grant_ids (
	uid varchar,
	grant_id int,
	id_id int,
	grant_identifier varchar
);

create table wos_reprint_address_names (
	uid varchar,
	addr_id int,
	name_id int,
	seq_no varchar,
	dais_id varchar,
	r_id_tr varchar,
	last_name varchar,
	display varchar,
	orcid_id_tr varchar,
	lang_id varchar,
	suffix varchar,
	addr_no_raw varchar,
	initials varchar,
	middle_name varchar,
	r_id varchar,
	display_name varchar,
	full_name varchar,
	orcid_id varchar,
	reprint varchar,
	wos_standard varchar,
	role varchar,
	first_name varchar,
	prefix varchar
);

create table wos_publisher_zip (
	uid varchar,
	publisher_id int,
	zip_id int,
	lang_id varchar,
	zip varchar,
	location varchar
);

create table wos_contributor_email_addr (
	uid varchar,
	contrib_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_reprint_address_organizations (
	uid varchar,
	addr_id int,
	org_id int,
	lang_id varchar,
	pref varchar,
	organization varchar
);

create table wos_conf_info (
	uid varchar,
	conf_record_id int,
	info_id int,
	conf_info varchar,
	lang_ind varchar
);

create table wos_reprint_address_zip (
	uid varchar,
	addr_id int,
	zip_id int,
	lang_id varchar,
	zip varchar,
	location varchar
);

create table wos_grant_alt_agencies (
	uid varchar,
	grant_id int,
	alt_agency_id int,
	lang_id varchar,
	alt_agency varchar,
	preferred varchar
);

create table wos_conf_sponsor (
	uid varchar,
	conf_record_id int,
	sponsor_id int,
	lang_id varchar,
	sponsor varchar
);

create table wos_publisher_suborganizations (
	uid varchar,
	publisher_id int,
	suborg_id int,
	lang_id varchar,
	suborganization varchar
);

create table wos_address_zip (
	uid varchar,
	addr_id int,
	zip_id int,
	lang_id varchar,
	zip varchar,
	location varchar
);

create table wos_publisher_names (
	uid varchar,
	publisher_id int,
	name_id int,
	seq_no varchar,
	dais_id varchar,
	r_id_tr varchar,
	last_name varchar,
	display varchar,
	orcid_id_tr varchar,
	lang_id varchar,
	suffix varchar,
	addr_no_raw varchar,
	initials varchar,
	middle_name varchar,
	r_id varchar,
	display_name varchar,
	full_name varchar,
	orcid_id varchar,
	reprint varchar,
	wos_standard varchar,
	role varchar,
	first_name varchar,
	prefix varchar
);

create table wos_address_dois (
	uid varchar,
	addr_id int,
	doi_id int,
	doi varchar
);

create table wos_address_organizations (
	uid varchar,
	addr_id int,
	org_id int,
	lang_id varchar,
	pref varchar,
	organization varchar
);

create table wos_reprint_address_suborganizations (
	uid varchar,
	addr_id int,
	suborg_id int,
	lang_id varchar,
	suborganization varchar
);

create table wos_reprint_addresses_addr_spec (
	uid varchar,
	reprint_addr_id int,
	addr_id int,
	country varchar,
	city varchar,
	addr_no varchar,
	street varchar,
	state varchar,
	full_addr varchar
);

create table wos_address_suborganizations (
	uid varchar,
	addr_id int,
	suborg_id int,
	lang_id varchar,
	suborganization varchar
);

create table wos_publisher_dois (
	uid varchar,
	publisher_id int,
	doi_id int,
	doi varchar
);

create table wos_publisher_email_addr (
	uid varchar,
	publisher_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_address_email_addr (
	uid varchar,
	addr_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_conf_location (
	uid varchar,
	conf_record_id int,
	location_id int,
	state_lang_id varchar,
	composite_lang_id varchar,
	conf_state varchar,
	conf_host varchar,
	composite_location varchar,
	city_lang_id varchar,
	host_lang_id varchar,
	conf_city varchar
);

create table wos_reprint_addresses_names (
	uid varchar,
	reprint_addr_id int,
	names_id int,
	count varchar
);

create table wos_publisher_organizations (
	uid varchar,
	publisher_id int,
	org_id int,
	lang_id varchar,
	organization varchar
);

create table wos_reprint_addresses_name (
	uid varchar,
	reprint_addr_id int,
	names_id int,
	name_id int,
	seq_no varchar,
	full_name varchar,
	display_name varchar,
	last_name varchar,
	display varchar,
	reprint varchar,
	addr_no varchar,
	wos_standard varchar,
	suffix varchar,
	email_addr varchar,
	role varchar,
	first_name varchar
);

create table wos_reprint_addresses_addr_spec_orgs (
	uid varchar,
	reprint_addr_id int,
	addr_id int,
	orgs_id int,
	count varchar
);

create table wos_reprint_address_names_email_addr (
	uid varchar,
	addr_id int,
	name_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_reprint_addresses_addr_spec_zip (
	uid varchar,
	reprint_addr_id int,
	addr_id int,
	zip int,
	location varchar
);

create table wos_address_names_email_addr (
	uid varchar,
	addr_id int,
	name_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_reprint_addresses_addr_spec_suborgs (
	uid varchar,
	reprint_addr_id int,
	addr_id int,
	suborgs_id int,
	count varchar
);

create table wos_publisher_names_email_addr (
	uid varchar,
	publisher_id int,
	name_id int,
	email_id int,
	lang_id varchar,
	email_addr varchar
);

create table wos_reprint_addresses_addr_spec_org (
	uid varchar,
	reprint_addr_id int,
	addr_id int,
	orgs_id int,
	org_id int,
	pref varchar,
	organization varchar
);

create table wos_reprint_addresses_addr_spec_suborg (
	uid varchar,
	reprint_addr_id int,
	addr_id int,
	suborgs_id int,
	suborg_id int,
	suborganization varchar
);


