# CNH MES Materials API
This is a custom API that allows programmatic access to some of the information in the MES process, like Item/Serial BOMs and completion status.

MES - Manufacturing Execution System

## Use Case
This API was developed for Ujigami to use to display Current Materials for a specific job in their system and for them to mark complete MES task. It could also be used as an easy endpoint to view all the materials in the Current BOM of an already-built item.

# Technical Documentation
This is an ASP.NET Core Web API project that leverages Entity Framework (a Microsoft ORM tool) to query against the SyteLine ERP database. Besides the API, there are a few other customizations made to SyteLine for this project:

## SyteLine Customization List 
### IDOs
- **CNH_InternalAPIAuths** - This IDO provides access to the CNH_InternalAPIAuths table, which stores Role Descriptions, as well as the hash of the API key and the salt for producing it.

- **CNH_APIAuthsMaps** - This IDO provides access to the CNH_APIKeyApplicationMap table, which maps the RowPointer of the hash in the other table to a human-readable description of the application a key is authorized to.

### UETs
- **Uf_CNH_MESCompleteDate** - This UET is on the CNH_Jobs class, and the job_mst table. It is for the date that Ujigami marks the MES process for a job complete.
- **Uf_CNH_MESDisplayGroup** - This UET is on the CNH_CurrentMaterials class and the jobmatl_mst table. It is to help Ujigami group materials in their system.

### Forms
- **CNH_InternalAPIManagement** - This form allows for the management and generation of API keys. On the left side grid is a list of roles and in the middle grid is a list of applications that role is authorized for. There is a button allowing users to generate a new key. Once that key is generated, it can not be accessed again, so it's smart to save it immediately after generation. 

### Custom Assemblies
- **CNHReman.SyteLine.CNH_APIKeyGeneration** - This assembly backs the aforementioned form and allows us to generate and upload new API keys to the relevant tables.

### Views 
- **CNH_UjigamiMaterialsVw** - This view joins serials, job materials, and current materials to allow us to see current materials pertaining to a given item number and serial number.

### Tables
- **CNH_InternalAPIAuth** - This table holds an encrypted API key (hash) and a description of the role for which the key is used.

- **CNH_APIKeyApplicationMap** - This table maps the RowPointer from the aforementioned table to a human-readable application name for which it authorizes access.

### Stored Procedures
- **CNH_MESMarkComplete** - This procedure, given an item and serial number, marks the Uf_CNH_CompleteDate for the job.

## Purple SyteLine Customization List 
These customizations are Site-level on a Vendor form
- **CNH_Uf_MESDisplayGroupGridCol** - This column on the main grid of _Current Materials_ provides access to the custom UET that Ujigami uses to group materials.
- **CNH_Uf_MESCompleteDateGridCol** - This column on the main grid of _Job Orders_ provides access to the custom UET that stores the date Ujigami marked the MES process complete
- **CNH_Uf_MESCompleteDateEdit** - This field below the S/N on _Job Orders_ provides a UI to view the UET that Ujigami uses to mark the MES process as complete.
- - **CNH_Uf_MESDisplayGroupEdit** - This field below Equivalent Code on _Current Materials_ provides a UI to manipulate the UET that Ujigami uses to group materials.

