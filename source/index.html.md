---
title: DataServices API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - vb
  - csharp
  - typescript

toc_footers:


search: true
---

# Introduction

Welcome to the Apollo DataServices API Reference Documentation.

The purpose of the Apollo API Integration Documentation is to provide a description of the service endpoints for the Apollo EPMM data services. 

The Apollo data services provide access to all metadata and image objects within Apollo EPMM by thirdparty applications.

The service is hosted on Apollo’s IIS based web server.  As it is hosted on an IIS web server, it must adhere to safeguards in place to prevent malicious persons from disrupting the server –most importantly requests posted to the web server can’t exceed a maximum size (to prevent denial of service attacks).

The Apollo data services support HTTP and HTTPS for URL requests used by thirdparty applications. Guidelines for secure access and use of the service endpoints described below will be determined at implementation.

We have language bindings in Visual Basic, C#, and Typescript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# Accessions

`GET: http://dev-web/DataServices/accessions/<accessionID>`

Purpose: Get accession information based on <code>accessionID</code>

Stored Procedure: accessionSearch

### Query Parameters

Parameter | Source
--------- | -------
userID | Security ticket
accessRight | UQP, user 'VIEW' if not specified
imageID | URL
Others as indicated by accessionSearch | UQP

<aside class="notice">
DATETIME: Format as YYYY-MM-DDT24:MI:SS.FFF
<code>2012-03-02T15:19:46.000</code>
</aside>

<aside class="notice">
add custom valuies stored in accession_custom_values table to attribute list as <code>field_name=<field_value></code> pairs:
<code><accession accession_id=1000 name='S10-1' ... customField1='VALUE' customField2='VALUE'></code>
</aside>

> The above URL returns XML structured like this:

```XML
<accessions>
    <accession all_images="All Images" physician_name="Cares, Jason" pathologist_id="46" site_name="arccHospital"
	site_id="1" accession_number="ACC0792113289" accession_id="1574" accdate="2016-09-30T02:45:38.670"
	accession_class_name="Wound Care" full_name="Gray, Raquel V" last_name="Gray" first_name="Raquel"
	middle_name="V" patient_id="1043" mrn_id="1033" mrn_number="MRN7065430130" mrn_client="AH" mrn="AH-MRN7065430130"
	gender="M" sex="0" dob="2012-03-24T20:55:25.730" total_image_count="11" docs_count="0" image_count="11"
	card_number="INSURANCE" patient_grouping_key="Gray, Raquel V|1033" accession_class="WOUND CARE"
	patient_class="CLINICAL" patient_class_name="Clinical" patient_form_library="DataForms.dll"
	patient_form="Apollo.ClinicalPatient" restricted_flag="N" created_date="2018-12-17T15:24:46.007" created_by="3"
	created_by_name="john" created_by_program="RedGate" last_updated_date="2018-12-26T10:15:41.903" last_updated_by="3"
	last_updated_by_name="john" last_updated_by_program="RedGate" mrn_client_name="arccHospital" data_operation_id="0"
	comments="" status="READY" status_name="Ready for Review" mrn_status="A" patient_data_operation_id="0" org_id="1480"
	effective_rights="511" org_name="Wound Care" />
</accessions>
```

# Images

`GET: http://dev-web/DataServices/images/<imageID>`

Purpose: Retrieve image metadata by <code>imageID</code>

Stored Procedure: imageSearch

### Query Parameters

Parameter | Source
--------- | -------
userID | Security ticket
accessRight | UQP, user 'VIEW' if not specified
imageID | URL
Others as indicated by imageSearch | UQP

> The above command returns XML structured like this:

```XML
<images>
    <image image_id="659871" name="1547_659871" caption="1547_659871" log="N" image_number="659871.jpg" image_format="JPEG"
	image_class_name="Cytology" dob="2000-01-02T00:00:00.000" full_name="Blick, Narg" mrn="AH-8675309" gender="M"
	accession_number="JB-006" accdate="2018-12-03T00:00:00.000" accession_class_name="Cytology" comment=""
	file_creation_date="2017-01-09T15:47:38.710" created_date="2018-12-26T10:07:11.053" created_by="3" created_by_program="RedGate"
	last_updated_date="2018-12-26T10:07:11.053" last_updated_by="3" last_updated_by_program="RedGate"
	anatomic_site_name="Nerve Fiber Layer" resolution_x="1620" resolution_y="1199" taken_by="RedGate" media_type="IMAGE"
	access_type="APOLLO" accession_id="1547" created_by_user="Reichert, John" last_updated_by_user="Reichert, John" resolution="1620x1199"
	form_name="SickKids.SCANImage" form_library="SickKids.dll" mrn_id="995" image_class="Cytology" accession_class="Cytology"
	legacy_image_file_name="NERVE_FIBER_LAYER.jpg" patient_id="1003" anatomic_site="NERVE_FIBER_LAYER" restricted_flag="N"
	media_type_description="JPEG" storage_location_name="Default" color_depth="24" data_operation_id="0" storage_location_id="1"
	orientation="1" annotation_flag="Y" image_file_size="596574" sort_order="659871" org_id="1461" effective_rights="511" org_name="Cytology" />
</images>
```

# Lookups

`GET: http://dev-web/DataServices/lookups/<lookupType>`

Stored Procedure: <code>getLookupSet</code> OR <code>getLookupClassSet</code>

Purpose: Retrieve list of lookup codes based on <code>lookupType</code>

### Query Parameters

Parameter | Source
--------- | -------
lookupType | URL
accessionClass | UQP

> The above command returns XML structured like this:

```XML
<lookups>
    <lookup lookup_code="BM Acid Phosphatase" description="BM Acid Phosphatase" status="A" />
    <lookup lookup_code="BM BM Diff" description="BM BM Diff" status="A" />
    <lookup lookup_code="BM CSFDIFF" description="BM CSFDIFF" status="A" />
    <lookup lookup_code="BM NSE" description="BM NSE" status="A" />
    <lookup lookup_code="BM NSE+FL" description="BM NSE+FL" status="A" />
    <lookup lookup_code="BM PAS" description="BM PAS" status="A" />
    <lookup lookup_code="BM PB Diff" description="BM PB Differ" status="A" />
    <lookup lookup_code="BM Peroxidase" description="BM Peroxidase" status="A" />
    <lookup lookup_code="BM Prussian Blue" description="BM Prussian Blue" status="A" />
    <lookup lookup_code="BM Sudan Black" description="BM Sudan Black" status="A" />
    <lookup lookup_code="BM Wright" description="BM Wright" status="A" />
    <lookup lookup_code="BOSPHOROUS" description="Bosphoric Acetate" status="A" />
    <lookup lookup_code="EH ACE" description="EH ACE" status="A" />
    <lookup lookup_code="EH ACPH" description="EH ACPH" status="A" />
    <lookup lookup_code="EH ADA" description="EH ADA" status="A" />
    <lookup lookup_code="EH ALKPH" description="EH ALKPH" status="A" />
    <lookup lookup_code="EH ANAE" description="EH ANAE" status="A" />
    <lookup lookup_code="EH ATP43" description="EH ATP43" status="A" />
    <lookup lookup_code="EH ATP46" description="EH ATP46" status="A" />
    <lookup lookup_code="IP alpha beta Crystallin" description="IP alpha beta Crystallin" status="A" />
    <lookup lookup_code="IP Alpha-1-ACT" description="IP Alpha-1-ACT" status="A" />
    <lookup lookup_code="IP Alpha-1-AT" description="IP Alpha-1-AT" status="A" />
    <lookup lookup_code="IP Alpha-fetoprotein" description="IP Alpha-fetoprotein" status="A" />
    <lookup lookup_code="IP alpha-internexin" description="IP alpha-internexin" status="A" />
    <lookup lookup_code="IP Amylase" description="IP Amylase" status="A" />
    <lookup lookup_code="IP Antibody Titration" description="IP Antibody Titration" status="A" />
    <lookup lookup_code="IP B Catenin" description="IP B Catenin" status="A" />
    <lookup lookup_code="IP BAF47" description="IP BAF47" status="A" />
    <lookup lookup_code="IP B-Alzheimer PP" description="IP B-Alzheimer PP" status="A" />
    <lookup lookup_code="IP BAX" description="IP BAX" status="A" />
    <lookup lookup_code="IP bcl-10 oncogene" description="IP bcl-10 oncogene" status="A" />
    <lookup lookup_code="IP bcl-2 oncogene" description="IP bcl-2 oncogene" status="A" />
    <lookup lookup_code="IP bcl-6 oncogene" description="IP bcl-6 oncogene" status="A" />
    <lookup lookup_code="IP Thyroid transcription factor-1" description="IP Thyroid transcription factor-1" status="A" />
</lookups>
```

## Lookup Values
`GET: http://dev-web/DataServices/lookups/<lookupType>/<lookupCode>`

Stored Procedure: <code>getLookupValue</code>

### Query Parameters

Parameter | Source
--------- | -------
lookupType | URL
lookupCode | URL

>The above code returns XML structured like this:

```XML
<lookups>
    <lookup lookup_code="BOSPHOROUS" description="Bosphoric Acetate" status="A" />
</lookups>
```

## Lookup Types
`GET: http://dev-web/DataServices/lookuptypes/<lookupType>`

Stored Procedure: <code>getLookupType</code>

### Query Parameters

Parameter | Source
--------- | -------
lookupType | URL

>The above code returns XML structured like this:

```XML
<lookuptypes>
    <lookuptype description="Stain" user_maintainable="Y" status="A" />
</lookuptypes>
```
