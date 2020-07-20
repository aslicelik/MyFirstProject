using System;
using System.Runtime.InteropServices.ComTypes;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {



            //  Consol üzerine yazılan datayı  içeriye almayı araştırınız :)
            //1) Disaridan alinan iki sayının toplamiyla farkinin birbirine bolumunden kalanin sonucu kactir? (Farkın toplama bolumunden kalan kactir?)
            int c1, c2, sonuc;
            string s1, s2;
            Console.WriteLine("birinci sayıyı giriniz");
            s1 = Console.ReadLine();
            c1 = Convert.ToInt32(s1);
            Console.WriteLine("ikinci sayıyı giriniz");
            s2 = Console.ReadLine();
            c2 = Convert.ToInt32(s2);
            sonuc = (c1 + c2) / (c1 - c2);
            Console.WriteLine("sonuc :" + sonuc.ToString());

            //2) Disaridan girilen bir sayının 10 eksiginin 20 fazlasinin 2ye bolumunden kalaninin karesi kactir? (karesını yapamadım)

            
            int c1, sonuc;
            String s1;
            Console.WriteLine("sayıyı giriniz");
            s1 = Console.ReadLine();
            c1 = Convert.ToInt32(s1);
            sonuc = ((c1 - 10) + 20) / 2;
            Console.WriteLine("sonuc:"+ sonuc.ToString());



            //3) Vize notu'nun % 30'u, final notu'nun % 70'ini alıp öğrencinin not ortalamasini cikartan bir uygulama yaziniz... DİKKAT => Notlar ondalikli olabilir?

            int v1, f1, ort;
            string vize, final;
            Console.WriteLine("vize notunu giriniz");
            vize = Console.ReadLine();
            v1 = Convert.ToInt32(vize);
            Console.WriteLine("final notunu giriniz");
            final = Console.ReadLine();
            f1 = Convert.ToInt32(final);
            ort = ((v1 / 100) * 30) + ((f1 / 100) * 70);
            Console.WriteLine("ortalama:" + ort.ToString());

            //4) Dışarıdan kullanıcı adını ve soyadını ayrı ayrı olarak alnız ve  adi.soyadi@hotmail.com şeklinde mail adresi oluşturup kullanıcıya gösteriniz

            string ad, soyad, mail;
            Console.WriteLine("adi gir");
            ad = Console.ReadLine();
            Console.WriteLine("soyadi gir");
            soyad = Console.ReadLine();
            mail = ad + "." + soyad + "@hotmail.com";
            Console.WriteLine("mail adresiniz:" + mail);


            //5) Disaridan girilen iki sayının karelerinin toplami ile karelerinin farki toplami kactir? 

            int c1, c2, sonuc;
            string 


            //Console.WriteLine(""); => sonucu ekrana yazdırmak için kullanıcağız, bu benden size kopya :)


        }
    }
    }
}
