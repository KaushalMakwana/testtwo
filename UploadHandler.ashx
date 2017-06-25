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
            string AttributeSetId = HttpContext.Current.Request.Form["nAttributeSetId"].ToString();

            int  nAttributeSetId=0;
            
            if (AttributeSetId != "")
            {
                nAttributeSetId =int.Parse(AttributeSetId);
            }

            string cDescription = HttpContext.Current.Request.Form["cDescription"].ToString();
            string cShortDescription = HttpContext.Current.Request.Form["cShortDescription"].ToString();
            string cSKU = HttpContext.Current.Request.Form["cSKU"].ToString();

            int nWeight = 0;

            string Weight = HttpContext.Current.Request.Form["nWeight"].ToString();

            if (Weight !="")
            {
                nWeight =int.Parse( Weight);
            }

            float fPrice = 0;

            string Price = HttpContext.Current.Request.Form["fPrice"].ToString();

            if (Price !="")
            {
                    fPrice=float.Parse(Price);
            }
            
            int nProductId = 0;
            DALmstProduct ObjDALmstProduct = new DALmstProduct();

            int nOptionTemplatesId = 0;

            bool IsActive = true;
            bool IsDisable = false;

            string cRemark1 = "";
            string cRemark2 = "";
            string cRemark3 = "";

            string cProductCode = "";
            string cProductUniqueCode = "";

            string SpecialPriceFrom = HttpContext.Current.Request.Form["dtSpecialPriceFrom"].ToString();
            
            DateTime? dtSpecialPriceFrom = null;
            if (SpecialPriceFrom != "")
            {
                dtSpecialPriceFrom = Convert.ToDateTime(SpecialPriceFrom);
            }


            string SpecialPriceTo = HttpContext.Current.Request.Form["dtSpecialPriceTo"].ToString();
            DateTime? dtSpecialPriceTo = null;
            if (SpecialPriceTo != "")
            {
                dtSpecialPriceTo = Convert.ToDateTime(SpecialPriceTo);
            }

            DateTime? dtCreatedDate = null;

            dtCreatedDate = System.DateTime.Now;

            cProductCode = cName.Substring(0, 2);
            Random r = new Random();
            string ProCode = r.Next(5, 10000).ToString();
            cProductCode = cProductCode + ProCode;

            string cMetaTitle = cName;
            string cMetaDescription = cShortDescription;

            float fMRP = fPrice;

            string UserId = HttpContext.Current.Request.Form["nUserId"].ToString();
            int nUserId = int.Parse(UserId);

            string cCsvFile = "";
            string cUrlKey = "";

            string WarrentyId = HttpContext.Current.Request.Form["nWarrentyId"].ToString();
            int nWarrentyId=0;
            if(WarrentyId !="")
            {
                nWarrentyId =int.Parse( WarrentyId);
            }


            string WarrentyDuration = HttpContext.Current.Request.Form["nWarrentyDuration"].ToString();
            int nWarrentyDuration = 0;
            if (WarrentyDuration != "")
            {
                nWarrentyDuration = int.Parse(WarrentyDuration);
            }

            string cWarrantyType = HttpContext.Current.Request.Form["cWarrantyType"].ToString();

            string TaxId = HttpContext.Current.Request.Form["nTaxId"].ToString();
            int nTaxId = 0;
            if (TaxId != "")
            {
                nTaxId = int.Parse(TaxId);
            }

            string MinimumStockAlert = HttpContext.Current.Request.Form["nMinimumStockAlert"].ToString();
            int nMinimumStockAlert = 0;
            if (MinimumStockAlert != "")
            {
                nMinimumStockAlert = int.Parse(MinimumStockAlert);
            }

            string LanguageId = HttpContext.Current.Request.Form["nLanguageId"].ToString();
            int nLanguageId = 0;
            if (LanguageId != "")
            {
                nLanguageId = int.Parse(LanguageId);
            }


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

            string BaseCurrencyId = HttpContext.Current.Request.Form["nBaseCurrencyId"].ToString();
            int nBaseCurrencyId = 0;
            if (BaseCurrencyId != "")
            {
                nBaseCurrencyId = int.Parse(BaseCurrencyId);
            }

            string NewProductFrom = HttpContext.Current.Request.Form["dtNewProductFrom"].ToString();

            DateTime? dtNewProductFrom = null;
            if (NewProductFrom != "")
            {
                dtNewProductFrom = Convert.ToDateTime(NewProductFrom);
            }

            string NewProductTo = HttpContext.Current.Request.Form["dtNewProductTo"].ToString();

            DateTime? dtNewProductTo = null;
            if (NewProductTo != "")
            {
                dtNewProductTo = Convert.ToDateTime(NewProductTo);
            }

            string SpecialPrice = HttpContext.Current.Request.Form["nSpecialPrice"].ToString();
            int nSpecialPrice = 0;
            if (SpecialPrice != "")
            {
                nSpecialPrice = int.Parse(SpecialPrice);
            }

            int nParentProductId = 0;

            bool IsTrackInventory = false;
            bool IsVirualProduct = false;
            bool IsFeatured = false;
            
            nProductId = ObjDALmstProduct.InsertRow(nAttributeSetId, nOptionTemplatesId, cName, cDescription,
            cShortDescription, cSKU, nWeight, fPrice, nSpecialPrice,
            dtSpecialPriceFrom, dtSpecialPriceTo, cMetaTitle, cMetaDescription,
            nBaseCurrencyId, nParentProductId, nTaxId, IsActive, nUserId, cCsvFile, cUrlKey,
            dtCreatedDate, nLanguageId, IsDisable, cRemark1, cRemark2,
            cRemark3, cImage, nMinimumStockAlert, IsTrackInventory, IsVirualProduct,
            IsFeatured, dtNewProductFrom, dtNewProductTo, cWarrantyType,
            nWarrentyDuration, nWarrentyId, cProductCode, cProductUniqueCode, fMRP);
           
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