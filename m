From: Sjoerd Simons <sjoerd@luon.net>
Subject: kernel fault when booting with dual link network card
Date: Sun, 29 Jun 2008 16:17:59 +0100
Message-ID: <20080629151759.GA7856@spring.luon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

  Kernel 2.6.24 causes the machine to fault when a dual-link network card is
  installed right after loading the tulip module. Output of SER PIM attached.

    Sjoerd
-- 
What the world *really* needs is a good Automatic Bicycle Sharpener.

--Nq2Wo0NMKNjxTN9z
Content-Type: application/cap
Content-Disposition: attachment; filename="tulip.cap"
Content-Transfer-Encoding: quoted-printable

Main Menu: Enter command > SER PIM=0A=0APROCESSOR PIM INFORMATION=0A=0A----=
-------------  Processor HPMC Information ------------------=0A=0ATimestamp=
 =3D   Sun Jun  29 14:45:17 GMT 2008    (20:08:06:29:14:45:17)=0A=0AHPMC Ch=
assis Codes =3D 0xcbf0  0x505f  0xcbf2  0xcbfc  =0A=0AGeneral Registers 0 -=
 31=0A 0 -  3  0x00000000  0x10248800  0x10245748  0x17cb45c8  =0A 4 -  7  =
0x0000000f  0x008aac94  0x1740d8d8  0x10410f88  =0A 8 - 11  0x0000006d  0x1=
740d800  0x0000006d  0x00000002  =0A12 - 15  0x0000006d  0x008a6728  0x0089=
27f0  0x00000191  =0A16 - 19  0x00000000  0x00000000  0x00000000  0x0000000=
2  =0A20 - 23  0x0000000e  0x00814000  0x17437800  0x00000002  =0A24 - 27  =
0x00000006  0x00000008  0x17404560  0x103da010  =0A28 - 31  0x00008068  0x2=
a86fc6c  0x17cb4680  0x17cb4608  =0A=0A<Press any key to continue (q to qui=
t)> =0A=0AControl Registers 0 - 31=0A 0 -  3  0x00000000  0x00000000  0x000=
00000  0x00000000  =0A 4 -  7  0x00000000  0x00000000  0x00000000  0x000000=
00  =0A 8 - 11  0x0000060a  0x00000000  0x000000c0  0x0000000d  =0A12 - 15 =
 0x00000000  0x00000000  0x00109800  0xf1000000  =0A16 - 19  0x39b0e584  0x=
00000000  0x10252bdc  0xd79c0e18  =0A20 - 23  0x00000000  0x0081406a  0x000=
4fe0e  0x00000000  =0A24 - 27  0x0041e000  0x07cd6000  0xffffffff  0x400014=
60  =0A28 - 31  0xaaaaaaaa  0x11111111  0x17cb4000  0xf0102918  =0A=0ASpace=
 Registers 0 - 7=0A 0 -  3  0x00000000  0x00000000  0x00000000  0x00000305 =
 =0A 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000  =0A=0A<Press a=
ny key to continue (q to quit)> =0A=0AIIA Space                    =3D 0x00=
000000=0AIIA Offset                   =3D 0x10252be0=0ACheck Type          =
         =3D 0x20000000=0ACPU State                    =3D 0x9e000004=0ACac=
he Check                  =3D 0x00000000=0ATLB Check                    =3D=
 0x00000000=0ABus Check                    =3D 0x00310000=0AAssists Check  =
              =3D 0x00000000=0AAssist State                 =3D 0x00000000=
=0ASystem Responder Address     =3D 0xfff88068=0ASystem Requestor Address  =
   =3D 0xfffbe000=0APath Info                    =3D 0x00000000=0APhysical =
Memory              =3D 0x08000000=0AAvailable Memory             =3D 0x080=
00000=0A=0A<Press any key to continue (q to quit)> =0A=0ACPU Diagnose Regis=
ter 0                =3D 0x600048fc=0AMIOC Status  Register                =
  =3D 0x00001002=0AMIOC Control Register                  =3D 0x98050000=0A=
MIOC MDERRADD Error Address Register   =3D 0x00000008=0AMIOC DMAERR DMA Err=
or Register         =3D 0xffffffff=0AMIOC DIOERR IO  Error Register        =
 =3D 0xfff88068=0A=0A<Press any key to continue (q to quit)> =0A=0A--------=
---------  Processor TOC Information -------------------=0A=0AGeneral Regis=
ters 0 - 31=0A 0 -  3  0x00000000  0x0f424000  0x001d31ec  0x0000da00  =0A =
4 -  7  0x001e8000  0x00000210  0x00000000  0x00000000  =0A 8 - 11  0x00000=
000  0x7ffe6000  0x000000a5  0x4000c640  =0A12 - 15  0x40005640  0x4000c640=
  0x4000c640  0x0000003c  =0A16 - 19  0x40004cb8  0x00000002  0x4000c9b0  0=
x001e8480  =0A20 - 23  0xc9566cff  0x0004000e  0x00458a88  0xd73d6d46  =0A2=
4 - 27  0x00e7319b  0x00000000  0x01e84800  0x004b36a0  =0A28 - 31  0x00000=
000  0x0fbc5200  0x7ffe6c08  0xd912beff  =0A=0A<Press any key to continue (=
q to quit)> =0A=0AControl Registers 0 - 31=0A 0 -  3  0x00000000  0x0000000=
0  0x00000000  0x00000000  =0A 4 -  7  0x00000000  0x00000000  0x00000000  =
0x00000000  =0A 8 - 11  0x0000b50b  0x000066f4  0x000000c0  0x0000001a  =0A=
12 - 15  0x00000000  0x00000000  0x00018000  0xaf000800  =0A16 - 19  0xd73e=
472c  0x00000000  0x0012a218  0x8af4800a  =0A20 - 23  0x00000000  0x0012a21=
8  0x0004700f  0x10000488  =0A24 - 27  0x00458a88  0x001da000  0x01e84800  =
0x7ffe6c08  =0A28 - 31  0x00458a88  0x00008000  0x000d7390  0x0720935c  =0A=
=0ASpace Registers 0 - 7=0A 0 -  3  0x00000000  0x00004b05  0x00000000  0x0=
0000000  =0A 4 -  7  0x00000000  0x00004355  0x00004b05  0x00000000  =0A=0A=
IIA Space                    =3D 0x00000000=0AIIA Offset                   =
=3D 0x0012a21c=0ACPU State                    =3D 0x9e000001=0A=0A=0A<Press=
 any key to continue (q to quit)> =0A=0AMemory Error Log Information:=0A=0A=
Timestamp =3D   Sun Jun  29 14:45:18 GMT 2008    (20:08:06:29:14:45:18)=0A=
=0A   No memory errors logged=0A=0A=0AI/O Module Error Log Information:=0A=
=0ATimestamp =3D   Sun Jun  29 14:45:18 GMT 2008    (20:08:06:29:14:45:18)=
=0A=0ABus      HPA       Module Type      Path  Slt Md Sev Estat Requestor =
Responder=0A----- ---------- ---------------- -------- -- -- --- ---- -----=
----- ----------=0AGSC   0x0000006d A DMA I/O        8/8       2  0 fe  0x0=
3 0x00000000 0x00000000=0A=0A<Press any key to continue (q to quit)> =0A=0A=
IO Bus Converter Log=0A--------------------=0A=0AGBOA HPA            =3D 0x=
fff8c000=0AGBOA UBC_IO_CONTROL =3D 0x00000080=0ANIO HPA             =3D 0xf=
1000001=0AGBOA IO_IO_LO       =3D 0xf1000000=0AGBOA IO_IO_HI       =3D 0xf1=
080000=0A=0AMain Menu: Enter command > =0AMain Menu: Enter command >  =0A
--Nq2Wo0NMKNjxTN9z--
