Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gw-nl4.philips.com (gw-nl4.philips.com [212.153.190.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84B764829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 06:39:03 -0600 (MDT)
Received: from smtpscan-nl3.philips.com (smtpscan-nl3.philips.com [130.139.36.23])
	by gw-nl4.philips.com (Postfix) with ESMTP id 04CFB44BED
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 14:39:00 +0200 (MET DST)
Received: from smtprelay-nl1.philips.com (localhost [127.0.0.1])
	by smtpscan-nl3.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id OAA06021
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 14:39:00 +0200 (MET DST)
From: joachim.weller@philips.com
Received: from hbg001soh.diamond.philips.com (e1soh01.diamond.philips.com [130.143.165.45])
	by smtprelay-nl1.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id OAA08479
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 14:38:59 +0200 (MET DST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OF52713812.E62609E7-ONC1256C3E.0044B75D@diamond.philips.com>
Date: Tue, 24 Sep 2002 14:40:33 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 00460EA7C1256C3E_="
Subject: [parisc-linux] Help wanted: XF86Config (B2600)
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
--=_alternative 00460EA7C1256C3E_=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

since yesterday, I have up and running a B2600 with Debian woody 3.0,
but I can't setup  X11 Configuration for the built in PCI Grafic card,
using framebuffer driver.

The error message in  /etc/XFree86.0.log (XFree86 Version 4.1.0.1)=20
says:
(EE) No devices detected.

although I have put in /etc/X11/XF86Config:

Section "Device"
        BoardName       "hp-3D"
        Identifier      "Device[0]"
        BusID           "1:3:0"=20
        Driver          "fbdev"
        Option          "UseFBDev"              "true"
        Screen          0
EndSection

The BusID was determined by  "cat /proc/pci" :
  Bus  1, device   3, function  0:
    3D controller: PCI device 103c:108b (Hewlett-Packard Company) (rev 5).
      IRQ 258.
      Master Capable.  Latency=3D255.
      Prefetchable 64 bit memory at 0xfffffffffb000000=20
[0xfffffffffbffffff].
      Non-prefetchable 64 bit memory at 0xfffffffffa000000=20
[0xfffffffffaffffff].

If anybody has the same grafic card running, I would very much appreciate
to get a working XF86Config or any tips to resolve that problem.

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
--=_alternative 00460EA7C1256C3E_=
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><font size=3D2 face=3D"sans-serif">Hi,</font>
<br>
<br><font size=3D2 face=3D"sans-serif">since yesterday, I have up and runni=
ng a B2600 with Debian woody 3.0,</font>
<br><font size=3D2 face=3D"sans-serif">but I can't setup &nbsp;X11 Configur=
ation for the built in PCI Grafic card,</font>
<br><font size=3D2 face=3D"sans-serif">using framebuffer driver.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">The error message in &nbsp;/etc/XFre=
e86.0.log (XFree86 Version 4.1.0.1) </font>
<br><font size=3D2 face=3D"sans-serif">says:</font>
<br><font size=3D2 face=3D"sans-serif">(EE) No devices detected.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">although I have put in /etc/X11/XF86=
Config:</font>
<br>
<br><font size=3D2 face=3D"sans-serif">Section &quot;Device&quot;</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; BoardNam=
e &nbsp; &nbsp; &nbsp; &nbsp;&quot;hp-3D&quot;</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Identifi=
er &nbsp; &nbsp; &nbsp; &nbsp;&quot;Device[0]&quot;</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; BusID &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;1:3:0&quot; &nbs=
p; &nbsp; &nbsp; &nbsp;</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Driver &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;fbdev&quot;</fo=
nt>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Option &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;UseFBDev&quot; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;true&quot;</fo=
nt>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Screen &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0</font>
<br><font size=3D2 face=3D"sans-serif">EndSection</font>
<br>
<br><font size=3D2 face=3D"sans-serif">The BusID was determined by &nbsp;&q=
uot;cat /proc/pci&quot; :</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; Bus &nbsp;1, device &nbsp; 3,=
 function &nbsp;0:</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; 3D controller: PCI dev=
ice 103c:108b (Hewlett-Packard Company) (rev 5).</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; IRQ 258.</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; Master Capable.=
 &nbsp;Latency=3D255.</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; Prefetchable 64=
 bit memory at 0xfffffffffb000000 [0xfffffffffbffffff].</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; Non-prefetchabl=
e 64 bit memory at 0xfffffffffa000000 [0xfffffffffaffffff].</font>
<br>
<br><font size=3D2 face=3D"sans-serif">If anybody has the same grafic card =
running, I would very much appreciate</font>
<br><font size=3D2 face=3D"sans-serif">to get a working XF86Config or any t=
ips to resolve that problem.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">Regards,</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp;Joachim<b=
r>
<br>
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
--=_alternative 00460EA7C1256C3E_=--
