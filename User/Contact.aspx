<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Foodie.User.Contact" %>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- book section -->

    <div class="view ml-0" style="background-image: 
    url('https://www.kindpng.com/picc/m/323-3233754_transparent-chef-clipart-png-png-download.png'); 
    background-repeat: no-repeat; background-attachment: fixed; background-position: right">

        <section class="book_section layout_padding">
            <div class="container">
                <div class="heading_container">

                    <div class="align-self-end">
                        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                    </div>
                    <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Send Your Query</h2"></asp:Label>                    
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form_container">
                            <form>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required"
                                        SetFocusOnError="true" ControlToValidate="txtName"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name"
                                        ToolTip="Full Name"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required"
                                        SetFocusOnError="true" ControlToValidate="txtEmail"
                                        ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                                        ToolTip="Email" TextMode="Email"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is required"
                                        SetFocusOnError="true" ControlToValidate="txtSubject"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject"
                                        ToolTip="Subject"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvQuery" runat="server" ErrorMessage="Query is required"
                                        SetFocusOnError="true" ControlToValidate="txtQuery"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtQuery" runat="server" CssClass="form-control" placeholder="Enter Your Query/Feedback"
                                        ToolTip="Write Query" TextMode="MultiLine" Height="150px"></asp:TextBox>
                                </div>
                                <div class="btn-box">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                                        CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click1"/>                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- end book section -->


</asp:Content>
