Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gw-nl6.philips.com (gw-nl6.philips.com [212.153.235.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD6E34829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 05:19:12 -0600 (MDT)
Received: from smtpscan-nl3.philips.com (smtpscan-nl3.philips.com [130.139.36.23])
	by gw-nl6.philips.com (Postfix) with ESMTP id 6FF10A1013
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 13:19:10 +0200 (MET DST)
Received: from smtprelay-nl1.philips.com (localhost [127.0.0.1])
	by smtpscan-nl3.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id NAA18632
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 13:19:09 +0200 (MET DST)
From: joachim.weller@philips.com
Received: from hbg001soh.diamond.philips.com (e1soh01.diamond.philips.com [130.143.165.45])
	by smtprelay-nl1.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id NAA21846
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 13:19:09 +0200 (MET DST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OFD78B3766.71BE9B40-ONC1256C3D.003C55CB@diamond.philips.com>
Date: Mon, 23 Sep 2002 13:19:01 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 003E97AAC1256C3D_="
Subject: [parisc-linux] Problem to load kernel by PALO (B2600)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multipart message in MIME format.
--=_alternative 003E97AAC1256C3D_=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=20
i'am new to parisc, but have managed to successfully set up=20
an hp715/100 with palinux-0.9.3.

I have downloaded the latest isoimage 2.4.19-pa19-20020922,
from http://pateam.esiee.fr/download.html
Burned to CD and succesfull booted from internal CDROM drive into the IPL.
The problem arises when trying to load the kernel.
I have tried with no success:
1. booting unmodified command line: 0/vmlinux
2. 0/vmlinux32
3. 0/vmlinux64
4. 0/dists/woody/main/disks-hppa/3.0.23-2002-09-22/32/linux.bin
5. 0/dists/woody/main/disks-hppa/3.0.23-2002-09-22/64/linux.bin

after b<enter>, the CD is accessed for about 20 seconds, and then
the almost same error message appears:

---------------------------------------------------------------------------=
---------------------------
Command line for kernel: 'ramdisk=5Fsize=3D8192 root=3D/dev/ram console=3Dt=
ty0=20
sti=3D10/1/3/0 st=5Ffont=3DVGA8x16 TERM=3Dlinux palo=5Fkernel=3D0/vmlinux32'
Selected kernel: /vmlinux32 from partition 0
Selected ramdisk: /ramdiski from partition 0
ELF32 executable
Entry 00100098 first 00100000 n 6
Segment 0 load 00100000 size 2196688 mediaptr 0x1000
Segment 1 load 0031a000 size 467792 mediaptr 0x21a000
Segment 2 load 00390000 size 255656 mediaptr 0x28d000
Segment 3 load 003d0000 size 8192 mediaptr 0x2cc000
Segment 4 load 003d8000 size 32768 mediaptr 0x2ce000
Segment 5 load 00402048 size 110832 mediaptr 0x2d6048

ERROR: Read from boot device failed (status =3D -3).
byteio=5Fread: seekread() returned -1 expected 2195456
ERROR: segment 0 read() failed
Fatal error loading kernel executableERROR: failed to load kernel
---------------------------------------------------------------------------=
---------------------------

In order to exclude CDROM media problems, I tried to burn on
a regular CD (first one was RW), but again with no success.

Reading the Boot-howto didn't help.
Any help very much appreciated !

Regards,
                    Joachim



Joachim Weller

Philips Medizin Systeme Boeblingen GmbH
Cardiac and Monitoring Systems (CMS) /New Product Engineering=20
Phone: {+49|0}-7031-463-1891
Fax:   {+49|0}-7031-463-2112
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F
Gesch=E4ftsf=FChrer: Dr. Werner Haas, David Russell, Wolfgang Strenzl=20
(Sprecher)
Sitz der Gesellschaft: B=F6blingen Registergericht B=F6blingen Reg.-Nr. HRB=
=20
5187=20
Hewlett-Packard Str. 2, D 71034 Boeblingen      -GERMANY-
--=_alternative 003E97AAC1256C3D_=
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><font size=3D2 face=3D"sans-serif">Hi, </font>
<br><font size=3D2 face=3D"sans-serif">i'am new to parisc, but have managed=
 to successfully set up </font>
<br><font size=3D2 face=3D"sans-serif">an hp715/100 with palinux-0.9.3.</fo=
nt>
<br>
<br><font size=3D2 face=3D"sans-serif">I have downloaded the latest isoimag=
e 2.4.19-pa19-20020922,</font>
<br><font size=3D2 face=3D"sans-serif">from http://pateam.esiee.fr/download=
.html</font>
<br><font size=3D2 face=3D"sans-serif">Burned to CD and succesfull booted f=
rom internal CDROM drive into the IPL.</font>
<br><font size=3D2 face=3D"sans-serif">The problem arises when trying to lo=
ad the kernel.</font>
<br><font size=3D2 face=3D"sans-serif">I have tried with no success:</font>
<br><font size=3D2 face=3D"sans-serif">1. booting unmodified command line: =
0/vmlinux</font>
<br><font size=3D2 face=3D"sans-serif">2. 0/vmlinux32</font>
<br><font size=3D2 face=3D"sans-serif">3. 0/vmlinux64</font>
<br><font size=3D2 face=3D"sans-serif">4. 0/dists/woody/main/disks-hppa/3.0=
.23-2002-09-22/32/linux.bin</font>
<br><font size=3D2 face=3D"sans-serif">5. 0/dists/woody/main/disks-hppa/3.0=
.23-2002-09-22/64/linux.bin</font>
<br>
<br><font size=3D2 face=3D"sans-serif">after b&lt;enter&gt;, the CD is acce=
ssed for about 20 seconds, and then</font>
<br><font size=3D2 face=3D"sans-serif">the almost same error message appear=
s:</font>
<br>
<br><font size=3D2 face=3D"sans-serif">------------------------------------=
------------------------------------------------------------------</font>
<br><font size=3D2 face=3D"sans-serif">Command line for kernel: 'ramdisk=5F=
size=3D8192 root=3D/dev/ram console=3Dtty0 sti=3D10/1/3/0 st=5Ffont=3DVGA8x=
16 TERM=3Dlinux palo=5Fkernel=3D0/vmlinux32'</font>
<br><font size=3D2 face=3D"sans-serif">Selected kernel: /vmlinux32 from par=
tition 0</font>
<br><font size=3D2 face=3D"sans-serif">Selected ramdisk: /ramdiski from par=
tition 0</font>
<br><font size=3D2 face=3D"sans-serif">ELF32 executable</font>
<br><font size=3D2 face=3D"sans-serif">Entry 00100098 first 00100000 n 6</f=
ont>
<br><font size=3D2 face=3D"sans-serif">Segment 0 load 00100000 size 2196688=
 mediaptr 0x1000</font>
<br><font size=3D2 face=3D"sans-serif">Segment 1 load 0031a000 size 467792 =
mediaptr 0x21a000</font>
<br><font size=3D2 face=3D"sans-serif">Segment 2 load 00390000 size 255656 =
mediaptr 0x28d000</font>
<br><font size=3D2 face=3D"sans-serif">Segment 3 load 003d0000 size 8192 me=
diaptr 0x2cc000</font>
<br><font size=3D2 face=3D"sans-serif">Segment 4 load 003d8000 size 32768 m=
ediaptr 0x2ce000</font>
<br><font size=3D2 face=3D"sans-serif">Segment 5 load 00402048 size 110832 =
mediaptr 0x2d6048</font>
<br>
<br><font size=3D2 face=3D"sans-serif">ERROR: Read from boot device failed =
(status =3D -3).</font>
<br><font size=3D2 face=3D"sans-serif">byteio=5Fread: seekread() returned -=
1 expected 2195456</font>
<br><font size=3D2 face=3D"sans-serif">ERROR: segment 0 read() failed</font>
<br><font size=3D2 face=3D"sans-serif">Fatal error loading kernel executabl=
eERROR: failed to load kernel<br>
---------------------------------------------------------------------------=
---------------------------</font>
<br>
<br><font size=3D2 face=3D"sans-serif">In order to exclude CDROM media prob=
lems, I tried to burn on</font>
<br><font size=3D2 face=3D"sans-serif">a regular CD (first one was RW), but=
 again with no success.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">Reading the Boot-howto didn't help.<=
/font>
<br><font size=3D2 face=3D"sans-serif">Any help very much appreciated !</fo=
nt>
<br>
<br><font size=3D2 face=3D"sans-serif">Regards,</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Joachim</font>
<br>
<br>
<br><font size=3D2 face=3D"sans-serif"><br>
Joachim Weller<br>
<br>
Philips Medizin Systeme Boeblingen GmbH<br>
Cardiac and Monitoring Systems (CMS) /New Product Engineering <br>
Phone: {+49|0}-7031-463-1891<br>
Fax: &nbsp; {+49|0}-7031-463-2112<br>
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F<br>
Gesch=E4ftsf=FChrer: Dr. Werner Haas, David Russell, Wolfgang Strenzl (Spre=
cher)<br>
Sitz der Gesellschaft: B=F6blingen Registergericht B=F6blingen Reg.-Nr. HRB=
 5187 &nbsp;<br>
Hewlett-Packard Str. 2, D 71034 Boeblingen &nbsp; &nbsp; &nbsp;-GERMANY-</f=
ont>
--=_alternative 003E97AAC1256C3D_=--
