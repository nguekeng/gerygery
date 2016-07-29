using PROJETUNITCOST.UTILITIES;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJETUNITCOST.MANAGERS
{
    public class DataBaseManager
    {
        public static DataBaseManager dbManager;


        public static DataBaseManager GetDataBaseManager()
        {
            if (dbManager == null)
                dbManager = new DataBaseManager();
            return dbManager;
        }



        public DataView SelectMyData(string method, ArrayList listparam)
        {
            SqlDataSource sqlDataSourceCreated = new SqlDataSource();
            sqlDataSourceCreated.ConnectionString = ConfigurationManager.ConnectionStrings[Elements.CONNECTIONSTRINGNAME].ToString();
            sqlDataSourceCreated.SelectCommand = method;
            sqlDataSourceCreated.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;

            if (listparam != null)
            {
                foreach (Parameter param in listparam)
                {
                    if (param.DefaultValue == "")
                    {
                        param.ConvertEmptyStringToNull = true;
                    }
                    sqlDataSourceCreated.SelectParameters.Add(param);
                }
            }

            DataSourceSelectArguments dssa = new DataSourceSelectArguments();
            DataView dv = new DataView();
            dssa.AddSupportedCapabilities(DataSourceCapabilities.RetrieveTotalRowCount);
            dssa.RetrieveTotalRowCount = true;
            sqlDataSourceCreated.CancelSelectOnNullParameter = false;

            dv = (DataView)sqlDataSourceCreated.Select(dssa);


            return dv;
        }


        public static ArrayList AddParameterToTheList(ArrayList theParameterValues, string[] parameterInStoreProc)
        {
            int i = 0;
            ArrayList listOfParametters = new ArrayList();
            // ArrayList listOfParamettersValues = new ArrayList();
            // listOfParametters = theParameter;

            foreach (string param in theParameterValues)
            {

                Parameter paramToAddToList = new Parameter(parameterInStoreProc[i], DbType.String, param);
                listOfParametters.Add(paramToAddToList);
                i++;
            }

            return listOfParametters;
        }



    }
}