<%@ page language="C#" autoeventwireup="true" inherits="GisMapViewer, App_Web_aahk2djl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <link rel="stylesheet" href="Style/leaflet.css" />
        <!--[if lte IE 8]>
            <link rel="stylesheet" href="Styele/leaflet_ie.css" />
        <![endif]-->


        <script src="Script/leaflet-0.6.4.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 0px auto"> 
            <br />
            <div id='mapblock' style=" display:none; margin : 0px auto; width: 800px; background-color: #EFEFEF;" align="center">
                
                <asp:Repeater ID="propertytabledata" runat="server" DataSourceID="PropertyDataSource">
                    <ItemTemplate>
                      <table id='proptable'>
                            
                        
                        <tr>
                          <td >
                            Property Type
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdptype" 
                                  text='<%# Eval("PropertyType") %>' />
                          </td>

                        </tr>

                        <tr>
                          <td >
                            Property Usage
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdpusage" 
                                  text='<%# Eval("PropertyUsage") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            QabalaNo
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdqabalano" 
                                  text='<%# Eval("QabalaNo") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            District
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tddistrict" 
                                  text='<%# Eval("District") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            Area:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdarea" 
                                  text='<%# Eval("Area") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            Guzer:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdguzer" 
                                  text='<%# Eval("Guzer") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            Block:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdblock" 
                                  text='<%# Eval("Block") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            Parcel:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdpercelno" 
                                  text='<%# Eval("ParcelNo") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            North Side:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdnorthside" 
                                  text='<%# Eval("NorthSide") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            South Side:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdsouthside" 
                                  text='<%# Eval("SouthSide") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            East Side:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdeastside" 
                                  text='<%# Eval("EastSide") %>' />
                          </td>
                        </tr>

                        <tr>  
                          <td >
                            West Side:
                          </td>
                          <td >
                              <asp:Label runat="server" ID="tdwestside" 
                                  text='<%# Eval("WestSide") %>' />
                          </td>
                        </tr>


                        
                    
                      </table>
                    </ItemTemplate>
                </asp:Repeater>


                <asp:ListBox
                    id="ListBox1"
                    runat="server"
                    DataTextField="Guzer"
                    DataSourceID="PropertyDataSource">
                </asp:ListBox>
                <asp:TextBox ID="txtSParcelNo" runat="server"></asp:TextBox>
                
                <asp:Label ID="lblHouse" runat="server"  Font-Bold="True"  Font-Size="Large">
                    <%= Request.QueryString["pid"] %>
                </asp:Label>
                
                <asp:SqlDataSource ID="PropertyDataSource" 
                    SelectCommand="SELECT PropertyType, PropertyUsage, QabalaNo, District ,Area, Guzer, Block, StreetNameOrNo, 
                        ParcelNo, NorthSide, SouthSide, EastSide, WestSide, InsertedDate, Unit FROM [IFMSDB].[dbo].[Property] 
                        where District = @did and Block = @bid and ParcelNo = @pid"
                    
                    EnableCaching="True"
                    CacheDuration="60"
                    ConnectionString="<%$ ConnectionStrings:IFMSDBConnectionString %>"
                    
                    RunAt="server" >
                    
                    <SelectParameters>
                        <asp:QueryStringParameter Name="did" QueryStringField="did" />
                        <asp:QueryStringParameter Name="bid" QueryStringField="bid" />
                        <asp:QueryStringParameter Name="pid" QueryStringField="pid" />
                    </SelectParameters>

                </asp:SqlDataSource>

                <asp:Label ID="lblMessage" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </div>
            <div id="map" style=" left: 0; width: 100%; height: 800px;"></div>
            
         
        </div>
    </form>

     <script type="text/javascript" src="/DParcelRegistration/Script/jquery-1.10.2.min.js"></script>
     
         <script type="text/javascript">
            var map;


             $(document).ready(function() {
               
                setupMap();
                 
             });


             function getTestImage(){
                 var urlParts = document.URL.split('?')
                var imageurl = urlParts[1] + '.png'
                var firstPart = urlParts[0]
                var imagesPath = firstPart.substring(0,firstPart.lastIndexOf('/') + 1) + 'GisMaps/' + imageurl
                
                                       
                var imageTag = "<img src='"+ imagesPath + "'/>";
                
                var mb = $('#mapblock');
                if (mb) {
                    mb.append(imageTag);
                }

               //getTestData();
                setupMap();

                var id = '<%= Request.QueryString["pid"] %>'

             }
             function getTestData(){
                    alert('receinving data')
                    
                    $.ajax({
                        type: "GET",
                        url: "/DParcelRegistration/GisMaps/json/dogs.json",
                       
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(msg) {
                            alert(msg.numdogs)
                        }
                    });

             }

             function showPopup(location, content){
                
                var popup = L.popup({closeOnClick:false})
                            .setLatLng(location)
                            .setContent(content);
                
                popup.openOn(map);

             }


            /**==============================================
            *       get the center point of the parcel
            **===========================================*/
             function getThings(district, block, parcel){
                    var centroid, parcel;

                    $.ajax({
                        type: "GET",
                        url: "/DParcelRegistration/GisMaps/json/" + district + "_" + block + ".json",
                       
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(data) {

                            for(var parcelIndex in data){
                                       
                                if ( data[parcelIndex].properties.Parcel_ID  == parcel){
                                    var parcelid = data[parcelIndex].properties.Parcel_ID;
                                    
                                    // add the marker and break
                                    centroid = [data[parcelIndex].centroid[1], data[parcelIndex].centroid[0]]
                                    showPopup(centroid, $('<div>').append($('#proptable').clone()).html() );
                                    break;

                                }

                            }

                        }
                    });

             }


            function gup( name ){
                name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
                var regexS = "[\\?&]"+name+"=([^&#]*)";
                var regex = new RegExp( regexS );
                var results = regex.exec( window.location.href );
                if( results == null )
                    return "";
                else
                    return results[1];
            }



             function setupMap(){
                var sw = new L.LatLng(-80, -180);
                var ne = new L.LatLng(80, 170);

                map = new L.Map('map', {
                    center: new L.LatLng(36.70719087182492, 67.11739709573688),
                    zoom: 14,
                    minZoom: 4,
                    maxZoom: 18,
                    layers: new L.TileLayer('/DParcelRegistration/GisMaps/mazar_bright/{z}/{x}/{y}.png'),
    //                layers: new L.TileLayer('http://{s}.tiles.mapbox.com/v3/johnderiggi.g8idhajj/{z}/{x}/{y}.png'),
    //                layers: new L.TileLayer('http://{s}.tiles.mapbox.com/v3/johnderiggi.map-pcso5skt/{z}/{x}/{y}.png'),
                    maxBounds: [[-82, -180], [82, 180]]

                            //layers: new L.TileLayer('http://{s}.tiles.mapbox.com/v3/deriggi.map-g7ztumv6/{z}/{x}/{y}.png')
                            //http://a.tiles.mapbox.com/v3/johnderiggi.map-pcso5skt/page.html

                });

                var did = gup("did");
                var bid = gup("bid");
                var pid = gup("pid");

                getThings(did, bid, pid);

             }
                
        </script>

        
    </body>
</html>
