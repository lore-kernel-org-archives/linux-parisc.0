Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5615C4875
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Mar 2004 00:35:57 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1B5gS4-0004Ts-00
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Mar 2004 08:35:56 +0100
Date: Tue, 23 Mar 2004 08:35:54 +0100
Message-ID: <40561EAF000053B8@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "PA-RISC Linux Port" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/40561EAF000053B8/mail.tiscali.be"
Subject: [parisc-linux] Cast of lvalue warning in the last k 2.6.5-rc2 with
	last gcc-3.3
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/40561EAF000053B8/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,

here is a warning during the last kernel build (2.6.5-rc2):
  gcc -Wp,-MD,arch/parisc/lib/.bitops.o.d -nostdinc -iwithprefix include
-D__KERNEL__ -Iinclude  -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes
-Wno-trigraphs
-fno-strict-aliasing -fno-common -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000 -O2 -fomit-frame-pointer
    -DKBUILD_BASENAME=bitops -DKBUILD_MODNAME=bitops -c -o arch/parisc/lib/bitops.o
arch/parisc/lib/bitops.c
arch/parisc/lib/bitops.c: In function `__xchg32':
arch/parisc/lib/bitops.c:40: warning: use of cast expressions as lvalues
is deprecated
arch/parisc/lib/bitops.c: In function `__xchg8':
arch/parisc/lib/bitops.c:53: warning: use of cast expressions as lvalues
is deprecated

And here is a patch proposal:
--- /usr/src/linux-2.6.5-rc2-pa2/arch/parisc/lib/bitops.c.orig	2004-03-22
08:35:45.000000000 +0100
+++ /usr/src/linux-2.6.5-rc2-pa2/arch/parisc/lib/bitops.c	2004-03-22 08:42:10.000000000
+0100
@@ -33,11 +33,10 @@
 
 unsigned long __xchg32(int x, int *ptr)
 {
-	unsigned long flags;
-	unsigned long temp;
+	unsigned long temp, flags;
 
 	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
-	(long) temp = (long) *ptr;	/* XXX - sign extension wanted? */
+	temp = (unsigned long) *ptr;	/* XXX - sign extension wanted? */
 	*ptr = x;
 	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return temp;
@@ -46,11 +45,10 @@
 
 unsigned long __xchg8(char x, char *ptr)
 {
-	unsigned long flags;
-	unsigned long temp;
+	unsigned long temp, flags;
 
 	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
-	(long) temp = (long) *ptr;	/* XXX - sign extension wanted? */
+	temp = (unsigned long) *ptr;	/* XXX - sign extension wanted? */
 	*ptr = x;
 	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return temp;
@@ -60,8 +58,7 @@
 #ifdef __LP64__
 unsigned long __cmpxchg_u64(volatile unsigned long *ptr, unsigned long old,
unsigned long new)
 {
-	unsigned long flags;
-	unsigned long prev;
+	unsigned long prev, flags;
 
 	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
 	if ((prev = *ptr) == old)
==========><=========

What do you thing about?

hth,
    Joel

PS1: attached patch in case of bad wrapping webmail

PS2: still have to make the same exercise for:
  gcc -Wp,-MD,arch/parisc/lib/.io.o.d -nostdinc -iwithprefix include -D__KERNEL__
-Iinclude  -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000 -O2 -fomit-frame-pointer
    -DKBUILD_BASENAME=io -DKBUILD_MODNAME=io -c -o arch/parisc/lib/io.o arch/parisc/lib/io.c
arch/parisc/lib/io.c: In function `__memcpy_toio':
arch/parisc/lib/io.c:24: warning: use of cast expressions as lvalues is deprecated
arch/parisc/lib/io.c:24: warning: use of cast expressions as lvalues is deprecated
...

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr




--========/40561EAF000053B8/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bitops.c.diff"

LS0tIC91c3Ivc3JjL2xpbnV4LTIuNi41LXJjMi1wYTIvYXJjaC9wYXJpc2MvbGliL2JpdG9wcy5j
Lm9yaWcJMjAwNC0wMy0yMiAwODozNTo0NS4wMDAwMDAwMDAgKzAxMDAKKysrIC91c3Ivc3JjL2xp
bnV4LTIuNi41LXJjMi1wYTIvYXJjaC9wYXJpc2MvbGliL2JpdG9wcy5jCTIwMDQtMDMtMjIgMDg6
NDI6MTAuMDAwMDAwMDAwICswMTAwCkBAIC0zMywxMSArMzMsMTAgQEAKIAogdW5zaWduZWQgbG9u
ZyBfX3hjaGczMihpbnQgeCwgaW50ICpwdHIpCiB7Ci0JdW5zaWduZWQgbG9uZyBmbGFnczsKLQl1
bnNpZ25lZCBsb25nIHRlbXA7CisJdW5zaWduZWQgbG9uZyB0ZW1wLCBmbGFnczsKIAogCWF0b21p
Y19zcGluX2xvY2tfaXJxc2F2ZShBVE9NSUNfSEFTSChwdHIpLCBmbGFncyk7Ci0JKGxvbmcpIHRl
bXAgPSAobG9uZykgKnB0cjsJLyogWFhYIC0gc2lnbiBleHRlbnNpb24gd2FudGVkPyAqLworCXRl
bXAgPSAodW5zaWduZWQgbG9uZykgKnB0cjsJLyogWFhYIC0gc2lnbiBleHRlbnNpb24gd2FudGVk
PyAqLwogCSpwdHIgPSB4OwogCWF0b21pY19zcGluX3VubG9ja19pcnFyZXN0b3JlKEFUT01JQ19I
QVNIKHB0ciksIGZsYWdzKTsKIAlyZXR1cm4gdGVtcDsKQEAgLTQ2LDExICs0NSwxMCBAQAogCiB1
bnNpZ25lZCBsb25nIF9feGNoZzgoY2hhciB4LCBjaGFyICpwdHIpCiB7Ci0JdW5zaWduZWQgbG9u
ZyBmbGFnczsKLQl1bnNpZ25lZCBsb25nIHRlbXA7CisJdW5zaWduZWQgbG9uZyB0ZW1wLCBmbGFn
czsKIAogCWF0b21pY19zcGluX2xvY2tfaXJxc2F2ZShBVE9NSUNfSEFTSChwdHIpLCBmbGFncyk7
Ci0JKGxvbmcpIHRlbXAgPSAobG9uZykgKnB0cjsJLyogWFhYIC0gc2lnbiBleHRlbnNpb24gd2Fu
dGVkPyAqLworCXRlbXAgPSAodW5zaWduZWQgbG9uZykgKnB0cjsJLyogWFhYIC0gc2lnbiBleHRl
bnNpb24gd2FudGVkPyAqLwogCSpwdHIgPSB4OwogCWF0b21pY19zcGluX3VubG9ja19pcnFyZXN0
b3JlKEFUT01JQ19IQVNIKHB0ciksIGZsYWdzKTsKIAlyZXR1cm4gdGVtcDsKQEAgLTYwLDggKzU4
LDcgQEAKICNpZmRlZiBfX0xQNjRfXwogdW5zaWduZWQgbG9uZyBfX2NtcHhjaGdfdTY0KHZvbGF0
aWxlIHVuc2lnbmVkIGxvbmcgKnB0ciwgdW5zaWduZWQgbG9uZyBvbGQsIHVuc2lnbmVkIGxvbmcg
bmV3KQogewotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0JdW5zaWduZWQgbG9uZyBwcmV2OworCXVu
c2lnbmVkIGxvbmcgcHJldiwgZmxhZ3M7CiAKIAlhdG9taWNfc3Bpbl9sb2NrX2lycXNhdmUoQVRP
TUlDX0hBU0gocHRyKSwgZmxhZ3MpOwogCWlmICgocHJldiA9ICpwdHIpID09IG9sZCkK

--========/40561EAF000053B8/mail.tiscali.be--
