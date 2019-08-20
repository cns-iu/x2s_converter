
alter table only wos_summary
	add constraint uni_wos_summary unique (uid);

alter table only wos_subheadings
	add constraint uni_wos_subheadings unique (uid,subheading_id);
alter table only wos_subheadings
	add constraint fk_wos_subheadings foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_chapters
	add constraint uni_wos_chapters unique (uid,chapter_id);
alter table only wos_chapters
	add constraint fk_wos_chapters foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_page
	add constraint uni_wos_page unique (uid,page_id);
alter table only wos_page
	add constraint fk_wos_page foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_contributors
	add constraint uni_wos_contributors unique (uid,contrib_id);
alter table only wos_contributors
	add constraint fk_wos_contributors foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_doctypes
	add constraint uni_wos_doctypes unique (uid,doctype_id);
alter table only wos_doctypes
	add constraint fk_wos_doctypes foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_reprint_addresses
	add constraint uni_wos_reprint_addresses unique (uid,reprint_addr_id);
alter table only wos_reprint_addresses
	add constraint fk_wos_reprint_addresses foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_book_notes
	add constraint uni_wos_book_notes unique (uid,note_id);
alter table only wos_book_notes
	add constraint fk_wos_book_notes foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_titles
	add constraint uni_wos_titles unique (uid,title_id);
alter table only wos_titles
	add constraint fk_wos_titles foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_keywords
	add constraint uni_wos_keywords unique (uid,keyword_id);
alter table only wos_keywords
	add constraint fk_wos_keywords foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_reviewed_authors
	add constraint uni_wos_reviewed_authors unique (uid,author_id);
alter table only wos_reviewed_authors
	add constraint fk_wos_reviewed_authors foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_addresses
	add constraint uni_wos_addresses unique (uid,addr_id);
alter table only wos_addresses
	add constraint fk_wos_addresses foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_abstracts
	add constraint uni_wos_abstracts unique (uid,abstract_id);
alter table only wos_abstracts
	add constraint fk_wos_abstracts foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_conference
	add constraint uni_wos_conference unique (uid,conf_record_id);
alter table only wos_conference
	add constraint fk_wos_conference foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_publisher
	add constraint uni_wos_publisher unique (uid,publisher_id);
alter table only wos_publisher
	add constraint fk_wos_publisher foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_dynamic_identifiers
	add constraint uni_wos_dynamic_identifiers unique (uid,dynamic_id);
alter table only wos_dynamic_identifiers
	add constraint fk_wos_dynamic_identifiers foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_grants
	add constraint uni_wos_grants unique (uid,grant_id);
alter table only wos_grants
	add constraint fk_wos_grants foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_normalized_doctypes
	add constraint uni_wos_normalized_doctypes unique (uid,doctype_id);
alter table only wos_normalized_doctypes
	add constraint fk_wos_normalized_doctypes foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_keywords_plus
	add constraint uni_wos_keywords_plus unique (uid,keyword_id);
alter table only wos_keywords_plus
	add constraint fk_wos_keywords_plus foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_references
	add constraint uni_wos_references unique (uid,ref_ctr);
alter table only wos_references
	add constraint fk_wos_references foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_edition
	add constraint uni_wos_edition unique (uid,edition_ctr);
alter table only wos_edition
	add constraint fk_wos_edition foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_subjects
	add constraint uni_wos_subjects unique (uid,subject_id);
alter table only wos_subjects
	add constraint fk_wos_subjects foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_headings
	add constraint uni_wos_headings unique (uid,heading_id);
alter table only wos_headings
	add constraint fk_wos_headings foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_summary_names
	add constraint uni_wos_summary_names unique (uid,name_id);
alter table only wos_summary_names
	add constraint fk_wos_summary_names foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_book_desc
	add constraint uni_wos_book_desc unique (uid,desc_id);
alter table only wos_book_desc
	add constraint fk_wos_book_desc foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_languages
	add constraint uni_wos_languages unique (uid,language_id);
alter table only wos_languages
	add constraint fk_wos_languages foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_item_reprint_addresses
	add constraint uni_wos_item_reprint_addresses unique (uid,addr_id);
alter table only wos_item_reprint_addresses
	add constraint fk_wos_item_reprint_addresses foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_normalized_languages
	add constraint uni_wos_normalized_languages unique (uid,language_id);
alter table only wos_normalized_languages
	add constraint fk_wos_normalized_languages foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_reviewed_languages
	add constraint uni_wos_reviewed_languages unique (uid,language_id);
alter table only wos_reviewed_languages
	add constraint fk_wos_reviewed_languages foreign key (uid) references wos_summary(uid) on delete cascade;

alter table only wos_reprint_address_email_addr
	add constraint uni_wos_reprint_address_email_addr unique (uid,addr_id,email_id);
alter table only wos_reprint_address_email_addr
	add constraint fk_wos_reprint_address_email_addr foreign key (uid,addr_id) references wos_item_reprint_addresses(uid,addr_id) on delete cascade;

alter table only wos_conf_title
	add constraint uni_wos_conf_title unique (uid,conf_record_id,title_id);
alter table only wos_conf_title
	add constraint fk_wos_conf_title foreign key (uid,conf_record_id) references wos_conference(uid,conf_record_id) on delete cascade;

alter table only wos_address_names
	add constraint uni_wos_address_names unique (uid,addr_id,name_id);
alter table only wos_address_names
	add constraint fk_wos_address_names foreign key (uid,addr_id) references wos_addresses(uid,addr_id) on delete cascade;

alter table only wos_summary_names_email_addr
	add constraint uni_wos_summary_names_email_addr unique (uid,name_id,email_id);
alter table only wos_summary_names_email_addr
	add constraint fk_wos_summary_names_email_addr foreign key (uid,name_id) references wos_summary_names(uid,name_id) on delete cascade;

alter table only wos_reprint_address_dois
	add constraint uni_wos_reprint_address_dois unique (uid,addr_id,doi_id);
alter table only wos_reprint_address_dois
	add constraint fk_wos_reprint_address_dois foreign key (uid,addr_id) references wos_item_reprint_addresses(uid,addr_id) on delete cascade;

alter table only wos_conf_date
	add constraint uni_wos_conf_date unique (uid,conf_record_id,date_id);
alter table only wos_conf_date
	add constraint fk_wos_conf_date foreign key (uid,conf_record_id) references wos_conference(uid,conf_record_id) on delete cascade;

alter table only wos_grant_ids
	add constraint uni_wos_grant_ids unique (uid,grant_id,id_id);
alter table only wos_grant_ids
	add constraint fk_wos_grant_ids foreign key (uid,grant_id) references wos_grants(uid,grant_id) on delete cascade;

alter table only wos_reprint_address_names
	add constraint uni_wos_reprint_address_names unique (uid,addr_id,name_id);
alter table only wos_reprint_address_names
	add constraint fk_wos_reprint_address_names foreign key (uid,addr_id) references wos_item_reprint_addresses(uid,addr_id) on delete cascade;

alter table only wos_publisher_zip
	add constraint uni_wos_publisher_zip unique (uid,publisher_id,zip_id);
alter table only wos_publisher_zip
	add constraint fk_wos_publisher_zip foreign key (uid,publisher_id) references wos_publisher(uid,publisher_id) on delete cascade;

alter table only wos_contributor_email_addr
	add constraint uni_wos_contributor_email_addr unique (uid,contrib_id,email_id);
alter table only wos_contributor_email_addr
	add constraint fk_wos_contributor_email_addr foreign key (uid,contrib_id) references wos_contributors(uid,contrib_id) on delete cascade;

alter table only wos_reprint_address_organizations
	add constraint uni_wos_reprint_address_organizations unique (uid,addr_id,org_id);
alter table only wos_reprint_address_organizations
	add constraint fk_wos_reprint_address_organizations foreign key (uid,addr_id) references wos_item_reprint_addresses(uid,addr_id) on delete cascade;

alter table only wos_conf_info
	add constraint uni_wos_conf_info unique (uid,conf_record_id,info_id);
alter table only wos_conf_info
	add constraint fk_wos_conf_info foreign key (uid,conf_record_id) references wos_conference(uid,conf_record_id) on delete cascade;

alter table only wos_reprint_address_zip
	add constraint uni_wos_reprint_address_zip unique (uid,addr_id,zip_id);
alter table only wos_reprint_address_zip
	add constraint fk_wos_reprint_address_zip foreign key (uid,addr_id) references wos_item_reprint_addresses(uid,addr_id) on delete cascade;

alter table only wos_grant_alt_agencies
	add constraint uni_wos_grant_alt_agencies unique (uid,grant_id,alt_agency_id);
alter table only wos_grant_alt_agencies
	add constraint fk_wos_grant_alt_agencies foreign key (uid,grant_id) references wos_grants(uid,grant_id) on delete cascade;

alter table only wos_conf_sponsor
	add constraint uni_wos_conf_sponsor unique (uid,conf_record_id,sponsor_id);
alter table only wos_conf_sponsor
	add constraint fk_wos_conf_sponsor foreign key (uid,conf_record_id) references wos_conference(uid,conf_record_id) on delete cascade;

alter table only wos_publisher_suborganizations
	add constraint uni_wos_publisher_suborganizations unique (uid,publisher_id,suborg_id);
alter table only wos_publisher_suborganizations
	add constraint fk_wos_publisher_suborganizations foreign key (uid,publisher_id) references wos_publisher(uid,publisher_id) on delete cascade;

alter table only wos_address_zip
	add constraint uni_wos_address_zip unique (uid,addr_id,zip_id);
alter table only wos_address_zip
	add constraint fk_wos_address_zip foreign key (uid,addr_id) references wos_addresses(uid,addr_id) on delete cascade;

alter table only wos_publisher_names
	add constraint uni_wos_publisher_names unique (uid,publisher_id,name_id);
alter table only wos_publisher_names
	add constraint fk_wos_publisher_names foreign key (uid,publisher_id) references wos_publisher(uid,publisher_id) on delete cascade;

alter table only wos_address_dois
	add constraint uni_wos_address_dois unique (uid,addr_id,doi_id);
alter table only wos_address_dois
	add constraint fk_wos_address_dois foreign key (uid,addr_id) references wos_addresses(uid,addr_id) on delete cascade;

alter table only wos_address_organizations
	add constraint uni_wos_address_organizations unique (uid,addr_id,org_id);
alter table only wos_address_organizations
	add constraint fk_wos_address_organizations foreign key (uid,addr_id) references wos_addresses(uid,addr_id) on delete cascade;

alter table only wos_reprint_address_suborganizations
	add constraint uni_wos_reprint_address_suborganizations unique (uid,addr_id,suborg_id);
alter table only wos_reprint_address_suborganizations
	add constraint fk_wos_reprint_address_suborganizations foreign key (uid,addr_id) references wos_item_reprint_addresses(uid,addr_id) on delete cascade;

alter table only wos_reprint_addresses_addr_spec
	add constraint uni_wos_reprint_addresses_addr_spec unique (uid,reprint_addr_id,addr_id);
alter table only wos_reprint_addresses_addr_spec
	add constraint fk_wos_reprint_addresses_addr_spec foreign key (uid,reprint_addr_id) references wos_reprint_addresses(uid,reprint_addr_id) on delete cascade;

alter table only wos_address_suborganizations
	add constraint uni_wos_address_suborganizations unique (uid,addr_id,suborg_id);
alter table only wos_address_suborganizations
	add constraint fk_wos_address_suborganizations foreign key (uid,addr_id) references wos_addresses(uid,addr_id) on delete cascade;

alter table only wos_publisher_dois
	add constraint uni_wos_publisher_dois unique (uid,publisher_id,doi_id);
alter table only wos_publisher_dois
	add constraint fk_wos_publisher_dois foreign key (uid,publisher_id) references wos_publisher(uid,publisher_id) on delete cascade;

alter table only wos_publisher_email_addr
	add constraint uni_wos_publisher_email_addr unique (uid,publisher_id,email_id);
alter table only wos_publisher_email_addr
	add constraint fk_wos_publisher_email_addr foreign key (uid,publisher_id) references wos_publisher(uid,publisher_id) on delete cascade;

alter table only wos_address_email_addr
	add constraint uni_wos_address_email_addr unique (uid,addr_id,email_id);
alter table only wos_address_email_addr
	add constraint fk_wos_address_email_addr foreign key (uid,addr_id) references wos_addresses(uid,addr_id) on delete cascade;

alter table only wos_conf_location
	add constraint uni_wos_conf_location unique (uid,conf_record_id,location_id);
alter table only wos_conf_location
	add constraint fk_wos_conf_location foreign key (uid,conf_record_id) references wos_conference(uid,conf_record_id) on delete cascade;

alter table only wos_reprint_addresses_names
	add constraint uni_wos_reprint_addresses_names unique (uid,reprint_addr_id,names_id);
alter table only wos_reprint_addresses_names
	add constraint fk_wos_reprint_addresses_names foreign key (uid,reprint_addr_id) references wos_reprint_addresses(uid,reprint_addr_id) on delete cascade;

alter table only wos_publisher_organizations
	add constraint uni_wos_publisher_organizations unique (uid,publisher_id,org_id);
alter table only wos_publisher_organizations
	add constraint fk_wos_publisher_organizations foreign key (uid,publisher_id) references wos_publisher(uid,publisher_id) on delete cascade;

alter table only wos_reprint_addresses_name
	add constraint uni_wos_reprint_addresses_name unique (uid,reprint_addr_id,names_id,name_id);
alter table only wos_reprint_addresses_name
	add constraint fk_wos_reprint_addresses_name foreign key (uid,reprint_addr_id,names_id) references wos_reprint_addresses_names(uid,reprint_addr_id,names_id) on delete cascade;

alter table only wos_reprint_addresses_addr_spec_orgs
	add constraint uni_wos_reprint_addresses_addr_spec_orgs unique (uid,reprint_addr_id,addr_id,orgs_id);
alter table only wos_reprint_addresses_addr_spec_orgs
	add constraint fk_wos_reprint_addresses_addr_spec_orgs foreign key (uid,reprint_addr_id,addr_id) references wos_reprint_addresses_addr_spec(uid,reprint_addr_id,addr_id) on delete cascade;

alter table only wos_reprint_address_names_email_addr
	add constraint uni_wos_reprint_address_names_email_addr unique (uid,addr_id,name_id,email_id);
alter table only wos_reprint_address_names_email_addr
	add constraint fk_wos_reprint_address_names_email_addr foreign key (uid,addr_id,name_id) references wos_reprint_address_names(uid,addr_id,name_id) on delete cascade;

alter table only wos_reprint_addresses_addr_spec_zip
	add constraint uni_wos_reprint_addresses_addr_spec_zip unique (uid,reprint_addr_id,addr_id,zip);
alter table only wos_reprint_addresses_addr_spec_zip
	add constraint fk_wos_reprint_addresses_addr_spec_zip foreign key (uid,reprint_addr_id,addr_id) references wos_reprint_addresses_addr_spec(uid,reprint_addr_id,addr_id) on delete cascade;

alter table only wos_address_names_email_addr
	add constraint uni_wos_address_names_email_addr unique (uid,addr_id,name_id,email_id);
alter table only wos_address_names_email_addr
	add constraint fk_wos_address_names_email_addr foreign key (uid,addr_id,name_id) references wos_address_names(uid,addr_id,name_id) on delete cascade;

alter table only wos_reprint_addresses_addr_spec_suborgs
	add constraint uni_wos_reprint_addresses_addr_spec_suborgs unique (uid,reprint_addr_id,addr_id,suborgs_id);
alter table only wos_reprint_addresses_addr_spec_suborgs
	add constraint fk_wos_reprint_addresses_addr_spec_suborgs foreign key (uid,reprint_addr_id,addr_id) references wos_reprint_addresses_addr_spec(uid,reprint_addr_id,addr_id) on delete cascade;

alter table only wos_publisher_names_email_addr
	add constraint uni_wos_publisher_names_email_addr unique (uid,publisher_id,name_id,email_id);
alter table only wos_publisher_names_email_addr
	add constraint fk_wos_publisher_names_email_addr foreign key (uid,publisher_id,name_id) references wos_publisher_names(uid,publisher_id,name_id) on delete cascade;

alter table only wos_reprint_addresses_addr_spec_org
	add constraint uni_wos_reprint_addresses_addr_spec_org unique (uid,reprint_addr_id,addr_id,orgs_id,org_id);
alter table only wos_reprint_addresses_addr_spec_org
	add constraint fk_wos_reprint_addresses_addr_spec_org foreign key (uid,reprint_addr_id,addr_id,orgs_id) references wos_reprint_addresses_addr_spec_orgs(uid,reprint_addr_id,addr_id,orgs_id) on delete cascade;

alter table only wos_reprint_addresses_addr_spec_suborg
	add constraint uni_wos_reprint_addresses_addr_spec_suborg unique (uid,reprint_addr_id,addr_id,suborgs_id,suborg_id);
alter table only wos_reprint_addresses_addr_spec_suborg
	add constraint fk_wos_reprint_addresses_addr_spec_suborg foreign key (uid,reprint_addr_id,addr_id,suborgs_id) references wos_reprint_addresses_addr_spec_suborgs(uid,reprint_addr_id,addr_id,suborgs_id) on delete cascade;
