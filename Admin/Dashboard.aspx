<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Foodie.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-5">

        <div class="row">

            <!-- card 1-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-secondary">
                        <div class="row">
                            <div class="col">                                
                                <i class="bi bi-back h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Categories
                                <asp:Label ID="lblCat" style="font-size:25px;" runat="server" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                                <a href="Category.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- card 2-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-info">
                        <div class="row">
                            <div class="col">                                
                               <i class="bi bi-cup-straw h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Product
                                <asp:Label ID="lblPro" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                                <a href="Product.aspx">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- card 3-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-success">
                        <div class="row">
                            <div class="col">                                
                               <i class="bi bi-archive-fill h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Total Order
                                <asp:Label ID="lblOrder" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                                <a href="OrderStatus.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- card 4-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-warning">
                        <div class="row">
                            <div class="col">                          
                                <i class="bi bi-truck h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Delivered
                                <asp:Label ID="lblDeliver" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                               <a href="OrderStatus.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            

        </div>

        <div class="row mt-lg-5">

             <!-- card 1-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-secondary">
                        <div class="row">
                            <div class="col">                                
                                <i class="bi bi-bag-dash-fill h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Pending
                                <asp:Label ID="lblPending" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                               <a href="OrderStatus.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- card 2-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-info">
                        <div class="row">
                            <div class="col">                                
                                <i class="bi bi-people-fill h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Users
                                <asp:Label ID="lblUser" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                                <a href="Users.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- card 3-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-success">
                        <div class="row">
                            <div class="col">                                
                                <i class="bi bi-cash-stack h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Sold Amount
                                <asp:Label ID="lblSold" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                                <a href="Selling.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- card 4-->
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-header text-white bg-warning">
                        <div class="row">
                            <div class="col">                                
                               <i class="bi bi-chat-square-quote-fill h2"></i>
                            </div>                            
                                                
                            <div class="col">
                               Feedbacks
                                <asp:Label ID="lblFeedback" style="font-size:25px;" runat="server" Text="<h3>8</h3>" ForeColor="White"></asp:Label>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <i class="bi bi-eye-fill"></i>
                                <a href="Contact.aspx" >View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            

        </div>

    </div>

</asp:Content>
