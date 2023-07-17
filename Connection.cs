﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Security.Cryptography;

namespace Foodie
{
    public class Connection
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }


    }
    public class Utils
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda; 
        public static bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg" };
            for (int i = 0; i < fileExtension.Length; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }

        //Setting default image if their is no image for any job
        public static string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "../Images/no_image.png";
            }
            else
            {
                url1 = string.Format("../{0}", url);
            }
            return url1;
        }

        public bool updateCartQuantity(int quantity, int productId, int userId)
        {
            bool isUpdated = false;
            conn = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", conn);
            cmd.Parameters.AddWithValue("@Action", "UPDATE");
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                isUpdated = true;
            }
            catch (Exception ex)
            {
                isUpdated = false;
                System.Web.HttpContext.Current.Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");
            }
            finally
            {
                conn.Close();
            }
            return isUpdated;
        }

        public int cartCount(int userId)
        {
            conn = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", conn);
            cmd.Parameters.AddWithValue("@Action", "SELECT"); 
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure; 
            sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable(); 
            sda.Fill(dt);
            return dt.Rows.Count;
        }

        public static string GetUniqueId()
        {
            Guid guid = Guid.NewGuid();
            String uniqueId = guid.ToString();
            return uniqueId;
        }

    }
}