
alter table only pubref
	add constraint uni_pubref unique (doc_num);

alter table only deceased
	add constraint uni_deceased unique (doc_num,dead_id_ctr);
alter table only deceased
	add constraint fk_deceased foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_ref_cit_nplcit
	add constraint uni_us_ref_cit_nplcit unique (doc_num,us_nplcit_id_ctr);
alter table only us_ref_cit_nplcit
	add constraint fk_us_ref_cit_nplcit foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_ref_cit_patcit
	add constraint uni_us_ref_cit_patcit unique (doc_num,us_ref_cit_pat_id_ctr);
alter table only us_ref_cit_patcit
	add constraint fk_us_ref_cit_patcit foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_applicant
	add constraint uni_us_applicant unique (doc_num,us_appl_id_ctr);
alter table only us_applicant
	add constraint fk_us_applicant foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only sequence_list_doc
	add constraint uni_sequence_list_doc unique (doc_num,seq_list_id_ctr);
alter table only sequence_list_doc
	add constraint fk_sequence_list_doc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_ref_cited_class_nat
	add constraint uni_us_ref_cited_class_nat unique (doc_num,us_ref_class_nat_id_ctr);
alter table only us_ref_cited_class_nat
	add constraint fk_us_ref_cited_class_nat foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only applicant
	add constraint uni_applicant unique (doc_num,us_app_id_ctr);
alter table only applicant
	add constraint fk_applicant foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_field_of_class_search_ipcr
	add constraint uni_us_field_of_class_search_ipcr unique (doc_num,us_class_ipcr);
alter table only us_field_of_class_search_ipcr
	add constraint fk_us_field_of_class_search_ipcr foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only description
	add constraint uni_description unique (doc_num,description_id_ctr);
alter table only description
	add constraint fk_description foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only agents
	add constraint uni_agents unique (doc_num,agents_id_ctr);
alter table only agents
	add constraint fk_agents foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_chem
	add constraint uni_us_chem unique (doc_num,us_id_ctr);
alter table only us_chem
	add constraint fk_us_chem foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only related_doc
	add constraint uni_related_doc unique (doc_num,related_doc_id_ctr);
alter table only related_doc
	add constraint fk_related_doc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only continuation
	add constraint uni_continuation unique (doc_num,continuation_id_ctr);
alter table only continuation
	add constraint fk_continuation foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only related_pub
	add constraint uni_related_pub unique (doc_num,related_pub_id_ctr);
alter table only related_pub
	add constraint fk_related_pub foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only ref_cit_class_cpc
	add constraint uni_ref_cit_class_cpc unique (doc_num,ref_cite_class_cpc_id_ctr);
alter table only ref_cit_class_cpc
	add constraint fk_ref_cit_class_cpc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only ref_cit_class_ipc
	add constraint uni_ref_cit_class_ipc unique (doc_num,ref_cit_class_ipc_id_ctr);
alter table only ref_cit_class_ipc
	add constraint fk_ref_cit_class_ipc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only inventor
	add constraint uni_inventor unique (doc_num,inventor_id);
alter table only inventor
	add constraint fk_inventor foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_botanic
	add constraint uni_us_botanic unique (doc_num,us_botanic_id_ctr);
alter table only us_botanic
	add constraint fk_us_botanic foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_exemplary_claim
	add constraint uni_us_exemplary_claim unique (doc_num,us_exemplary_claim_id_ctr);
alter table only us_exemplary_claim
	add constraint fk_us_exemplary_claim foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only assist_examiner
	add constraint uni_assist_examiner unique (doc_num,assist_exam_id_ctr);
alter table only assist_examiner
	add constraint fk_assist_examiner foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only appref
	add constraint uni_appref unique (doc_num,appref_id_ctr);
alter table only appref
	add constraint fk_appref foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only drawings
	add constraint uni_drawings unique (doc_num,drawing_id_ctr);
alter table only drawings
	add constraint fk_drawings foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only pct_regional_fil
	add constraint uni_pct_regional_fil unique (doc_num,pct_reg_fil_id_ctr);
alter table only pct_regional_fil
	add constraint fk_pct_regional_fil foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_deceased
	add constraint uni_us_deceased unique (doc_num,us_dead_id_ctr);
alter table only us_deceased
	add constraint fk_us_deceased foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only substitution
	add constraint uni_substitution unique (doc_num,substitution_id_ctr);
alter table only substitution
	add constraint fk_substitution foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only figures
	add constraint uni_figures unique (doc_num,figures_id_ctr);
alter table only figures
	add constraint fk_figures foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only examiner
	add constraint uni_examiner unique (doc_num,examiner_id_ctr);
alter table only examiner
	add constraint fk_examiner foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only ref_cit_category
	add constraint uni_ref_cit_category unique (doc_num,ref_cit_cat_id_ctr);
alter table only ref_cit_category
	add constraint fk_ref_cit_category foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_cpc_comb_set
	add constraint uni_class_cpc_comb_set unique (doc_num,class_cpc_comb_set_id_ctr);
alter table only class_cpc_comb_set
	add constraint fk_class_cpc_comb_set foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only ref_cited_class_nat
	add constraint uni_ref_cited_class_nat unique (doc_num,us_ref_class_cited_nat_id_ctr);
alter table only ref_cited_class_nat
	add constraint fk_ref_cited_class_nat foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only field_of_search_national
	add constraint uni_field_of_search_national unique (doc_num,field_of_search_national_id_ctr);
alter table only field_of_search_national
	add constraint fk_field_of_search_national foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_ref_cit_category
	add constraint uni_us_ref_cit_category unique (doc_num,us_ref_cit_cat_id_ctr);
alter table only us_ref_cit_category
	add constraint fk_us_ref_cit_category foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_cpc_main
	add constraint uni_class_cpc_main unique (doc_num,class_cpc_main_id_ctr);
alter table only class_cpc_main
	add constraint fk_class_cpc_main foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only field_of_search_ipc
	add constraint uni_field_of_search_ipc unique (doc_num,field_of_search_ipc_id_ctr);
alter table only field_of_search_ipc
	add constraint fk_field_of_search_ipc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_cpc_further
	add constraint uni_class_cpc_further unique (doc_num,class_cpc_further_id_ctr);
alter table only class_cpc_further
	add constraint fk_class_cpc_further foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_field_of_class_search_cpc
	add constraint uni_us_field_of_class_search_cpc unique (doc_num,class_cpc_text_id_ctr);
alter table only us_field_of_class_search_cpc
	add constraint fk_us_field_of_class_search_cpc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_ref_cit_class_cpc
	add constraint uni_us_ref_cit_class_cpc unique (doc_num,us_ref_cit_class_cpc_id_ctr);
alter table only us_ref_cit_class_cpc
	add constraint fk_us_ref_cit_class_cpc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_related_doc_reexam
	add constraint uni_us_related_doc_reexam unique (doc_num,us_relate_doc_reexam_ctr);
alter table only us_related_doc_reexam
	add constraint fk_us_related_doc_reexam foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only assignee
	add constraint uni_assignee unique (doc_num,assignee_id_ctr);
alter table only assignee
	add constraint fk_assignee foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only ref_cit_nplcit
	add constraint uni_ref_cit_nplcit unique (doc_num,nplcit_id_ctr);
alter table only ref_cit_nplcit
	add constraint fk_ref_cit_nplcit foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_ipcr
	add constraint uni_class_ipcr unique (doc_num,class_ipcr_id_ctr);
alter table only class_ipcr
	add constraint fk_class_ipcr foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only reissue
	add constraint uni_reissue unique (doc_num,reissue_id_ctr);
alter table only reissue
	add constraint fk_reissue foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only claims
	add constraint uni_claims unique (doc_num,claims_id_ctr);
alter table only claims
	add constraint fk_claims foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only further_class
	add constraint uni_further_class unique (doc_num,further_class_id_ctr);
alter table only further_class
	add constraint fk_further_class foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_continuing_reissue
	add constraint uni_us_continuing_reissue unique (doc_num,us_cont_reissue_ctr);
alter table only us_continuing_reissue
	add constraint fk_us_continuing_reissue foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_prov_app
	add constraint uni_us_prov_app unique (doc_num,us_prove_app_id_ctr);
alter table only us_prov_app
	add constraint fk_us_prov_app foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_sequence_list_doc
	add constraint uni_us_sequence_list_doc unique (doc_num,us_seq_list_doc_id_ctr);
alter table only us_sequence_list_doc
	add constraint fk_us_sequence_list_doc foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_field_of_class_search_cpc_comb
	add constraint uni_us_field_of_class_search_cpc_comb unique (doc_num,class_cpc_comb_id_ctr);
alter table only us_field_of_class_search_cpc_comb
	add constraint fk_us_field_of_class_search_cpc_comb foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_national
	add constraint uni_class_national unique (doc_num,class_national_id_ctr);
alter table only class_national
	add constraint fk_class_national foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_inventor
	add constraint uni_us_inventor unique (doc_num,inventor_id_ctr);
alter table only us_inventor
	add constraint fk_us_inventor foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_ipc_further_class
	add constraint uni_class_ipc_further_class unique (doc_num,futher_class_id_ctr);
alter table only class_ipc_further_class
	add constraint fk_class_ipc_further_class foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only hague_agreement
	add constraint uni_hague_agreement unique (doc_num,hague_agreement_id_ctr);
alter table only hague_agreement
	add constraint fk_hague_agreement foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only class_cpc_comb_rank
	add constraint uni_class_cpc_comb_rank unique (doc_num,class_cpc_comb_rank_id_ctr);
alter table only class_cpc_comb_rank
	add constraint fk_class_cpc_comb_rank foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only pct_regional_pub
	add constraint uni_pct_regional_pub unique (doc_num,pct_region_pub_id_ctr);
alter table only pct_regional_pub
	add constraint fk_pct_regional_pub foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only priority_claim
	add constraint uni_priority_claim unique (doc_num,priority_claim_id_ctr);
alter table only priority_claim
	add constraint fk_priority_claim foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only ref_cit_patcit
	add constraint uni_ref_cit_patcit unique (doc_num,ref_cit_pat_id_ctr);
alter table only ref_cit_patcit
	add constraint fk_ref_cit_patcit foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_maths
	add constraint uni_us_maths unique (doc_num,us_maths_id_ctr);
alter table only us_maths
	add constraint fk_us_maths foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only continuation_in_part
	add constraint uni_continuation_in_part unique (doc_num,cont_in_part_id_ctr);
alter table only continuation_in_part
	add constraint fk_continuation_in_part foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_agents
	add constraint uni_us_agents unique (doc_num,us_agents_id_ctr);
alter table only us_agents
	add constraint fk_us_agents foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only pubref_abs
	add constraint uni_pubref_abs unique (doc_num,pubref_abs_id_ctr);
alter table only pubref_abs
	add constraint fk_pubref_abs foreign key (doc_num) references pubref(doc_num) on delete cascade;

alter table only us_ref_cited_further
	add constraint uni_us_ref_cited_further unique (doc_num,us_ref_class_nat_id_ctr,us_ref_cited_further_id_ctr);
alter table only us_ref_cited_further
	add constraint fk_us_ref_cited_further foreign key (doc_num,us_ref_class_nat_id_ctr) references us_ref_cited_class_nat(doc_num,us_ref_class_nat_id_ctr) on delete cascade;

alter table only descrip_of_draw
	add constraint uni_descrip_of_draw unique (doc_num,description_id_ctr,description_draw_id_ctr);
alter table only descrip_of_draw
	add constraint fk_descrip_of_draw foreign key (doc_num,description_id_ctr) references description(doc_num,description_id_ctr) on delete cascade;

alter table only claim
	add constraint uni_claim unique (doc_num,claims_id_ctr,claim_id_ctr);
alter table only claim
	add constraint fk_claim foreign key (doc_num,claims_id_ctr) references claims(doc_num,claims_id_ctr) on delete cascade;

alter table only ref_cited_further
	add constraint uni_ref_cited_further unique (doc_num,us_ref_class_cited_nat_id_ctr,ref_cited_further_id_ctr);
alter table only ref_cited_further
	add constraint fk_ref_cited_further foreign key (doc_num,us_ref_class_cited_nat_id_ctr) references ref_cited_class_nat(doc_num,us_ref_class_cited_nat_id_ctr) on delete cascade;

alter table only description_heading
	add constraint uni_description_heading unique (doc_num,description_id_ctr,description_heading_id_ctr);
alter table only description_heading
	add constraint fk_description_heading foreign key (doc_num,description_id_ctr) references description(doc_num,description_id_ctr) on delete cascade;

alter table only sequence_list_p
	add constraint uni_sequence_list_p unique (doc_num,seq_list_id_ctr,seq_list_p_id_ctr);
alter table only sequence_list_p
	add constraint fk_sequence_list_p foreign key (doc_num,seq_list_id_ctr) references sequence_list_doc(doc_num,seq_list_id_ctr) on delete cascade;

alter table only abstract_p
	add constraint uni_abstract_p unique (doc_num,pubref_abs_id_ctr,abstract_p_id_ctr);
alter table only abstract_p
	add constraint fk_abstract_p foreign key (doc_num,pubref_abs_id_ctr) references pubref_abs(doc_num,pubref_abs_id_ctr) on delete cascade;

alter table only description_p
	add constraint uni_description_p unique (doc_num,description_id_ctr,description_p_id_ctr);
alter table only description_p
	add constraint fk_description_p foreign key (doc_num,description_id_ctr) references description(doc_num,description_id_ctr) on delete cascade;

alter table only us_sequence_list_p
	add constraint uni_us_sequence_list_p unique (doc_num,us_seq_list_doc_id_ctr,seq_list_p_id_ctr);
alter table only us_sequence_list_p
	add constraint fk_us_sequence_list_p foreign key (doc_num,us_seq_list_doc_id_ctr) references us_sequence_list_doc(doc_num,us_seq_list_doc_id_ctr) on delete cascade;

alter table only draw_fig
	add constraint uni_draw_fig unique (doc_num,drawing_id_ctr,draw_fig_id_ctr);
alter table only draw_fig
	add constraint fk_draw_fig foreign key (doc_num,drawing_id_ctr) references drawings(doc_num,drawing_id_ctr) on delete cascade;

alter table only dod_head
	add constraint uni_dod_head unique (doc_num,description_id_ctr,description_draw_id_ctr,dod_head_id_ctr);
alter table only dod_head
	add constraint fk_dod_head foreign key (doc_num,description_id_ctr,description_draw_id_ctr) references descrip_of_draw(doc_num,description_id_ctr,description_draw_id_ctr) on delete cascade;

alter table only draw_fig_image
	add constraint uni_draw_fig_image unique (doc_num,drawing_id_ctr,draw_fig_id_ctr,draw_fig_image_id_ctr);
alter table only draw_fig_image
	add constraint fk_draw_fig_image foreign key (doc_num,drawing_id_ctr,draw_fig_id_ctr) references draw_fig(doc_num,drawing_id_ctr,draw_fig_id_ctr) on delete cascade;

alter table only dod_p
	add constraint uni_dod_p unique (doc_num,description_id_ctr,description_draw_id_ctr,dod_p_id_ctr);
alter table only dod_p
	add constraint fk_dod_p foreign key (doc_num,description_id_ctr,description_draw_id_ctr) references descrip_of_draw(doc_num,description_id_ctr,description_draw_id_ctr) on delete cascade;
