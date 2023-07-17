using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null) 
                {
                    getUserDetails();
                }                
            }
        }
       
        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                string actionName = string.Empty;
                int userId = Convert.ToInt32(Request.QueryString["id"]);
                conn = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Query_IU", conn);
                cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
                //cmd.Parameters.AddWithValue("@ContactId", userId);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                cmd.Parameters.AddWithValue("@Message", txtQuery.Text.Trim());

                cmd.CommandType = CommandType.StoredProcedure;
                //txtQuery.ToolTip = "begin";
                try
                {
                    //txtEmail.ToolTip = "hii";
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    actionName = "Thanks for reaching out will look into your query!";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b> " + txtName.Text.Trim() + " </b>" + actionName;
                    lblMsg.CssClass = "alert alert-success";
                    //txtSubject.ToolTip = "bye";
                }
                //catch (SqlException ex)
                //{
                //    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                //    {
                //        lblMsg.Visible = true;
                //        lblMsg.Text = "<b>" + txtUsername.Text.Trim() + "</b> Feedback already exist, try new one..!";
                //        lblMsg.CssClass = "alert alert-danger";
                //    }
                //}
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error - " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void getUserDetails()
        {
            conn = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Query_IU", conn);
            cmd.Parameters.AddWithValue("@Action", "SELECT4QUERY");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                txtName.Text = dt.Rows[0]["Name"].ToString();                
                txtEmail.Text = dt.Rows[0]["Email"].ToString();                
                txtSubject.Text = dt.Rows[0]["Subjext"].ToString();
                txtQuery.Text = dt.Rows[0]["Message"].ToString();
            }
            lblHeaderMsg.Text = "<h2>Edit Profile</h2>";
            btnSubmit.Text = "Update";           
        }

        private void clear()
        {
            txtName.Text = string.Empty;            
            txtEmail.Text = string.Empty;
            txtQuery.Text = string.Empty;
            txtSubject.Text = string.Empty;
           
        }
    }
}