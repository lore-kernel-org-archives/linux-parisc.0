From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Fri, 8 Oct 2004 08:00:53 +0200
Message-ID: <41617557000010DC@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
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
> Date: Thu, 7 Oct 2004 18:39:40 -0400
> From: Carlos O'Donell <carlos@baldric.uwo.ca>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: parisc-linux@parisc-linux.org
> Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
>
>
> > I look forward and encounter:
> > <http://sources.redhat.com/ml/glibc-cvs/2004-q4/msg00074.html>
> >
> > It seems an evidence to just change errno to rtld_errno symbol for th=
ose
> > other arch but for hppa I realy didn't encounter this variable name,
what
> > did I missed (certanly a macro but which one?)
>
> Please please please, if you are going to quote other arches, read the
> code before commenting.
>
> i386 code is ancient and manipulates errno directly. We use the generic=

> code which is always kept up to date. Notice how alpha and ia64 didn't
> need to be fixed? Neither do we :)
>
Sorry to be so lazy (just a bit tired, appologies), here are the ref to
likewise modifications:
<http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/sysdeps/unix/sysv/linu=
x/ia64/sysdep.S.diff?cvsroot=3Dglibc&r1=3D1.8&r2=3D1.9>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/glibc/libc/sysdeps/unix/sysv/linux/ia64/sysdep.S,v
retrieving revision 1.8
retrieving revision 1.9
diff -u -r1.8 -r1.9
--- libc/sysdeps/unix/sysv/linux/ia64/sysdep.S	2004/05/04 16:46:06	1.8
+++ libc/sysdeps/unix/sysv/linux/ia64/sysdep.S	2004/10/04 20:59:36	1.9
@@ -30,7 +30,7 @@
 	 * be fine.  Otherwise, we would have to first load the global
 	 * pointer register from __gp.
 	 */
-	addl	r2=3D@gprel(errno),gp
+	addl	r2=3D@gprel(rtld_errno),gp
 	;;
 	st4	[r2]=3Dr8
 	mov	r8=3D-1
<http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/sysdeps/unix/alpha/sys=
dep.h.diff?cvsroot=3Dglibc&r1=3D1.25&r2=3D1.26>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/glibc/libc/sysdeps/unix/alpha/sysdep.h,v
retrieving revision 1.25
retrieving revision 1.26
diff -u -r1.25 -r1.26
--- libc/sysdeps/unix/alpha/sysdep.h	2004/09/26 17:40:31	1.25
+++ libc/sysdeps/unix/alpha/sysdep.h	2004/10/04 20:59:38	1.26
@@ -82,7 +82,7 @@
 #if RTLD_PRIVATE_ERRNO
 # define SYSCALL_ERROR_LABEL	$syscall_error
 # define SYSCALL_ERROR_HANDLER			\
-	stl	v0, errno(gp)	!gprel;		\
+	stl	v0, rtld_errno(gp)	!gprel;	\
 	lda	v0, -1;				\
 	ret
 #elif defined(PIC)

pfff, 'thuth is out there' :)

Thanks for your attention,
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
