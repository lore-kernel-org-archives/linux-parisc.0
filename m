Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1.WPI.EDU (mail1.WPI.EDU [130.215.36.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1567F483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 19:05:37 -0700 (MST)
Received: from mcafee.wpi.edu (mcafee.WPI.EDU [130.215.36.86])
	by mail1.WPI.EDU (8.12.10/8.12.10) with SMTP id hAB25aLk004960
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 21:05:36 -0500
Received: from vapier.wh0rd.org (vapier.wh0rd.org [130.215.224.143])
	by smtp.WPI.EDU (8.12.10/8.12.10) with ESMTP id hAB25XDF003187
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 21:05:34 -0500
From: Mike Frysinger <vapier@gentoo.org>
Reply-To: vapier@gentoo.org
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drawing incorrectly ?
Date: Mon, 10 Nov 2003 21:05:35 -0500
References: <200311101646.55611.vapier@gentoo.org> <3FB01295.10005@tiscali.be>
In-Reply-To: <3FB01295.10005@tiscali.be>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_2PEs/CM79Nz9EG/";
  charset="iso-8859-1"
Message-Id: <200311102105.42375.vapier@gentoo.org>
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

--Boundary-02=_2PEs/CM79Nz9EG/
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Monday 10 November 2003 17:35, you wrote:
> please send your xfonfig-4 and your dmesg file.

http://wh0rd.de/mike/hppa-dmesg
http://wh0rd.de/mike/hppa-XF86Config-4
http://wh0rd.de/mike/hppa-fbcon-pic.jpg
the pic is a little blurry but you can see that the white text is from the=
=20
hppa firmware/palo while the purple text is from the bootup ... also, it=20
seems that the buffer is swapped in the middle ... the lower half of the=20
purple text is actually displayed first when scrolling back through the=20
buffer ...
=2Dmike

--Boundary-02=_2PEs/CM79Nz9EG/
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iQIVAwUAP7BD9UFjO5/oN/WBAQKQlg/+LX6b6IhJDIHgSHYklao4PRMSMJu+CUQ9
qv35Gja72CFYiXRPiWhG2FPwpMVxWRJ/DjW54WuiEzTszTleDIlfbhZ4DS+nhIG3
qcGkfg8+ORxPcQ2IAYOHGUo/3dvrKpaLt8KTPW2G2ZdiTMeTGVjZ3JikjdGAl6Is
v5JwCOYezUeSZ5x5JGVanNQOaxKGr2VnXq7YamdEPSOHQGxRnUYspFx7084jz/zW
JYVvZwQ0dKv+C10gIbMSs1SWl6s7gXv5LnhRtqwQ5KOxBzC5MCqFuuIN4TEO7CB0
4EdxIhlvy3vaq87nZsJvVSJW2WketwGFnlZYuKZ7eIU6Z9i1u21eDK44a5nm56eb
Po6bfL+Fv+PtcfSjWquoapRV8GQAPn7zxkDBPX+wKge+Xkz/+7w0hTWs4DIq1cff
nzp0z6A7y/9nZEGRA5Vb9gnnGad7BTormeYCmkCau9AS6FI0CtvePkyrxBHsPzcd
lR7lREq5GAcbTm7IRH1WraE5DmxqC+IhNJBDPS/ibxIxvg3Hjvzl2HBcI4PUDJYZ
7TAA4YPOpWAND9c7KBBN8+tFs9FddtXhLwRRq3BipJ3BNfOCiNWnfzx9Igjb9xBt
SNQt0MJeLw+WUthqXCs3cjpyhTWAclXlfstFd0gLF4M7kEAvBwC8h4jBtuEJccBa
/GsPLglTRTQ=
=5ZBE
-----END PGP SIGNATURE-----

--Boundary-02=_2PEs/CM79Nz9EG/--
