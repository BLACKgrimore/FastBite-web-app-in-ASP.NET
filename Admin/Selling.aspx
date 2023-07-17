<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Selling.aspx.cs" Inherits="Foodie.Admin.Selling" %>

<%@ Import Namespace="Foodie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">

        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-block">
                                        <div class="row">

                                            <div class="container">
                                                <div class="row">
                                                    <div class="col">
                                                        <asp:Label ID="lblFrom" runat="server" CssClass="ml-2 text-" Text="From Date"></asp:Label>
                                                        <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" TextMode="Date" Text="dd-mm-yyyy"></asp:TextBox>
                                                    </div>
                                                    <div class="col pr-0">
                                                        <asp:Label ID="lblTo" runat="server" CssClass="ml-2 text-" Text="To Date"></asp:Label>
                                                        <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" TextMode="Date" Text="dd-mm-yyyy"></asp:TextBox>
                                                    </div>
                                                    <div class="col btn-box pl-2 mt-3">
                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                                            CssClass="btn bg-c-blue rounded-pill text-white" OnClick="btnSubmit_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12 mobile-inputs">
                                                <h4 class="sub-title p-t-30">Selling Report</h4>
                                                <div class="card-block table-border-style">
                                                    <div class="table-responsive">

                                                        <asp:Repeater ID="rSelling" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table data-table-export table-hover nowrap">
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="table-plus">SrNo</th>
                                                                            <th>Full Name</th>
                                                                            <th>Email</th>
                                                                            <th>Items Orders</th>
                                                                            <th>Total Cost</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td class="table-plus"><%# Eval("SrNo") %> </td>
                                                                    <td><%# Eval("Full_Name") %> </td>
                                                                    <td><%# Eval("Email") %> </td>
                                                                    <td><%# Eval("Item_Orders") %> </td>
                                                                    <td><%# Eval("Total_Cost") %> </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </tbody>
                                                            </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <asp:Label ID="lblSold" CssClass="badge badge-success badge-pill shadow-sm" Visible="false" runat="server">
                                    </asp:Label>
                                   <%-- <b class="badge badge-success badge-pill shadow-sm">Sold Cost: ₹ </b>--%>
                                    <div class="pt-1">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="card"
                                            HeaderText="Fix the following errors" Font-Names="Segoe Script" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
