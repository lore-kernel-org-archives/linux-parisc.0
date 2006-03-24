From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] a small hunk to cleanup 2 build warning?
Date: Fri, 24 Mar 2006 15:41:07 +0100
Message-ID: <IWMZGK$A7E56C1F2E8CACD0CB61C6EEBA1DB197@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hi pa*,

those 2 warning crossed my look during the build of n4k (64bit) smp kerne=
l (in
a loop to stress it a bit):
  CC      kernel/compat.o
/usr/src/linux-2.6.16-pa4/kernel/compat.c: In function 'compat_sys_timer_=
create':
/usr/src/linux-2.6.16-pa4/kernel/compat.c:531: warning: implicit declarat=
ion
of function 'get_compat_sigevent'
[...]
  CC      ipc/compat_mq.o
/usr/src/linux-2.6.16-pa4/ipc/compat_mq.c: In function 'compat_sys_mq_not=
ify':
/usr/src/linux-2.6.16-pa4/ipc/compat_mq.c:113: warning: implicit declarat=
ion
of function 'get_compat_sigevent'
[...]

imho this simple hunk could be helpfull:
--- ./include/linux/compat_siginfo.h.Orig       2006-03-24 14:04:10.00000=
0000
+0100
+++ ./include/linux/compat_siginfo.h    2006-03-24 14:24:49.000000000 +01=
00
@@ -171,6 +171,9 @@
 
 #endif /* !HAVE_ARCH_COMPAT_COPY_SIGINFO */
 
+extern int get_compat_sigevent(struct sigevent *event,
+                       const struct compat_sigevent __user *u_event);
+
 extern int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, stru=
ct
siginfo *from);
 extern int compat_copy_siginfo_from_user(struct siginfo *to, compat_sigi=
nfo_t
__user *from);
 
=3D=3D=3D=3D<>=3D=3D=3D=3D

If Ok can you ci?

TIA,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
