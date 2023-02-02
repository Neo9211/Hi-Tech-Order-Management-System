using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using FinalProject2021.VALIDATION;
using FinalProject2021.BLL;

namespace FinalProject2021.GUI
{
    public partial class SalesManager : Form
    {
        DataTable dtCustomers;

        public SalesManager()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MainInterface mf = new MainInterface();
            mf.Show();
            this.Hide();

        }

        private void buttonlist_Click(object sender, EventArgs e)
        {
            Customer customer = new Customer();
            //dtCustomers = customer.ListCustomers();
            dataGridViewListFromDatabase.DataSource = dtCustomers;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void buttonListFromDataSet_Click(object sender, EventArgs e)
        {
            dataGridViewListFromDataSet.DataSource = dtCustomers;
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
           
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }
    }
}
