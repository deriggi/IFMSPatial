IFMSPatial
==========

This is the repository for the web-mapping extension of the financial management system (IFMS). Installation of the .ASP may need to be done carefully if the site is not being recompiled


The folder structure matches that of the IFMS deployment so all the non asp files could simply be dropped in and merged with the deployed files

### Map Tiles

The map tiles serve as the zoomable and pannable baselayer for the parcel location. The map was built using TileMill and the data from the parcel and district layers for Mazar-e Sharif. They should be placed in the

[ maps tiles ] ( https://github.com/deriggi/IFMSPatial/tree/master/IFMS%20Web/GisMaps/mazar_bright)


### JSON Data

JSON files are called by the JavaScript from the [GisMapViewer] (https://github.com/deriggi/IFMSPatial/blob/master/IFMS%20Web/GisMapViewer.aspx) page. They contain some of the data displayed on the popup in the map. The other portion of the popup content is retrieved from the data base using the ASP SqlDataSource tag and parameters stored in the URL

[json files] (https://github.com/deriggi/IFMSPatial/tree/master/IFMS%20Web/GisMaps/json)




