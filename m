Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFCC04845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Dec 2003 03:28:36 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 1ARqhU-00052I-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 04 Dec 2003 11:27:12 +0100
Date: Thu, 4 Dec 2003 11:27:08 +0100
Message-ID: <3FB25B960000DAD8@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3FB25B960000DAD8/mail.tiscali.be"
Subject: [parisc-linux] 2.4.23 semctl_broken -> semctl
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

--========/3FB25B960000DAD8/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi pa,

This is the last chunk I find interesting (as James and Carlos work iirc):
=========><=========
diff -NaurX dontdiff linux-2.4.23-pa1/arch/parisc/kernel/sys_parisc32.c linux-2.4.23-rc5-pa17/arch/parisc/kernel/sys_parisc32.c
--- linux-2.4.23-pa1/arch/parisc/kernel/sys_parisc32.c	2003-09-22 09:06:22.000000000
+0200
+++ linux-2.4.23-rc5-pa17/arch/parisc/kernel/sys_parisc32.c	2003-11-12 11:01:43.000000000
+0100
@@ -3196,12 +3196,10 @@
 	return sys_lseek(fd, offset, origin);
 }
 
-asmlinkage long sys32_semctl_broken(int semid, int semnum, int cmd, union
semun arg)
+asmlinkage long sys32_semctl(int semid, int semnum, int cmd, union semun
arg)
 {
         union semun u;
 	
-	cmd &= ~IPC_64; /* should be removed together with the _broken suffix */
-
         if (cmd == SETVAL) {
                 /* Ugh.  arg is a union of int,ptr,ptr,ptr, so is 8 bytes.
                  * The int should be in the first 4, but our argument
diff -NaurX dontdiff linux-2.4.23-pa1/arch/parisc/kernel/sys_parisc.c linux-2.4.23-rc5-pa17/arch/parisc/kernel/sys_parisc.c
--- linux-2.4.23-pa1/arch/parisc/kernel/sys_parisc.c	2001-11-23 22:54:28.000000000
+0100
+++ linux-2.4.23-rc5-pa17/arch/parisc/kernel/sys_parisc.c	2003-11-12 11:01:00.000000000
+0100
@@ -153,106 +153,3 @@
 	return raddr;
 }
 
-
-/*
- * FIXME, please remove this crap as soon as possible
- *
- * This is here to fix up broken glibc structures, 
- * which are already fixed in newer glibcs
- */
-#include <linux/msg.h>
-#include <linux/sem.h>
-#include <linux/shm.h>
-#include "sys32.h"
-
-struct broken_ipc_perm
-{
-    key_t key;			/* Key.  */
-    uid_t uid;			/* Owner's user ID.  */
-    gid_t gid;			/* Owner's group ID.  */
-    uid_t cuid;			/* Creator's user ID.  */
-    gid_t cgid;			/* Creator's group ID.  */
-    unsigned short int mode;		/* Read/write permission.  */
-    unsigned short int __pad1;
-    unsigned short int seq;		/* Sequence number.  */
-    unsigned short int __pad2;
-    unsigned long int __unused1;
-    unsigned long int __unused2;
-};
-		    
-struct broken_shmid64_ds {
-	struct broken_ipc_perm	shm_perm;	/* operation perms */
-	size_t			shm_segsz;	/* size of segment (bytes) */
-#ifndef __LP64__
-	unsigned int		__pad1;
-#endif
-	__kernel_time_t		shm_atime;	/* last attach time */
-#ifndef __LP64__
-	unsigned int		__pad2;
-#endif
-	__kernel_time_t		shm_dtime;	/* last detach time */
-#ifndef __LP64__
-	unsigned int		__pad3;
-#endif
-	__kernel_time_t		shm_ctime;	/* last change time */
-	__kernel_pid_t		shm_cpid;	/* pid of creator */
-	__kernel_pid_t		shm_lpid;	/* pid of last operator */
-	unsigned int		shm_nattch;	/* no. of current attaches */
-	unsigned int		__unused1;
-	unsigned int		__unused2;
-};
-
-static void convert_broken_perm (struct broken_ipc_perm *out, struct ipc64_perm
*in)
-{
-	out->key  = in->key;
-	out->uid  = in->uid;
-	out->gid  = in->gid;
-	out->cuid = in->cuid;
-	out->cgid = in->cgid;
-	out->mode = in->mode;
-	out->seq  = in->seq;
-}
-
-static int copyout_broken_shmid64(struct broken_shmid64_ds *buf, struct
shmid64_ds *sbuf)
-{
-	struct broken_shmid64_ds tbuf;
-	
-	memset(&tbuf, 0, sizeof tbuf);
-	convert_broken_perm (&tbuf.shm_perm, &sbuf->shm_perm);
-	tbuf.shm_segsz = sbuf->shm_segsz;
-	tbuf.shm_atime = sbuf->shm_atime;
-	tbuf.shm_dtime = sbuf->shm_dtime;
-	tbuf.shm_ctime = sbuf->shm_ctime;
-	tbuf.shm_cpid = sbuf->shm_cpid;
-	tbuf.shm_lpid = sbuf->shm_lpid;
-	tbuf.shm_nattch = sbuf->shm_nattch;
-	return copy_to_user(buf, &tbuf, sizeof tbuf);
-}
-
-int sys_msgctl_broken(int msqid, int cmd, struct msqid_ds *buf)
-{
-	return sys_msgctl (msqid, cmd & ~IPC_64, buf);
-}
-
-int sys_semctl_broken(int semid, int semnum, int cmd, union semun arg)
-{
-	return sys_semctl (semid, semnum, cmd & ~IPC_64, arg);
-}
-
-int sys_shmctl_broken(int shmid, int cmd, struct shmid64_ds *buf)
-{
-	struct shmid64_ds sbuf;
-	int err;
-
-	if (cmd & IPC_64) {
-		cmd &= ~IPC_64;
-		if (cmd == IPC_STAT || cmd == SHM_STAT) {
-			KERNEL_SYSCALL(err, sys_shmctl, shmid, cmd, (struct shmid_ds *)&sbuf);
-			if (err == 0)
-				err = copyout_broken_shmid64((struct broken_shmid64_ds *)buf, &sbuf);
-			return err;
-		}
-	}
-	return sys_shmctl (shmid, cmd, (struct shmid_ds *)buf);
-}
-
diff -NaurX dontdiff linux-2.4.23-pa1/arch/parisc/kernel/syscall.S linux-2.4.23-rc5-pa17/arch/parisc/kernel/syscall.S
--- linux-2.4.23-pa1/arch/parisc/kernel/syscall.S	2003-08-26 07:42:18.000000000
+0200
+++ linux-2.4.23-rc5-pa17/arch/parisc/kernel/syscall.S	2003-11-12 11:03:22.000000000
+0100
@@ -577,15 +577,15 @@
 	ENTRY_DIFF(recvmsg)
 	ENTRY_SAME(semop)		/* 185 */
 	ENTRY_SAME(semget)
-	ENTRY_DIFF(semctl_broken)
+	ENTRY_DIFF(semctl)
 	ENTRY_DIFF(msgsnd)
 	ENTRY_DIFF(msgrcv)
 	ENTRY_SAME(msgget)		/* 190 */
-	ENTRY_SAME(msgctl_broken)
+	ENTRY_SAME(msgctl)
 	ENTRY_SAME(shmat_wrapper)
 	ENTRY_SAME(shmdt)
 	ENTRY_SAME(shmget)
-	ENTRY_SAME(shmctl_broken)		/* 195 */
+	ENTRY_SAME(shmctl)		/* 195 */
 	ENTRY_SAME(ni_syscall)		/* streams1 */
 	ENTRY_SAME(ni_syscall)		/* streams2 */
 	ENTRY_SAME(lstat64)
========><========

hth,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr



--========/3FB25B960000DAD8/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="arch_parisc_kernel_sys_parisc.c.patch"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi40LjIzLXBhMS9hcmNoL3BhcmlzYy9rZXJuZWwv
c3lzX3BhcmlzYy5jIGxpbnV4LTIuNC4yMy1yYzUtcGExNy9hcmNoL3BhcmlzYy9rZXJuZWwvc3lz
X3BhcmlzYy5jCi0tLSBsaW51eC0yLjQuMjMtcGExL2FyY2gvcGFyaXNjL2tlcm5lbC9zeXNfcGFy
aXNjLmMJMjAwMS0xMS0yMyAyMjo1NDoyOC4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIuNC4y
My1yYzUtcGExNy9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzX3BhcmlzYy5jCTIwMDMtMTEtMTIgMTE6
MDE6MDAuMDAwMDAwMDAwICswMTAwCkBAIC0xNTMsMTA2ICsxNTMsMyBAQAogCXJldHVybiByYWRk
cjsKIH0KIAotCi0vKgotICogRklYTUUsIHBsZWFzZSByZW1vdmUgdGhpcyBjcmFwIGFzIHNvb24g
YXMgcG9zc2libGUKLSAqCi0gKiBUaGlzIGlzIGhlcmUgdG8gZml4IHVwIGJyb2tlbiBnbGliYyBz
dHJ1Y3R1cmVzLCAKLSAqIHdoaWNoIGFyZSBhbHJlYWR5IGZpeGVkIGluIG5ld2VyIGdsaWJjcwot
ICovCi0jaW5jbHVkZSA8bGludXgvbXNnLmg+Ci0jaW5jbHVkZSA8bGludXgvc2VtLmg+Ci0jaW5j
bHVkZSA8bGludXgvc2htLmg+Ci0jaW5jbHVkZSAic3lzMzIuaCIKLQotc3RydWN0IGJyb2tlbl9p
cGNfcGVybQotewotICAgIGtleV90IGtleTsJCQkvKiBLZXkuICAqLwotICAgIHVpZF90IHVpZDsJ
CQkvKiBPd25lcidzIHVzZXIgSUQuICAqLwotICAgIGdpZF90IGdpZDsJCQkvKiBPd25lcidzIGdy
b3VwIElELiAgKi8KLSAgICB1aWRfdCBjdWlkOwkJCS8qIENyZWF0b3IncyB1c2VyIElELiAgKi8K
LSAgICBnaWRfdCBjZ2lkOwkJCS8qIENyZWF0b3IncyBncm91cCBJRC4gICovCi0gICAgdW5zaWdu
ZWQgc2hvcnQgaW50IG1vZGU7CQkvKiBSZWFkL3dyaXRlIHBlcm1pc3Npb24uICAqLwotICAgIHVu
c2lnbmVkIHNob3J0IGludCBfX3BhZDE7Ci0gICAgdW5zaWduZWQgc2hvcnQgaW50IHNlcTsJCS8q
IFNlcXVlbmNlIG51bWJlci4gICovCi0gICAgdW5zaWduZWQgc2hvcnQgaW50IF9fcGFkMjsKLSAg
ICB1bnNpZ25lZCBsb25nIGludCBfX3VudXNlZDE7Ci0gICAgdW5zaWduZWQgbG9uZyBpbnQgX191
bnVzZWQyOwotfTsKLQkJICAgIAotc3RydWN0IGJyb2tlbl9zaG1pZDY0X2RzIHsKLQlzdHJ1Y3Qg
YnJva2VuX2lwY19wZXJtCXNobV9wZXJtOwkvKiBvcGVyYXRpb24gcGVybXMgKi8KLQlzaXplX3QJ
CQlzaG1fc2Vnc3o7CS8qIHNpemUgb2Ygc2VnbWVudCAoYnl0ZXMpICovCi0jaWZuZGVmIF9fTFA2
NF9fCi0JdW5zaWduZWQgaW50CQlfX3BhZDE7Ci0jZW5kaWYKLQlfX2tlcm5lbF90aW1lX3QJCXNo
bV9hdGltZTsJLyogbGFzdCBhdHRhY2ggdGltZSAqLwotI2lmbmRlZiBfX0xQNjRfXwotCXVuc2ln
bmVkIGludAkJX19wYWQyOwotI2VuZGlmCi0JX19rZXJuZWxfdGltZV90CQlzaG1fZHRpbWU7CS8q
IGxhc3QgZGV0YWNoIHRpbWUgKi8KLSNpZm5kZWYgX19MUDY0X18KLQl1bnNpZ25lZCBpbnQJCV9f
cGFkMzsKLSNlbmRpZgotCV9fa2VybmVsX3RpbWVfdAkJc2htX2N0aW1lOwkvKiBsYXN0IGNoYW5n
ZSB0aW1lICovCi0JX19rZXJuZWxfcGlkX3QJCXNobV9jcGlkOwkvKiBwaWQgb2YgY3JlYXRvciAq
LwotCV9fa2VybmVsX3BpZF90CQlzaG1fbHBpZDsJLyogcGlkIG9mIGxhc3Qgb3BlcmF0b3IgKi8K
LQl1bnNpZ25lZCBpbnQJCXNobV9uYXR0Y2g7CS8qIG5vLiBvZiBjdXJyZW50IGF0dGFjaGVzICov
Ci0JdW5zaWduZWQgaW50CQlfX3VudXNlZDE7Ci0JdW5zaWduZWQgaW50CQlfX3VudXNlZDI7Ci19
OwotCi1zdGF0aWMgdm9pZCBjb252ZXJ0X2Jyb2tlbl9wZXJtIChzdHJ1Y3QgYnJva2VuX2lwY19w
ZXJtICpvdXQsIHN0cnVjdCBpcGM2NF9wZXJtICppbikKLXsKLQlvdXQtPmtleSAgPSBpbi0+a2V5
OwotCW91dC0+dWlkICA9IGluLT51aWQ7Ci0Jb3V0LT5naWQgID0gaW4tPmdpZDsKLQlvdXQtPmN1
aWQgPSBpbi0+Y3VpZDsKLQlvdXQtPmNnaWQgPSBpbi0+Y2dpZDsKLQlvdXQtPm1vZGUgPSBpbi0+
bW9kZTsKLQlvdXQtPnNlcSAgPSBpbi0+c2VxOwotfQotCi1zdGF0aWMgaW50IGNvcHlvdXRfYnJv
a2VuX3NobWlkNjQoc3RydWN0IGJyb2tlbl9zaG1pZDY0X2RzICpidWYsIHN0cnVjdCBzaG1pZDY0
X2RzICpzYnVmKQotewotCXN0cnVjdCBicm9rZW5fc2htaWQ2NF9kcyB0YnVmOwotCQotCW1lbXNl
dCgmdGJ1ZiwgMCwgc2l6ZW9mIHRidWYpOwotCWNvbnZlcnRfYnJva2VuX3Blcm0gKCZ0YnVmLnNo
bV9wZXJtLCAmc2J1Zi0+c2htX3Blcm0pOwotCXRidWYuc2htX3NlZ3N6ID0gc2J1Zi0+c2htX3Nl
Z3N6OwotCXRidWYuc2htX2F0aW1lID0gc2J1Zi0+c2htX2F0aW1lOwotCXRidWYuc2htX2R0aW1l
ID0gc2J1Zi0+c2htX2R0aW1lOwotCXRidWYuc2htX2N0aW1lID0gc2J1Zi0+c2htX2N0aW1lOwot
CXRidWYuc2htX2NwaWQgPSBzYnVmLT5zaG1fY3BpZDsKLQl0YnVmLnNobV9scGlkID0gc2J1Zi0+
c2htX2xwaWQ7Ci0JdGJ1Zi5zaG1fbmF0dGNoID0gc2J1Zi0+c2htX25hdHRjaDsKLQlyZXR1cm4g
Y29weV90b191c2VyKGJ1ZiwgJnRidWYsIHNpemVvZiB0YnVmKTsKLX0KLQotaW50IHN5c19tc2dj
dGxfYnJva2VuKGludCBtc3FpZCwgaW50IGNtZCwgc3RydWN0IG1zcWlkX2RzICpidWYpCi17Ci0J
cmV0dXJuIHN5c19tc2djdGwgKG1zcWlkLCBjbWQgJiB+SVBDXzY0LCBidWYpOwotfQotCi1pbnQg
c3lzX3NlbWN0bF9icm9rZW4oaW50IHNlbWlkLCBpbnQgc2VtbnVtLCBpbnQgY21kLCB1bmlvbiBz
ZW11biBhcmcpCi17Ci0JcmV0dXJuIHN5c19zZW1jdGwgKHNlbWlkLCBzZW1udW0sIGNtZCAmIH5J
UENfNjQsIGFyZyk7Ci19Ci0KLWludCBzeXNfc2htY3RsX2Jyb2tlbihpbnQgc2htaWQsIGludCBj
bWQsIHN0cnVjdCBzaG1pZDY0X2RzICpidWYpCi17Ci0Jc3RydWN0IHNobWlkNjRfZHMgc2J1ZjsK
LQlpbnQgZXJyOwotCi0JaWYgKGNtZCAmIElQQ182NCkgewotCQljbWQgJj0gfklQQ182NDsKLQkJ
aWYgKGNtZCA9PSBJUENfU1RBVCB8fCBjbWQgPT0gU0hNX1NUQVQpIHsKLQkJCUtFUk5FTF9TWVND
QUxMKGVyciwgc3lzX3NobWN0bCwgc2htaWQsIGNtZCwgKHN0cnVjdCBzaG1pZF9kcyAq
KSZzYnVmKTsKLQkJCWlmIChlcnIgPT0gMCkKLQkJCQllcnIgPSBjb3B5b3V0X2Jyb2tlbl9zaG1p
ZDY0KChzdHJ1Y3QgYnJva2VuX3NobWlkNjRfZHMgKilidWYsICZzYnVmKTsKLQkJCXJldHVybiBl
cnI7Ci0JCX0KLQl9Ci0JcmV0dXJuIHN5c19zaG1jdGwgKHNobWlkLCBjbWQsIChzdHJ1Y3Qgc2ht
aWRfZHMgKilidWYpOwotfQotCg==


--========/3FB25B960000DAD8/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="arch_parisc_kernel_sys_parisc32.c.patch"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi40LjIzLXBhMS9hcmNoL3BhcmlzYy9rZXJuZWwv
c3lzX3BhcmlzYzMyLmMgbGludXgtMi40LjIzLXJjNS1wYTE3L2FyY2gvcGFyaXNjL2tlcm5lbC9z
eXNfcGFyaXNjMzIuYwotLS0gbGludXgtMi40LjIzLXBhMS9hcmNoL3BhcmlzYy9rZXJuZWwvc3lz
X3BhcmlzYzMyLmMJMjAwMy0wOS0yMiAwOTowNjoyMi4wMDAwMDAwMDAgKzAyMDAKKysrIGxpbnV4
LTIuNC4yMy1yYzUtcGExNy9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzX3BhcmlzYzMyLmMJMjAwMy0x
MS0xMiAxMTowMTo0My4wMDAwMDAwMDAgKzAxMDAKQEAgLTMxOTYsMTIgKzMxOTYsMTAgQEAKIAly
ZXR1cm4gc3lzX2xzZWVrKGZkLCBvZmZzZXQsIG9yaWdpbik7CiB9CiAKLWFzbWxpbmthZ2UgbG9u
ZyBzeXMzMl9zZW1jdGxfYnJva2VuKGludCBzZW1pZCwgaW50IHNlbW51bSwgaW50IGNtZCwgdW5p
b24gc2VtdW4gYXJnKQorYXNtbGlua2FnZSBsb25nIHN5czMyX3NlbWN0bChpbnQgc2VtaWQsIGlu
dCBzZW1udW0sIGludCBjbWQsIHVuaW9uIHNlbXVuIGFyZykKIHsKICAgICAgICAgdW5pb24gc2Vt
dW4gdTsKIAkKLQljbWQgJj0gfklQQ182NDsgLyogc2hvdWxkIGJlIHJlbW92ZWQgdG9nZXRoZXIg
d2l0aCB0aGUgX2Jyb2tlbiBzdWZmaXggKi8KLQogICAgICAgICBpZiAoY21kID09IFNFVFZBTCkg
ewogICAgICAgICAgICAgICAgIC8qIFVnaC4gIGFyZyBpcyBhIHVuaW9uIG9mIGludCxwdHIscHRy
LHB0ciwgc28gaXMgOCBieXRlcy4KICAgICAgICAgICAgICAgICAgKiBUaGUgaW50IHNob3VsZCBi
ZSBpbiB0aGUgZmlyc3QgNCwgYnV0IG91ciBhcmd1bWVudAo=


--========/3FB25B960000DAD8/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="arch_parisc_kernel_syscall.S.patch"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi40LjIzLXBhMS9hcmNoL3BhcmlzYy9rZXJuZWwv
c3lzY2FsbC5TIGxpbnV4LTIuNC4yMy1yYzUtcGExNy9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzY2Fs
bC5TCi0tLSBsaW51eC0yLjQuMjMtcGExL2FyY2gvcGFyaXNjL2tlcm5lbC9zeXNjYWxsLlMJMjAw
My0wOC0yNiAwNzo0MjoxOC4wMDAwMDAwMDAgKzAyMDAKKysrIGxpbnV4LTIuNC4yMy1yYzUtcGEx
Ny9hcmNoL3BhcmlzYy9rZXJuZWwvc3lzY2FsbC5TCTIwMDMtMTEtMTIgMTE6MDM6MjIuMDAwMDAw
MDAwICswMTAwCkBAIC01NzcsMTUgKzU3NywxNSBAQAogCUVOVFJZX0RJRkYocmVjdm1zZykKIAlF
TlRSWV9TQU1FKHNlbW9wKQkJLyogMTg1ICovCiAJRU5UUllfU0FNRShzZW1nZXQpCi0JRU5UUllf
RElGRihzZW1jdGxfYnJva2VuKQorCUVOVFJZX0RJRkYoc2VtY3RsKQogCUVOVFJZX0RJRkYobXNn
c25kKQogCUVOVFJZX0RJRkYobXNncmN2KQogCUVOVFJZX1NBTUUobXNnZ2V0KQkJLyogMTkwICov
Ci0JRU5UUllfU0FNRShtc2djdGxfYnJva2VuKQorCUVOVFJZX1NBTUUobXNnY3RsKQogCUVOVFJZ
X1NBTUUoc2htYXRfd3JhcHBlcikKIAlFTlRSWV9TQU1FKHNobWR0KQogCUVOVFJZX1NBTUUoc2ht
Z2V0KQotCUVOVFJZX1NBTUUoc2htY3RsX2Jyb2tlbikJCS8qIDE5NSAqLworCUVOVFJZX1NBTUUo
c2htY3RsKQkJLyogMTk1ICovCiAJRU5UUllfU0FNRShuaV9zeXNjYWxsKQkJLyogc3RyZWFtczEg
Ki8KIAlFTlRSWV9TQU1FKG5pX3N5c2NhbGwpCQkvKiBzdHJlYW1zMiAqLwogCUVOVFJZX1NBTUUo
bHN0YXQ2NCkK

--========/3FB25B960000DAD8/mail.tiscali.be--
