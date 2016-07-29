using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PROJETUNITCOST.UTILITIES
{
    public class Elements
    {

        public const string LDAPPATH = "LDAP://edldap101.test.intranet.bell.ca/o=bell,c=ca";
        public const string LDAPUSERNAME = "ou=TRBB,ou=APPLICATIONS,o=BELL,c=ca";
        public const string LDAPPASSWORD = "TR@*bB01";
        public const string LDAPFILTERWITHBELLNET = "(zcntlogin = ";
        public const string CONNECTIONSTRINGNAME = "NeTMedSQLConnectionString";
        public const string ERRORMESSAGELOGINPASSWORD = "le mot de passe ou le nom d'utilisateur est incorrect";
        public const string ERRORMESSAGELOGINPASSWORDEMPTY = "Veuillez saisir votre nom d'utilisateur ou mot de passe SVP";
        public const string ACCESTOMASTERPAGE = "~/Pages/Metrics/MasterPage.aspx";

        //the names of store procedure
        public const string STOREPROCFORCREATED = "getValuesParamettersByToolUserNameNRMSCreated";
        public const string STOREPROCFORMODIFIED = "getValuesParamettersByToolUserNameNRMSModified";
        public const string STOREPROCFORCIRCUITRESERVATION = "getValuesParamettersByToolUserNameCircuitReservationCreated";
        //metrics created
        //procedure of list group by type (created)
        public const string STOREPROCLISTCARDCREATEDGROUPBYTYPE = "getListTypeCardCreateGroupByType";
        public const string STOREPROCLISTCIRCUITCREATEDGROUPBYTYPE = "getListTypeCircuitCreateGroupByType";
        public const string STOREPROCLISTNODECREATEDGROUPBYTYPE = "getListTypeNodeCreateGroupByType";
        public const string STOREPROCLISTTOPOLOGYCREATEDGROUPBYTYPE = "getListTypeTopologyCreateGroupByType";
        public const string STOREPROCLISTLINKCREATEDGROUPBYTYPE = "getListTypeLinkCreateGroupByType";

        //procedure of all element of a specifique type created
        public const string STOREPROCLISTCARDCREATEDBYTYPE = "getListOfCardCreatedByType";
        public const string STOREPROCLISTCIRCUITCREATEDBYTYPE = "getListOfCircuitCreatedByType";
        public const string STOREPROCLISTNODECREATEDBYTYPE = "getListOfNodeCreatedByType";
        public const string STOREPROCLISTTOPOLOGYCREATEDBYTYPE = "getListOfTopologyByCreatedType";
        public const string STOREPROCLISTLINKCREATEDBYTYPE = "getListOfLinkCreatedByType";
        public const string STOREPROCLISTXCONNECTCREATEDBYTYPE = "getListOfXconnectCreatedByType";

        //metrics modified
        //procedure of list group by type (modified)
        public const string STOREPROCLISTCARDMODIFIEDGROUPBYTYPE = "getListTypeCardModifiedGroupByType";
        public const string STOREPROCLISTCIRCUITMODIFIEDGROUPBYTYPE = "getListTypeCircuitModifiedGroupByType";
        public const string STOREPROCLISTNODEMODIFIEDGROUPBYTYPE = "getListTypeNodeModifiedGroupByType";
        public const string STOREPROCLISTTOPOLOGYMODIFIEDGROUPBYTYPE = "getListTypeTopologyModifiedGroupByType";
        public const string STOREPROCLISTLINKMODIFIEDGROUPBYTYPE = "getListTypeLinkModifiedGroupByType";


        //procedure of all element of a specifique type created
        public const string STOREPROCLISTCARDMODIFIEDBYTYPE = "getListOfCardModifiedByType";
        public const string STOREPROCLISTCIRCUITMODIFIEDBYTYPE = "getListOfCircuitModifiedByType";
        public const string STOREPROCLISTNODEMODIFIEDBYTYPE = "getListOfNodeModifiedByType";
        public const string STOREPROCLISTTOPOLOGYMODIFIEDBYTYPE = "getListOfTopologyByModifiedType";
        public const string STOREPROCLISTLINKMODIFIEDBYTYPE = "getListOfLinkModifiedByType";
        public const string STOREPROCLISTXCONNECTMODIFIEDBYTYPE = "getListOfXconnectModifiedByType";

        //procedure for reseved circuit
        public const string STOREPROCLISTCIRCUITRESERVEDWITHOUTDATE = "getListOfCircuitReservedWithoutDateByUser";
        public const string STOREPROCLISTCIRCUITRESERVEDWITHDATE = "getListOfCircuitReservedWithDateByUser";


        //  public string GETUSERBELLNETFROMWINDOWSAUTHENTIFICATION = HttpContext.Current.User.Identity.Name.Substring(HttpContext.Current.User.Identity.Name.IndexOf("\\") + 1);


        public static string GetUserBellNetFronWindowsAuthentification()
        {
            // return  HttpContext.Current.User.Identity.Name.Substring(HttpContext.Current.User.Identity.Name.IndexOf("\\") + 1);
            string userWindows = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            return userWindows.Substring(userWindows.LastIndexOf("\\") + 1, userWindows.Length - (userWindows.LastIndexOf("\\") + 1));

        }
    }
}