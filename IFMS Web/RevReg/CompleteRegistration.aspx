<%@ page title="" language="C#" masterpagefile="~/SiteP.master" autoeventwireup="true" inherits="RevReg_CompleteRegistration, App_Web_t4rqv1ug" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
       function ZeroIndex(ID, IDs) {
           var vr = document.getElementById(ID).value;
           if (vr == 0 || vr == "...") {
               var arr = IDs.split(",");
               var ab;
               var cb = arr.length;
               for (cn = 0; cn <= arr.length; cn++) {
                   //ab = "'<" + "%" + "=" + arr[cn] + ".ClientID" + "%" + ">'";
                   document.getElementById(arr[cn]).value = "0";
                   //alert(ab);
               }
           }
       }
       function SelectRate(Rat) {
           document.getElementById('Rate').innerHTML = Rat;
       }
       function Calculation() {
           var cal = 0;
           var vl = 0;
           var BMC = document.getElementById("<%=txtBMeterCube.ClientID %>").value;
           var BC = document.getElementById("<%=ddlBCategory.ClientID %>").value;
           document.getElementById("<%=txtBTotalAmount.ClientID %>").value = isNaN((BMC * BC)) ? "0" : Math.round((BMC * BC));
           document.getElementById("<%=txtBPricePerUnit.ClientID %>").value = BC;

           var BsMC = document.getElementById("<%=txtBaseMeterCube.ClientID %>").value;
           var BsC = document.getElementById("<%=ddlBaseCategory.ClientID %>").value;
           document.getElementById("<%=txtBaseTotalAmount.ClientID %>").value = isNaN((BsMC * BsC)) ? "0" : Math.round((BsMC * BsC));
           document.getElementById("<%=txtBasePricePerUnit.ClientID %>").value = BsC;

           var URMC = document.getElementById("<%=txtURMeterCube.ClientID %>").value;
           var URC = document.getElementById("<%=ddlURCategory.ClientID %>").value;
           document.getElementById("<%=txtURTotalAmount.ClientID %>").value = isNaN((URMC * URC)) ? "0" : Math.round((URMC * URC));
           document.getElementById("<%=txtURPricePerUnit.ClientID %>").value = URC;

           var WMC = document.getElementById("<%=txtWMeterCube.ClientID %>").value;
           var WC = document.getElementById("<%=ddlWCategory.ClientID %>").value;
           document.getElementById("<%=txtWTotalAmount.ClientID %>").value = isNaN((WMC * WC)) ? "0" : Math.round((WMC * WC));
           document.getElementById("<%=txtWPricePerUnit.ClientID %>").value = WC;

           var LMS = document.getElementById("<%=txtLMeterSquare.ClientID %>").value;
           var LG = document.getElementById("<%=ddlLandGrade.ClientID %>").value;

           document.getElementById("<%=txtLTotalAmount.ClientID %>").value = isNaN((LMS * LG)) ? "0" : Math.round((LMS * LG));
           document.getElementById("<%=txtLPricePerUnit.ClientID %>").value = LG;
           var PCOST = 0;
           var PTAX = 0;
           var PT = document.getElementById("<%=ddlPropertyType.ClientID %>").value.match(/\d+./g);
           PT = PT.join("");
           PCOST = (BsMC * BsC) + (BMC * BC) + (LMS * LG) + (URMC * URC) + (WMC * WC);
           PTAX = (PT * PCOST);

           document.getElementById("<%=txtPropertyTotalCost.ClientID %>").value = isNaN(PCOST) ? "0" : Math.round(PCOST);
           document.getElementById("<%=txtPropertyTax.ClientID %>").value = isNaN(PTAX) ? "0" : Math.round(PTAX);
       }
   </script>
    <table class="Width100">
        <tr>
            <td class="Heading" dir="rtl">
                ثبت ملکیت</td>
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table class="Width100">
                <tr>
                    <td align="center" colspan="6" style="color: #FF0000; text-decoration: blink;">
                        <asp:Label ID="lblDublicate" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <strong>موقعیت ملکیت</strong></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label1" runat="server" Text="شماره مسلسل:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtSerialNo" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                            ControlToValidate="txtSerialNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator33" 
                            runat="server" ControlToValidate="txtSerialNo" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label16" runat="server" Text="شماره ثبت ملکیت:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtPropertyRegNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                            ControlToValidate="txtPropertyRegNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator34" 
                            runat="server" ControlToValidate="txtPropertyRegNo" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label13" runat="server" Text="ناحیه:"></asp:Label>
                    </td>
                    
                    <td class="style6">
                    <span> this is where the district is</span>
                        <asp:DropDownList ID="ddlDistrict" runat="server">
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
                    <td class="style7">
                        <asp:CustomValidator ID="CustomValidator2" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlDistrict" 
                            ErrorMessage="CustomValidator">ناحیه انتخاب نمایید!</asp:CustomValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label19" runat="server" Text="منطقه:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtArea" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                            ControlToValidate="txtArea" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label21" runat="server" Text="بلاک:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtBlock" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtBlock" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="txtBlock" ErrorMessage="RegularExpressionValidator" 
                            ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label8" runat="server" Text="اسم یا شماره سرک:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtStreetNameOrNo" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtStreetNameOrNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label20" runat="server" Text="ګذر:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtGuzer" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtGuzer" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="txtGuzer" ErrorMessage="RegularExpressionValidator" 
                            ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label14" runat="server" Text="شماره ملکیت در نقشه:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtParcelNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                            ControlToValidate="txtParcelNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator35" 
                            runat="server" ControlToValidate="txtParcelNo" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <strong>هویت مالک یا متصرف</strong></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label22" runat="server" Text="اسم:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtPersonName" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                            ControlToValidate="txtPersonName" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label23" runat="server" Text="ولد:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtFatherName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                            ControlToValidate="txtFatherName" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label24" runat="server" Text="ولدیت:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtGrandFatherName" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                            ControlToValidate="txtGrandFatherName" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label25" runat="server" Text="شماره تذکره:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtTazkeraNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                            ControlToValidate="txtTazkeraNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                            ControlToValidate="txtTazkeraNo" ErrorMessage="RegularExpressionValidator" 
                            ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        &nbsp;شماره جلد:</td>
                    <td class="style6">
                        <asp:TextBox ID="txtToghNo" runat="server">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtToghNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style5">
                        شماره صفحه:</td>
                    <td class="style8">
                        <asp:TextBox ID="txtPanaNo" runat="server">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtPanaNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtPanaNo" ErrorMessage="RegularExpressionValidator" 
                            ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        شماره ثبت:</td>
                    <td class="style6">
                        <asp:TextBox ID="txtSabthNo" runat="server">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                            ControlToValidate="txtSabthNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtSabthNo" ErrorMessage="RegularExpressionValidator" 
                            ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label18" runat="server" Text="شماره سند ملکیت:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtQabalaNo" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                            ControlToValidate="txtQabalaNo" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label26" runat="server" Text="تعداد اعضای فامیل:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtFamilyMembers" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                            ControlToValidate="txtFamilyMembers" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator36" 
                            runat="server" ControlToValidate="txtFamilyMembers" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label27" runat="server" Text="سرپرست فامیل:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtFamilyHead" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                            ControlToValidate="txtFamilyHead" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td align="center">
                        &nbsp;</td>
                    <td align="center">
                        &nbsp;</td>
                    <td align="center" colspan="2">
                        <strong>نوع  استفاده از ملکیت</strong></td>
                    <td align="center">
                        &nbsp;</td>
                    <td align="center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label17" runat="server" Text="نوع استعمال ملکیت:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="ddlPropertyUsage" runat="server">
                            <asp:ListItem Selected="True">...</asp:ListItem>
                            <asp:ListItem>مالک</asp:ListItem>
                            <asp:ListItem>کرایه دار</asp:ListItem>
                            <asp:ListItem>اجاره دار</asp:ListItem>
                            <asp:ListItem>ګروي</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style7">
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlPropertyUsage" 
                            ErrorMessage="CustomValidator">نوع استعمال ملکیت انتخاب نمایید!</asp:CustomValidator>
                        <br />
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label15" runat="server" Text="نوع ملکیت:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:DropDownList ID="ddlPropertyType" runat="server"
                         AutoPostBack="True" 
                            onselectedindexchanged="ddlPropertyType_SelectedIndexChanged">
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
                        <asp:CustomValidator ID="CustomValidator3" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlPropertyType" 
                            ErrorMessage="CustomValidator">نوع ملکیت انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <strong>حدود اربعه</strong></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label9" runat="server" Text="شمالاً:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtNorth" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtNorth" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label10" runat="server" Text="جنوباً:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtSouth" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="txtSouth" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label11" runat="server" Text="شرقاً:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtEast" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="txtEast" ErrorMessage="RequiredFieldValidator">باید تکمیل شود! </asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label12" runat="server" Text="غرباً:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtWest" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="txtWest" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label84" runat="server" Font-Bold="True" Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="lblBuilding" runat="server" Font-Bold="True" Text="ساختمان"></asp:Label>
                    </td>
                    <td class="style7">
                        &nbsp;</td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label83" runat="server" Font-Bold="True" Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:Label ID="lblBasement" runat="server" Font-Bold="True" Text="تهکاوی"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label3" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="ddlBCategory" runat="server" 
                        onchange="Calculation(), ZeroIndex(this.id, 'ctl00_MainContent_txtBNoOfFloors,ctl00_MainContent_txtBMeterCube,ctl00_MainContent_txtBPricePerUnit,ctl00_MainContent_txtBTotalAmount')">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>خامه</asp:ListItem>
                            <asp:ListItem>نیمه پوخ</asp:ListItem>
                            <asp:ListItem>پوخ</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style7">
                        <asp:CustomValidator ID="CustomValidator9" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlBCategory" 
                            ErrorMessage="CustomValidator">یک کتګوری انتخاب نمایید!</asp:CustomValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label52" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:DropDownList ID="ddlBaseCategory" runat="server" 
                           onchange="Calculation(),ZeroIndex(this.id, 'ctl00_MainContent_txtBaseNoOfFloors,ctl00_MainContent_txtBaseMeterCube,ctl00_MainContent_txtBasePricePerUnit,ctl00_MainContent_txtBaseTotalAmount')">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>نشته</asp:ListItem>
                            <asp:ListItem>خامه</asp:ListItem>
                            <asp:ListItem>نیمه پوخ</asp:ListItem>
                            <asp:ListItem>پوخ</asp:ListItem>
                            <asp:ListItem>اعلی پوخ</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator10" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlBaseCategory" 
                            ErrorMessage="CustomValidator">یک کتګوری انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label4" runat="server" Text="تعداد طبقات:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtBNoOfFloors" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtBNoOfFloors" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator25" 
                            runat="server" ControlToValidate="txtBNoOfFloors" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label53" runat="server" Text="تعداد طبقات:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtBaseNoOfFloors" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                            ControlToValidate="txtBaseNoOfFloors" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator29" 
                            runat="server" ControlToValidate="txtBaseNoOfFloors" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label5" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtBMeterCube" runat="server" onKeyUp="Calculation()"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtBMeterCube" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator26" 
                            runat="server" ControlToValidate="txtBMeterCube" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label54" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtBaseMeterCube" runat="server" onKeyUp="Calculation()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                            ControlToValidate="txtBaseMeterCube" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator30" 
                            runat="server" ControlToValidate="txtBaseMeterCube" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label7" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBPricePerUnit" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator27" 
                            runat="server" ControlToValidate="txtBPricePerUnit" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtBPricePerUnit" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label55" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBasePricePerUnit" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                            ControlToValidate="txtBasePricePerUnit" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator31" 
                            runat="server" ControlToValidate="txtBasePricePerUnit" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label51" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBTotalAmount" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtBTotalAmount" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator28" 
                            runat="server" ControlToValidate="txtBTotalAmount" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label56" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBaseTotalAmount" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                            ControlToValidate="txtBaseTotalAmount" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator32" 
                            runat="server" ControlToValidate="txtBaseTotalAmount" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label85" runat="server" Font-Bold="True" Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="lblUtilityRoom" runat="server" Font-Bold="True" Text="الحاقیه"></asp:Label>
                    </td>
                    <td class="style7">
                        &nbsp;</td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label82" runat="server" Font-Bold="True" Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:Label ID="lblWalls" runat="server" Font-Bold="True" Text="دیوارها"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label57" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="ddlURCategory" runat="server"
                        onchange="Calculation(), ZeroIndex(this.id, 'ctl00_MainContent_txtURNoOfFloors,ctl00_MainContent_txtURMeterCube,ctl00_MainContent_txtURPricePerUnit,ctl00_MainContent_txtURTotalAmount')">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>نشته</asp:ListItem>
                            <asp:ListItem>خامه</asp:ListItem>
                            <asp:ListItem>نیمه پوخ</asp:ListItem>
                            <asp:ListItem>پوخ</asp:ListItem>
                            <asp:ListItem>اعلی پوخ</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style7">
                        <asp:CustomValidator ID="CustomValidator11" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlURCategory" 
                            ErrorMessage="CustomValidator">یک کتګوری انتخاب نمایید!</asp:CustomValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label62" runat="server" Text="کټګوری:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:DropDownList ID="ddlWCategory" runat="server"
                        onchange="Calculation(), ZeroIndex(this.id, 'ctl00_MainContent_txtWMeterCube,ctl00_MainContent_txtWPricePerUnit,ctl00_MainContent_txtWTotalAmount')">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>نشته</asp:ListItem>
                            <asp:ListItem>خامه</asp:ListItem>
                            <asp:ListItem>نیمه پوخ</asp:ListItem>
                            <asp:ListItem>پوخ</asp:ListItem>
                            <asp:ListItem>اعلی پوخ</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator4" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlWCategory" 
                            ErrorMessage="CustomValidator">یک کتګوری انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label58" runat="server" Text="تعداد طبقات:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtURNoOfFloors" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                            ControlToValidate="txtURNoOfFloors" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" 
                            runat="server" ControlToValidate="txtURNoOfFloors" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label63" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtWMeterCube" runat="server" onKeyUp="Calculation()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                            ControlToValidate="txtWMeterCube" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                            runat="server" ControlToValidate="txtWMeterCube" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label59" runat="server" Text="اندازه به متر مکعب:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtURMeterCube" runat="server" onKeyUp="Calculation()"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                            ControlToValidate="txtURMeterCube" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                            runat="server" ControlToValidate="txtURMeterCube" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label64" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWPricePerUnit" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                            ControlToValidate="txtWPricePerUnit" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                            runat="server" ControlToValidate="txtWPricePerUnit" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label60" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURPricePerUnit" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                            ControlToValidate="txtURPricePerUnit" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" 
                            runat="server" ControlToValidate="txtURPricePerUnit" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label65" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWTotalAmount" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                            ControlToValidate="txtWTotalAmount" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator19" 
                            runat="server" ControlToValidate="txtWTotalAmount" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label61" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURTotalAmount" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                            ControlToValidate="txtURTotalAmount" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" 
                            runat="server" ControlToValidate="txtURTotalAmount" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        &nbsp;</td>
                    <td class="style8">
                        &nbsp;</td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label86" runat="server" Font-Bold="True" Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="lblPropertyLand" runat="server" Font-Bold="True" 
                            Text="زمین"></asp:Label>
                    </td>
                    <td class="style7">
                        &nbsp;</td>
                    <td align="left" class="style5">
                        <strong>تاریخ</strong></td>
                    <td class="style8">
                        <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="قیمت ګذاری ملکیت"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label40" runat="server" Text=" اندازه به متر مربع:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="txtLMeterSquare" runat="server" onKeyUp="Calculation()"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                            ControlToValidate="txtLMeterSquare" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator20" 
                            runat="server" ControlToValidate="txtLMeterSquare" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        روز:</td>
                    <td class="style8">
                        <asp:DropDownList ID="ddlDay" runat="server">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            <asp:ListItem Value="13"></asp:ListItem>
                            <asp:ListItem Value="14"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="16"></asp:ListItem>
                            <asp:ListItem Value="17"></asp:ListItem>
                            <asp:ListItem Value="18"></asp:ListItem>
                            <asp:ListItem Value="19"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="21"></asp:ListItem>
                            <asp:ListItem Value="22"></asp:ListItem>
                            <asp:ListItem Value="23"></asp:ListItem>
                            <asp:ListItem Value="24"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                            <asp:ListItem Value="26"></asp:ListItem>
                            <asp:ListItem Value="27"></asp:ListItem>
                            <asp:ListItem Value="28"></asp:ListItem>
                            <asp:ListItem Value="29"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="31"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator6" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlDay" 
                            ErrorMessage="CustomValidator">روز انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label41" runat="server" Text="درجه زمین:"></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="ddlLandGrade" runat="server" onchange="Calculation(), ZeroIndex(this.id, 'ctl00_MainContent_txtLPricePerUnit')">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style7">
                        <asp:CustomValidator ID="CustomValidator5" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlLandGrade" 
                            ErrorMessage="CustomValidator">درجه زمین انتخاب نمایید!</asp:CustomValidator>
                    </td>
                    <td align="left" class="style5">
                        ماه:</td>
                    <td class="style8">
                        <asp:DropDownList ID="ddlMonth" runat="server">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator7" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlMonth" 
                            ErrorMessage="CustomValidator">ماه انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label42" runat="server" Text="فی واحد قیمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLPricePerUnit" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                            ControlToValidate="txtLPricePerUnit" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator21" 
                            runat="server" ControlToValidate="txtLPricePerUnit" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        سال:</td>
                    <td class="style8">
                        <asp:DropDownList ID="ddlYear" runat="server">
                            <asp:ListItem>...</asp:ListItem>
                            <asp:ListItem>1388</asp:ListItem>
                            <asp:ListItem>1389</asp:ListItem>
                            <asp:ListItem Value="3">1390</asp:ListItem>
                            <asp:ListItem Value="4">1391</asp:ListItem>
                            <asp:ListItem Value="5">1392</asp:ListItem>
                            <asp:ListItem Value="6">1393</asp:ListItem>
                            <asp:ListItem Value="7">1394</asp:ListItem>
                            <asp:ListItem Value="8">1395</asp:ListItem>
                            <asp:ListItem Value="9">1396</asp:ListItem>
                            <asp:ListItem Value="10">1397</asp:ListItem>
                            <asp:ListItem Value="11">1398</asp:ListItem>
                            <asp:ListItem Value="12">1399</asp:ListItem>
                            <asp:ListItem Value="13">1400</asp:ListItem>
                            <asp:ListItem Value="14">1401</asp:ListItem>
                            <asp:ListItem Value="15">1402</asp:ListItem>
                            <asp:ListItem Value="16">1403</asp:ListItem>
                            <asp:ListItem Value="17">1404</asp:ListItem>
                            <asp:ListItem Value="18">1405</asp:ListItem>
                            <asp:ListItem Value="19">1406</asp:ListItem>
                            <asp:ListItem Value="20">1407</asp:ListItem>
                            <asp:ListItem Value="21">1408</asp:ListItem>
                            <asp:ListItem Value="22">1409</asp:ListItem>
                            <asp:ListItem Value="23">1410</asp:ListItem>
                            <asp:ListItem Value="24">1411</asp:ListItem>
                            <asp:ListItem Value="25">1412</asp:ListItem>
                            <asp:ListItem Value="26">1413</asp:ListItem>
                            <asp:ListItem Value="27">1414</asp:ListItem>
                            <asp:ListItem Value="28">1415</asp:ListItem>
                            <asp:ListItem Value="29">1416</asp:ListItem>
                            <asp:ListItem Value="30">1417</asp:ListItem>
                            <asp:ListItem Value="31">1418</asp:ListItem>
                            <asp:ListItem>1419</asp:ListItem>
                            <asp:ListItem>1420</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator8" runat="server" 
                            ClientValidationFunction="ddlValidator" ControlToValidate="ddlYear" 
                            ErrorMessage="CustomValidator">سال انتخاب نمایید!</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label49" runat="server" Text="قیمت مجموع:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLTotalAmount" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" 
                            ControlToValidate="txtLTotalAmount" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator22" 
                            runat="server" ControlToValidate="txtLTotalAmount" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        &nbsp;</td>
                    <td class="style8">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        <asp:Label ID="Label46" runat="server" Font-Bold="False" 
                            Text="قیمت مجموع ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyTotalCost" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                            ControlToValidate="txtPropertyTotalCost" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator23" 
                            runat="server" ControlToValidate="txtPropertyTotalCost" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                    <td align="left" class="style5">
                        <asp:Label ID="Label47" runat="server" Font-Bold="False" Text="محصول ملکیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyTax" runat="server" onKeyUp="Calculation()" 
                            Enabled="False">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                            ControlToValidate="txtPropertyTax" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator37" 
                            runat="server" ControlToValidate="txtPropertyTax" 
                            ErrorMessage="RegularExpressionValidator" ValidationExpression="^\d*\.?\d*$">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="RightAlign">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style7">
                        <br />
                    </td>
                    <td align="left" class="style5">
                        فیصدی ملکیت:</td>
                    <td ID="Rate" runat="server" align="center">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="RightAlign" colspan="2">
                        <asp:Label ID="Label45" runat="server" Font-Bold="True" 
                            Text="فورمه سکن شده ملکیت آپلود نمایید:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:FileUpload ID="fuPropertyCostForm" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator67" runat="server" 
                            ControlToValidate="fuPropertyCostForm" ErrorMessage="RequiredFieldValidator">باید تکمیل شود!</asp:RequiredFieldValidator>
                    </td>
                    <td class="style8">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <hr /></td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="ثبت" 
                            Width="95px" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <asp:Button ID="btnCalculateTax" runat="server" onclick="btnCalculateTax_Click" 
                            Text="محصول معلوم نمایید" Visible="False" />
                    </td>
                </tr>
            </table>
        <br />
           <div align="center">
               <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="Width100">
                <tr>
                    <td align="center" class="SuccessMessage">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="SuccessMessage">
                        ریکارډ ثبت شد!</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:RadioButton ID="rbtnAdd" runat="server" AutoPostBack="True" 
                            oncheckedchanged="rbtnAdd_CheckedChanged" Text="ثبت ریکارد دیګر؟" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View runat="server" ID="View3">   
            <div>
                <table class="Width100">
                    <tr>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="style9" colspan="6">
                            <h2>
                                <strong>شماره تذکره مالک یا متصرف در دیتابیس موجود میباشد</strong></h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td class="Heading">
                            مالک یا متصرف موجوده</td>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td class="Heading">
                            مالک یا متصرف جدید</td>
                        <td class="style7">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label66" runat="server" Text="اسم:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtPersonName0" runat="server" ValidationGroup="Update"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                                ControlToValidate="txtPersonName0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label74" runat="server" Text="اسم:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtPersonName1" runat="server" ValidationGroup="Insert"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" 
                                ControlToValidate="txtPersonName1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label67" runat="server" Text="ولد:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtFatherName0" runat="server" ValidationGroup="Update"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" 
                                ControlToValidate="txtFatherName0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label75" runat="server" Text="ولد:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtFatherName1" runat="server" ValidationGroup="Insert"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" 
                                ControlToValidate="txtFatherName1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label68" runat="server" Text="ولدیت:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtGrandFatherName0" runat="server" ValidationGroup="Update"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" 
                                ControlToValidate="txtGrandFatherName0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label76" runat="server" Text="ولدیت:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtGrandFatherName1" runat="server" ValidationGroup="Insert"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator59" runat="server" 
                                ControlToValidate="txtGrandFatherName1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label69" runat="server" Text="شماره تذکره:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtTazkeraNo0" runat="server" Enabled="False" 
                                ValidationGroup="Update" ForeColor="#FFFF66"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" 
                                ControlToValidate="txtTazkeraNo0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator38" 
                                runat="server" ControlToValidate="txtTazkeraNo0" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Update">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label77" runat="server" Text="شماره تذکره:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtTazkeraNo1" runat="server" ValidationGroup="Insert" 
                                ForeColor="#FFFF66"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" 
                                ControlToValidate="txtTazkeraNo1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator43" 
                                runat="server" ControlToValidate="txtTazkeraNo1" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Insert">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                            <br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="NotEqual"
                                ErrorMessage="شماره تذکره موافق میباشد!" ControlToCompare="txtTazkeraNo0" 
                                ControlToValidate="txtTazkeraNo1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            &nbsp;شماره جلد:</td>
                        <td class="style6">
                            <asp:TextBox ID="txtToghNo0" runat="server" ValidationGroup="Update">0</asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" 
                                ControlToValidate="txtToghNo0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                        <td class="RightAlign">
                            &nbsp;شماره جلد:</td>
                        <td class="style6">
                            <asp:TextBox ID="txtToghNo1" runat="server" ValidationGroup="Insert">0</asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator61" runat="server" 
                                ControlToValidate="txtToghNo1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label73" runat="server" Text="شماره صفحه:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtPanaNo0" runat="server" ValidationGroup="Update">0</asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" 
                                ControlToValidate="txtPanaNo0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator39" 
                                runat="server" ControlToValidate="txtPanaNo0" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Update">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label78" runat="server" Text="شماره صفحه:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtPanaNo1" runat="server" ValidationGroup="Insert">0</asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" 
                                ControlToValidate="txtPanaNo1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator44" 
                                runat="server" ControlToValidate="txtPanaNo1" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Insert">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            شماره ثبت:</td>
                        <td class="style6">
                            <asp:TextBox ID="txtSabthNo0" runat="server" ValidationGroup="Update">0</asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" 
                                ControlToValidate="txtSabthNo0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator40" 
                                runat="server" ControlToValidate="txtSabthNo0" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Update">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                        <td class="RightAlign">
                            شماره ثبت:</td>
                        <td class="style6">
                            <asp:TextBox ID="txtSabthNo1" runat="server" ValidationGroup="Insert">0</asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" 
                                ControlToValidate="txtSabthNo1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator45" 
                                runat="server" ControlToValidate="txtSabthNo1" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Insert">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label71" runat="server" Text="تعداد اعضای فامیل:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtFamilyMembers0" runat="server" ValidationGroup="Update"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" 
                                ControlToValidate="txtFamilyMembers0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator41" 
                                runat="server" ControlToValidate="txtFamilyMembers0" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Update">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label80" runat="server" Text="تعداد اعضای فامیل:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtFamilyMembers1" runat="server" ValidationGroup="Insert"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" 
                                ControlToValidate="txtFamilyMembers1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator46" 
                                runat="server" ControlToValidate="txtFamilyMembers1" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Insert">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            <asp:Label ID="Label72" runat="server" Text="سرپرست فامیل:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtFamilyHead0" runat="server" ValidationGroup="Update"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" 
                                ControlToValidate="txtFamilyHead0" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Update">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator42" 
                                runat="server" ControlToValidate="txtFamilyMembers0" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Update">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                        <td class="RightAlign">
                            <asp:Label ID="Label81" runat="server" Text="سرپرست فامیل:"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="txtFamilyHead1" runat="server" ValidationGroup="Insert"></asp:TextBox>
                        </td>
                        <td class="style7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator66" runat="server" 
                                ControlToValidate="txtFamilyHead1" ErrorMessage="RequiredFieldValidator" 
                                ValidationGroup="Insert">باید تکمیل شود!</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator47" 
                                runat="server" ControlToValidate="txtFamilyMembers1" 
                                ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$" 
                                ValidationGroup="Insert">فقط شماره بنویسید!</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Button ID="btnSaveOnly" runat="server" onclick="btnSaveOnly_Click" 
                                Text="جایداد ثبت و به مالک یا متصرف الحاق نمایید" />
                        </td>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Button ID="btnInsertSave" runat="server" onclick="btnInsertSave_Click" 
                                Text="ثبت معلومات جدید" />
                        </td>
                        <td class="style7">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="  " colspan="2" style="text-align: center">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="RightAlign">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="  " colspan="2" style="text-align: center">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style7">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="6">
                            &nbsp;&nbsp;&nbsp;<asp:Label ID="lbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">

    function ddlValidator(source, args) {
        var text = args.Value;
        args.IsValid = false;
        if (text != "...") {
            args.IsValid = true;
        }
    }

  </script>
    <style type="text/css">
        .style5
        {
            width: 139px;
            text-align: left;
        }
        .style6
        {
            width: 151px;
        }
        .style7
        {
            width: 212px;
        }
        .style8
        {
            width: 152px;
        }
        .style9
        {
            color: red;
        }
    </style>
    
</asp:Content>



