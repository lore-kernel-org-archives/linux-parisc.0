From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Thu, 7 Oct 2004 19:03:27 +0200
Message-ID: <4161729B00001526@mail-1-bnl.tiscali.it>
References: <4161729B000014F1@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4161729B000014F1@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos, 

I need more help
> <http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/include/errno.h.diff=
?cvsroot=3Dglibc&only_with_tag=3Dfedora-branch&r1=3D1.11&r2=3D1.11.2.1>
> i.e.:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /cvs/glibc/libc/include/errno.h,v
> retrieving revision 1.11
> retrieving revision 1.11.2.1
> diff -u -r1.11 -r1.11.2.1
> --- libc/include/errno.h	2002/12/31 20:33:33	1.11
> +++ libc/include/errno.h	2004/10/05 08:25:13	1.11.2.1
> @@ -14,8 +14,8 @@
>     so a single (hidden) global variable is all it needs.  */
> 
>  #  undef  errno
> -#  define errno errno		/* For #ifndef errno tests.  */
> -extern int errno attribute_hidden;
> +#  define errno rtld_errno
> +extern int rtld_errno attribute_hidden;
> 
> =3D=3D=3D=3D=3D=3D=3D
> So certainly where I have to check?
> 
I look forward and encounter:
<http://sources.redhat.com/ml/glibc-cvs/2004-q4/msg00074.html>

It seems an evidence to just change errno to rtld_errno symbol for those
other arch but for hppa I realy didn't encounter this variable name, what=

did I missed (certanly a macro but which one?)

Thanks again,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
..
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
