using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Foodie.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["breadCrum"] = " ";
                if (Session["admin"]==null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    getuserData();
                }
            }
        }

        private void getuserData()
        {
            try
            {
                conn = new SqlConnection(Connection.GetConnectionString());
                conn.Open();

                cmd = new SqlCommand("select count(CategoriesId) from Categories", conn);
                int lblcat= (int)cmd.ExecuteScalar();
                lblCat.Text = lblcat.ToString();
                //lblCat.Font.Size=20; 

                cmd = new SqlCommand("select count(ProductsId) from dbo.Products", conn);
                int lblpro = (int)cmd.ExecuteScalar();
                lblPro.Text = lblpro.ToString();

                cmd = new SqlCommand("select count(OrderDetailsId) from dbo.Orders", conn);
                int lblorder = (int)cmd.ExecuteScalar();
                lblOrder.Text = lblorder.ToString();

                cmd = new SqlCommand("select count(Status) from dbo.Orders where status='Delivered'", conn);
                int lbldeliver = (int)cmd.ExecuteScalar();
                lblDeliver.Text = lbldeliver.ToString();

                cmd = new SqlCommand("select count(Status) from dbo.Orders where status='Pending'", conn);
                int lblpending = (int)cmd.ExecuteScalar();
                lblPending.Text = lblpending.ToString();

                cmd = new SqlCommand("select count(UserId) from dbo.Users", conn);
                int lbluser = (int)cmd.ExecuteScalar();
                lblUser.Text = lbluser.ToString();

                //cmd = new SqlCommand("Invoice", conn);
                //cmd.Parameters.AddWithValue("@Action", "TOTAL");
                //cmd.CommandType = CommandType.StoredProcedure;
                //int lblsold = (int)cmd.ExecuteScalar();
                //lblSold.Text = lblsold.ToString();

                cmd = new SqlCommand("SELECT sum(p.Price* o.Quantity) FROM Orders o INNER JOIN Products p ON p.ProductsId = o.ProductId", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblSold.Text = "₹"+ dr[0].ToString();
                }

                cmd = new SqlCommand("select count(ContactId) from dbo.Contact", conn);
                int lblcontact = (int)cmd.ExecuteScalar();
                lblFeedback.Text = lblcontact.ToString();
             
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);               
            }
            finally 
            { 
                conn.Close(); 
            }         
            
        }
    }
}