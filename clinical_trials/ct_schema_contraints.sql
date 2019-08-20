\c clinical_trials;

-- CREATE TABLE ct_master (
COMMENT on table ct_master is 'Clinical Trials core record table';
comment on column ct_master.id is 'NCT Record ID (internal primary key)';
comment on column ct_master.download_date is 'Date record downloaded from CT.gov';
comment on column ct_master.source_url is 'URL For source NCT record';
comment on column ct_master.org_study_id is 'Unique protocol ID assigned by sponsoring organization';
comment on column ct_master.brief_title is 'Protocol title intended for the lay public';
comment on column ct_master.acronym is 'Acronym or initials used to identify this study';
comment on column ct_master.official_title is 'Official name of the protocol provided by the study principal investigator or sponsor.';
comment on column ct_master.source is 'Information provider';
comment on column ct_master.has_dmc is 'Indicate whether a data monitoring committee has been appointed for this study.';
comment on column ct_master.brief_summary is 'Short description of the protocol intended for the lay public. Include a brief statement of the study hypothesis.';
comment on column ct_master.detailed_description is 'Extended description of the protocol, including more technical information';
comment on column ct_master.overall_status is 'Overall accrual activity for the protocol.';
comment on column ct_master.why_stopped is 'For suspended, terminated or withdrawn studies, provide a brief explanation of why the study has been halted or terminated.';
comment on column ct_master.start_date is  'Date that enrollment to the protocol begins.';
comment on column ct_master.completion_date_type is 'Final date on which data was (or is expected to be) collected.';
comment on column ct_master.completion_date is  'Anticipated or Actual';
comment on column ct_master.primary_completion_date_type is 'As specified in US Public Law 110-85, Title VIII, Section 801, with respect to an applicable clinical trial, the date that the final subject was examined or received an intervention for the purposes of final collection of data for the primary outcome, whether the clinical trial concluded according to the prespecified protocol or was terminated.';
comment on column ct_master.primary_completion_date is 'Anticipated or Actual';
comment on column ct_master.phase is 'Phase of investigation, as defined by the US FDA for trials involving investigational new drugs';
comment on column ct_master.study_type is 'Nature of the investigation.';
comment on column ct_master.study_design is 'Primary investigative techniques used in the protocol.';
comment on column ct_master.target_duration is 'For Patient Registries, the anticipated time period over which each participant is to be followed.';
comment on column ct_master.number_of_arms is 'Number of intervention groups';
comment on column ct_master.number_of_groups is 'Number of study groups/cohorts.';
comment on column ct_master.enrollment_type is 'Anticipated or Actual';
comment on column ct_master.enrollment is 'Number of subjects in the trial.';
comment on column ct_master.biospec_retention is 'Biospecimen retention';
comment on column ct_master.biospec_desc is 'Specify all types of biospecimens to be retained (e.g., whole blood, serum, white cells, urine, tissue).';
comment on column ct_master.study_pop is 'For observational studies only, a description of the population from which the groups or cohorts will be selected';
comment on column ct_master.sampling_method is 'For observational studies only, select Probability or Non-Probability Sample';
comment on column ct_master.criteria is 'Summary criteria for participant selection.';
comment on column ct_master.gender is 'Physical gender of individuals who may participate in the protocol.';
comment on column ct_master.minimum_age is 'Minimum age of participants.';
comment on column ct_master.maximum_age is 'Maximum age of participants.';
comment on column ct_master.healthy_volunteers is 'Indicate if persons who have not had the condition(s) being studied or otherwise related conditions or symptoms, as specified in the eligibility requirements, may participate in the study.';
comment on column ct_master.contact_first_name is 'First name of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_middle_name is 'Middle name of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_last_name is 'Last name of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_degrees is 'Degrees of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_phone is 'Phone number of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_phone_ext is 'Phone extension of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_email is 'Email of person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_first_name is 'First name of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_middle_name is 'Middle name of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_last_name is 'Last name of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_degrees is 'Degrees of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_phone is 'Phone number of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_phone_ext is 'Phone extension of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.contact_backup_email is 'Email of backup to person providing centralized, coordinated recruitment information for the entire study.';
comment on column ct_master.verification_date is 'Date the protocol information was last verified.';
comment on column ct_master.lastchanged_date is 'Last changed date';
comment on column ct_master.firstreceived_date is 'First received date';
comment on column ct_master.firstreceived_results_date is 'First received results date';
comment on column ct_master.is_fda_regulated is 'Indicate whether this trial includes an intervention subject to US Food and Drug Administration regulation under section 351 of the Public Health Service Act or any of the following sections of the Federal Food, Drug and Cosmetic Act: 505, 510(k), 515, 520(m), and 522.';
comment on column ct_master.is_section_801 is 'If this trial includes an FDA regulated intervention, indicate whether this is an "applicable clinical trial" as defined in US Public Law 110-85, Title VIII, Section 801.';
comment on column ct_master.duplicate is 'Duplicate Flag for deletion';

-- create table ct_required_header (

-- CREATE TABLE ct_secondary_ids (
COMMENT on table ct_secondary_ids is 'Secondary Study Identifiers';
comment on column ct_secondary_ids.id is 'Record ID (internal primary key)';
comment on column ct_secondary_ids.secondary_id_ctr is 'Sequence of Secondary ID in list (internal primary key)';
comment on column ct_secondary_ids.secondary_id is 'Other identification numbers assigned to the protocol, including unique identifiers from other registries and NIH grant numbers, if applicable.';
alter table only ct_secondary_ids add constraint unique_ct_secondary_ids UNIQUE (id, secondary_id_ctr);
alter table only ct_secondary_ids add constraint fk_ct_secondary_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;

-- CREATE TABLE ct_nct_aliases (
COMMENT on table ct_nct_aliases is 'NCT Aliases';
comment on column ct_nct_aliases.id is 'Record ID (internal primary key)';
comment on column ct_nct_aliases.nct_alias_ctr is 'Sequence of NCT Alias in list (internal primary key)';
comment on column ct_nct_aliases.nct_alias is 'NCT Alias';
alter table only ct_nct_aliases add constraint unique_ct_nct_aliases_ids UNIQUE (id, nct_alias_ctr);
alter table only ct_nct_aliases add constraint fk_ct_nct_aliases_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;

-- CREATE TABLE ct_lead_sponsors (
Comment on table ct_lead_sponsors is 'Lead Sponsors';
comment on column ct_lead_sponsors.id is 'Record ID (internal primary key)';
comment on column ct_lead_sponsors.sponsor_ctr is 'Sequence of Lead Sponsor in list (internal primary key)';
comment on column ct_lead_sponsors.agency is 'Name of primary organization that oversees implementation of study and is responsible for data analysis.';
comment on column ct_lead_sponsors.agency_class is 'Type of organization sponsoring the study (NIH, US Fed, Industry, Other)';
alter table only ct_lead_sponsors add constraint unique_ct_lead_sponsors_ids UNIQUE (id, sponsor_ctr);
alter table only ct_lead_sponsors add constraint fk_ct_lead_sponsors_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;

-- CREATE TABLE ct_collaborator_sponsors (
COMMENT on table ct_collaborator_sponsors is 'Collaborating Organizations';
comment on column ct_collaborator_sponsors.id is 'Record ID (internal primary key)';
comment on column ct_collaborator_sponsors.sponsor_ctr is 'Sequence of Collaborator in list (internal primary key)';
comment on column ct_collaborator_sponsors.agency is 'Other organizations (if any) providing support, including funding, design, implementation, data analysis and reporting.';
comment on column ct_collaborator_sponsors.agency_class is 'Type of organization sponsoring the study (NIH, US Fed, Industry, Other)';
alter table only ct_collaborator_sponsors add constraint unique_ct_collaborator_sponsors_ids UNIQUE (id, sponsor_ctr);
alter table only ct_collaborator_sponsors add constraint fk_ct_collaborator_sponsors_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;

-- create table oversight_info (

-- create table ct_expanded_access (

-- create table ct_study_design (

-- CREATE TABLE ct_primary_outcome (
COMMENT on table ct_primary_outcome is 'Primary Outcomes';
comment on column ct_primary_outcome.id is 'Record ID (internal primary key)';
comment on column ct_primary_outcome.id_ctr is 'Sequence of Primary Outcome in list (internal primary key)';
comment on column ct_primary_outcome.measure is 'Specific key measurement(s) or observation(s) used to measure the effect of experimental variables in a study, or for observational studies, to describe patterns of diseases or traits or associations with exposures, risk factors or treatment.';
comment on column ct_primary_outcome.time_frame is 'Time point(s) at which outcome measure is assessed.';
comment on column ct_primary_outcome.description  is 'Additional information about the outcome measure, if needed for clarification.';
alter table only ct_primary_outcome add constraint unique_ct_primary_outcome_ids UNIQUE (id, outcome_ctr);
alter table only ct_primary_outcome add constraint fk_ct_primary_outcome_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;

-- CREATE TABLE ct_seconday_outcome (
COMMENT on table ct_seconday_outcome is 'Secondary Outcomes';
comment on column ct_seconday_outcome.id  is 'Record ID (internal primary key)';
comment on column ct_seconday_outcome.id_ctr is 'Sequence of Secondary Outcome in list (internal primary key)';
comment on column ct_seconday_outcome.measure is 'Secondary measurements that will be used to evaluate the intervention(s) or, for observational studies, that are a focus of the study.';
comment on column ct_seconday_outcome.time_frame is 'Time point(s) at which outcome measure is assessed.';
comment on column ct_seconday_outcome.description is 'Additional information about the outcome measure, if needed for clarification.';
alter table only ct_seconday_outcome add constraint unique_ct_seconday_outcome_ids UNIQUE (id, outcome_ctr);
alter table only ct_seconday_outcome add constraint fk_ct_seconday_outcome_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;

-- CREATE TABLE ct_other_outcome (
COMMENT on table ct_other_outcome is 'Other Outcomes';
comment on column ct_other_outcome.id is 'Record ID (internal primary key)';
comment on column ct_other_outcome.id_ctr is 'Sequence of Other Outcome in list (internal primary key)';
comment on column ct_other_outcome.measure is 'Any other measurements, excluding post-hoc measures, that will be used to evaluate the intervention(s) or, for observational studies, that are a focus of the study.';
comment on column ct_other_outcome.time_frame is 'Time point(s) at which outcome measure is assessed.';
comment on column ct_other_outcome.description is 'Additional information about the outcome measure, if needed for clarification.';
alter table only ct_other_outcome add constraint fk_ct_other_outcome_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_other_outcome add constraint unique_ct_other_outcome_ids UNIQUE (id, id_ctr);

-- CREATE TABLE ct_condition (
COMMENT on table ct_condition is 'Condition';
comment on column ct_condition.id is 'Record ID (internal primary key)';
comment on column ct_condition.id_ctr is 'Sequence of condition in list (internal primary key)';
comment on column ct_condition.condition is 'Primary disease or condition being studied, or focus of the study. Diseases or conditions should use the National Library of Medicine''s Medical Subject Headings (MeSH) controlled vocabulary when possible.';
alter table only ct_condition add constraint fk_ct_condition_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_condition add constraint unique_ct_condition_ids UNIQUE (id, id_ctr);

-- CREATE TABLE ct_arm_group (
COMMENT on table ct_arm_group is 'For interventional studies specify the arms, corresponding to Number of Arms specified under Study Design (for single-arm studies, the following data elements are optional).';
comment on column ct_arm_group.id is 'Record ID (internal primary key)';
comment on column ct_arm_group.id_ctr is 'Sequence of arm_group in list (internal primary key)';
comment on column ct_arm_group.arm_group_label is 'the short name used to identify the arm.';
comment on column ct_arm_group.arm_group_type is 'type of arm (enumerated list)';
comment on column ct_arm_group.description is 'brief description of the arm.';
alter table only ct_arm_group add constraint fk_ct_arm_group_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_arm_group add constraint unique_ct_arm_group_ids UNIQUE (id, id_ctr);

-- CREATE TABLE ct_intervention (
COMMENT on table ct_intervention is 'For all studies, and for expanded access records, specify the associated intervention(s). For interventional studies, at least one intervention must be specified. For observational studies, specify the intervention(s)/exposure(s) of interest, if any.';
comment on column ct_intervention.id is 'Record ID (internal primary key)';
comment on column ct_intervention.id_ctr is 'Sequence of intervention in list (internal primary key)';
comment on column ct_intervention.intervention_type is 'type of intervention (enumerated list).';
comment on column ct_intervention.intervention_name is 'for drugs use generic name; for other types of interventions provide a brief descriptive name.';
comment on column ct_intervention.intervention_desc is 'cover key details of the intervention. Must be sufficiently detailed to distinguish between arms of a study (e.g., comparison of different dosages of drug) and/or among similar interventions (e.g., comparison of multiple implantable cardiac defibrillators).';
alter table only ct_intervention add constraint fk_ct_intervention_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_intervention add constraint unique_ct_intervention_ids UNIQUE (id, id_ctr);

-- CREATE TABLE ct_eligibility (

-- CREATE TABLE ct_overall_officials (
COMMENT on table ct_overall_officials is 'Person(s) responsible for the overall scientific leadership of the protocol, including study principal investigator.';
comment on column ct_overall_officials.id is 'Record ID (internal primary key)';
comment on column ct_overall_officials.official_ctr is 'Sequence of overall_official in list (internal primary key)';
comment on column ct_overall_officials.first_name is 'First name.';
comment on column ct_overall_officials.middle_name is 'Middle name.';
comment on column ct_overall_officials.last_name is 'Last name.';
comment on column ct_overall_officials.degrees is 'Degree(s).';
comment on column ct_overall_officials.role is 'Position or function of the official.';
comment on column ct_overall_officials.affiliation is 'Full name of the official''s organization. If none, specify Unaffiliated.';
alter table only ct_overall_officials add constraint fk_ct_overall_officials_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_overall_officials add constraint unique_ct_overall_officials_ids UNIQUE (id, official_ctr);

-- CREATE TABLE ct_overall_contact (

-- CREATE TABLE ct_overall_contact_backup (

-- CREATE TABLE ct_locations (

-- CREATE TABLE ct_facility (
comment on column ct_facility.name is 'Full name of the organization where the protocol is being conducted.';
comment on column ct_facility.city is 'City.';
comment on column ct_facility.state is 'State.';
comment on column ct_facility.zip is 'Postal Code.';
comment on column ct_facility.country is 'Country.';

-- create table fac_address (
	
-- create table ct_location_contact (
comment on column ct_location_contact.status is 'protocol accrual activity at a facility.';
comment on column ct_location_contact.first_name is 'First name of person providing facility recruitment information for the entire study.';
comment on column ct_location_contact.middle_name is 'Middle name of person providing facility recruitment information for the entire study.';
comment on column ct_location_contact.last_name is 'Last name of person providing facility recruitment information for the entire study.';
comment on column ct_location_contact.degrees is 'Degrees of person providing facility recruitment information for the entire study.';
comment on column ct_location_contact.phone is 'Phone number of person providing facility recruitment information for the entire study.';
comment on column ct_location_contact.phone_ext is 'Phone extension of person providing facility recruitment information for the entire study.';
comment on column ct_location_contact.email is 'Email of person providing facility recruitment information for the entire study.';

-- create table ct_location_contact_backup (
COMMENT on table ct_location is 'Locations where protocol is being conducted.';
comment on column ct_location.id is 'Record ID (internal primary key)';
comment on column ct_location.loc_bck_id_ctr is 'Sequence of location in list (internal primary key)';
comment on column ct_location_contact_backup.first_name is 'First name of backup to person providing facility recruitment information for the entire study.';
comment on column ct_location_contact_backup.middle_name is 'Middle name of backup to person providing facility recruitment information for the entire study.';
comment on column ct_location_contact_backup.last_name is 'Last name of backup to person providing facility recruitment information for the entire study.';
comment on column ct_location_contact_backup.degrees is 'Degrees of backup to person providing facility recruitment information for the entire study.';
comment on column ct_location_contact_backup.phone is 'Phone number of backup to person providing facility recruitment information for the entire study.';
comment on column ct_location_contact_backup.phone_ext is 'Phone extension of backup to person providing facility recruitment information for the entire study.';
comment on column ct_location_contact_backup.email is 'Email of backup to person providing facility recruitment information for the entire study.';
alter table only ct_location_contact_backup add constraint fk_ct_location_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_location_contact_backup add constraint unique_ct_location_contact_backup_ids UNIQUE (id, loc_cont_bck_id_ctr);

-- CREATE TABLE ct_location_investigator (
COMMENT on table ct_location_investigator is 'Investigators at the protocol location.';
comment on column ct_location_investigator.id is 'Record ID (internal primary key)';
comment on column ct_location_investigator.id_ctr is 'Sequence of location in list (internal primary key)';
comment on column ct_location_investigator.loc_invest_ctr is 'Sequence of investigator in list (internal primary key)';
comment on column ct_location_investigator.first_name is 'First name.';
comment on column ct_location_investigator.middle_name is 'Middle name.';
comment on column ct_location_investigator.last_name is 'Last name.';
comment on column ct_location_investigator.degrees is 'Degree(s).';
comment on column ct_location_investigator.role is 'Position or function of the investigator.';
comment on column ct_location_investigator.affiliation is 'Full name of the investigator''s organization. If none, specify Unaffiliated.';
alter table only ct_location_investigator add constraint fk_ct_location_investigator_ids FOREIGN KEY (id, id_ctr) REFERENCES ct_location(id, id_ctr) ON DELETE CASCADE;
alter table only ct_location_investigator add constraint unique_ct_location_investigator_ids UNIQUE (id, id_ctr, loc_invest_id_ctr);

-- CREATE TABLE ct_location_countries (
COMMENT on table ct_location_countries is 'Countries where protocol is carried out (?)';
comment on column ct_location_countries.id is 'Record ID (internal primary key)';
comment on column ct_location_countries.country_ctr is 'Sequence of country in list (internal primary key)';
comment on column ct_location_countries.country is 'undocumented';
alter table only ct_location_countries add constraint fk_ct_location_countries_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_location_countries add constraint unique_ct_location_countries_ids UNIQUE (id, country_ctr);

--CREATE TABLE ct_removed_countries (
COMMENT on table ct_removed_countries is 'Countries where protocol has been terminated (?)';
comment on column ct_removed_countries.id is 'Record ID (internal primary key)';
comment on column ct_removed_countries.country_ctr is 'Sequence of country in list (internal primary key)';
comment on column ct_removed_countries.country is 'undocumented';
alter table only ct_removed_countries add constraint fk_ct_removed_countries_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_removed_countries add constraint unique_ct_removed_countries_ids UNIQUE (id, country_ctr);

-- CREATE TABLE ct_links (
COMMENT on table ct_links is 'A Web site directly relevant to the protocol';
comment on column ct_links.id is 'Record ID (internal primary key)';
comment on column ct_links.link_ctr is 'Sequence of link in list (internal primary key)';
comment on column ct_links.url is 'complete URL, including http';
comment on column ct_links.link_desc is 'title or brief description of the linked page.';
alter table only ct_links add constraint fk_ct_links_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_links add constraint unique_ct_links_ids UNIQUE (id, link_ctr);

-- CREATE TABLE ct_references (
COMMENT on table ct_references is 'Citations to publications related to the protocol background';
comment on column ct_references.id is 'Record ID (internal primary key)';
comment on column ct_references.reference_ctr is 'Sequence of reference in list (internal primary key)';
comment on column ct_references.citation is 'bibliographic reference in NLM''s MEDLINE format';
comment on column ct_references.PMID is 'PubMed Unique Identifier (PMID) for the citation in MEDLINE';
alter table only ct_references add constraint unique_ct_references_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_references add constraint unique_ct_references_ids UNIQUE (id, reference_ctr);

-- CREATE TABLE ct_results_references (
COMMENT on table ct_results_references is 'Citations to publications related to the protocol results';
comment on column ct_results_references.id is 'Record ID (internal primary key)';
comment on column ct_results_references.reference_ctr is 'Sequence of reference in list (internal primary key)';
comment on column ct_results_references.citation is 'bibliographic reference in NLM''s MEDLINE format';
comment on column ct_results_references.PMID is 'PubMed Unique Identifier (PMID) for the citation in MEDLINE';
alter table only ct_results_references add constraint fk_ct_results_references_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_results_references add constraint unique_ct_results_references_ids UNIQUE (id, reference_ctr);

-- CREATE TABLE ct_responsible_party (
COMMENT on table ct_responsible_party is 'As defined in US Public Law 110-85, Title VIII, Section 801,';
comment on column ct_responsible_party.id is 'Record ID (internal primary key)';
comment on column ct_responsible_party.party_ctr is 'Sequence of responsible party in list (internal primary key)';
comment on column ct_responsible_party.name_title is 'Old data format name and title';
comment on column ct_responsible_party.organization is 'Old data format organization';
comment on column ct_responsible_party.responsible_party_type is 'Sponsor, Investigator or Sponsor-Investigator';
comment on column ct_responsible_party.investigator_affiliation is 'primary organizational affiliation of the investigator';
comment on column ct_responsible_party.investigator_full_name is 'Full name of responsible investigator';
comment on column ct_responsible_party.investigator_title is 'title of the investigator, at the primary organizational affiliation';
alter table only ct_responsible_party add constraint fk_ct_responsible_party_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_responsible_party add constraint unique_ct_responsible_party_ids UNIQUE (id, party_ctr);

-- CREATE TABLE ct_keyword (
COMMENT on table ct_keyword is 'Keywords';
comment on column ct_keyword.id is 'Record ID (internal primary key)';
comment on column ct_keyword.keyword_ctr is 'Sequence of keyword in list (internal primary key)';
comment on column ct_keyword.keyword is 'Sequence of keyword in list (internal primary key)';
alter table only ct_keyword add constraint fk_ct_keyword_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_keyword add constraint unique_ct_keyword_ids UNIQUE (id, keyword_ctr);

-- CREATE TABLE ct_condition_browse (
COMMENT on table ct_condition_browse is 'List of condition-related MeSH terms for browsing (Undocumented)';
comment on column ct_condition_browse.id is 'Record ID (internal primary key)';
comment on column ct_condition_browse.condition_ctr is 'Sequence of condition in list (internal primary key)';
comment on column ct_condition_browse.mesh_term is 'Condition related MeSH term.';
alter table only ct_condition_browse add constraint fk_ct_condition_browse_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_condition_browse add constraint unique_ct_condition_browse_ids UNIQUE (id, condition_ctr);

-- CREATE TABLE ct_intervention_browse (
COMMENT on table ct_intervention_browse is 'List of intervention-related MeSH terms for browsing (Undocumented)';
comment on column ct_intervention_browse.id is 'Record ID (internal primary key)';
comment on column ct_intervention_browse.intervention_ctr is 'Sequence of intervention in list (internal primary key)';
comment on column ct_intervention_browse.mesh_term is 'Intervention related MeSH term.';
alter table only ct_intervention_browse add constraint fk_ct_intervention_browse_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_intervention_browse add constraint unique_ct_intervention_browse_ids UNIQUE (id, intervention_ctr);

-- create table ct_patient_data (

-- create table ct_study_doc (

-- create table ct_pending_results_submitted (

-- create table ct_pending_results_returned (

-- create table ct_pending_results_submission_canceled (

-- CREATE TABLE ct_results (
COMMENT on table ct_results is 'Reported Study Results';
comment on column ct_results.id is 'Record ID (internal primary key)';
comment on column ct_results.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results.recruitment_details is 'Key information relevant to the recruitment process for the overall study, such as dates of the recruitment period and types of location (e.g., medical clinic), to provide context.';
comment on column ct_results.pre_assignment_details is 'Description of any significant events and approaches for the overall study (e.g., wash out, run-in, transition) following participant enrollment, but prior to group assignment.';
comment on column ct_results.events_timeframe is 'Period in which the reported adverse event data were collected';
comment on column ct_results.events_desc is 'Additional relevant information about adverse event collection, including details about the method of systematic assessment';
comment on column ct_results.pi_employee is 'If all principal investigators are employees of the sponsor';
comment on column ct_results.restrictive_agreement is 'If there is an agreement between the sponsor (or its agent) and any non-employee PI(s) that restricts the PI''s rights to discuss or publish trial results after the trial is completed';
comment on column ct_results.limitations is 'describe significant limitations of the trial';
comment on column ct_results.poc_name_or_title is 'Point of contact for scientific information about the posted clinical trial results.';
comment on column ct_results.poc_organization is 'Full name of the designated individual''s organizational affiliation.';
comment on column ct_results.poc_phone is 'Office phone of the designated individual.';
comment on column ct_results.poc_email is 'Electronic mail address of the designated individual';
alter table only ct_results add constraint fk_ct_results_ids FOREIGN KEY (id) REFERENCES ct_master(id) ON DELETE CASCADE;
alter table only ct_results add constraint unique_ct_results_ids UNIQUE (id, results_ctr);

-- CREATE TABLE ct_results_groups (
COMMENT on table ct_results_groups is 'Arms or comparison groups in a trial';
comment on column ct_results_groups.id is 'Record ID (internal primary key)';
comment on column ct_results_groups.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_groups.group_ctr is 'Sequence of group in list (internal primary key)';
comment on column ct_results_groups.title is 'Label used to identify the arm or comparison group.';
comment on column ct_results_groups.description is 'Brief description of the arm or comparison group to distinguish it from other arms/groups in the trial.';
comment on column ct_results_groups.group_id is 'Group Identifier (should match up to ct_arm_groups)';
alter table only ct_results_groups add constraint fk_ct_results_groups_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_groups add constraint unique_ct_results_groups_ids UNIQUE (id, results_ctr, group_ctr);

-- CREATE TABLE ct_results_periods (
COMMENT on table ct_results_periods is 'Discrete stages of a clinical trial during which numbers of participants at specific significant events or points of time are reported.';
comment on column ct_results_periods.id is 'Record ID (internal primary key)';
comment on column ct_results_periods.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_periods.period_ctr is 'Sequence of period in list (internal primary key)';
comment on column ct_results_periods.period_title is 'Title describing a stage of the trial';
alter table only ct_results_periods add constraint fk_ct_results_periods_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_periods add constraint unique_ct_results_periods_ids UNIQUE (id, results_ctr, period_ctr);

-- CREATE TABLE ct_results_periods_milestones (
COMMENT on table ct_results_periods_milestones is 'Any specific events or time points in the trial when the numbers of participants are reported may be added.';
comment on column ct_results_periods_milestones.id is 'Record ID (internal primary key)';
comment on column ct_results_periods_milestones.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_periods_milestones.period_ctr is 'Sequence of period in list (internal primary key)';
comment on column ct_results_periods_milestones.milestone_ctr is 'Sequence of milestone in list (internal primary key)';
comment on column ct_results_periods_milestones.milestone_title is 'Label describing milestone';
alter table only ct_results_periods_milestones add constraint fk_ct_results_periods_milestones_ids FOREIGN KEY (id, results_ctr, period_ctr) REFERENCES ct_results_periods(id, results_ctr, period_ctr) ON DELETE CASCADE;
alter table only ct_results_periods_milestones add constraint unique_ct_results_periods_milestones_ids UNIQUE (id, results_ctr, period_ctr, milestone_ctr);

-- CREATE TABLE ct_results_periods_participants (
COMMENT on table ct_results_periods_participants is 'Participant group at a given milestone';
comment on column ct_results_periods_participants.id is 'Record ID (internal primary key)';
comment on column ct_results_periods_participants.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_periods_participants.period_ctr is 'Sequence of period in list (internal primary key)';
comment on column ct_results_periods_participants.milestone_ctr is 'Sequence of milestone in list (internal primary key)';
comment on column ct_results_periods_participants.participant_ctr is 'Sequence of participant group in list (internal primary key)';
comment on column ct_results_periods_participants.group_id is 'Group Identifier (should match up to ct_arm_groups)';
comment on column ct_results_periods_participants.group_desc is 'undocumented';
comment on column ct_results_periods_participants.count is 'Number of participants to reach the milestone.';
alter table only ct_results_periods_participants add constraint fk_ct_results_periods_participants_ids FOREIGN KEY (id, results_ctr, period_ctr, milestone_ctr) REFERENCES ct_results_periods_milestones(id, results_ctr, period_ctr, milestone_ctr) ON DELETE CASCADE;
alter table only ct_results_periods_participants add constraint unique_ct_results_periods_participants_ids UNIQUE (id, results_ctr, period_ctr, milestone_ctr, participant_ctr);

-- CREATE TABLE ct_results_periods_drops (
COMMENT on table ct_results_periods_drops is 'Additional information about participants who did not complete the period.';
comment on column ct_results_periods_drops.id is 'Record ID (internal primary key)';
comment on column ct_results_periods_drops.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_periods_drops.period_ctr is 'Sequence of period in list (internal primary key)';
comment on column ct_results_periods_drops.drops_ctr is 'Sequence of drop reason in list (internal primary key)';
comment on column ct_results_periods_drops.drop_reason_title is 'Specific reason not completed';
alter table only ct_results_periods_drops add constraint fk_ct_results_periods_drops_ids FOREIGN KEY (id, results_ctr, period_ctr) REFERENCES ct_results_periods(id, results_ctr, period_ctr) ON DELETE CASCADE;
alter table only ct_results_periods_drops add constraint unique_ct_results_periods_drops_ids UNIQUE (id, results_ctr, period_ctr, drops_ctr);

-- CREATE TABLE ct_results_periods_drops_participants (
COMMENT on table ct_results_periods_drops_participants is 'Participant group for a given drop reason';
comment on column ct_results_periods_drops_participants.id is 'Record ID (internal primary key)';
comment on column ct_results_periods_drops_participants.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_periods_drops_participants.period_ctr is 'Sequence of period in list (internal primary key)';
comment on column ct_results_periods_drops_participants.drops_ctr is 'Sequence of drop reason in list (internal primary key)';
comment on column ct_results_periods_drops_participants.participant_ctr is 'Sequence of participant group in list (internal primary key)';
comment on column ct_results_periods_drops_participants.group_id is 'Group Identifier (should match up to ct_arm_groups)';
comment on column ct_results_periods_drops_participants.group_desc is 'undocumented';
comment on column ct_results_periods_drops_participants.count is 'Number of participants to drop for the given reason.';
alter table only ct_results_periods_drops_participants add constraint fk_ct_results_periods_drops_participants_ids FOREIGN KEY (id, results_ctr, period_ctr, drops_ctr) REFERENCES ct_results_periods_drops(id, results_ctr, period_ctr, drops_ctr) ON DELETE CASCADE;
alter table only ct_results_periods_drops_participants add constraint unique_ct_results_periods_drops_participants_ids UNIQUE (id, results_ctr, period_ctr, drops_ctr, participant_ctr);

-- create table ct_results_baseline (

-- CREATE TABLE ct_results_baseline_groups (
COMMENT on table ct_results_baseline_groups is 'Arms or comparison groups in the baseline of a trial';
comment on column ct_results_baseline_groups.id is 'Record ID (internal primary key)';
comment on column ct_results_baseline_groups.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_baseline_groups.group_ctr is 'Sequence of group in list (internal primary key)';
comment on column ct_results_baseline_groups.group_title is 'Label used to identify the arm or comparison group.';
comment on column ct_results_baseline_groups.group_desc is 'Brief description of the arm or comparison group to distinguish it from other arms/groups in the trial.';
comment on column ct_results_baseline_groups.group_id is 'Group Identifier (should match up to ct_arm_groups)';
alter table only ct_results_baseline_groups add constraint fk_ct_results_baseline_groups_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_baseline_groups add constraint unique_ct_results_baseline_groups_ids UNIQUE (id, results_ctr, group_ctr);

-- create table ct_results_baseline_analyzed (

-- create table ct_results_baseline_analyzed_count (

-- CREATE TABLE ct_results_baseline_measures (
COMMENT on table ct_results_baseline_measures is 'Name and description of a characteristic measured at the beginning of the trial.';
comment on column ct_results_baseline_measures.id is 'Record ID (internal primary key)';
comment on column ct_results_baseline_measures.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_baseline_measures.measure_ctr is 'Sequence of measure in list (internal primary key)';
comment on column ct_results_baseline_measures.measure_title is 'Measure title';
comment on column ct_results_baseline_measures.measure_desc is 'Additional information about the measure, such as details about the collection method or participant population, if different from Overall Number of Baseline Participants.';
comment on column ct_results_baseline_measures.units is 'Units of measure';
comment on column ct_results_baseline_measures.param is 'Parameter measured';
comment on column ct_results_baseline_measures.dispersion is 'Measure of dispersion';
alter table only ct_results_baseline_measures add constraint fk_ct_results_baseline_measures_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_baseline_measures add constraint unique_ct_results_baseline_measures_ids UNIQUE (id, results_ctr, measure_ctr);

-- create table ct_results_baseline_measure_analyzed (

-- create table ct_results_baseline_measure_analyzed_count (

-- create table ct_results_baseline_measure_class (

-- create table ct_results_baseline_measure_class_analyzed (

-- create table ct_results_baseline_measure_class_analyzed_count (

-- CREATE TABLE ct_results_baseline_measure_categories (
COMMENT on table ct_results_baseline_measure_categories is 'Name and description of a category of a characteristic measured at the beginning of the trial.';
comment on column ct_results_baseline_measure_categories.id is 'Record ID (internal primary key)';
comment on column ct_results_baseline_measure_categories.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_baseline_measure_categories.measure_ctr is 'Sequence of measure in list (internal primary key)';
comment on column ct_results_baseline_measure_categories.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_baseline_measure_categories.sub_title is 'Name of distinct category used to measure outcome, if reporting categorical data.';
alter table only ct_results_baseline_measure_categories add constraint fk_ct_results_baseline_measure_categories_ids FOREIGN KEY (id, results_ctr, measure_ctr) REFERENCES ct_results_baseline_measures(id, results_ctr, measure_ctr) ON DELETE CASCADE;
alter table only ct_results_baseline_measure_categories add constraint unique_ct_results_baseline_measure_categories_ids UNIQUE (id, results_ctr, measure_ctr, category_ctr);

-- CREATE TABLE ct_results_baseline_measure_values (
COMMENT on table ct_results_baseline_measure_values is 'Values measured as part of the baseline of a trial.';
comment on column ct_results_baseline_measure_values.id is 'Record ID (internal primary key)';
comment on column ct_results_baseline_measure_values.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_baseline_measure_values.measure_ctr is 'Sequence of measure in list (internal primary key)';
comment on column ct_results_baseline_measure_values.category_ctr is 'Sequence of value in list (internal primary key)';
comment on column ct_results_baseline_measure_values.value_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_baseline_measure_values.group_id is 'Group Identifier (should match up to ct_arm_groups)';
comment on column ct_results_baseline_measure_values.value is 'Measurement Value';
comment on column ct_results_baseline_measure_values.spread is 'Spread of Results';
comment on column ct_results_baseline_measure_values.lower_limit is 'Lower Limit of Results';
comment on column ct_results_baseline_measure_values.upper_limit is 'Upper Limit of Results';
comment on column ct_results_baseline_measure_values.value_note is 'annotation';
alter table only ct_results_baseline_measure_values add constraint fk_ct_results_baseline_measure_values_ids FOREIGN KEY (id, results_ctr, measure_ctr, category_ctr) REFERENCES ct_results_baseline_measure_categories(id, results_ctr, measure_ctr, category_ctr) ON DELETE CASCADE;
alter table only ct_results_baseline_measure_values add constraint unique_ct_results_baseline_measure_values_ids UNIQUE (id, results_ctr, measure_ctr, category_ctr, value_ctr);

-- CREATE TABLE ct_results_outcomes (
COMMENT on table ct_results_outcomes is 'Name and description of the measure used to assess the effect of experimental variables in the trial';
comment on column ct_results_outcomes.id is 'Record ID (internal primary key)';
comment on column ct_results_outcomes.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_outcomes.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_outcomes.outcome_type is 'Primary, Secondary, Other pre-speciified or Post-Hoc';
comment on column ct_results_outcomes.outcome_title is 'Name of outcome measure';
comment on column ct_results_outcomes.outcome_desc is 'Additional information about outcome measure.';
comment on column ct_results_outcomes.time_frame is 'Time point(s) at which outcome measure was assessed.';
comment on column ct_results_outcomes.safety_issue is 'Is this outcome measure assessing a safety issue?';
comment on column ct_results_outcomes.posting_date is 'If results data are not included for an outcome measure, provide the expected month and year they will be submitted.';
comment on column ct_results_outcomes.population is 'Explanation of how the number of participants for analysis was determined.';
alter table only ct_results_outcomes add constraint fk_ct_results_outcomes_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_outcomes add constraint unique_ct_results_outcomes_ids UNIQUE (id, results_ctr, outcome_ctr);

-- CREATE TABLE ct_results_outcomes_groups (
COMMENT on table ct_results_outcomes_groups is 'Arms or comparison groups in a trial';
comment on column ct_results_outcomes_groups.id is 'Record ID (internal primary key)';
comment on column ct_results_outcomes_groups.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_outcomes_groups.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_outcomes_groups.group_ctr is 'Sequence of group in list (internal primary key)';
comment on column ct_results_outcomes_groups.group_title is 'Label used to identify the arm or comparison group.';
comment on column ct_results_outcomes_groups.group_desc is 'Brief description of the arm or comparison group to distinguish it from other arms/groups in the trial.';
comment on column ct_results_outcomes_groups.group_id is 'Group Identifier (should match up to ct_arm_groups)';
alter table only ct_results_outcomes_groups add constraint fk_ct_results_outcomes_groups_ids FOREIGN KEY (id, results_ctr, outcome_ctr) REFERENCES ct_results_outcomes(id, results_ctr, outcome_ctr) ON DELETE CASCADE;
alter table only ct_results_outcomes_groups add constraint unique_ct_results_outcomes_groups_ids UNIQUE (id, results_ctr, outcome_ctr, group_ctr);

-- CREATE TABLE ct_results_outcomes_measures (
COMMENT on table ct_results_outcomes_measures is 'Name and description of a characteristic measured.';
comment on column ct_results_outcomes_measures.id is 'Record ID (internal primary key)';
comment on column ct_results_outcomes_measures.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_outcomes_measures.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_outcomes_measures.measure_ctr is 'Sequence of measure in list (internal primary key)';
comment on column ct_results_outcomes_measures.measure_title is 'Measure title';
comment on column ct_results_outcomes_measures.measure_desc is 'Additional information about the measure, such as details about the collection method or participant population, if different from Overall Number of Baseline Participants.';
comment on column ct_results_outcomes_measures.units is 'Units of measure';
comment on column ct_results_outcomes_measures.param is 'Parameter measured';
comment on column ct_results_outcomes_measures.dispersion is 'Measure of dispersion';
alter table only ct_results_outcomes_measures add constraint fk_ct_results_outcomes_measures_ids FOREIGN KEY (id, results_ctr, outcome_ctr) REFERENCES ct_results_outcomes(id, results_ctr, outcome_ctr) ON DELETE CASCADE;
alter table only ct_results_outcomes_measures add constraint unique_ct_results_outcomes_measures_ids UNIQUE (id, results_ctr, outcome_ctr, measure_ctr);

-- create table ct_results_outcome_measure_analyzed (

-- create table ct_results_outcome_measure_analyzed_count (

-- create table ct_results_outcome_measure_class (

-- create table ct_results_outcome_measure_class_analyzed (

-- create table ct_results_outcome_measure_class_analyzed_count (

-- CREATE TABLE ct_results_outcome_measure_categories (
COMMENT on table ct_results_outcomes_measure_categories is 'Name and description of category of a characteristic measured.';
comment on column ct_results_outcomes_measure_categories.id is 'Record ID (internal primary key)';
comment on column ct_results_outcomes_measure_categories.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_outcomes_measure_categories.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_outcomes_measure_categories.measure_ctr is 'Sequence of measure in list (internal primary key)';
comment on column ct_results_outcomes_measure_categories.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_outcomes_measure_categories.sub_title is 'Name of distinct category used to measure outcome, if reporting categorical data.';
alter table only ct_results_outcomes_measure_categories add constraint fk_ct_results_outcomes_measure_categories_ids FOREIGN KEY (id, results_ctr, outcome_ctr, measure_ctr) REFERENCES ct_results_outcomes_measures(id, results_ctr, outcome_ctr, measure_ctr) ON DELETE CASCADE;
alter table only ct_results_outcomes_measure_categories add constraint unique_ct_results_outcomes_measure_categories_ids UNIQUE (id, results_ctr, outcome_ctr, measure_ctr, category_ctr);

-- CREATE TABLE ct_results_outcome_measure_values (
COMMENT on table ct_results_outcomes_measure_values is 'Values measured as part of an outcome.';
comment on column ct_results_outcomes_measure_values.id is 'Record ID (internal primary key)';
comment on column ct_results_outcomes_measure_values.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_outcomes_measure_values.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_outcomes_measure_values.measure_ctr is 'Sequence of measure in list (internal primary key)';
comment on column ct_results_outcomes_measure_values.category_ctr is 'Sequence of value in list (internal primary key)';
comment on column ct_results_outcomes_measure_values.value_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_outcomes_measure_values.group_id is 'Group Identifier (should match up to ct_arm_groups)';
comment on column ct_results_outcomes_measure_values.value is 'Measurement Value';
comment on column ct_results_outcomes_measure_values.spread is 'Spread of Results';
comment on column ct_results_outcomes_measure_values.lower_limit is 'Lower Limit of Results';
comment on column ct_results_outcomes_measure_values.upper_limit is 'Upper Limit of Results';
comment on column ct_results_outcomes_measure_values.value_note is 'annotation';
alter table only ct_results_outcomes_measure_values add constraint fk_ct_results_outcomes_measure_values_ids FOREIGN KEY (id, results_ctr, outcome_ctr, measure_ctr, category_ctr) REFERENCES ct_results_outcomes_measure_categories(id, results_ctr, outcome_ctr, measure_ctr, category_ctr) ON DELETE CASCADE;
alter table only ct_results_outcomes_measure_values add constraint unique_ct_results_outcomes_measure_values_ids UNIQUE (id, results_ctr, outcome_ctr, measure_ctr, category_ctr, value_ctr);

-- CREATE TABLE ct_results_outcome_analysis (
COMMENT on table ct_results_analysis is 'Summary description of the analysis performed.';
comment on column ct_results_analysis.id is 'Record ID (internal primary key)';
comment on column ct_results_analysis.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_analysis.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_analysis.analysis_ctr is 'Sequence of analysis in list (internal primary key)';
comment on column ct_results_analysis.groups_desc is 'Additional details about the statistical analysis, such as null hypothesis and description of power calculation';
comment on column ct_results_analysis.non_inferiority is 'Identifies whether the analysis is a test of non-inferiority or equivalence';
comment on column ct_results_analysis.non_inferiority_desc is 'If, "Yes", provide additional details, including details of the power calculation (if not previously provided), definition of non-inferiority margin, and other key parameters';
comment on column ct_results_analysis.p_value is 'Calculated p-value given the null-hypothesis';
comment on column ct_results_analysis.p_value_desc is 'Additional information, such as whether or not the p-value is adjusted for multiple comparisons and the a priori threshold for statistical significance';
comment on column ct_results_analysis.method is 'Procedure used to estimate effect of intervention.';
comment on column ct_results_analysis.method_desc is 'Undocumented';
comment on column ct_results_analysis.param_type is 'Estimation Parameter Type';
comment on column ct_results_analysis.param_value is 'Estimateion Parameter Value';
comment on column ct_results_analysis.dispersion_type is 'Standard deviation or Standard Error of the Mean';
comment on column ct_results_analysis.dispersion_value is 'Value of dispersionmeasure';
comment on column ct_results_analysis.ci_percent is 'Level of confidence interval, expressed as a percent';
comment on column ct_results_analysis.ci_n_sides is 'Number of sides of confidence interval';
comment on column ct_results_analysis.ci_lower_limit is 'Lower limit of confidence interval';
comment on column ct_results_analysis.ci_upper_limit is 'Upper limit of confidence interval';
comment on column ct_results_analysis.ci_upper_limit_na_comment is 'Explain why the upper limit data are Not Available.';
comment on column ct_results_analysis.estimate_desc is 'Any other relevant estimation information, including the direction of the comparison (e.g., describe which arm or comparison group represents the numerator and denominator for relative risk)';
alter table only ct_results_analysis add constraint fk_ct_results_analysis_ids FOREIGN KEY (id, results_ctr, outcome_ctr) REFERENCES ct_results_outcomes(id, results_ctr, outcome_ctr) ON DELETE CASCADE;
alter table only ct_results_analysis add constraint unique_ct_results_analysis_ids UNIQUE (id, results_ctr, outcome_ctr, analysis_ctr);

-- CREATE TABLE ct_results_outcome_group (
COMMENT on table ct_results_analysis_groups is 'Identifies the arms or comparison groups involved in the statistical analysis';
comment on column ct_results_analysis_groups.id is 'Record ID (internal primary key)';
comment on column ct_results_analysis_groups.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_analysis_groups.outcome_ctr is 'Sequence of outcome in list (internal primary key)';
comment on column ct_results_analysis_groups.analysis_ctr is 'Sequence of analysis in list (internal primary key)';
comment on column ct_results_analysis_groups.group_ctr is 'Sequence of group in list (internal primary key)';
comment on column ct_results_analysis_groups.group_id is 'Group Identifier (should match up to ct_arm_groups)';
alter table only ct_results_analysis_groups add constraint fk_ct_results_analysis_groups_ids FOREIGN KEY (id, results_ctr, outcome_ctr, analysis_ctr) REFERENCES ct_results_analysis(id, results_ctr, outcome_ctr, analysis_ctr) ON DELETE CASCADE;
alter table only ct_results_analysis_groups add constraint unique_ct_results_analysis_groups_ids UNIQUE (id, results_ctr, outcome_ctr, analysis_ctr, group_ctr);

-- create table ct_results_reported_events (

-- CREATE TABLE ct_results_reported_events_groups (
COMMENT on table ct_results_events_groups is 'Arms or comparison groups in a trial';
comment on column ct_results_events_groups.id is 'Record ID (internal primary key)';
comment on column ct_results_events_groups.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_groups.group_ctr is 'Sequence of group in list (internal primary key)';
comment on column ct_results_events_groups.group_title is 'Label used to identify the arm or comparison group.';
comment on column ct_results_events_groups.group_desc is 'Brief description of the arm or comparison group to distinguish it from other arms/groups in the trial.';
comment on column ct_results_events_groups.group_id is 'Group Identifier (should match up to ct_arm_groups)';
alter table only ct_results_analysis_groups add constraint fk_ct_results_events_groups_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_analysis_groups add constraint unique_ct_results_events_groups_ids UNIQUE (id, results_ctr, group_ctr);

-- CREATE TABLE ct_results_events_serious (
COMMENT on table ct_results_events_serious is 'adverse events that result in death, require either inpatient hospitalization or the prolongation of hospitalization, are life-threatening, result in a persistent or significant disability/incapacity or result in a congenital anomaly/birth defect.';
comment on column ct_results_events_serious.id is 'Record ID (internal primary key)';
comment on column ct_results_events_serious.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_serious.serious_events_ctr is 'Sequence of serious event in list (internal primary key)';
comment on column ct_results_events_serious.frequency_threshhold is 'The frequency of Other (Not Including Serious) Adverse Events that, when exceeded within any arm or comparison group, are reported in the results database for all arms or comparison groups.';
comment on column ct_results_events_serious.default_vocab is 'Default terminology used to describe events';
comment on column ct_results_events_serious.default_assessment is 'Default method of assessing events';
alter table only ct_results_events_serious add constraint fk_ct_results_events_serious_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_events_serious add constraint unique_ct_results_events_serious_ids UNIQUE (id, results_ctr, serious_events_ctr);

-- CREATE TABLE ct_results_events_serious_categories (
COMMENT on table ct_results_events_serious_categories is 'Categories of serious adverse events';
comment on column ct_results_events_serious_categories.id is 'Record ID (internal primary key)';
comment on column ct_results_events_serious_categories.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_serious_categories.serious_events_ctr is 'Sequence of serious event in list (internal primary key)';
comment on column ct_results_events_serious_categories.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_events_serious_categories.category_title is 'title of the category.';
alter table only ct_results_events_serious_categories add constraint fk_ct_results_events_serious_categories_ids FOREIGN KEY (id, results_ctr, serious_events_ctr) REFERENCES ct_results_events_serious(id, results_ctr, serious_events_ctr) ON DELETE CASCADE;
alter table only ct_results_events_serious_categories add constraint unique_ct_results_events_serious_categories_ids UNIQUE (id, results_ctr, serious_events_ctr, category_ctr);

-- CREATE TABLE ct_results_events_serious_events (
COMMENT on table ct_results_events_serious_events is 'Specific types of serious adverse events';
comment on column ct_results_events_serious_events.id is 'Record ID (internal primary key)';
comment on column ct_results_events_serious_events.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_serious_events.serious_events_ctr is 'Sequence of serious event in list (internal primary key)';
comment on column ct_results_events_serious_events.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_events_serious_events.event_ctr is 'Sequence of event in list (internal primary key)';
comment on column ct_results_events_serious_events.sub_title is 'title of the events.';
comment on column ct_results_events_serious_events.assessment is 'Method used to assess the adverse event.';
comment on column ct_results_events_serious_events.event_desc is 'Additional relevant information about the adverse event, including any deviation from the Time Frame for Adverse Event Reporting.';
alter table only ct_results_events_serious_events add constraint fk_ct_results_events_serious_events_ids FOREIGN KEY (id, results_ctr, serious_events_ctr, category_ctr) REFERENCES ct_results_events_serious_categories(id, results_ctr, serious_events_ctr, category_ctr) ON DELETE CASCADE;
alter table only ct_results_events_serious_events add constraint unique_ct_results_events_serious_events_ids UNIQUE (id, results_ctr, serious_events_ctr, category_ctr, event_ctr);

-- CREATE TABLE ct_results_events_serious_counts (
COMMENT on table ct_results_events_serious_counts is 'Counts of serious adverse events by event and by group';
comment on column ct_results_events_serious_counts.id is 'Record ID (internal primary key)';
comment on column ct_results_events_serious_counts.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_serious_counts.serious_events_ctr is 'Sequence of serious event in list (internal primary key)';
comment on column ct_results_events_serious_counts.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_events_serious_counts.event_ctr is 'Sequence of event in list (internal primary key)';
comment on column ct_results_events_serious_counts.count_ctr is 'Sequence of count in list (internal primary key)';
comment on column ct_results_events_serious_counts.group_id is 'Group Identifier (should match up to ct_arm_groups)';
comment on column ct_results_events_serious_counts.subjects_affected is 'Number of participants experiencing at least one event being reported ';
comment on column ct_results_events_serious_counts.subjects_at_risk is 'Number of participants assessed for adverse events during the trial (i.e., the denominator for calculating frequency of adverse events).';
comment on column ct_results_events_serious_counts.event_count is 'Number of occurrences of the adverse event being reported';
alter table only ct_results_events_serious_counts add constraint fk_ct_results_events_serious_counts_ids FOREIGN KEY (id, results_ctr, serious_events_ctr, category_ctr, event_ctr) REFERENCES ct_results_events_serious_events(id, results_ctr, serious_events_ctr, category_ctr, event_ctr) ON DELETE CASCADE;
alter table only ct_results_events_serious_counts add constraint unique_ct_results_events_serious_counts_ids UNIQUE (id, results_ctr, serious_events_ctr, category_ctr, event_ctr, count_ctr);

-- CREATE TABLE ct_results_events_other (
COMMENT on table ct_results_events_other is 'Other (Not Including Serious) Adverse Events are those that are not Serious Adverse Events that exceed a frequency threshold.';
comment on column ct_results_events_other.id is 'Record ID (internal primary key)';
comment on column ct_results_events_other.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_other.other_events_ctr is 'Sequence of other event in list (internal primary key)';
comment on column ct_results_events_other.frequency_threshhold is 'The frequency of Other (Not Including Serious) Adverse Events that, when exceeded within any arm or comparison group, are reported in the results database for all arms or comparison groups.';
comment on column ct_results_events_other.default_vocab is 'Default terminology used to describe events';
comment on column ct_results_events_other.default_assessment is 'Default method of assessing events';
alter table only ct_results_events_other add constraint fk_ct_results_events_other_ids FOREIGN KEY (id, results_ctr) REFERENCES ct_results(id, results_ctr) ON DELETE CASCADE;
alter table only ct_results_events_other add constraint unique_ct_results_events_other_ids UNIQUE (id, results_ctr, other_events_ctr);

-- CREATE TABLE ct_results_events_other_categories (
COMMENT on table ct_results_events_other_categories is 'Categories of other adverse events';
comment on column ct_results_events_other_categories.id is 'Record ID (internal primary key)';
comment on column ct_results_events_other_categories.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_other_categories.other_events_ctr is 'Sequence of other event in list (internal primary key)';
comment on column ct_results_events_other_categories.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_events_other_categories.category_title is 'title of the category.';
alter table only ct_results_events_other_categories add constraint fk_ct_results_events_other_categories_ids FOREIGN KEY (id, results_ctr, other_events_ctr) REFERENCES ct_results_events_other(id, results_ctr, other_events_ctr) ON DELETE CASCADE;
alter table only ct_results_events_other_categories add constraint unique_ct_results_events_other_categories_ids UNIQUE (id, results_ctr, other_events_ctr, category_ctr);

-- CREATE TABLE ct_results_events_other_events (
COMMENT on table ct_results_events_other_events is 'Specific types of other adverse events';
comment on column ct_results_events_other_events.id is 'Record ID (internal primary key)';
comment on column ct_results_events_other_events.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_other_events.other_events_ctr is 'Sequence of other event in list (internal primary key)';
comment on column ct_results_events_other_events.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_events_other_events.event_ctr is 'Sequence of event in list (internal primary key)';
comment on column ct_results_events_other_events.sub_title is 'title of the events.';
comment on column ct_results_events_other_events.assessment is 'Method used to assess the adverse event.';
comment on column ct_results_events_other_events.event_desc is 'Additional relevant information about the adverse event, including any deviation from the Time Frame for Adverse Event Reporting.';
alter table only ct_results_events_other_events add constraint fk_ct_results_events_other_events_ids FOREIGN KEY (id, results_ctr, other_events_ctr, category_ctr) REFERENCES ct_results_events_other_categories(id, results_ctr, other_events_ctr, category_ctr) ON DELETE CASCADE;
alter table only ct_results_events_other_events add constraint unique_ct_results_events_other_events_ids UNIQUE (id, results_ctr, other_events_ctr, category_ctr, event_ctr);

-- CREATE TABLE ct_results_events_other_counts (
COMMENT on table ct_results_events_other_counts is 'Counts of other adverse events by event and by group';
comment on column ct_results_events_other_counts.id is 'Record ID (internal primary key)';
comment on column ct_results_events_other_counts.results_ctr is 'Sequence of results in list (internal primary key)';
comment on column ct_results_events_other_counts.other_events_ctr is 'Sequence of other event in list (internal primary key)';
comment on column ct_results_events_other_counts.category_ctr is 'Sequence of category in list (internal primary key)';
comment on column ct_results_events_other_counts.event_ctr is 'Sequence of event in list (internal primary key)';
comment on column ct_results_events_other_counts.count_ctr is 'Sequence of count in list (internal primary key)';
comment on column ct_results_events_other_counts.group_id is 'Group Identifier (should match up to ct_arm_groups)';
comment on column ct_results_events_other_counts.subjects_affected is 'Number of participants experiencing at least one event being reported ';
comment on column ct_results_events_other_counts.subjects_at_risk is 'Number of participants assessed for adverse events during the trial (i.e., the denominator for calculating frequency of adverse events).';
comment on column ct_results_events_other_counts.event_count is 'Number of occurrences of the adverse event being reported';
alter table only ct_results_events_other_counts add constraint fk_ct_results_events_other_counts_ids FOREIGN KEY (id, results_ctr, other_events_ctr, category_ctr, event_ctr) REFERENCES ct_results_events_other_events(id, results_ctr, other_events_ctr, category_ctr, event_ctr) ON DELETE CASCADE;
alter table only ct_results_events_other_counts add constraint unique_ct_results_events_other_counts_ids UNIQUE (id, results_ctr, other_events_ctr, category_ctr, event_ctr, count_ctr);

-- CREATE TABLE ct_interventions_arm_groups (
COMMENT on table ct_interventions_arm_groups is 'if multiple Arms/Groups have been specified for the study, edit the Cross-Reference, checking boxes to indicate which of the Interventions are to be stered under each Arm/Group of the study.';
comment on column ct_interventions_arm_groups.id is 'Record ID (internal primary key)';
comment on column ct_interventions_arm_groups.interventions_ctr is 'Sequence of intervention in list (internal primary key)';
comment on column ct_interventions_arm_groups.arm_group_ctr is 'Sequence of arm_group in list (internal primary key)';
comment on column ct_interventions_arm_groups.arm_group_label is 'Arm group receiving the intervention';
alter table only ct_interventions_arm_groups add constraint fk_ct_interventions_arm_groups_ids FOREIGN KEY (id, interventions_ctr) REFERENCES ct_interventions(id, interventions_ctr) ON DELETE CASCADE;
alter table only ct_interventions_arm_groups add constraint fk_ct_interventions_arm_groups_ids UNIQUE (id, interventions_ctr, arm_group_ctr);

-- CREATE TABLE ct_interventions_other_names (
COMMENT on table ct_interventions_other_names is 'Other Names for interventions';
comment on column ct_interventions_other_names.id is 'Record ID (internal primary key)';
comment on column ct_interventions_other_names.intervention_ctr is 'Sequence of intervention in list (internal primary key)';
comment on column ct_interventions_other_names.other_name_ctr is 'Sequence of other name in list (internal primary key)';
comment on column ct_interventions_other_names.other_name is 'list other names used to identify the intervention, past or present (e.g., brand name for a drug).';
alter table only ct_interventions_other_names add constraint fk_ct_interventions_other_names_ids FOREIGN KEY (id, intervention_ctr) REFERENCES ct_interventions(id, interventions_ctr) ON DELETE CASCADE;
alter table only ct_interventions_other_names add constraint unique_ct_interventions_other_names_ids UNIQUE (id, intervention_ctr, other_name_ctr);

