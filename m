From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Thu, 7 Oct 2004 18:08:46 +0200
Message-ID: <4161729B000014F1@mail-1-bnl.tiscali.it>
References: <20041007152900.GU23260@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041007152900.GU23260@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> Date: Thu, 7 Oct 2004 11:29:00 -0400
> From: Carlos O'Donell <carlos@baldric.uwo.ca>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: parisc-linux@parisc-linux.org
> Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
> 
> 
> On Thu, Oct 07, 2004 at 01:56:09PM +0200, Joel Soete wrote:
> > Since the Oct 1, I try desperately to complete the glibc cvs build bu=
t
> without
> > success:
> 
> a. Build an 'unstable' chroot. Enter the chroot.
> b. apt-get build-dep glibc
> c. Pull down glibc cvs head.
> d. Apply the latest hppa patch set.
> e. Build glibc.
> 
> I suggest the chroot method because it seems that you might have
> problems with your environment. In particular I always try a chroot
> build if something seems funny.
> 
> Cheers,
> Carlos.
> 
mmm good idea but with exactely the same env (ie same binutils, same gcc,=

same kernel, same nfs server and client) I reach to build glibc cvs 2004
09 30 + your patch with same index (even complet test) without pb but for=

later cvs (ie 2004 10 0[1234567] it failed.

Fwiw I check and configure script: no change?
Is there some include file which could change its behaviour?

That said, I can force ranlib with --enable-ranlib but unfortunately the
build  just failed:(
I try to have a look in precompiled elf/rtld.i but I didn't yet find wher=
e
errno is requested in set_dp?
(ooh iirc something was changed regarfing __errno in upstream:
<http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/include/errno.h.diff?c=
vsroot=3Dglibc&only_with_tag=3Dfedora-branch&r1=3D1.11&r2=3D1.11.2.1>
i.e.:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/glibc/libc/include/errno.h,v
retrieving revision 1.11
retrieving revision 1.11.2.1
diff -u -r1.11 -r1.11.2.1
--- libc/include/errno.h	2002/12/31 20:33:33	1.11
+++ libc/include/errno.h	2004/10/05 08:25:13	1.11.2.1
@@ -14,8 +14,8 @@
    so a single (hidden) global variable is all it needs.  */
 
 #  undef  errno
-#  define errno errno		/* For #ifndef errno tests.  */
-extern int errno attribute_hidden;
+#  define errno rtld_errno
+extern int rtld_errno attribute_hidden;

=3D=3D=3D=3D=3D=3D=3D
So certainly where I have to check?

Thanks,
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
