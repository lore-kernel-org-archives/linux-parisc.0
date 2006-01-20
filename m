From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] a small compile warning cleanup?
Date: Fri, 20 Jan 2006 15:55:28 +0100
Message-ID: <ITEC4G$9C17DD6AE38ACE7E042A68D230E01BEF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

Hello pa,

Attempting to get rid of this warning (gcc-4.0):
/CAD/linux-2.6.16-rc1-pa1-20060119/kernel/compat.c: In function
'compat_sys_timer_create':
/CAD/linux-2.6.16-rc1-pa1-20060119/kernel/compat.c:532: warning: implicit=

declaration of function 'get_compat_sigevent'

As used in severall places (2 at least), I thing this could help:
--- include/linux/compat_siginfo.h.Orig 2006-01-20 13:39:16.000000000 +01=
00
+++ include/linux/compat_siginfo.h      2006-01-20 13:40:40.000000000 +01=
00
@@ -177,6 +177,9 @@
 extern int compat_copy_sigevent_from_user(struct sigevent *to,
compat_sigevent_t __user *from);
 extern int compat_copy_sigevent_to_user(compat_sigevent_t __user *to, st=
ruct
sigevent *from);
 
+extern int get_compat_sigevent(struct sigevent *event,
+               const struct compat_sigevent __user *u_event);
+
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_GENERIC_COMPAT_SIGINFO_H */
 
=3D=3D=3D=3D<>=3D=3D=3D=3D

If agreed feel free to ci (no cvs access).

TIA,
    Joel
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
