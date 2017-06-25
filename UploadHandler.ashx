<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;
using System.IO;

public class UploadHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string cNewsImage = "";
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;

            string cName = HttpContext.Current.Request.Form["cName"].ToString();
            
     
 string cName = HttpContext.Current.Request.Form["cName"].ToString();

 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();

 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();

 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();

 string cName = HttpContext.Current.Request.Form["cName"].ToString();


 string cName = HttpContext.Current.Request.Form["cName"].ToString();

 string cName = HttpContext.Current.Request.Form["cName"].ToString();




            for (int i = 0; i < files.Count; i++)
            {
                //Multipal Image Store Wen then 

                HttpPostedFile file = files[i];
                string fname;
                if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                {
                    string[] testfiles = file.FileName.Split(new char[] { '\\' });
                    fname = testfiles[testfiles.Length - 1];
                }
                else
                {
                    fname = file.FileName;
                }
                // fname=Path.Combine(context.Server.MapPath("~/uploads/"), fname);
                // file.SaveAs(fname);

                string filepathsigna = "" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + Path.GetExtension(file.FileName).ToString();

                file.SaveAs(context.Server.MapPath("~/kImage/") + filepathsigna);
                string cLogo = "~/kImage/" + filepathsigna;
                //   cNewsImage = "http://vite.biz/ecp/Master/NewsImage/" + filepathsigna;

                cNewsImage = "~/kImage/" + filepathsigna; ;


            }

            string cImage = cNewsImage;

            
        }
        //context.Response.ContentType = "text/plain";
        //context.Response.Write( cNewsImage);

        context.Response.Clear();
        context.Response.ContentType = "application/Json; charset = utf-8";
        context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        context.Response.AppendHeader("Access-Control-Allow-Header", "Content-Type");
        context.Response.Write(cNewsImage);
        context.Response.End();

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
