using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.Admin
{
    public partial class Selling : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Selling Report";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }              
               
            }
        }

        private void getContacts()
        {
            conn = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Selling", conn);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@Startdate", txtFrom.Text);
            cmd.Parameters.AddWithValue("@Todate", txtTo.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);            
            rSelling.DataSource = dt;
            rSelling.DataBind();

            try
            {
                conn.Open();
                cmd = new SqlCommand("Sold", conn);
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                cmd.Parameters.AddWithValue("@Startdate", txtFrom.Text);
                cmd.Parameters.AddWithValue("@Todate", txtTo.Text);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblSold.Visible = true;
                    lblSold.Text = "Sold Cost : ₹ " + dr[0].ToString();
                }
            }
            catch (Exception ex)
            {

                lblSold.Visible = true;
                lblSold.Text = ex.Message;
            }  
            finally
            {
                conn.Close();
            }


            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getContacts();
        }

        
    }
}