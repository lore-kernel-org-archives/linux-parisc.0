Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 781E1489E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 06:16:45 -0700 (MST)
Date: Wed, 18 Feb 2004 14:16:36 +0100
Message-ID: <402A42A1000052A9@ocpmta1.freegates.net>
In-Reply-To: <20040217211041.GB12535@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/402A42A1000052A9/mail.tiscali.be"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/402A42A1000052A9/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Carlos,

>I'm building with a fix right now "__attribute__((used))" to war
> gcc-3.5 that it should not remove the function. I hadn't even realized
>that it was only being called by assembly, hence gcc-3.5 is doing a
>*better* job of removing apparently dead code.
>
>When the build finishes I'll update my glibc patches online

Ah :)
So you would certainly need some more hack because of lvalue casting.
Here are some one which could already help you:
--- glibc-2.3.3-20040212/iconv/gconv_simple.c	2004-02-07 17:27:50.000000000
+0100
+++ glibc-2.3.3-20040209/iconv/gconv_simple.c	2004-02-09 18:44:41.217390320
+0100
@@ -453,9 +453,11 @@
 #if __BYTE_ORDER == __BIG_ENDIAN
   /* Sigh, we have to do some real work.  */
   size_t cnt;
+  uint32_t *outptr32 = (uint32_t *) outptr;
 
   for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
-    *((uint32_t *) outptr)++ = bswap_32 (*(const uint32_t *) inptr);
+    *outptr32++ = bswap_32 (*(const uint32_t *) inptr);
+  outptr = (unsigned char *) outptr32;
 
   *inptrp = inptr;
   *outptrp = outptr;
=========><=========
I already submitted it and accepted by its maintainer (as it is just a complement
to his job) but not yet ci.

=========><=========
--- glibc-2.3.3-20040212/elf/dl-load.c	2004-02-09 08:03:48.000000000 +0100
+++ glibc-2.3.3-20040209/elf/dl-load.c	2004-02-10 16:32:53.250787488 +0100
@@ -1226,9 +1226,13 @@
 			    (header->e_phnum * sizeof (ElfW(Phdr))));
 	l->l_phdr_allocated = 1;
       }
-    else
+    else {
       /* Adjust the PT_PHDR value by the runtime load address.  */
-      (ElfW(Addr)) l->l_phdr += l->l_addr;
+      /*       (ElfW(Addr)) l->l_phdr += l->l_addr; */
+      ElfW(Addr) *tmpp = (ElfW(Addr) *) l->l_phdr;
+      tmpp += l->l_addr;
+      l->l_phdr = (ElfW(Phdr) *) tmpp;
+    }
   }
 
 #ifdef USE_TLS
@@ -1253,8 +1257,12 @@
 	  goto call_lose;
 	}
     }
-  else
-    (ElfW(Addr)) l->l_ld += l->l_addr;
+  else {
+    /* (ElfW(Addr)) l->l_ld += l->l_addr; */
+    ElfW(Addr) *tmpp = (ElfW(Addr) *) l->l_phdr;
+    tmpp += l->l_addr;
+    l->l_phdr = (ElfW(Phdr) *) tmpp;
+  }
 
   l->l_entry += l->l_addr;
 
=========><=========
--- glibc-2.3.3-20040212/sunrpc/rpc/xdr.h	2002-12-16 03:05:49.000000000 +0100
+++ glibc-2.3.3-20040209/sunrpc/rpc/xdr.h	2004-02-10 11:43:02.022656032 +0100
@@ -263,9 +263,19 @@
  * in the RPC code will not work on 64bit Solaris platforms !
  */
 #define IXDR_GET_LONG(buf) \
-	((long)ntohl((u_long)*__extension__((u_int32_t*)(buf))++))
+	({			\
+	long l;			\
+	u_int32_t *buf_u32 = (u_int32_t *) buf;			\
+	l = ((long)ntohl((u_long)*__extension__(buf_u32)++));	\
+	buf = (__typeof__(*buf) *) buf_u32;			\
+	l;							\
+	})
 #define IXDR_PUT_LONG(buf, v) \
-	(*__extension__((u_int32_t*)(buf))++ = (long)htonl((u_long)(v)))
+	do {			\
+	u_int32_t *buf_u32 = (u_int32_t *) buf;			\
+	(*__extension__(buf_u32)++ = (long)htonl((u_long)(v)));	\
+	buf = (__typeof__(*buf) *) buf_u32;			\
+	} while (0)
 #define IXDR_GET_U_LONG(buf)	      ((u_long)IXDR_GET_LONG(buf))
 #define IXDR_PUT_U_LONG(buf, v)	      IXDR_PUT_LONG(buf, (long)(v))
 
=========><=========
But this one is just a very ugly (just quick and dirty :( )

but also:
--- glibc/iconvdata/euc-jisx0213.c.orig	2004-02-18 12:07:32.723703576 +0100
+++ glibc/iconvdata/euc-jisx0213.c	2004-02-18 12:10:13.832211360 +0100
@@ -83,7 +83,9 @@
 	  if (__builtin_expect (outbuf + 4 <= outend, 1))		      \
 	    {								      \
 	      /* Write out the last character.  */			      \
-	      *((uint32_t *) outbuf)++ = data->__statep->__count >> 3;	      \
+	      uint32_t *outptr32 = (uint32_t *) outbuf;			      \
+	      *outptr32++ = data->__statep->__count >> 3;		      \
+	      outbuf = (unsigned char *) outptr32;			      \
 	      data->__statep->__count = 0;				      \
 	    }								      \
 	  else								      \
--- glibc/iconvdata/iso-2022-cn-ext.c.orig	2004-02-18 11:13:48.000000000
+0100
+++ glibc/iconvdata/iso-2022-cn-ext.c	2004-02-18 11:21:56.511671032 +0100
@@ -171,6 +171,7 @@
 #define BODY \
   {									      \
     uint32_t ch = *inptr;						      \
+    uint32_t *outptr32 = (uint32_t *) outptr;				      \
 									      \
     /* This is a 7bit character set, disallow all 8bit characters.  */	
     \
     if (ch > 0x7f)							      \
@@ -377,7 +378,8 @@
 	  }								      \
       }									      \
 									      \
-    *((uint32_t *) outptr)++ = ch;					      \
+    *outptr32++ = ch;							      \
+    outptr = (unsigned char *) outptr32;				      \
   }
 #define EXTRA_LOOP_DECLS	, int *setp
 #define INIT_PARAMS		int set = (*setp >> 3) & CURRENT_MASK; \
--- glibc/iconvdata/shift_jisx0213.c.orig	2004-02-18 12:15:21.953369824 +0100
+++ glibc/iconvdata/shift_jisx0213.c	2004-02-18 12:16:30.127005856 +0100
@@ -83,7 +83,9 @@
 	  if (__builtin_expect (outbuf + 4 <= outend, 1))		      \
 	    {								      \
 	      /* Write out the last character.  */			      \
-	      *((uint32_t *) outbuf)++ = data->__statep->__count >> 3;	      \
+	      uint32_t *outptr32 = (uint32_t *) outbuf;			      \
+	      *outptr32++ = data->__statep->__count >> 3;		      \
+	      outbuf = (unsigned char *) outptr32;			      \
 	      data->__statep->__count = 0;				      \
 	    }								      \
 	  else								      \
--- glibc/iconvdata/tcvn5712-1.c.orig	2004-02-18 11:18:22.027277616 +0100
+++ glibc/iconvdata/tcvn5712-1.c	2004-02-18 11:54:17.527591760 +0100
@@ -68,7 +68,9 @@
 	  if (__builtin_expect (outbuf + 4 <= outend, 1))		      \
 	    {								      \
 	      /* Write out the last character.  */			      \
-	      *((uint32_t *) outbuf)++ = data->__statep->__count >> 3;	      \
+	      uint32_t *outptr32 = (uint32_t *) outbuf;			      \
+	      *outptr32++ = data->__statep->__count >> 3;		      \
+	      outbuf = (unsigned char *) outptr32;			      \
 	      data->__statep->__count = 0;				      \
 	    }								      \
 	  else								      \
--- glibc/iconvdata/tscii.c.orig	2004-02-18 12:23:37.289067352 +0100
+++ glibc/iconvdata/tscii.c	2004-02-18 12:24:25.417750680 +0100
@@ -98,7 +98,9 @@
 		  break;						      \
 		}							      \
 	      /* Write out the pending character.  */			      \
-	      *((uint32_t *) outbuf)++ = data->__statep->__count >> 8;	      \
+	      uint32_t *outptr32 = (uint32_t *) outbuf;			      \
+	      *outptr32++ = data->__statep->__count >> 8;		      \
+	      outbuf = (unsigned char *) outptr32;			      \
 	      /* Retrieve the successor state.  */			      \
 	      data->__statep->__count =					      \
 		tscii_next_state[(data->__statep->__count >> 4) & 0x0f];      \
=========><=========

But now I need more to try to complete job because:
make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]

Segmentation fault

And dmesg saying:

do_page_fault() pid=6547 command='ld.so.1' type=15 address=0x0016b690
vm_start = 0x00033000, vm_end = 0x00034000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000111100001111 Not tainted
r00-03  0000000000000000 000000004102b6fc 000000004100721f 00000000faf02040
r04-07  000000004102b6fc 00000000400002b8 00000000faf02158 00000000faf01d8c
r08-11  0000000040170000 0000000000170e60 000000004016fd98 00000000faf01dc0
r12-15  0000000040171e60 0000000000000002 00000000faf02128 ffffffffffffffff
r16-19  00000000faf02180 0000000000000003 0000000000000004 000000004102b6fc
r20-23  000000004102bd80 0000000000000008 000000000016b690 0000000040000000
r24-27  000000000016b690 0000000000001e60 0000000000000003 00000000000c97f0
r28-31  0000000040001000 0000000000000000 00000000faf02180 0000000041013fc7
sr0-3   0000000000003580 0000000000003580 0000000000000000 0000000000003580
sr4-7   0000000000003580 0000000000003580 0000000000003580 0000000000003580

IASQ: 0000000000003580 0000000000003580 IAOQ: 0000000041007293 0000000041007297
 IIR: 0ec01095    ISR: 0000000000003580  IOR: 000000000016b690
 CPU:        8   CR30: 000000003a038000 CR31: 00000000104a4000
 ORIG_R28: 0000000040170000
 IAOQ[0]: 0x41007293
 IAOQ[1]: 0x41007297
 RP(r2): 0x4100721f

But I need first to reboot with a new kernel (the present one was build with
gcc-hppa64-3.3 :( ).
Then get the very last gcc and glibc cvs and restart the scipt :)

hth,
    Joel

PS: I also join diff as files because of bad wraping of my webmail interface.


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr




--========/402A42A1000052A9/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="GLibC-diff"

LS0tIGdsaWJjLTIuMy4zLTIwMDQwMjEyL2VsZi9kbC1sb2FkLmMJMjAwNC0wMi0wOSAwODowMzo0
OC4wMDAwMDAwMDAgKzAxMDAKKysrIGdsaWJjLTIuMy4zLTIwMDQwMjA5L2VsZi9kbC1sb2FkLmMJ
MjAwNC0wMi0xMCAxNjozMjo1My4yNTA3ODc0ODggKzAxMDAKQEAgLTEyMjYsOSArMTIyNiwxMyBA
QAogCQkJICAgIChoZWFkZXItPmVfcGhudW0gKiBzaXplb2YgKEVsZlcoUGhkcikpKSk7CiAJbC0+
bF9waGRyX2FsbG9jYXRlZCA9IDE7CiAgICAgICB9Ci0gICAgZWxzZQorICAgIGVsc2UgewogICAg
ICAgLyogQWRqdXN0IHRoZSBQVF9QSERSIHZhbHVlIGJ5IHRoZSBydW50aW1lIGxvYWQgYWRkcmVz
cy4gICovCi0gICAgICAoRWxmVyhBZGRyKSkgbC0+bF9waGRyICs9IGwtPmxfYWRkcjsKKyAgICAg
IC8qICAgICAgIChFbGZXKEFkZHIpKSBsLT5sX3BoZHIgKz0gbC0+bF9hZGRyOyAqLworICAgICAg
RWxmVyhBZGRyKSAqdG1wcCA9IChFbGZXKEFkZHIpICopIGwtPmxfcGhkcjsKKyAgICAgIHRtcHAg
Kz0gbC0+bF9hZGRyOworICAgICAgbC0+bF9waGRyID0gKEVsZlcoUGhkcikgKikgdG1wcDsKKyAg
ICB9CiAgIH0KIAogI2lmZGVmIFVTRV9UTFMKQEAgLTEyNTMsOCArMTI1NywxMiBAQAogCSAgZ290
byBjYWxsX2xvc2U7CiAJfQogICAgIH0KLSAgZWxzZQotICAgIChFbGZXKEFkZHIpKSBsLT5sX2xk
ICs9IGwtPmxfYWRkcjsKKyAgZWxzZSB7CisgICAgLyogKEVsZlcoQWRkcikpIGwtPmxfbGQgKz0g
bC0+bF9hZGRyOyAqLworICAgIEVsZlcoQWRkcikgKnRtcHAgPSAoRWxmVyhBZGRyKSAqKSBsLT5s
X3BoZHI7CisgICAgdG1wcCArPSBsLT5sX2FkZHI7CisgICAgbC0+bF9waGRyID0gKEVsZlcoUGhk
cikgKikgdG1wcDsKKyAgfQogCiAgIGwtPmxfZW50cnkgKz0gbC0+bF9hZGRyOwogCi0tLSBnbGli
Yy0yLjMuMy0yMDA0MDIxMi9zdW5ycGMvcnBjL3hkci5oCTIwMDItMTItMTYgMDM6MDU6NDkuMDAw
MDAwMDAwICswMTAwCisrKyBnbGliYy0yLjMuMy0yMDA0MDIwOS9zdW5ycGMvcnBjL3hkci5oCTIw
MDQtMDItMTAgMTE6NDM6MDIuMDIyNjU2MDMyICswMTAwCkBAIC0yNjMsOSArMjYzLDE5IEBACiAg
KiBpbiB0aGUgUlBDIGNvZGUgd2lsbCBub3Qgd29yayBvbiA2NGJpdCBTb2xhcmlzIHBsYXRmb3Jt
cyAhCiAgKi8KICNkZWZpbmUgSVhEUl9HRVRfTE9ORyhidWYpIFwKLQkoKGxvbmcpbnRvaGwoKHVf
bG9uZykqX19leHRlbnNpb25fXygodV9pbnQzMl90KikoYnVmKSkrKykpCisJKHsJCQlcCisJbG9u
ZyBsOwkJCVwKKwl1X2ludDMyX3QgKmJ1Zl91MzIgPSAodV9pbnQzMl90ICopIGJ1ZjsJCQlcCisJ
bCA9ICgobG9uZyludG9obCgodV9sb25nKSpfX2V4dGVuc2lvbl9fKGJ1Zl91MzIpKyspKTsJXAor
CWJ1ZiA9IChfX3R5cGVvZl9fKCpidWYpICopIGJ1Zl91MzI7CQkJXAorCWw7CQkJCQkJCVwKKwl9
KQogI2RlZmluZSBJWERSX1BVVF9MT05HKGJ1ZiwgdikgXAotCSgqX19leHRlbnNpb25fXygodV9p
bnQzMl90KikoYnVmKSkrKyA9IChsb25nKWh0b25sKCh1X2xvbmcpKHYpKSkKKwlkbyB7CQkJXAor
CXVfaW50MzJfdCAqYnVmX3UzMiA9ICh1X2ludDMyX3QgKikgYnVmOwkJCVwKKwkoKl9fZXh0ZW5z
aW9uX18oYnVmX3UzMikrKyA9IChsb25nKWh0b25sKCh1X2xvbmcpKHYpKSk7CVwKKwlidWYgPSAo
X190eXBlb2ZfXygqYnVmKSAqKSBidWZfdTMyOwkJCVwKKwl9IHdoaWxlICgwKQogI2RlZmluZSBJ
WERSX0dFVF9VX0xPTkcoYnVmKQkgICAgICAoKHVfbG9uZylJWERSX0dFVF9MT05HKGJ1ZikpCiAj
ZGVmaW5lIElYRFJfUFVUX1VfTE9ORyhidWYsIHYpCSAgICAgIElYRFJfUFVUX0xPTkcoYnVmLCAo
bG9uZykodikpCiAKLS0tIGdsaWJjLTIuMy4zLTIwMDQwMjEyL2ljb252L2djb252X3NpbXBsZS5j
CTIwMDQtMDItMDcgMTc6Mjc6NTAuMDAwMDAwMDAwICswMTAwCisrKyBnbGliYy0yLjMuMy0yMDA0
MDIwOS9pY29udi9nY29udl9zaW1wbGUuYwkyMDA0LTAyLTA5IDE4OjQ0OjQxLjIxNzM5MDMyMCAr
MDEwMApAQCAtNDUzLDkgKzQ1MywxMSBAQAogI2lmIF9fQllURV9PUkRFUiA9PSBfX0JJR19FTkRJ
QU4KICAgLyogU2lnaCwgd2UgaGF2ZSB0byBkbyBzb21lIHJlYWwgd29yay4gICovCiAgIHNpemVf
dCBjbnQ7CisgIHVpbnQzMl90ICpvdXRwdHIzMiA9ICh1aW50MzJfdCAqKSBvdXRwdHI7CiAKICAg
Zm9yIChjbnQgPSAwOyBjbnQgPCBuX2NvbnZlcnQ7ICsrY250LCBpbnB0ciArPSA0KQotICAgICoo
KHVpbnQzMl90ICopIG91dHB0cikrKyA9IGJzd2FwXzMyICgqKGNvbnN0IHVpbnQzMl90ICopIGlu
cHRyKTsKKyAgICAqb3V0cHRyMzIrKyA9IGJzd2FwXzMyICgqKGNvbnN0IHVpbnQzMl90ICopIGlu
cHRyKTsKKyAgb3V0cHRyID0gKHVuc2lnbmVkIGNoYXIgKikgb3V0cHRyMzI7CiAKICAgKmlucHRy
cCA9IGlucHRyOwogICAqb3V0cHRycCA9IG91dHB0cjsK


--========/402A42A1000052A9/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="GLibC-diff2"

LS0tIGdsaWJjL2ljb252ZGF0YS9ldWMtamlzeDAyMTMuYy5vcmlnCTIwMDQtMDItMTggMTI6MDc6
MzIuNzIzNzAzNTc2ICswMTAwCisrKyBnbGliYy9pY29udmRhdGEvZXVjLWppc3gwMjEzLmMJMjAw
NC0wMi0xOCAxMjoxMDoxMy44MzIyMTEzNjAgKzAxMDAKQEAgLTgzLDcgKzgzLDkgQEAKIAkgIGlm
IChfX2J1aWx0aW5fZXhwZWN0IChvdXRidWYgKyA0IDw9IG91dGVuZCwgMSkpCQkgICAgICBcCiAJ
ICAgIHsJCQkJCQkJCSAgICAgIFwKIAkgICAgICAvKiBXcml0ZSBvdXQgdGhlIGxhc3QgY2hhcmFj
dGVyLiAgKi8JCQkgICAgICBcCi0JICAgICAgKigodWludDMyX3QgKikgb3V0YnVmKSsrID0gZGF0
YS0+X19zdGF0ZXAtPl9fY291bnQgPj4gMzsJICAgICAgXAorCSAgICAgIHVpbnQzMl90ICpvdXRw
dHIzMiA9ICh1aW50MzJfdCAqKSBvdXRidWY7CQkJICAgICAgXAorCSAgICAgICpvdXRwdHIzMisr
ID0gZGF0YS0+X19zdGF0ZXAtPl9fY291bnQgPj4gMzsJCSAgICAgIFwKKwkgICAgICBvdXRidWYg
PSAodW5zaWduZWQgY2hhciAqKSBvdXRwdHIzMjsJCQkgICAgICBcCiAJICAgICAgZGF0YS0+X19z
dGF0ZXAtPl9fY291bnQgPSAwOwkJCQkgICAgICBcCiAJICAgIH0JCQkJCQkJCSAgICAgIFwKIAkg
IGVsc2UJCQkJCQkJCSAgICAgIFwKLS0tIGdsaWJjL2ljb252ZGF0YS9pc28tMjAyMi1jbi1leHQu
Yy5vcmlnCTIwMDQtMDItMTggMTE6MTM6NDguMDAwMDAwMDAwICswMTAwCisrKyBnbGliYy9pY29u
dmRhdGEvaXNvLTIwMjItY24tZXh0LmMJMjAwNC0wMi0xOCAxMToyMTo1Ni41MTE2NzEwMzIgKzAx
MDAKQEAgLTE3MSw2ICsxNzEsNyBAQAogI2RlZmluZSBCT0RZIFwKICAgewkJCQkJCQkJCSAgICAg
IFwKICAgICB1aW50MzJfdCBjaCA9ICppbnB0cjsJCQkJCQkgICAgICBcCisgICAgdWludDMyX3Qg
Km91dHB0cjMyID0gKHVpbnQzMl90ICopIG91dHB0cjsJCQkJICAgICAgXAogCQkJCQkJCQkJICAg
ICAgXAogICAgIC8qIFRoaXMgaXMgYSA3Yml0IGNoYXJhY3RlciBzZXQsIGRpc2FsbG93IGFsbCA4
Yml0IGNoYXJhY3RlcnMuICAqLwkgICAgICBcCiAgICAgaWYgKGNoID4gMHg3ZikJCQkJCQkJICAg
ICAgXApAQCAtMzc3LDcgKzM3OCw4IEBACiAJICB9CQkJCQkJCQkgICAgICBcCiAgICAgICB9CQkJ
CQkJCQkJICAgICAgXAogCQkJCQkJCQkJICAgICAgXAotICAgICooKHVpbnQzMl90ICopIG91dHB0
cikrKyA9IGNoOwkJCQkJICAgICAgXAorICAgICpvdXRwdHIzMisrID0gY2g7CQkJCQkJCSAgICAg
IFwKKyAgICBvdXRwdHIgPSAodW5zaWduZWQgY2hhciAqKSBvdXRwdHIzMjsJCQkJICAgICAgXAog
ICB9CiAjZGVmaW5lIEVYVFJBX0xPT1BfREVDTFMJLCBpbnQgKnNldHAKICNkZWZpbmUgSU5JVF9Q
QVJBTVMJCWludCBzZXQgPSAoKnNldHAgPj4gMykgJiBDVVJSRU5UX01BU0s7IFwKLS0tIGdsaWJj
L2ljb252ZGF0YS9zaGlmdF9qaXN4MDIxMy5jLm9yaWcJMjAwNC0wMi0xOCAxMjoxNToyMS45NTMz
Njk4MjQgKzAxMDAKKysrIGdsaWJjL2ljb252ZGF0YS9zaGlmdF9qaXN4MDIxMy5jCTIwMDQtMDIt
MTggMTI6MTY6MzAuMTI3MDA1ODU2ICswMTAwCkBAIC04Myw3ICs4Myw5IEBACiAJICBpZiAoX19i
dWlsdGluX2V4cGVjdCAob3V0YnVmICsgNCA8PSBvdXRlbmQsIDEpKQkJICAgICAgXAogCSAgICB7
CQkJCQkJCQkgICAgICBcCiAJICAgICAgLyogV3JpdGUgb3V0IHRoZSBsYXN0IGNoYXJhY3Rlci4g
ICovCQkJICAgICAgXAotCSAgICAgICooKHVpbnQzMl90ICopIG91dGJ1ZikrKyA9IGRhdGEtPl9f
c3RhdGVwLT5fX2NvdW50ID4+IDM7CSAgICAgIFwKKwkgICAgICB1aW50MzJfdCAqb3V0cHRyMzIg
PSAodWludDMyX3QgKikgb3V0YnVmOwkJCSAgICAgIFwKKwkgICAgICAqb3V0cHRyMzIrKyA9IGRh
dGEtPl9fc3RhdGVwLT5fX2NvdW50ID4+IDM7CQkgICAgICBcCisJICAgICAgb3V0YnVmID0gKHVu
c2lnbmVkIGNoYXIgKikgb3V0cHRyMzI7CQkJICAgICAgXAogCSAgICAgIGRhdGEtPl9fc3RhdGVw
LT5fX2NvdW50ID0gMDsJCQkJICAgICAgXAogCSAgICB9CQkJCQkJCQkgICAgICBcCiAJICBlbHNl
CQkJCQkJCQkgICAgICBcCi0tLSBnbGliYy9pY29udmRhdGEvdGN2bjU3MTItMS5jLm9yaWcJMjAw
NC0wMi0xOCAxMToxODoyMi4wMjcyNzc2MTYgKzAxMDAKKysrIGdsaWJjL2ljb252ZGF0YS90Y3Zu
NTcxMi0xLmMJMjAwNC0wMi0xOCAxMTo1NDoxNy41Mjc1OTE3NjAgKzAxMDAKQEAgLTY4LDcgKzY4
LDkgQEAKIAkgIGlmIChfX2J1aWx0aW5fZXhwZWN0IChvdXRidWYgKyA0IDw9IG91dGVuZCwgMSkp
CQkgICAgICBcCiAJICAgIHsJCQkJCQkJCSAgICAgIFwKIAkgICAgICAvKiBXcml0ZSBvdXQgdGhl
IGxhc3QgY2hhcmFjdGVyLiAgKi8JCQkgICAgICBcCi0JICAgICAgKigodWludDMyX3QgKikgb3V0
YnVmKSsrID0gZGF0YS0+X19zdGF0ZXAtPl9fY291bnQgPj4gMzsJICAgICAgXAorCSAgICAgIHVp
bnQzMl90ICpvdXRwdHIzMiA9ICh1aW50MzJfdCAqKSBvdXRidWY7CQkJICAgICAgXAorCSAgICAg
ICpvdXRwdHIzMisrID0gZGF0YS0+X19zdGF0ZXAtPl9fY291bnQgPj4gMzsJCSAgICAgIFwKKwkg
ICAgICBvdXRidWYgPSAodW5zaWduZWQgY2hhciAqKSBvdXRwdHIzMjsJCQkgICAgICBcCiAJICAg
ICAgZGF0YS0+X19zdGF0ZXAtPl9fY291bnQgPSAwOwkJCQkgICAgICBcCiAJICAgIH0JCQkJCQkJ
CSAgICAgIFwKIAkgIGVsc2UJCQkJCQkJCSAgICAgIFwKLS0tIGdsaWJjL2ljb252ZGF0YS90c2Np
aS5jLm9yaWcJMjAwNC0wMi0xOCAxMjoyMzozNy4yODkwNjczNTIgKzAxMDAKKysrIGdsaWJjL2lj
b252ZGF0YS90c2NpaS5jCTIwMDQtMDItMTggMTI6MjQ6MjUuNDE3NzUwNjgwICswMTAwCkBAIC05
OCw3ICs5OCw5IEBACiAJCSAgYnJlYWs7CQkJCQkJICAgICAgXAogCQl9CQkJCQkJCSAgICAgIFwK
IAkgICAgICAvKiBXcml0ZSBvdXQgdGhlIHBlbmRpbmcgY2hhcmFjdGVyLiAgKi8JCQkgICAgICBc
Ci0JICAgICAgKigodWludDMyX3QgKikgb3V0YnVmKSsrID0gZGF0YS0+X19zdGF0ZXAtPl9fY291
bnQgPj4gODsJICAgICAgXAorCSAgICAgIHVpbnQzMl90ICpvdXRwdHIzMiA9ICh1aW50
MzJfdCAqKSBvdXRidWY7CQkJICAgICAgXAorCSAgICAgICpvdXRwdHIzMisrID0gZGF0YS0+X19z
dGF0ZXAtPl9fY291bnQgPj4gODsJCSAgICAgIFwKKwkgICAgICBvdXRidWYgPSAodW5zaWduZWQg
Y2hhciAqKSBvdXRwdHIzMjsJCQkgICAgICBcCiAJICAgICAgLyogUmV0cmlldmUgdGhlIHN1Y2Nl
c3NvciBzdGF0ZS4gICovCQkJICAgICAgXAogCSAgICAgIGRhdGEtPl9fc3RhdGVwLT5fX2NvdW50
ID0JCQkJCSAgICAgIFwKIAkJdHNjaWlfbmV4dF9zdGF0ZVsoZGF0YS0+X19zdGF0ZXAtPl9fY291
bnQgPj4gNCkgJiAweDBmXTsgICAgICBcCg==

--========/402A42A1000052A9/mail.tiscali.be--
