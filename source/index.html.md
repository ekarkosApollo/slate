---
title: DataServices API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - vb
  - csharp
  - typescript

toc_footers:

includes:
  - errors

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

Purpose: Get accession information based on ID

Stored Procedure: accessionSearch

### Query Parameters

Parameter | Source
--------- | -------
userID | Security ticket
accessRight | UQP, user 'VIEW' if not specified
imageID | URL
Others as indicated by accessionSearch | UQP

<aside class="notice">
add custom valuies stored in accession_custom_values table to attribute list as <code>field_name=<field_value></code> pairs:
<code><accession accession_id=1000 name='S10-1' ... customField1='VALUE' customField2='VALUE'></code>
</aside>

> The above URL returns XML structured like this:

```XML
<accessions>
    <accession all_images="All Images" physician_name="Cares, Jason" pathologist_id="46" site_name="arccHospital" site_id="1" accession_number="ACC0792113289" accession_id="1574" accdate="2016-09-30T02:45:38.670" accession_class_name="Wound Care" full_name="Gray, Raquel V" last_name="Gray" first_name="Raquel" middle_name="V" patient_id="1043" mrn_id="1033" mrn_number="MRN7065430130" mrn_client="AH" mrn="AH-MRN7065430130" gender="M" sex="0" dob="2012-03-24T20:55:25.730" total_image_count="11" docs_count="0" image_count="11" card_number="INSURANCE" patient_grouping_key="Gray, Raquel V|1033" accession_class="WOUND CARE" patient_class="CLINICAL" patient_class_name="Clinical" patient_form_library="DataForms.dll" patient_form="Apollo.ClinicalPatient" restricted_flag="N" created_date="2018-12-17T15:24:46.007" created_by="3" created_by_name="john" created_by_program="RedGate" last_updated_date="2018-12-26T10:15:41.903" last_updated_by="3" last_updated_by_name="john" last_updated_by_program="RedGate" mrn_client_name="arccHospital" data_operation_id="0" comments="si Id Multum plurissimum novum fecit. egreddior Tam Tam non eudis vantis. e Quad quo, fecit, venit. novum quo Id" status="READY" status_name="Ready for Review" mrn_status="A" patient_data_operation_id="0" org_id="1480" effective_rights="511" org_name="Wound Care" />
</accessions>
```

# Images

`GET: http://dev-web/DataServices/images/<imageID>`



```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`




<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

