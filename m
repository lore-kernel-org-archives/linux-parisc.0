From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] Firefox/Mozilla patches
Date: Fri, 24 Dec 2004 14:15:45 +0100
Message-ID: <20041224141545.3ed7b450.gmsoft@gentoo.org>
References: <200412172238.iBHMc3sL017678@hiauly1.hia.nrc.ca>
	<Pine.GSO.4.58.0412180034280.1196@panter.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1871957438=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.GSO.4.58.0412180034280.1196@panter.stud.ntnu.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1871957438==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Fri__24_Dec_2004_14_15_45_+0100_YfSYOxaEcZ8yq9bJ"

--Signature=_Fri__24_Dec_2004_14_15_45_+0100_YfSYOxaEcZ8yq9bJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi,

Your patch works great. I've put it into Gentoo and we now have mozilla
and firefox working ! Thanks.

However, your Makefile have a little error. On box running 64bit kernel,
OS_TEST will be parisc64 and the Makefile will use the unsuported stuff.

Maybe you should replace 
ifeq ($(OS_TEST), parisc)
by this :
ifneq (,$(filter parisc parisc64,$(OS_TEST)))

hth,


On Sat, 18 Dec 2004 00:58:40 +0100 (MET)
Ivar <orskaug@stud.ntnu.no> wrote:

> Please note that this patch is VERY preliminary - thus, any feedbak is
> welcome,
> 
> 
> diff -N -u ./mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in
> /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in---
> ./mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in	2004-04-22 22:50:05.000000000 +0200+++
> /home/user/mozilla/xpcom/reflect/xptcall/src/md/unix/Makefile.in	2004-12-18 00:00:29.807917680 +0100@@ -167,6 +167,19 @@
>  endif
>  endif
> 
> +#
> +# Linux/HPPA/GCC
> +#
> +ifeq ($(OS_ARCH),Linux)
> +ifeq ($(OS_TEST), parisc)
> +ifeq ($(CC),gcc)
> +CPPSRCS		:= xptcinvoke_pa32.cpp xptcstubs_pa32.cpp
> +ASFILES		:= xptcstubs_asm_parisc_linux.s
> xptcinvoke_asm_parisc_linux.s
> +endif
> +endif
> +endif
> +
> +
>  ####################################################################
>  ###
>  # M68k
>  ####################################################################
>  ###


-- 
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)

--Signature=_Fri__24_Dec_2004_14_15_45_+0100_YfSYOxaEcZ8yq9bJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBzBaMrpShrnoH4YYRAigMAJ4yeeyPKQC+WgF+Gx0S2Q2HT30pWACaAj30
G6Q4dXSuE74w0aweLo1E3Go=
=U1YP
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Dec_2004_14_15_45_+0100_YfSYOxaEcZ8yq9bJ--


--===============1871957438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1871957438==--
