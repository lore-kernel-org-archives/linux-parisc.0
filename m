Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6853482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jul 2003 09:10:16 -0600 (MDT)
Date: Wed, 2 Jul 2003 17:10:13 +0200
Message-ID: <3ED70CF10000D286@ocpmta2.freegates.net>
In-Reply-To: <20030701181327.GC14683@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] byte swapping redux
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3ED70CF10000D286/mail.tiscali.be"
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

--========/3ED70CF10000D286/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit


> Maybe our userspace will encounter this problem as well since I've
> ripped out the __STRICT_ANSI__ test...can you work this out?

I will see what I can do for this 

> > I also write this small testcase to try to point out the pb in 32bits
mode:
> ...
> > And here is the results:
> > Val of TU64: fedcba9876543210
> > Val of ___arch__swab64(TU64): 76543210fedcba98
> > Val of __fswab64(TU64): 1032547698badcfe
[...]
> __fswab64() is correct.
> ___arch__swab64() didn't actually swap within the  32-bit word
[...]

static __inline__ __const__ __u64 ___arch__swab64(__u64 x)
{
	__u32 t1 = (__u32) x;
	__u32 t2 = (__u32) ((x) >> 32);
	return ((__u64) ___arch__swab32(t1) << 32) + ((__u64) ___arch__swab32(t2))
>     
}

That works for my 32bits kernel on my b2k :-) (just replace 't1' by 'l' and
't2' by 'h' ;) )

btw here is also a small patch I just test also for cdrom pb encounter by
somebody else:
--- system_irqsave.h.orig	2003-07-02 17:34:02.000000000 +0200
+++ system_irqsave.h	2003-07-02 17:35:59.000000000 +0200
@@ -7,8 +7,13 @@
 #define __cli()	__asm__ __volatile__("rsm %0,%%r0\n" : : "i" (PSW_I) : "memory"
)
 #define __sti()	__asm__ __volatile__("ssm %0,%%r0\n" : : "i" (PSW_I) : "memory"
)
 
+#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
+#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
+
+/* For spinlocks etc */
 #define local_irq_save(x) \
 	__asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )
+#define local_irq_set(x)   __save_and_sti(x)
 #define local_irq_restore(x) \
 	__asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )
 #define local_irq_disable() __cli()

( may be possible to do better ??)

Joel





---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be



--========/3ED70CF10000D286/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="system_irqsave-patch"

LS0tIHN5c3RlbV9pcnFzYXZlLmgub3JpZwkyMDAzLTA3LTAyIDE3OjM0OjAyLjAwMDAwMDAwMCAr
MDIwMAorKysgc3lzdGVtX2lycXNhdmUuaAkyMDAzLTA3LTAyIDE3OjM1OjU5LjAwMDAwMDAwMCAr
MDIwMApAQCAtNyw4ICs3LDEzIEBACiAjZGVmaW5lIF9fY2xpKCkJX19hc21fXyBfX3ZvbGF0aWxl
X18oInJzbSAlMCwlJXIwXG4iIDogOiAiaSIgKFBTV19JKSA6ICJtZW1vcnkiICkKICNkZWZpbmUg
X19zdGkoKQlfX2FzbV9fIF9fdm9sYXRpbGVfXygic3NtICUwLCUlcjBcbiIgOiA6ICJpIiAoUFNX
X0kpIDogIm1lbW9yeSIgKQogCisjZGVmaW5lIF9fc2F2ZV9hbmRfY2xpKHgpICBkbyB7IF9fc2F2
ZV9mbGFncyh4KTsgX19jbGkoKTsgfSB3aGlsZSgwKTsKKyNkZWZpbmUgX19zYXZlX2FuZF9zdGko
eCkgIGRvIHsgX19zYXZlX2ZsYWdzKHgpOyBfX3N0aSgpOyB9IHdoaWxlKDApOworCisvKiBGb3Ig
c3BpbmxvY2tzIGV0YyAqLwogI2RlZmluZSBsb2NhbF9pcnFfc2F2ZSh4KSBcCiAJX19hc21fXyBf
X3ZvbGF0aWxlX18oInJzbSAlMSwlMCIgOiAiPXIiICh4KSA6ImkiIChQU1dfSSkgOiAibWVtb3J5
IiApCisjZGVmaW5lIGxvY2FsX2lycV9zZXQoeCkgICBfX3NhdmVfYW5kX3N0aSh4KQogI2RlZmlu
ZSBsb2NhbF9pcnFfcmVzdG9yZSh4KSBcCiAJX19hc21fXyBfX3ZvbGF0aWxlX18oIm10c20gJTAi
IDogOiAiciIgKHgpIDogIm1lbW9yeSIgKQogI2RlZmluZSBsb2NhbF9pcnFfZGlzYWJsZSgpIF9f
Y2xpKCkK

--========/3ED70CF10000D286/mail.tiscali.be--
