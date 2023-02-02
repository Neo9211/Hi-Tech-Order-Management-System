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
    public partial class ChangePassword : Form
    {
        public ChangePassword()
        {
            InitializeComponent();
        }

        private void textBoxEmployeeID_TextChanged(object sender, EventArgs e)
        {

        }

        private void ChangePassword_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            buttonChange.Enabled = false;
            textBoxNew.Enabled = false;
        }

        private void buttonCheck_Click(object sender, EventArgs e)
        {
            SqlConnection conn = Utility.ConnectDB();
            SqlCommand cmdInsert = new SqlCommand();
            cmdInsert.Connection = conn;

            if (textBoxEmployeeID.Text != string.Empty || textBoxOldPassword.Text != string.Empty)
            {
                string query = "Select * from Employees Where EmployeeID = '" + textBoxEmployeeID.Text.Trim() + "'and EmployeePassword ='"
                     + textBoxOldPassword.Text.Trim() + "'";
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataTable Employees = new DataTable();
                sda.Fill(Employees);

                if (Employees.Rows.Count == 1)
                {
                    MessageBox.Show("Your identity verification has been successful, password can be changed.","Confirmation");
                    buttonChange.Enabled = true;
                    textBoxNew.Enabled = true;

                    
                }
                else
                {
                    MessageBox.Show("Please cheack your Employee ID and Password!\n" +
                   "If you cannot fix this issue, contact the company.", "Warning");
                }

            }
            else
            {
                MessageBox.Show("Please enter your EmployeeID and Password", "Warning");
            }

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            MainInterface mi = new MainInterface();
            this.Hide();
            mi.Show();
        }

        private void buttonChange_Click(object sender, EventArgs e)
        {
            string input = textBoxEmployeeID.Text.Trim();
            Login lg = new Login();
            lg.EmployeePassword = textBoxNew.Text.Trim();
            lg.UpdateP(lg);
            MessageBox.Show("Password Changed", "Confirmation");

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
