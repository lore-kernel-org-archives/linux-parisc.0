Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1.WPI.EDU (mail1.WPI.EDU [130.215.36.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C4E7483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 14:46:58 -0700 (MST)
Received: from mcafee.wpi.edu (mcafee.WPI.EDU [130.215.36.86])
	by mail1.WPI.EDU (8.12.10/8.12.10) with SMTP id hAALkrLk030202
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 16:46:53 -0500
Received: from vapier.wh0rd.org (vapier.wh0rd.org [130.215.224.143])
	by smtp.WPI.EDU (8.12.10/8.12.10) with ESMTP id hAALkoDF012583
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 16:46:50 -0500
From: Mike Frysinger <vapier@gentoo.org>
Reply-To: vapier@gentoo.org
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 10 Nov 2003 16:46:22 -0500
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_PdAs/x8OnGeYmx3";
  charset="us-ascii"
Message-Id: <200311101646.55611.vapier@gentoo.org>
Subject: [parisc-linux] framebuffer drawing incorrectly ?
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

--Boundary-02=_PdAs/x8OnGeYmx3
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

i've been trying to get the framebuffer to work but so far havent had any=20
luck ... i was unable to locate anyone who had a similar problem ...

Display controller: Hewlett-Packard Comp A4977A Visualize EG (rev 3).
machine is a C360 ... STI Console works great ...
tried 2.4.22-pa13 and 2.6.0-test9-pa5 with same exact results

the frame buffer draws all messed up however ... it only draws on the right=
=20
quarter of the screen ... the rest of the screen still contains the buffere=
d=20
video as found when the computer was booted (firmware output along with pal=
o=20
stuff) ... the colors are all skewed, basically white is purple along with =
a=20
few other bit inversions of some sort ...
also, each line is drawn incorrectly ... it's like each has been split in h=
alf=20
horizontally and then swapped ...
i can get X to load, but again it draws it all messed up in the right quart=
er=20
on the screen

i wish i could post a frame buffer grab, but fbgrab doesnt support 8bit and=
=20
fbscreenshot likes to segfault when writing the png to disk.

any ideas what i'm missing ?
or is the fbdriver the only way i can get X and running ?
=2Dmike

--Boundary-02=_PdAs/x8OnGeYmx3
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iQIVAwUAP7AHRkFjO5/oN/WBAQJ2OA/5AcJvrYma6EATE+R8pPlabOavWDHFt+R8
hxG7/CYEmMVBQgJKZ1WISVKRb+ba8bTr1GUZKaN5NibglRy65e24K4rGn5dbtPHj
lJETEsbuID5CwOjzE9T/PuMeDGUhvC69I4DkXoVqOB0lp8Z8AsSnB0Jw4JKgniHn
UU4IUr18MYWq1tzhffjz5X9sRcdsopo3/SZGJ7rvbxJlWFdSTSqz+ah0U8pcUcJD
Scypal8pBWE4STTBbz8f7YbCaveg9cyjcTrZsCvmjtPP9EJe2WT+c8V7SplnpEla
0BdLB7LbG4Vu9m32umNAX5Aba6uXs3GsNP39+jLLW5SSiTQRBIPvr1xt5CfIAOMd
AWA61ukNNVf5Pi2Rvjd4u2ir06i0f764bES9rcM/uthqBgm9qszGv14hDk+X2iQA
VxZUxweKDr/N62AaZx27kGlQ2jbZ7VUkyJwfljnrcf163mB/38ke5cjggzntWRog
bflKqTbyJ4rHAWxLxAlRpfHWEYM/Y+DlFDIHIZLJOv/bYuYgmLlisU9Ef58hwrd5
Yr7veKt0wMjEznsOugUnA7tsKEhAdBhk6VOEiSevyLOBVYStyEr29Fc0TIAFxYyh
+SpZHeJPm+xVDFFwO0C8wiojZkbBUwCT11plrG+pUwFRrQugfm+PuIpLp007bG88
1nLCRvRvHpQ=
=sFPF
-----END PGP SIGNATURE-----

--Boundary-02=_PdAs/x8OnGeYmx3--
