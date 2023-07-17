﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Foodie.Admin.Product" %>

<%@ Import Namespace="Foodie" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        // For disappearing alert messages
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        //Image Preview function
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">

        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Product</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Product Name</label>
                                                    <div>

                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                            runat="server" ErrorMessage="Name is required"
                                                            SetFocusOnError="true" ControlToValidate="txtName"
                                                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Description</label>
                                                    <div>

                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Description" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                            runat="server" ErrorMessage="Description is required"
                                                            SetFocusOnError="true" ControlToValidate="txtDescription"
                                                            ForeColor="Red" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>                                                        
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Price(₹)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Price"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                            runat="server" ErrorMessage="Price is required"
                                                            SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ForeColor="Red" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                            ErrorMessage="Price must be in Decimal" SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ForeColor="Red" Display="Dynamic" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" >
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Quantity</label>
                                                    <div>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Quantity"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                            runat="server" ErrorMessage="Quantity is required"
                                                            SetFocusOnError="true" ControlToValidate="txtQuantity"
                                                            ForeColor="Red" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                            ErrorMessage="Quantity must be Positive" SetFocusOnError="true" ControlToValidate="txtQuantity"
                                                            ForeColor="Red" Display="Dynamic" ValidationExpression="^([1-9]\d*|0)$" >
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"
                                                            onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>

                                                 <div class="form-group">
                                                    <label>Product Category</label>
                                                    <div>                                                       
                                                        <asp:DropDownList ID="ddlCategories" CssClass="form-control"
                                                            runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" 
                                                            DataValueField="CategoriesId" AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>                                                            
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0"
                                                            runat="server" ErrorMessage="Category is required"
                                                            SetFocusOnError="true" ControlToValidate="ddlCategories"
                                                            ForeColor="Red" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>  
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:cs %>" 
                                                            SelectCommand="SELECT [CategoriesId], [Name] FROM [Categories]"></asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive"
                                                        CssClass="form-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add"
                                                        CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                                    &nbsp;
                                                     <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                         CauseValidation="false" OnClick="btnClear_Click" />
                                                </div>
                                                <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />

                                            </div>


                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Product Lists</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rProduct" runat="server"
                                                        OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Name</th>
                                                                        <th>Image</th>
                                                                        <th>Price</th>
                                                                        <th>Quantity</th>
                                                                        <th>Category</th>
                                                                        <th>Description</th>
                                                                        <th>IsActive</th>
                                                                        <th>CreatedDate</th>
                                                                        <th class="datatable-nonsort">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name") %> </td>

                                                                <td>
                                                                    <img alt="" width="40" src="<%#Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                                </td>

                                                                <td><%# Eval("Price") %> </td>

                                                                <td>
                                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                </td>

                                                                <td><%# Eval("CategoryName") %> </td>

                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>

                                                                <td><%# Eval("Description") %> </td>
                                                                                                                                
                                                                <td><%# Eval("CreateDate") %> </td>

                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" CssClass="badge badge-primary"
                                                                        CommandArgument='<%# Eval("ProductsId") %>' runat="server"
                                                                        CommandName="edit" CausesValidation="false">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" CssClass="badge badge-danger"
                                                                        CommandArgument='<%# Eval("ProductsId") %>' runat="server" CausesValidation="false"
                                                                        CommandName="delete" OnClientClick="return confirm('Do you want to delete this product?');">
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton>
                                                                </td>

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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
