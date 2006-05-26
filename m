From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] Close to mainline for hppa-linux TLS.
Date: Fri, 26 May 2006 16:57:48 -0400
Message-ID: <1148677068.21405.5.camel@localhost.localdomain>
References: <119aab440605260729m1fad24ccta84a2ada06c82c7a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0506517555=="
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <119aab440605260729m1fad24ccta84a2ada06c82c7a@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0506517555==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-lVJeoWM0gXYfQ8ktcmNc"


--=-lVJeoWM0gXYfQ8ktcmNc
Content-Type: multipart/alternative; boundary="=-s8kr1TPD6RYwoTWRBE8P"


--=-s8kr1TPD6RYwoTWRBE8P
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le vendredi 26 mai 2006 =C3=A0 10:29 -0400, Carlos O'Donell a =C3=A9crit :

> Index: sysdeps/unix/sysv/linux/hppa/Versions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/Versions,v
> retrieving revision 1.2
> diff -u -p -r1.2 Versions
> --- sysdeps/unix/sysv/linux/hppa/Versions       28 Aug 2002 23:55:01
> -0000      1.2
> +++ sysdeps/unix/sysv/linux/hppa/Versions       26 May 2006 14:12:18
> -0000
> @@ -16,6 +16,9 @@ libc {
>      #errlist-compat    254
>      _sys_errlist; sys_errlist; _sys_nerr; sys_nerr;
>    }
> +  GLIBC_2.4 {
> +    #errlist-compat    256
> +    sys_errlist;
>  }
>  librt {
>    GLIBC_2.3 {


What stops this from going into ports now?

Tks,
Jeff Bailey

--=20
Although when you're in the situation that RMS is telling you that
you're being too ideological about freedom, maybe, just maybe, it's
true.
- Matthew Wilcox

--=-s8kr1TPD6RYwoTWRBE8P
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.10.1">
</HEAD>
<BODY>
Le vendredi 26 mai 2006 &#224; 10:29 -0400, Carlos O'Donell a &#233;crit&nb=
sp;:<BR>
<BLOCKQUOTE TYPE=3DCITE>
    <TT><FONT COLOR=3D"#000000">Index: sysdeps/unix/sysv/linux/hppa/Version=
s</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">RCS file: /cvs/glibc/ports/sysdeps/unix/sys=
v/linux/hppa/Versions,v</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">retrieving revision 1.2</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">diff -u -p -r1.2 Versions</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">--- sysdeps/unix/sysv/linux/hppa/Versions&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;28 Aug 2002 23:55:01 -0000&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;1.2</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">+++ sysdeps/unix/sysv/linux/hppa/Versions&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;26 May 2006 14:12:18 -0000</FONT></=
TT><BR>
    <TT><FONT COLOR=3D"#000000">@@ -16,6 +16,9 @@ libc {</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">&nbsp;&nbsp;&nbsp;&nbsp; #errlist-compat&nb=
sp;&nbsp;&nbsp;&nbsp;254</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">&nbsp;&nbsp;&nbsp;&nbsp; _sys_errlist; sys_=
errlist; _sys_nerr; sys_nerr;</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">&nbsp;&nbsp; }</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">+&nbsp; GLIBC_2.4 {</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">+&nbsp;&nbsp;&nbsp; #errlist-compat&nbsp;&n=
bsp;&nbsp;&nbsp;256</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">+&nbsp;&nbsp;&nbsp; sys_errlist;</FONT></TT=
><BR>
    <TT><FONT COLOR=3D"#000000">&nbsp;}</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">&nbsp;librt {</FONT></TT><BR>
    <TT><FONT COLOR=3D"#000000">&nbsp;&nbsp; GLIBC_2.3 {</FONT></TT><BR>
</BLOCKQUOTE>
<BR>
What stops this from going into ports now?<BR>
<BR>
Tks,<BR>
Jeff Bailey<BR>
<BR>
<TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
<TR>
<TD>
-- <BR>
<TT>Although when you're in the situation that RMS is telling you that</TT>=
<BR>
<TT>you're being too ideological about freedom, maybe, just maybe, it's</TT=
><BR>
<TT>true.</TT><BR>
- Matthew Wilcox
</TD>
</TR>
</TABLE>
</BODY>
</HTML>

--=-s8kr1TPD6RYwoTWRBE8P--

--=-lVJeoWM0gXYfQ8ktcmNc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEd2vM5M5hmdCYCpkRAqg0AKDhJ8EhEAbq7w5+9dP8f3Pa91EEcwCdEWg1
zLPB9kUV2T9F+JE4pZVYx5Y=
=npU0
-----END PGP SIGNATURE-----

--=-lVJeoWM0gXYfQ8ktcmNc--


--===============0506517555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0506517555==--
