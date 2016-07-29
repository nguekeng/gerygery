<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormulairePrevision.aspx.cs" Inherits="PROJETUNITCOST.PAGES.FormulairePrevision" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        /*-----------------  css pour le menu ---------------------------------*/

        #nav {
            width: 100%;
            float: left;
            margin: 0 0 3em 0;
            padding: 0;
            list-style: none;
            background-color: #f2f2f2;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }

            #nav li {
                float: left;
            }

                #nav li a {
                    display: block;
                    padding: 8px 15px;
                    text-decoration: none;
                    font-weight: bold;
                    color: #069;
                    border-right: 1px solid #ccc;
                }

                    #nav li a:hover {
                        color: #c00;
                        background-color: #fff;
                    }
        /* End navigation bar styling. */
        .auto-style1 {
            text-align: center;
            font-weight: 800;
            Height : 28px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
        }

        .auto-style2 {
            height: 23px;
            text-align: center;
            font-weight: 700;
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: small;
        }
        .auto-style4 {
            height: 34px;
            text-align: center;
            font-weight: 700;
            width: 214px;

            font-size: small;
        }
        .auto-style5 {
            height: 23px;
            text-align: center;
            font-weight: 700;
            width: 267px;
        }
        .style4 {}
        .auto-style6 {
            height: 34px;
            text-align: center;
            font-weight: 700;
            width: 500px;
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <ul id="nav">
                <li><a href="FormulaireDesPrevision.aspx">FORCAST</a></li>
                <li><a href="ForcastChart.aspx">DASHBOARD</a></li>

            </ul>
        </header>



        <div id="allocation" style="border: double;">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NeTMedSQLConnectionString %>" DeleteCommand="DELETE FROM [ALLOCATIONSFORCASTS] WHERE [IDALLOCATIONS] = @IDALLOCATIONS" InsertCommand="INSERT INTO [ALLOCATIONSFORCASTS] ([PEATNAMEALLOCATION], [PEATALLOCATION], [ALLOCATION]) VALUES (@PEATNAMEALLOCATION, @PEATALLOCATION, @ALLOCATION)" SelectCommand="SELECT * FROM [ALLOCATIONSFORCASTS]"
                UpdateCommand="UPDATE [ALLOCATIONSFORCASTS] SET [PEATNAMEALLOCATION] = @PEATNAMEALLOCATION, [PEATALLOCATION] = @PEATALLOCATION, [ALLOCATION] = @ALLOCATION WHERE [IDALLOCATIONS] = @IDALLOCATIONS" OnUpdated="SqlDataSource1_Updated" OnDeleting="SqlDataSource1_Deleting" OnSelecting="SqlDataSource1_Selecting" OnUpdating="SqlDataSource1_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="IDALLOCATIONS" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PEATNAMEALLOCATION" Type="String" />
                    <asp:Parameter Name="PEATALLOCATION" Type="String" />
                    <asp:Parameter Name="ALLOCATION" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PEATNAMEALLOCATION" Type="String" />
                    <asp:Parameter Name="PEATALLOCATION" Type="String" />
                    <asp:Parameter Name="ALLOCATION" Type="Decimal" />
                    <asp:Parameter Name="IDALLOCATIONS" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridAllocationPeat" runat="server" AutoGenerateColumns="False" DataKeyNames="IDALLOCATIONS" DataSourceID="SqlDataSource1" ShowFooter="True" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnCommand="LinkButton1_Command"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbInsert" runat="server" Text="Insert" OnClick="lbInsert_Click"></asp:LinkButton>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDALLOCATIONS" HeaderText="IDALLOCATIONS" InsertVisible="False" ReadOnly="True" SortExpression="IDALLOCATIONS" Visible="false" />
                    <asp:TemplateField HeaderText="PEATS NAME" SortExpression="PEATNAMEALLOCATION">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PEATNAMEALLOCATION") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PEATNAMEALLOCATION") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbPeatName" runat="server" Enabled="true"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PEATS" SortExpression="PEATALLOCATION">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PEATALLOCATION") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PEATALLOCATION") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbPeatAllocation" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ALLOCATIONS($K)" SortExpression="ALLOCATION">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ALLOCATION") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ALLOCATION") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbAllocation" runat="server" Enabled="true" onkeypress="return isDecimal(event)"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <br />

            <asp:Label ID="labelTotalPeat" runat="server" Text="TOTAL($K)  " Style="font-weight: 700; font-size: large; background-color: #990000; font-style: italic; color: white" Width="315px"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="theTotalAllocation" runat="server" Width="175px"></asp:TextBox>
            <br />
        </div>
        <br />
        <br />
        <br />
        <div>
            <label >REGIONS & SUBPEATS</label>
             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlLesRegions" runat="server"  AutoPostBack="true" >
                  <asp:ListItem Text="---- select a region ----" Selected="True"></asp:ListItem>
            </asp:DropDownList>
             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <%--<label >REGIONS </label>--%>
            <asp:DropDownList ID="ddlListeSubPeats" runat="server">
                <asp:ListItem Text="---- select a subpeat ----" Selected="True"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <br />
        <table style="width: 82%;" border="1">

            <tr>
                <td class="auto-style5">MONTHS&nbsp;</td>
                <td class="auto-style1">JANUARY</td>
                <td class="auto-style1">FEBUARY</td>
                <td class="auto-style1">MARCH</td>
                <td class="auto-style1">APRIL&nbsp;</td>
                <td class="auto-style1">MAY</td>
                <td class="auto-style1">JUN</td>
                <td class="auto-style1">JULY</td>
                <td class="auto-style1">AUGUST&nbsp;</td>
                <td class="auto-style1">SEPTEMBER</td>
                <td class="auto-style1">OCTOBER&nbsp;</td>
                <td class="auto-style1">NOVEMBER</td>
                <td class="auto-style1">DECEMBER</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="13">FORCAST BY MONTH</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp; <span class="auto-style3">BUBGET($K)</span></td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryForcastBudget" runat="server" CssClass="auto-style1" ></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="mayForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberForcastBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">BANDWITH(G)</td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="fevuaryForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="mayForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox14" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberForcastBandwith" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
            </tr>



            <%-- --------------------------------- ACTUALS -----------------------------------%>





            <tr>
                <td class="auto-style2" colspan="13">
                    <asp:Button ID="saveActualMonthForcast" runat="server" Text="SAVE FORCAST FOR ACTUAL MONTH" OnClick="saveActualMonthForcast_Click" style="text-align: left; margin-left: 0px" Width="299px" />
                     &nbsp; &nbsp;&nbsp;&nbsp;<br />
                    <br />
                    
                    ACTUALS BY MONTH </td>
            </tr>

             <%-- ----------------------------- actuals budget -----------------------------------------%>

            <tr>
                <td class="auto-style5"> <span class="auto-style3">BUBGET($K)</span></td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="mayActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="juneActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberActualBudget" runat="server" CssClass="auto-style1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberActualBudget" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberActualBudget" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
            </tr>

             <%-- ----------------------------- DWD available -----------------------------------------%>
            <tr>
                <td class="auto-style6">DWD available(Gbps)</td>
                <td class="auto-style4" >
                    <asp:TextBox ID="januaryDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="machDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="maiDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberDwdAvailable" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
            </tr>

             <%-- ----------------------------- DWD growth -----------------------------------------%>


             <tr>
                <td class="auto-style6">DWD bdw Growth(Gbps)</td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="maiDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberDwdGrowth" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
            </tr>


             <%-- ----------------------------- DWD consumed -----------------------------------------%>

            <tr>
                <td class="auto-style6">DWD bdw consumed(Gbps)</td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="maiDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberDwdConsumed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
            </tr>

      <%-- -----------------------------DWD bdw Remaining(Gbps)-----------------------------------------%>
            <tr>
                <td class="auto-style6">DWD bdw Remaining(Gbps)</td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="maiDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberDwdRemaining" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
            </tr>

            <%-- -----------------------------% USED-----------------------------------------%>

             <tr>
                <td class="auto-style6">% used</td>
                <td class="auto-style1">
                    <asp:TextBox ID="januaryPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="febuaryPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="marchPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="aprilPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="mayPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="junPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="julyPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="augustPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="septemberPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="octoberPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="novemberPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="decemberPercentUsed" runat="server" CssClass="auto-style1" Height="37px"></asp:TextBox>
                </td>
            </tr>





        </table>
        </div>
    </form>
</body>
</html>
