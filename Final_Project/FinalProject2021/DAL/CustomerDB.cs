using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data;
using FinalProject2021.BLL;
using System.Windows.Forms;

namespace FinalProject2021.DAL
{
    public static class CustomerDB
    {
        static DataTable dtCustomers;
        static DataSet dsFinalProjectDB;
        static SqlDataAdapter da;

        public static DataTable ListCustomersFromDB()
        {

            dsFinalProjectDB = new DataSet("FinalProjectDB");
            dtCustomers = new DataTable("Customers");
            dtCustomers.Columns.Add("CustomerId", typeof(Int32));
            dtCustomers.Columns.Add("CustomerName", typeof(string));
            dtCustomers.Columns.Add("StreeAddress", typeof(string));
            dtCustomers.Columns.Add("City", typeof(string));
            dtCustomers.Columns.Add("PostalCode", typeof(string));
            dtCustomers.Columns.Add("PhoneNumber", typeof(string));
            dtCustomers.Columns.Add("FaxNumber", typeof(string));
            dtCustomers.Columns.Add("CreditLimit", typeof(string));
            dtCustomers.Columns.Add("Email", typeof(string));


            dtCustomers.PrimaryKey = new DataColumn[]
            {
                dtCustomers.Columns["StudentId"]
            };

            dsFinalProjectDB = UnilityDB.GetDataSet(dtCustomers, "Customers");

            da = new SqlDataAdapter("SELECT * FROM Customers", UnilityDB.ConnectDB());

            da.Fill(dsFinalProjectDB.Tables["Customers"]);
            return dtCustomers;
        }


    }
}
