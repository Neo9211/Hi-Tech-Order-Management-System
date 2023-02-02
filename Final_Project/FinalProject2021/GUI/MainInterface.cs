using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FinalProject2021.DAL;
using FinalProject2021.BLL;
using System.Data.SqlClient;
using FinalProject2021.VALIDATION;

namespace FinalProject2021.GUI
{
    public partial class MainInterface : Form
    {
        public MainInterface()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Contact the Company now! Tel: 514-721-8662 " +'\n'+
                "Contactez l'entreprise maintenant! Tel: 514 - 721 - 8662","Warning");
        }

        private void MainInterface_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.Width = 700;
            this.Height = 550;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = Utility.ConnectDB();
            SqlCommand cmdInsert = new SqlCommand();
            cmdInsert.Connection = conn;

            if (textBoxEmployeeID.Text != string.Empty || textBoxPassword.Text != string.Empty)
            {
                string query = "Select * from Employees Where EmployeeID = '" + textBoxEmployeeID.Text.Trim() + "'and EmployeePassword ='"
                     + textBoxPassword.Text.Trim() + "'";
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataTable Employees = new DataTable();
                sda.Fill(Employees);

                if (Employees.Rows.Count == 1)
                {
                    //MessageBox.Show("Login Successfully");
                    string input = textBoxEmployeeID.Text.Trim();
                    Login lg = new Login();
                    lg = lg.SearchEmployee(Convert.ToInt32(input));
                    if (lg.EmployeePosition == "MIS_Manager")
                    {
                        MessageBox.Show("EmployeeID " + lg.EmployeeID + ", " + lg.EmployeeFirstName + " " + lg.EmployeeLastName + " as a " + lg.EmployeePosition + " has been login successfully", "Confirmation");
                        MISManager mis = new MISManager();
                        this.Hide();
                        mis.Show();
                    }
                    else if (lg.EmployeePosition == "Sales_Manager")
                    {
                        MessageBox.Show("EmployeeID " + lg.EmployeeID + ", " + lg.EmployeeFirstName + " " + lg.EmployeeLastName + " as a " + lg.EmployeePosition + " has been login successfully", "Confirmation");
                        SalesManager sm = new SalesManager();
                        this.Hide();
                        sm.Show();
                    }
                    else if (lg.EmployeePosition == "Inventory_Controller")
                    {
                        MessageBox.Show("EmployeeID " + lg.EmployeeID + ", " + lg.EmployeeFirstName + " " + lg.EmployeeLastName + " as a " + lg.EmployeePosition + " has been login successfully", "Confirmation");
                        InventoryController ic = new InventoryController();
                        this.Hide();
                        ic.Show();
                    }
                    else if (lg.EmployeePosition == "Order_Clerk")
                    {
                        MessageBox.Show("EmployeeID " + lg.EmployeeID + ", " + lg.EmployeeFirstName + " " + lg.EmployeeLastName + " as a " + lg.EmployeePosition + " has been login successfully", "Confirmation");
                        OrderClerk oc = new OrderClerk();
                        this.Hide();
                        oc.Show();
                    }
                    else if (lg.EmployeePosition == "Accountant")
                    {
                        MessageBox.Show("EmployeeID " + lg.EmployeeID + ", " + lg.EmployeeFirstName + " " + lg.EmployeeLastName + " as a " + lg.EmployeePosition + " has been login successfully", "Confirmation");
                        Accountant ac = new Accountant();
                        this.Hide();
                        ac.Show();
                    }
                }
                else
                {
                    MessageBox.Show("Please cheack your Employee ID and Password!\n" +
                    "If you cannot fix this issue, contact the company.", "Warning");
                }
            }
            else
            {
                MessageBox.Show("Please enter your EmployeeID and Password","Warning");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ChangePassword cp = new ChangePassword();
            this.Hide();
            cp.Show();
        }

        private void buttonQuit_Click(object sender, EventArgs e)
        {
            DialogResult answer = MessageBox.Show("Do you really want to exit the application?",
          "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (answer == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }


       
    
}
