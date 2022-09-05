//using Firebase.Auth;
//using Firebase.Storage;
using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace SurveyFPT.Service
{
    public class ImageService
    {
      


        public string UploadImages(HttpPostedFileBase file, string direction)
        {
            if (file.ContentLength > 0)
            {
                Guid guid = Guid.NewGuid();
                var extenstion = Path.GetExtension(file.FileName);
                Random rd = new Random();
                int rand_num = rd.Next(0, 100);

                string fileName = "i_" + guid + "_" + rand_num + extenstion;

                if (!Directory.Exists(direction)) Directory.CreateDirectory(direction);
                string savedFileName = (direction + fileName);
                file.SaveAs(savedFileName);

                return fileName;
               
            }
            return null;

        }
    }
}