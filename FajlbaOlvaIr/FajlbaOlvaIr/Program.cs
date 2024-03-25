using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace FajlbaOlvaIr
{
    class Program
    {
        static Random r = new Random();
        static void Main(string[] args)
        {
            List<Autotip> autotipusok = new List<Autotip>();
            StreamReader f = new StreamReader("auto_tipusokny.txt");
            while (!f.EndOfStream)
            {
                Autotip sv = new Autotip();
                string[] asd = f.ReadLine().Split(',');
                sv.id =Convert.ToInt32(asd[0]);
                sv.marka =asd[1];
                sv.tipus =asd[2];
                sv.evszam =Convert.ToInt32(asd[3]);
                autotipusok.Add(sv);
            }
            f.Close();
            StreamWriter ff= new StreamWriter("vege.txt");
            ff.WriteLine("INSERT INTO Auto_tipus (id,tipus,gyartasiev,marka) VALUES");
            for (int i = 0; i < autotipusok.Count-1; i++)
            {
                ff.WriteLine("('{0}',{1},'{2}'),",  autotipusok[i].tipus, autotipusok[i].evszam, autotipusok[i].marka);
            }
            ff.WriteLine("('{0}',{1},'{2}');", , autotipusok[autotipusok.Count-1].tipus, autotipusok[autotipusok.Count-1].evszam, autotipusok[autotipusok.Count-1].marka);
            ff.WriteLine();
            ff.Close();

            Be2();
            Be3();
            Be4();
            Be5();
            Console.ReadLine();
        }
        static void Be2()
        {
            StreamReader f = new StreamReader("varosokny.txt");
            StreamWriter ff = new StreamWriter("vege.txt",true);
            ff.WriteLine("INSERT INTO Varos (id,nev) VALUES");
            int i = 0;
            while (!f.EndOfStream)
            {
                
                string[] asd = f.ReadLine().Split(',');
                if(i<49) ff.WriteLine("('{0}'),", asd[1]);
                else ff.WriteLine("('{0}');",  asd[1]);
                i++;
            }
            //ff.WriteLine("('{0}','{1}');",asd[0]);
            ff.WriteLine();
            f.Close();
            ff.Close();
        }

        static void Be3()
        {
            StreamReader f = new StreamReader("vasarlony.txt");
            StreamWriter ff = new StreamWriter("vege.txt", true);
            ff.WriteLine("INSERT INTO Elado (hely_id,email,nev,telefonszam) VALUES");
            int i = 0;
            while (!f.EndOfStream)
            {
                string[] asd = f.ReadLine().Split(',');
                string n = asd[0] +' '+ asd[1];
                if (i < 199) ff.WriteLine("({0},'{1}','{2}','{3}'),", r.Next(1,51), n,asd[2],asd[3]);
                else ff.WriteLine("({0},'{1}','{2}','{3}');", r.Next(1, 51), n, asd[2], asd[3]);
                i++;
            }
            ff.WriteLine();
            f.Close();
            ff.Close();
        }

        static void Be4()
        {
            StreamReader f = new StreamReader("vevony.txt");
            StreamWriter ff = new StreamWriter("vege.txt", true);
            ff.WriteLine("INSERT INTO Vevo (lakhely_id,email,nev,telefonszam) VALUES");
            int i = 0;
            while (!f.EndOfStream)
            {
                string[] asd = f.ReadLine().Split(',');
                string n = asd[0] + ' ' + asd[1];
                if (i < 199) ff.WriteLine("({0},'{1}','{2}','{3}'),", r.Next(1, 51), n, asd[2], asd[3]);
                else ff.WriteLine("({0},'{1}','{2}','{3}');", r.Next(1, 51), n, asd[2], asd[3]);
                i++;
            }
            ff.WriteLine();
            f.Close();
            ff.Close();
        }

        static void Be5()
        {
            StreamReader f = new StreamReader("autokny.txt");
            StreamWriter ff = new StreamWriter("vege.txt", true);
            ff.WriteLine("INSERT INTO Autok (tipus_id,rendszam,ar,alvazszam) VALUES");
            int i = 0;
            while (!f.EndOfStream)
            {
                string[] asd = f.ReadLine().Split(',');
                if (i < 199) ff.WriteLine("({0},'{1}',{2},'{3}'),", asd[2], asd[3], asd[1], asd[0]);
                else ff.WriteLine("({0},'{1}',{2},'{3}');", asd[2], asd[3], asd[1], asd[0]);
                i++;
            }
            ff.WriteLine();
            f.Close();
            ff.Close();
        }
    }
    struct Autotip
    {
        public int id, evszam;
        public string marka, tipus;
    }
}
