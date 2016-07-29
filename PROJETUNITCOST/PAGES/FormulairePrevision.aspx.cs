using PROJETUNITCOST.MANAGERS;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJETUNITCOST.PAGES
{
    public partial class FormulairePrevision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddlListeSubPeats.Visible = false;

                ddlLesRegions.DataSource = DataBaseManager.GetDataBaseManager().SelectMyData("GETLISTOFREGIONSUNITCOST", null);
                ddlLesRegions.DataValueField = "NAMEREGION";
                ddlLesRegions.DataBind();

                Response.Write("region name " + ddlLesRegions.Text);

                string ff = ddlLesRegions.Text;

                ddlListeSubPeats.Visible = true;

                ArrayList listOfRegions3 = new ArrayList();

                Parameter param3 = new Parameter("regionName", DbType.String, ddlLesRegions.Text);
                listOfRegions3.Add(param3);

                ddlListeSubPeats.DataSource = DataBaseManager.GetDataBaseManager().SelectMyData("GETLISTFSUBPEATBYREGION", listOfRegions3);
                ddlListeSubPeats.DataValueField = "NAMESUBPEAT";
                ddlListeSubPeats.DataBind();

                SetValuesOfTexBoxes(ddlListeSubPeats.Text);

            }
            else
            {
                ArrayList listOfRegions3 = new ArrayList();

                Parameter param3 = new Parameter("regionName", DbType.String, ddlLesRegions.Text);
                listOfRegions3.Add(param3);

                ddlListeSubPeats.DataSource = DataBaseManager.GetDataBaseManager().SelectMyData("GETLISTFSUBPEATBYREGION", listOfRegions3);
                ddlListeSubPeats.DataValueField = "NAMESUBPEAT";
                ddlListeSubPeats.DataBind();

                SetValuesOfTexBoxes(ddlListeSubPeats.Text);

            }
          

        }


        //get value from storeprocedure

        public string GetValueFromStoreProg(string parameter1, string parameter1Name, string parameter2, string parameter2Name, string storeProcToExecute, string rowNameToGet)
        {
            string returnValue = null;

            if (parameter1 == null && parameter2 == null)
            {
                DataView dv = (DataBaseManager.GetDataBaseManager().SelectMyData(storeProcToExecute, null));
                try
                {
                    returnValue = dv.Table.Rows[0][rowNameToGet].ToString();
                }
                catch
                {
                    returnValue = "0";

                }
            }

            else if (!(parameter1 == null) && !(parameter2 == null))
            {
                ArrayList listOfParametters = new ArrayList();

                Parameter param1 = new Parameter(parameter1Name, DbType.String, parameter1);
                listOfParametters.Add(param1);

                Parameter param2 = new Parameter(parameter2Name, DbType.String, parameter2);
                listOfParametters.Add(param2);

                //lod the first gridview for created
                DataView dv = (DataBaseManager.GetDataBaseManager().SelectMyData(storeProcToExecute, listOfParametters));
                try
                {
                    returnValue = dv.Table.Rows[0][rowNameToGet].ToString();
                }
                catch
                {
                    returnValue = "0";

                }

            }
            else if (!(parameter1 == null) && (parameter2 == null))
            {
                ArrayList listOfParametters = new ArrayList();

                Parameter param1 = new Parameter(parameter1Name, DbType.String, parameter1);
                listOfParametters.Add(param1);

                //lod the first gridview for created
                DataView dv = (DataBaseManager.GetDataBaseManager().SelectMyData(storeProcToExecute, listOfParametters));
                try
                {
                    returnValue = dv.Table.Rows[0][rowNameToGet].ToString();
                }
                catch
                {
                    returnValue = "0";

                }


            }
            else if ((parameter1 == null) && !(parameter2 == null))
            {
                ArrayList listOfParametters = new ArrayList();

                Parameter param1 = new Parameter(parameter1Name, DbType.String, parameter2);
                listOfParametters.Add(param1);

                //lod the first gridview for created
                DataView dv = (DataBaseManager.GetDataBaseManager().SelectMyData(storeProcToExecute, listOfParametters));
                try
                {
                    returnValue = dv.Table.Rows[0][rowNameToGet].ToString();
                }
                catch
                {
                    returnValue = "0";

                }


            }
            return returnValue;

        }

        public void SetValuesOfTexBoxes(string subPeat)
        {
            //get forcast amounth values

            januaryForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "january", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            febuaryForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "febuary", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            marchForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "march", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            aprilForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "april", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            mayForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "may", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            junForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "jun", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            julyForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "july", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            augustForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "august", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            septemberForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "september", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            octoberForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "october", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            novemberForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "november", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");
            decemberForcastBudget.Text = GetValueFromStoreProg(subPeat, "subpeat", "december", "theMonth", "GETTHEFORCASTAMOUNTBYMONTH", "theValue");

            //get forcast bandwith values

            //get actual values
            
            //get 

        }



        //disable texbosxes
        private void DisableChilds(Control ctrl)
        {
            foreach (Control c in ctrl.Controls)
            {
                DisableChilds(c);
                if (c is TextBox)
                {
                    ((TextBox)(c)).Enabled = false;
                }
            }
        }


        //FONCTION OD THE ALLOCATION TABLE


        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            Response.Write(e.CommandName.ToString());
            //SqlDataSource1.
            //theTotalAllocation.Text = GetValueFromStoreProg(null, null, null, null, "getTotalOfAllocations", "totalAllocation");

        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {

            System.Data.Common.DbCommand command = e.Command;
            // EmployeesDropDownList.DataBind();
            string updateValueAlloc = command.Parameters["@ALLOCATION"].Value.ToString();
            if (updateValueAlloc.Contains("."))
            {
                string newVal = updateValueAlloc.Replace(".", ",");
                command.Parameters["@ALLOCATION"].Value = newVal;

            }
            //int intIdOfTheEltToDelete = Int32.Parse(idOfTheEltDeleted);
            //theTotalAllocation.Text = GetValueFromStoreProg(idOfTheEltDeleted, "allocationID", null, null, "getTotalOfAllocationsAfterDelete", "totalAllocation");


        }



        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            System.Data.Common.DbCommand command = e.Command;
            // EmployeesDropDownList.DataBind();
            string updateValueAlloc = command.Parameters["@ALLOCATION"].Value.ToString();
            if (updateValueAlloc.Contains("."))
            {
                string newVal = updateValueAlloc.Replace(".", ",");
                command.Parameters["@ALLOCATION"].Value = newVal;

            }
            //  theTotalAllocation.Text = GetValueFromStoreProg(null, null, null, null, "getTotalOfAllocations", "totalAllocation");
        }

        protected void SqlDataSource1_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            //string dd = SqlDataSource1.SelectParameters.GetValues
            //int dd = (Int32)e.Command.Parameters[0].Value;
            //string aa = SqlDataSource1.SelectParameters.


            System.Data.Common.DbCommand command = e.Command;
            // EmployeesDropDownList.DataBind();
            string idOfTheEltDeleted = command.Parameters["@IDALLOCATIONS"].Value.ToString();
            int intIdOfTheEltToDelete = Int32.Parse(idOfTheEltDeleted);
            //theTotalAllocation.Text = GetValueFromStoreProg(idOfTheEltDeleted, "allocationID", null, null, "getTotalOfAllocationsAfterDelete", "totalAllocation");

            //new Parameter(parameter1Name, DbType.String, parameter1);

            //string parameter1, string parameter1Name, string parameter2, string parameter2Name, string storeProcToExecute, string rowNameToGet

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //Int32 dd = (Int32)e.Command.Parameters[1].Value;
            //Membership.GetUser().ProviderUserKey.ToString();
            // foreach (SqlParameter P in e.Command.Parameters)
            //{
            //    Response.Write(P);
            //    //for debugging only
            //}   

        }

        protected void DeleteAllocation_Click(object sender, EventArgs e)
        {
            //string alocationValue = (GridAllocationPeat.DeleteRow().FindControl("tbAllocation") as TextBox).Text;
            //Response.Write("la valeur de l'allocation est " + alocationValue);


        }



        protected void lbInsert_Click(object sender, EventArgs e)
        {

            if (((GridAllocationPeat.FooterRow.FindControl("tbPeatName") as TextBox).Text) != ""
             && ((GridAllocationPeat.FooterRow.FindControl("tbPeatAllocation") as TextBox).Text) != ""
             && ((GridAllocationPeat.FooterRow.FindControl("tbAllocation") as TextBox).Text) != "")
            {
                SqlDataSource1.InsertParameters["PEATNAMEALLOCATION"].DefaultValue =
                    (GridAllocationPeat.FooterRow.FindControl("tbPeatName") as TextBox).Text;

                SqlDataSource1.InsertParameters["PEATALLOCATION"].DefaultValue =
                    (GridAllocationPeat.FooterRow.FindControl("tbPeatAllocation") as TextBox).Text;

                if (((GridAllocationPeat.FooterRow.FindControl("tbAllocation") as TextBox).Text).Contains("."))
                {
                    string nvlValue = ((GridAllocationPeat.FooterRow.FindControl("tbAllocation") as TextBox).Text).Replace(".", ",");
                    SqlDataSource1.InsertParameters["ALLOCATION"].DefaultValue = nvlValue;

                }
                else
                {
                    SqlDataSource1.InsertParameters["ALLOCATION"].DefaultValue =
                    (GridAllocationPeat.FooterRow.FindControl("tbAllocation") as TextBox).Text;
                }


                SqlDataSource1.Insert();

                // theTotalAllocation.Text = GetValueFromStoreProg(null, null, null, null, "getTotalOfAllocations", "totalAllocation");

            }
            else
            {


                Type cstype = this.GetType();

                // Get a ClientScriptManager reference from the Page class.
                ClientScriptManager cs = Page.ClientScript;
                String cstext = "alert('Please fill out all the boxes');";
                cs.RegisterStartupScript(cstype, "PopupScript", cstext, true);


            }
        }

        protected void saveActualMonthForcast_Click(object sender, EventArgs e)
        {

        }

     




    }
}