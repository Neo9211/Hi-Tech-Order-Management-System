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
    public partial class MISManager : Form
    {
        public MISManager()
        {
            InitializeComponent();
        }

        private void MISManager_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.Height =700;
            this.Width = 950;
        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            MainInterface mf = new MainInterface();
            mf.Show();
            this.Hide();
          

        }

        private void buttonList_Click(object sender, EventArgs e)
        {
            User us = new User();
            List<User> listus = us.GetAllUsers();
            listViewUser.Items.Clear();
            if (listus.Count != 0)
            {
                foreach (User u_item in listus)
                {
                    ListViewItem item = new ListViewItem(u_item.UserID.ToString());
                    item.SubItems.Add(u_item.UserPassword);
                    item.SubItems.Add(u_item.EmployeeID.ToString());
                    listViewUser.Items.Add(item);

                }
            }
            else
            {
                MessageBox.Show("Users list is empty");
                return;
            }
        }

        private void buttonElist_Click(object sender, EventArgs e)
        {
            Employees emp = new Employees();
            List<Employees> listEmp = emp.GetAllEmployees();
            listViewEmployee.Items.Clear();
            if (listEmp.Count != 0)
            {
                foreach (Employees emp_item in listEmp)
                {
                    ListViewItem item = new ListViewItem(emp_item.EmployeeID.ToString());
                    item.SubItems.Add(emp_item.EmployeeFirstName);
                    item.SubItems.Add(emp_item.EmployeeLastName); 
                    item.SubItems.Add(emp_item.EmployeePassword);
                    item.SubItems.Add(emp_item.EmployeePosition);
                    item.SubItems.Add(emp_item.EmployeeUserID.ToString());
                    item.SubItems.Add(emp_item.EmployeePhoneNumber);
                    item.SubItems.Add(emp_item.EmployeeEmail);
                    listViewEmployee.Items.Add(item);

                }
            }
            else
            {
                MessageBox.Show("Employee list is empty");
                return;
            }
        }

        private void buttonESearch_Click(object sender, EventArgs e)
        {
            string input = textBoxESearch.Text.Trim();
            Employees emp = new Employees();
            emp = emp.SearchEmployees(Convert.ToInt32(input));
            if (emp != null)
            {
                textBoxEmployeeID.Text = emp.EmployeeID.ToString();
                textBoxEmployeeFirstName.Text = emp.EmployeeFirstName;
                textBoxEmployeeLastName.Text = emp.EmployeeLastName;
                textBoxEmployeePassword.Text = emp.EmployeePassword;
                textBoxPosition.Text = emp.EmployeePosition;
                textBoxEmployeeUserID.Text = emp.EmployeeUserID.ToString();
                textBoxEmployeePhone.Text = emp.EmployeePhoneNumber;
                textBoxEmployeeEmail.Text = emp.EmployeeEmail;
            }
            else
            {
                MessageBox.Show("Employee not found");
                textBoxESearch.Clear();
                textBoxESearch.Focus();
                return;
            }
        }

        private void buttonEDelete_Click(object sender, EventArgs e)
        {

        }

        private void buttonEAdd_Click(object sender, EventArgs e)
        {
            string input = textBoxEmployeeID.Text.Trim();
            Employees emp  = new Employees();
            if (emp.IsDuplicateclId(Convert.ToInt32(input)))
            {
                MessageBox.Show("This Id has already existed");
                textBoxEmployeeID.Clear();
                textBoxEmployeeID.Focus();
                return;
            }

            input = "";
            input = textBoxEmployeeFirstName.Text.Trim();
            if (!Validation.IsValidName(input))
            {
                MessageBox.Show("First Name contains only letters and space to separate first name components",
                    "Invalid First Name", MessageBoxButtons.OK, MessageBoxIcon.Error);
                textBoxEmployeeFirstName.Clear();
                textBoxEmployeeFirstName.Focus();
                return;

            }
            input = "";
            input = textBoxEmployeeLastName.Text.Trim();
            if (!Validation.IsValidName(input))
            {
                MessageBox.Show("Last Name contains only letters and space to separate Last name components",
                    "Invalid Last Name", MessageBoxButtons.OK, MessageBoxIcon.Error);
                textBoxEmployeeLastName.Clear();
                textBoxEmployeeLastName.Focus();
                return;

            }

            emp.EmployeeID = Convert.ToInt32(textBoxEmployeeID.Text.Trim());
            emp.EmployeeFirstName = textBoxEmployeeLastName.Text.Trim();
            emp.EmployeeLastName = textBoxEmployeeFirstName.Text.Trim();
            emp.EmployeePassword = textBoxEmployeePassword.Text.Trim();
            emp.EmployeePosition = textBoxPosition.Text.Trim();
            emp.EmployeeUserID = Convert.ToInt32(textBoxEmployeeUserID.Text.Trim());
            emp.EmployeePhoneNumber = textBoxEmployeePhone.Text.Trim();
            emp.EmployeeEmail = textBoxEmployeeEmail.Text.Trim();
            emp.SaveEmployees(emp);
            MessageBox.Show("New Employee Added successfully", "Confirmation");
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            User us = new User();
            us.UserID= Convert.ToInt32(textBoxUserID.Text.Trim());
            us.UserPassword = textBoxUserPassword.Text.Trim();
            us.EmployeeID = Convert.ToInt32(textBoxUEmployeeID.Text.Trim());
            us.SaveUser(us);
            MessageBox.Show("User Saved", "Confirmation");
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            string input = textBoxSearch.Text.Trim();
            User us = new User();
            us = us.SearchUser(Convert.ToInt32(input));
            if (us != null)
            {
                textBoxUserID.Text = us.UserID.ToString();
                textBoxUserPassword.Text = us.UserPassword;
                textBoxEmployeeID.Text = us.EmployeeID.ToString();
            }
            else
            {
                MessageBox.Show("User not found");
                textBoxSearch.Clear();
                textBoxSearch.Focus();
                return;
            }
        }
    }
}
