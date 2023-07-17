using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Foodie.Admin;
using System.Drawing;

namespace Foodie.User
{
    public partial class Menu : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCategories();
                getProducts();
            }
        }

        private void getCategories()
        {
            conn = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", conn);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }

        private void getProducts()
        {
            conn = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", conn);
            cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProducts.DataSource = dt;
            rProducts.DataBind();
        }

        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["userId"] != null)
            {

                bool isCartItemUpdated = false;
                int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));
                if (i == 0)
                {
                    //Adding new item in cart
                    conn = new SqlConnection(Connection.GetConnectionString());
                    cmd = new SqlCommand("Cart_Crud", conn);
                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@Quantity", 1);
                    cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error -" + ex.Message + " ');</script>");
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
                else
                {
                    Utils utils = new Utils();
                    isCartItemUpdated = utils.updateCartQuantity(i + 1, Convert.ToInt32(e.CommandArgument), 
                        Convert.ToInt32(Session["userId"]));                    
                }
                lblMsg.Visible = true;
                lblMsg.Text = "Item Added successfully in your cart!";
                lblMsg.CssClass = "alert alert-success";
                //Response.AddHeader("REFRESH", "1;URL=Cart.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }


        int isItemExistInCart(int productId)
        {
            conn = new SqlConnection(Connection.GetConnectionString()); 
            cmd = new SqlCommand("Cart_Crud", conn); 
            cmd.Parameters.AddWithValue("@Action", "GETBYID"); 
            cmd.Parameters.AddWithValue("@ProductId", productId); 
            sda = new SqlDataAdapter(cmd); dt = new DataTable();
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]); 
            cmd.CommandType = CommandType.StoredProcedure;
            sda.Fill(dt);
            int quantity = 0;
            if (dt.Rows.Count > 0)
            {
                quantity = Convert.ToInt32(dt.Rows[0]["Quantity"]);
            }            
            return quantity;
        }


            //private string LowerCase(object obj)
            //{
            //    return obj.ToString().ToLower();
            //}



        }
}