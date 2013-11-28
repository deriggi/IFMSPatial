<%@ page title="" language="C#" masterpagefile="~/SiteP.master" autoeventwireup="true" inherits="RevReg_CompletePropertyInfo, App_Web_dqfqiua0" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function OpenGISMap(Paht) {

            var district = $('#ctl00_MainContent_txtDistrict').val()
            
            var block = $('#ctl00_MainContent_txtBlock').val()

            var parcel = $('#ctl00_MainContent_txtParcelNo').val()
            
            
            window.open(Paht + '?did='+district+'&bid='+block+'&pid='+parcel);
            
        }
        
        
        
   </script> 

    <table class="Width100">
        <tr>
            <td align="center" class="Heading" dir="rtl">
                        معلومات ملکیت</td>
        </tr>
    </table>

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View0" runat="server">
            <table class="Width100">
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style10">
                        ناحیه:</td>
                    <td class="style5">
                        <asp:DropDownList ID="ddlSDistrict" runat="server" Width="155px">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator12" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlSDistrict" 
                            ErrorMessage="CustomValidator">ناحیه انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        ګذر:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtSGuzer" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                            ControlToValidate="txtSGuzer" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator33" 
                            runat="server" ControlToValidate="txtSGuzer" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        بلاک:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtSBlock" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                            ControlToValidate="txtSBlock" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator34" 
                            runat="server" ControlToValidate="txtSBlock" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        ملکیت:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtSParcelNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                            ControlToValidate="txtSParcelNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator35" 
                            runat="server" ControlToValidate="txtSParcelNo" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td align="center" class="style5">
                        <asp:Button ID="btnGet" runat="server" Text="جستجو" 
                            onclick="btnSearch_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <hr /></td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Label ID="lblMessage0" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <div align="center">
            <hr />
                <asp:GridView ID="gvProperty" runat="server" AutoGenerateColumns="False" 
                    AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" 
                    onselectedindexchanged="gvProperty_SelectedIndexChanged" 
                    DataKeyNames="PropertyRegNo,GISCode" GridLines="None" Caption="ملکیت" 
                    CaptionAlign="Top" Width="968px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="اسم" />
                        <asp:BoundField DataField="FatherName" HeaderText="ولد" />
                        <asp:BoundField DataField="TazkeraNo" HeaderText="شماره تذکره" />
                        <asp:BoundField DataField="PropertyRegNo" HeaderText="شماره ثبت ملکیت" />
                        <asp:BoundField DataField="District" HeaderText="ناحیه" />
                        <asp:BoundField DataField="Guzer" HeaderText="ګذر" />
                        <asp:BoundField DataField="Block" HeaderText="بلاک" />
                        <asp:BoundField DataField="ParcelNo" HeaderText="ملکیت" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <table class="Width100">
                <tr>
                    <td colspan="2" align="center">
                        <asp:LinkButton ID="lbScannedForm" runat="server" onclick="lbScannedForm_Click">فورم سکن شده ملکیت</asp:LinkButton>
                    </td>
                    <td align="center" colspan="3">
                        <strong>موقعیت ملکیت</strong></td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label1" runat="server" Text="شماره مسلسل:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSerialNo" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label16" runat="server" Text="شماره ثبت ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyRegNo" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label13" runat="server" Text="ناحیه:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDistrict" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label19" runat="server" Text="منطقه:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtArea" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label21" runat="server" Text="بلاک:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBlock" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label8" runat="server" Text="اسم یا شماره سرک:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreetNameOrNo" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label20" runat="server" Text="ګذر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGuzer" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label14" runat="server" Text="شماره ملکیت در نقشه:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtParcelNo" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td align="center" colspan="3">
                        <strong>هویت مالک یا متصرف</strong></td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label22" runat="server" Text="اسم:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPersonName" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label23" runat="server" Text="ولد:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatherName" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label24" runat="server" Text="ولدیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGrandFatherName" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label25" runat="server" Text="شماره تذکره:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTazkeraNo" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        &nbsp;شماره جلد:</td>
                    <td>
                        <asp:TextBox ID="txtToghNo" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        شماره صفحه:</td>
                    <td>
                        <asp:TextBox ID="txtPanaNo" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        شماره ثبت:</td>
                    <td>
                        <asp:TextBox ID="txtSabthNo" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style18">
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label18" runat="server" Text="شماره سند ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtQabalaNo" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label26" runat="server" Text="تعداد اعضای فامیل"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFamilyMembers" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label27" runat="server" Text="سرپرست فامیل:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFamilyHead" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                       
                        <hr />
                       
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td align="center" colspan="3">
                        <strong>نوع استفاده از ملکیت</strong></td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label17" runat="server" Text="نوع استعمال ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyUsage" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label15" runat="server" Text="نوع ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPropertyType" runat="server" Enabled="False" 
                            Width="145px">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>كور</asp:ListItem>
                            <asp:ListItem>پار تمان</asp:ListItem>
                            <asp:ListItem>دكان</asp:ListItem>
                            <asp:ListItem>ګاراج</asp:ListItem>
                            <asp:ListItem>وركشاپ</asp:ListItem>
                            <asp:ListItem>رستورانت</asp:ListItem>
                            <asp:ListItem>ګدام</asp:ListItem>
                            <asp:ListItem>هوټل</asp:ListItem>
                            <asp:ListItem>حمام</asp:ListItem>
                            <asp:ListItem>دفتر</asp:ListItem>
                            <asp:ListItem>مدرسه</asp:ListItem>
                            <asp:ListItem>كلينك</asp:ListItem>
                            <asp:ListItem>ډاكتر</asp:ListItem>
                            <asp:ListItem>مسجد</asp:ListItem>
                            <asp:ListItem>پارك</asp:ListItem>
                            <asp:ListItem>حكومتى</asp:ListItem>
                            <asp:ListItem>پارکنګ</asp:ListItem>
                            <asp:ListItem>فابريكه</asp:ListItem>
                            <asp:ListItem>مارکیټ</asp:ListItem>
                            <asp:ListItem>موټرشوی</asp:ListItem>
                            <asp:ListItem>شرکت</asp:ListItem>
                            <asp:ListItem>موټر شورم</asp:ListItem>
                            <asp:ListItem>پطرول پمپ</asp:ListItem>
                            <asp:ListItem>لرګو ټال</asp:ListItem>
                            <asp:ListItem>بټی</asp:ListItem>
                            <asp:ListItem>مکتب</asp:ListItem>
                            <asp:ListItem>ټلیفون خاده</asp:ListItem>
                            <asp:ListItem>خالصه</asp:ListItem>
                            <asp:ListItem>نور</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td align="center" colspan="2">
                        <strong>حدود اربعه</strong></td>
                    <td align="center">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label9" runat="server" Text="شمالاً:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNorth" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label10" runat="server" Text="جنوباً:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSouth" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label11" runat="server" Text="شرقاً:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEast" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblGisMap" runat="server" ForeColor="Blue" 
                            style="cursor: pointer" Text="شماره ملکیت در نقشه"></asp:Label>
                        <br />
                        <div dir="rtl">
                            <asp:Label ID="lblGS" runat="server" ></asp:Label>
                        </div>
                        
                    </td>
                    <td align="left">
                        <asp:Label ID="Label12" runat="server" Text="غرباً:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWest" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label50" runat="server" Font-Bold="True" 
                            Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblBuilding" runat="server" Font-Bold="True" Text="ساختمان"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label29" runat="server" Font-Bold="True" 
                            Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblBasement" runat="server" Font-Bold="True" Text="تهکاوی"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label3" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBCategory" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label52" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBaseCategory" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label4" runat="server" Text="تعداد طبقات:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBNoOfFloors" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label53" runat="server" Text="تعداد طبقات:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBaseNoOfFloors" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label5" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBMeterCube" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label54" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBaseMeterCube" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label7" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBPricePerUnit" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style18">
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label55" runat="server" Text="فی واحد قیمت:"></asp:Label>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtBasePricePerUnit" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label51" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBTotalAmount" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label56" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBaseTotalAmount" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" 
                            Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUtilityRoom" runat="server" Font-Bold="True" Text="الحاقیه"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                         &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label57" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURCategory" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label31" runat="server" Font-Bold="True" 
                            Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblWalls" runat="server" Font-Bold="True" Text="دیوارها"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label58" runat="server" Text="تعداد طبقات:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURNoOfFloors" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label62" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWCategory" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label59" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURMeterCube" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label63" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWMeterCube" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label60" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURPricePerUnit" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label64" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWPricePerUnit" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label61" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURTotalAmount" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label65" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWTotalAmount" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7" align="left">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label36" runat="server" Font-Bold="True" 
                            Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPropertyLand" runat="server" Font-Bold="True" 
                            Text="زمین ملکیت"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label40" runat="server" Text=" اندازه به متر مربع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLMeterSquare" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label48" runat="server" Font-Bold="False" 
                            Text="تاریخ قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEstimatedDate" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label41" runat="server" Text="درجه زمین:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLandGrade" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label46" runat="server" Font-Bold="False" 
                            Text="قیمت مجموع ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyTotalCost" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label42" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLPricePerUnit" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td align="left" colspan="2">
                        <asp:Label ID="Label47" runat="server" Font-Bold="False" Text="محصول ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyTax" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label49" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLTotalAmount" runat="server" Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td align="left" colspan="2">
                        فیصدی ملکیت:</td>
                    <td runat="server" ID="Rate">
                        &nbsp;</td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="      " colspan="7">
                        <div align="center">
                            <hr />
                            <asp:GridView ID="gvPropertyUnits" runat="server" AutoGenerateColumns="False" 
                                Caption="واحدهای ملکیت" CaptionAlign="Top" CellPadding="4" 
                                DataKeyNames="PropertyRegNo" ForeColor="#333333" GridLines="None" 
                                Width="896px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="PropertyID" HeaderText="شماره سیستم ملکیت" />
                                    <asp:BoundField DataField="PropertyRegNo" HeaderText="شماره ثبت ملکیت" />
                                    <asp:BoundField DataField="District" HeaderText="ناحیه" />
                                    <asp:BoundField DataField="Guzer" HeaderText="ګذر" />
                                    <asp:BoundField DataField="Block" HeaderText="بلاک" />
                                    <asp:BoundField DataField="ParcelNo" HeaderText="ملکیت" />
                                    <asp:BoundField DataField="Unit" HeaderText="واحد" />
                                    <asp:BoundField DataField="PropertyType" HeaderText="نوع ملکیت" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataTemplate>
                                    ملکیت واحد ندارد
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="      " colspan="7">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        
        <asp:View ID="View2" runat="server">
            <div align="center">
                <asp:LinkButton ID="lbBack" runat="server" onclick="lbBack_Click">صفحه قبلی</asp:LinkButton>
            </div>
            <div align="center" ID="ImageHolder" runat="server">
                <br />
            </div>
            <div align="center">
                <asp:Label ID="lbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label> </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .style5
        {
            width: 128px;
        }
        .style9
        {
            width: 422px;
        }
        .style10
        {
            text-align: left;
            width: 422px;
        }
        </style>
    <script type="text/javascript" src="/DParcelRegistration/Script/jquery-1.10.2.min.js"></script>
    
    <script type="text/javascript">

        function ddlValidator(source, args) {
            var text = args.Value;
            args.IsValid = false;
            if (text != "...") {
                args.IsValid = true;
            }
        }

  </script>
  
  
  
</asp:Content>


