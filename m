Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF979483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 08:54:55 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1B6AiU-00089V-00
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 16:54:54 +0100
Date: Wed, 24 Mar 2004 16:54:52 +0100
Message-ID: <40561E710000662F@ocpmta2.freegates.net>
In-Reply-To: <40561EAF000053B8@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?RE=3A=20=5Bparisc=2Dlinux=5D=20Cast=20of=20lvalue=20warning=20in=20the=20last=20k=202=2E6=2E5=2Drc2=20with=09last=20gcc=2D3=2E3=20=28next=29?=
To: "PA-RISC Linux Port" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/40561E710000662F/mail.tiscali.be"
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/40561E710000662F/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,


>PS2: still have to make the same exercise for:
>  gcc -Wp,-MD,arch/parisc/lib/.io.o.d -nostdinc -iwithprefix include >-D__KERNEL__
>-Iinclude  -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs
>-fno-strict-aliasin
>  -fno-common -pipe -mno-space-regs -mfast-indirect-calls
>-mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000 -O2 >-fomit-frame-pointer
>    -DKBUILD_BASENAME=io -DKBUILD_MODNAME=io -c -o arch/parisc/lib/io.o
>arch/parisc/lib/io.c
>arch/parisc/lib/io.c: In function `__memcpy_toio':
>arch/parisc/lib/io.c:24: warning: use of cast expressions as lvalues is
>deprecated
>arch/parisc/lib/io.c:24: warning: use of cast expressions as lvalues is
>deprecated

here is the next io.c diff file proposal (if some interest :) )
--- arch/parisc/lib/io.c.orig	2004-03-24 14:47:42.703516192 +0100
+++ arch/parisc/lib/io.c	2004-03-24 14:52:46.808285240 +0100
@@ -21,19 +21,19 @@
 		goto bytecopy;
 	while (dest & 3) {
 		writeb(*(char *)src, dest++);
-		((char *)src)++;
-		count--;
+		src += sizeof(char);
+		count -= sizeof(char);
 	}
 	while (count > 3) {
 		__raw_writel(*(u32 *)src, dest);
-		src += 4;
-		dest += 4;
-		count -= 4;
+		src += sizeof(u32);
+		dest += sizeof(u32);
+		count -= sizeof(u32);
 	}
  bytecopy:
 	while (count--) {
 		writeb(*(char *)src, dest++);
-		((char *)src)++;
+		src += sizeof(char);
 	}
 }
 
@@ -62,39 +62,39 @@
 	/* Then check for misaligned start address */
 	if (src & 1) {
 		*(u8 *)dest = readb(src);
-		((u8 *)src)++;
-		((u8 *)dest)++;
-		count--;
+		src += sizeof(u8);
+		dest += sizeof(u8);
+		count -= sizeof(u8);
 		if (count < 2) goto bytecopy;
 	}
 
 	if (src & 2) {
 		*(u16 *)dest = __raw_readw(src);
-		((u16 *)src)++;
-		((u16 *)dest)++;
-		count-=2;
+		src += sizeof(u16);
+		dest += sizeof(u16);
+		count -= sizeof(u16);
 	}
 
 	while (count > 3) {
 		*(u32 *)dest = __raw_readl(src);
-		dest += 4;
-		src += 4;
-		count -= 4;
+		dest += sizeof(u32);
+		src += sizeof(u32);
+		count -= sizeof(u32);
 	}
 
  shortcopy:
 	while (count > 1) {
 		*(u16 *)dest = __raw_readw(src);
-		((u16 *)src)++;
-		((u16 *)dest)++;
-		count-=2;
+		src += sizeof(u16);
+		dest += sizeof(u16);
+		count -= sizeof(u16);
 	}
 
  bytecopy:
 	while (count--) {
 		*(char *)dest = readb(src);
-		((char *)src)++;
-		((char *)dest)++;
+		src += sizeof(char);
+		dest += sizeof(char);
 	}
 }
 
@@ -130,7 +130,7 @@
 			return;
 		count--;
 		*(unsigned char *) dst = inb(port);
-		((unsigned char *) dst)++;
+		dst += sizeof(unsigned char);
 	}
 
 	while (count >= 4) {
@@ -141,13 +141,13 @@
 		w |= inb(port) << 8;
 		w |= inb(port);
 		*(unsigned int *) dst = w;
-		((unsigned int *) dst)++;
+		dst += sizeof(unsigned int);
 	}
 
 	while (count) {
 		--count;
 		*(unsigned char *) dst = inb(port);
-		((unsigned char *) dst)++;
+		dst += sizeof(unsigned char);
 	}
 }
 
@@ -175,7 +175,7 @@
 			l = cpu_to_le16(inw(port)) << 16;
 			l |= cpu_to_le16(inw(port));
 			*(unsigned int *) dst = l;
-			((unsigned int *) dst)++;
+			dst += sizeof(unsigned int);
 		}
 		if (count) {
 			*(unsigned short *) dst = cpu_to_le16(inw(port));
@@ -184,15 +184,15 @@
 	
 	 case 0x02:			/* Buffer 16-bit aligned */
 		*(unsigned short *) dst = cpu_to_le16(inw(port));
-		((unsigned short *) dst)++;
-		count--;
+		dst += sizeof(unsigned short);
+		count -= sizeof(unsigned short);
 		while (count>=2) {
 			
 			count -= 2;
 			l = cpu_to_le16(inw(port)) << 16;
 			l |= cpu_to_le16(inw(port));
 			*(unsigned int *) dst = l;
-			((unsigned int *) dst)++;
+			dst += sizeof(unsigned int);
 		}
 		if (count) {
 			*(unsigned short *) dst = cpu_to_le16(inw(port));
@@ -207,12 +207,12 @@
 		
 		l = cpu_to_le16(inw(port));
 		*(unsigned char *) dst = l >> 8;
-		((unsigned char *) dst)++;
+		dst += sizeof(unsigned char);
 		while (count--)
 		{
 			l2 = cpu_to_le16(inw(port));
 			*(unsigned short *) dst = (l & 0xff) << 8 | (l2 >> 8);
-			((unsigned short *) dst)++;
+			dst += sizeof(unsigned short);
 			l = l2;
 		}
 		*(unsigned char *) dst = l & 0xff;
@@ -241,7 +241,7 @@
 		while (count--)
 		{
 			*(unsigned int *) dst = cpu_to_le32(inl(port));
-			((unsigned int *) dst)++;
+			dst += sizeof(unsigned int);
 		}
 		break;
 	
@@ -250,13 +250,13 @@
 		
 		l = cpu_to_le32(inl(port));
 		*(unsigned short *) dst = l >> 16;
-		((unsigned short *) dst)++;
+		dst += sizeof(unsigned short);
 		
 		while (count--)
 		{
 			l2 = cpu_to_le32(inl(port));
 			*(unsigned int *) dst = (l & 0xffff) << 16 | (l2 >> 16);
-			((unsigned int *) dst)++;
+			dst += sizeof(unsigned int);
 			l = l2;
 		}
 		*(unsigned short *) dst = l & 0xffff;
@@ -266,14 +266,14 @@
 		
 		l = cpu_to_le32(inl(port));
 		*(unsigned char *) dst = l >> 24;
-		((unsigned char *) dst)++;
+		dst += sizeof(unsigned char);
 		*(unsigned short *) dst = (l >> 8) & 0xffff;
-		((unsigned short *) dst)++;
+		dst += sizeof(unsigned short);
 		while (count--)
 		{
 			l2 = cpu_to_le32(inl(port));
 			*(unsigned int *) dst = (l & 0xff) << 24 | (l2 >> 8);
-			((unsigned int *) dst)++;
+			dst += sizeof(unsigned int);
 			l = l2;
 		}
 		*(unsigned char *) dst = l & 0xff;
@@ -283,16 +283,16 @@
 		
 		l = cpu_to_le32(inl(port));
 		*(unsigned char *) dst = l >> 24;
-		((unsigned char *) dst)++;
+		dst += sizeof(unsigned char);
 		while (count--)
 		{
 			l2 = cpu_to_le32(inl(port));
 			*(unsigned int *) dst = (l & 0xffffff) << 8 | l2 >> 24;
-			((unsigned int *) dst)++;
+			dst += sizeof(unsigned int);
 			l = l2;
 		}
 		*(unsigned short *) dst = (l >> 8) & 0xffff;
-		((unsigned short *) dst)++;
+		dst += sizeof(unsigned short);
 		*(unsigned char *) dst = l & 0xff;
 		break;
 	}
@@ -308,9 +308,9 @@
 void outsb(unsigned long port, const void * src, unsigned long count)
 {
 	while (count) {
-		count--;
 		outb(*(char *)src, port);
-		((char *) src)++;
+		src += sizeof(char);
+		count -= sizeof(char);
 	}
 }
 
@@ -333,7 +333,7 @@
 		while (count>=2) {
 			count -= 2;
 			l = *(unsigned int *) src;
-			((unsigned int *) src)++;
+			src += sizeof(unsigned int);
 			outw(le16_to_cpu(l >> 16), port);
 			outw(le16_to_cpu(l & 0xffff), port);
 		}
@@ -345,13 +345,13 @@
 	 case 0x02:			/* Buffer 16-bit aligned */
 		
 		outw(le16_to_cpu(*(unsigned short*)src), port);
-		((unsigned short *) src)++;
+		src += sizeof(unsigned short);
 		count--;
 		
 		while (count>=2) {
 			count -= 2;
 			l = *(unsigned int *) src;
-			((unsigned int *) src)++;
+			src += sizeof(unsigned int);
 			outw(le16_to_cpu(l >> 16), port);
 			outw(le16_to_cpu(l & 0xffff), port);
 		}
@@ -365,13 +365,13 @@
 		 * in this case, 16bit will have to do -- DE */
 		
 		l  = *(unsigned char *) src << 8;
-		((unsigned char *) src)++;
+		src += sizeof(unsigned char);
 		count--;
 		while (count)
 		{
 			count--;
 			l2 = *(unsigned short *) src;
-			((unsigned short *) src)++;
+			src += sizeof(unsigned short);
 			outw(le16_to_cpu(l | l2 >> 8), port);
 		        l = l2 << 8;
 		}
@@ -402,7 +402,7 @@
 		while (count--)
 		{
 			outl(le32_to_cpu(*(unsigned int *) src), port);
-			((unsigned int *) src)++;
+			src += sizeof(unsigned int);
 		}
 		break;
 	
@@ -410,12 +410,12 @@
 		--count;
 		
 		l = *(unsigned short *) src;
-		((unsigned short *) src)++;
+		src += sizeof(unsigned short);
 		
 		while (count--)
 		{
 			l2 = *(unsigned int *) src;
-			((unsigned int *) src)++;
+			src += sizeof(unsigned int);
 			outl (le32_to_cpu(l << 16 | l2 >> 16), port);
 			l = l2;
 		}
@@ -426,13 +426,13 @@
 		--count;
 		
 		l  = *(unsigned char *) src << 24;
-		((unsigned char *) src)++;
+		src += sizeof(unsigned char);
 		l |= *(unsigned short *) src << 8;
-		((unsigned short *) src)++;
+		src += sizeof(unsigned short);
 		while (count--)
 		{
 			l2 = *(unsigned int *) src;
-			((unsigned int *) src)++;
+			src += sizeof(unsigned int);
 			outl (le32_to_cpu(l | l2 >> 24), port);
 			l = l2 << 8;
 		}
@@ -443,16 +443,16 @@
 		--count;
 		
 		l  = *(unsigned char *) src << 24;
-		((unsigned char *) src)++;
+		src += sizeof(unsigned char);
 		while (count--)
 		{
 			l2 = *(unsigned int *) src;
-			((unsigned int *) src)++;
+			src += sizeof(unsigned int);
 			outl (le32_to_cpu(l | l2 >> 8), port);
 			l = l2 << 24;
 		}
 		l2  = *(unsigned short *) src << 16;
-		((unsigned short *) src)++;
+		src += sizeof(unsigned short);
 		l2 |= *(unsigned char *) src;
 		outl (le32_to_cpu(l | l2), port);
 		break;
=========><=========

hth,
    Joel

PS: I am runing a kernel with this patch on my n4k :)

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr




--========/40561E710000662F/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="io.c.diff"

LS0tIGFyY2gvcGFyaXNjL2xpYi9pby5jLm9yaWcJMjAwNC0wMy0yNCAxNDo0Nzo0Mi43MDM1MTYx
OTIgKzAxMDAKKysrIGFyY2gvcGFyaXNjL2xpYi9pby5jCTIwMDQtMDMtMjQgMTQ6NTI6NDYuODA4
Mjg1MjQwICswMTAwCkBAIC0yMSwxOSArMjEsMTkgQEAKIAkJZ290byBieXRlY29weTsKIAl3aGls
ZSAoZGVzdCAmIDMpIHsKIAkJd3JpdGViKCooY2hhciAqKXNyYywgZGVzdCsrKTsKLQkJKChjaGFy
ICopc3JjKSsrOwotCQljb3VudC0tOworCQlzcmMgKz0gc2l6ZW9mKGNoYXIpOworCQljb3VudCAt
PSBzaXplb2YoY2hhcik7CiAJfQogCXdoaWxlIChjb3VudCA+IDMpIHsKIAkJX19yYXdfd3JpdGVs
KCoodTMyICopc3JjLCBkZXN0KTsKLQkJc3JjICs9IDQ7Ci0JCWRlc3QgKz0gNDsKLQkJY291bnQg
LT0gNDsKKwkJc3JjICs9IHNpemVvZih1MzIpOworCQlkZXN0ICs9IHNpemVvZih1MzIpOworCQlj
b3VudCAtPSBzaXplb2YodTMyKTsKIAl9CiAgYnl0ZWNvcHk6CiAJd2hpbGUgKGNvdW50LS0pIHsK
IAkJd3JpdGViKCooY2hhciAqKXNyYywgZGVzdCsrKTsKLQkJKChjaGFyICopc3JjKSsrOworCQlz
cmMgKz0gc2l6ZW9mKGNoYXIpOwogCX0KIH0KIApAQCAtNjIsMzkgKzYyLDM5IEBACiAJLyogVGhl
biBjaGVjayBmb3IgbWlzYWxpZ25lZCBzdGFydCBhZGRyZXNzICovCiAJaWYgKHNyYyAmIDEpIHsK
IAkJKih1OCAqKWRlc3QgPSByZWFkYihzcmMpOwotCQkoKHU4ICopc3JjKSsrOwotCQkoKHU4ICop
ZGVzdCkrKzsKLQkJY291bnQtLTsKKwkJc3JjICs9IHNpemVvZih1OCk7CisJCWRlc3QgKz0gc2l6
ZW9mKHU4KTsKKwkJY291bnQgLT0gc2l6ZW9mKHU4KTsKIAkJaWYgKGNvdW50IDwgMikgZ290byBi
eXRlY29weTsKIAl9CiAKIAlpZiAoc3JjICYgMikgewogCQkqKHUxNiAqKWRlc3QgPSBfX3Jhd19y
ZWFkdyhzcmMpOwotCQkoKHUxNiAqKXNyYykrKzsKLQkJKCh1MTYgKilkZXN0KSsrOwotCQljb3Vu
dC09MjsKKwkJc3JjICs9IHNpemVvZih1MTYpOworCQlkZXN0ICs9IHNpemVvZih1MTYpOworCQlj
b3VudCAtPSBzaXplb2YodTE2KTsKIAl9CiAKIAl3aGlsZSAoY291bnQgPiAzKSB7CiAJCSoodTMy
ICopZGVzdCA9IF9fcmF3X3JlYWRsKHNyYyk7Ci0JCWRlc3QgKz0gNDsKLQkJc3JjICs9IDQ7Ci0J
CWNvdW50IC09IDQ7CisJCWRlc3QgKz0gc2l6ZW9mKHUzMik7CisJCXNyYyArPSBzaXplb2YodTMy
KTsKKwkJY291bnQgLT0gc2l6ZW9mKHUzMik7CiAJfQogCiAgc2hvcnRjb3B5OgogCXdoaWxlIChj
b3VudCA+IDEpIHsKIAkJKih1MTYgKilkZXN0ID0gX19yYXdfcmVhZHcoc3JjKTsKLQkJKCh1MTYg
KilzcmMpKys7Ci0JCSgodTE2ICopZGVzdCkrKzsKLQkJY291bnQtPTI7CisJCXNyYyArPSBzaXpl
b2YodTE2KTsKKwkJZGVzdCArPSBzaXplb2YodTE2KTsKKwkJY291bnQgLT0gc2l6ZW9mKHUxNik7
CiAJfQogCiAgYnl0ZWNvcHk6CiAJd2hpbGUgKGNvdW50LS0pIHsKIAkJKihjaGFyICopZGVzdCA9
IHJlYWRiKHNyYyk7Ci0JCSgoY2hhciAqKXNyYykrKzsKLQkJKChjaGFyICopZGVzdCkrKzsKKwkJ
c3JjICs9IHNpemVvZihjaGFyKTsKKwkJZGVzdCArPSBzaXplb2YoY2hhcik7CiAJfQogfQogCkBA
IC0xMzAsNyArMTMwLDcgQEAKIAkJCXJldHVybjsKIAkJY291bnQtLTsKIAkJKih1bnNpZ25lZCBj
aGFyICopIGRzdCA9IGluYihwb3J0KTsKLQkJKCh1bnNpZ25lZCBjaGFyICopIGRzdCkrKzsKKwkJ
ZHN0ICs9IHNpemVvZih1bnNpZ25lZCBjaGFyKTsKIAl9CiAKIAl3aGlsZSAoY291bnQgPj0gNCkg
ewpAQCAtMTQxLDEzICsxNDEsMTMgQEAKIAkJdyB8PSBpbmIocG9ydCkgPDwgODsKIAkJdyB8PSBp
bmIocG9ydCk7CiAJCSoodW5zaWduZWQgaW50ICopIGRzdCA9IHc7Ci0JCSgodW5zaWduZWQgaW50
ICopIGRzdCkrKzsKKwkJZHN0ICs9IHNpemVvZih1bnNpZ25lZCBpbnQpOwogCX0KIAogCXdoaWxl
IChjb3VudCkgewogCQktLWNvdW50OwogCQkqKHVuc2lnbmVkIGNoYXIgKikgZHN0ID0gaW5iKHBv
cnQpOwotCQkoKHVuc2lnbmVkIGNoYXIgKikgZHN0KSsrOworCQlkc3QgKz0gc2l6ZW9mKHVuc2ln
bmVkIGNoYXIpOwogCX0KIH0KIApAQCAtMTc1LDcgKzE3NSw3IEBACiAJCQlsID0gY3B1X3RvX2xl
MTYoaW53KHBvcnQpKSA8PCAxNjsKIAkJCWwgfD0gY3B1X3RvX2xlMTYoaW53KHBvcnQpKTsKIAkJ
CSoodW5zaWduZWQgaW50ICopIGRzdCA9IGw7Ci0JCQkoKHVuc2lnbmVkIGludCAqKSBkc3QpKys7
CisJCQlkc3QgKz0gc2l6ZW9mKHVuc2lnbmVkIGludCk7CiAJCX0KIAkJaWYgKGNvdW50KSB7CiAJ
CQkqKHVuc2lnbmVkIHNob3J0ICopIGRzdCA9IGNwdV90b19sZTE2KGludyhwb3J0KSk7CkBAIC0x
ODQsMTUgKzE4NCwxNSBAQAogCQogCSBjYXNlIDB4MDI6CQkJLyogQnVmZmVyIDE2LWJpdCBhbGln
bmVkICovCiAJCSoodW5zaWduZWQgc2hvcnQgKikgZHN0ID0gY3B1X3RvX2xlMTYoaW53KHBvcnQp
KTsKLQkJKCh1bnNpZ25lZCBzaG9ydCAqKSBkc3QpKys7Ci0JCWNvdW50LS07CisJCWRzdCArPSBz
aXplb2YodW5zaWduZWQgc2hvcnQpOworCQljb3VudCAtPSBzaXplb2YodW5zaWduZWQgc2hvcnQp
OwogCQl3aGlsZSAoY291bnQ+PTIpIHsKIAkJCQogCQkJY291bnQgLT0gMjsKIAkJCWwgPSBjcHVf
dG9fbGUxNihpbncocG9ydCkpIDw8IDE2OwogCQkJbCB8PSBjcHVfdG9fbGUxNihpbncocG9ydCkp
OwogCQkJKih1bnNpZ25lZCBpbnQgKikgZHN0ID0gbDsKLQkJCSgodW5zaWduZWQgaW50ICopIGRz
dCkrKzsKKwkJCWRzdCArPSBzaXplb2YodW5zaWduZWQgaW50KTsKIAkJfQogCQlpZiAoY291bnQp
IHsKIAkJCSoodW5zaWduZWQgc2hvcnQgKikgZHN0ID0gY3B1X3RvX2xlMTYoaW53KHBvcnQpKTsK
QEAgLTIwNywxMiArMjA3LDEyIEBACiAJCQogCQlsID0gY3B1X3RvX2xlMTYoaW53KHBvcnQpKTsK
IAkJKih1bnNpZ25lZCBjaGFyICopIGRzdCA9IGwgPj4gODsKLQkJKCh1bnNpZ25lZCBjaGFyICop
IGRzdCkrKzsKKwkJZHN0ICs9IHNpemVvZih1bnNpZ25lZCBjaGFyKTsKIAkJd2hpbGUgKGNvdW50
LS0pCiAJCXsKIAkJCWwyID0gY3B1X3RvX2xlMTYoaW53KHBvcnQpKTsKIAkJCSoodW5z
aWduZWQgc2hvcnQgKikgZHN0ID0gKGwgJiAweGZmKSA8PCA4IHwgKGwyID4+IDgpOwotCQkJKCh1
bnNpZ25lZCBzaG9ydCAqKSBkc3QpKys7CisJCQlkc3QgKz0gc2l6ZW9mKHVuc2lnbmVkIHNob3J0
KTsKIAkJCWwgPSBsMjsKIAkJfQogCQkqKHVuc2lnbmVkIGNoYXIgKikgZHN0ID0gbCAmIDB4ZmY7
CkBAIC0yNDEsNyArMjQxLDcgQEAKIAkJd2hpbGUgKGNvdW50LS0pCiAJCXsKIAkJCSoodW5zaWdu
ZWQgaW50ICopIGRzdCA9IGNwdV90b19sZTMyKGlubChwb3J0KSk7Ci0JCQkoKHVuc2lnbmVkIGlu
dCAqKSBkc3QpKys7CisJCQlkc3QgKz0gc2l6ZW9mKHVuc2lnbmVkIGludCk7CiAJCX0KIAkJYnJl
YWs7CiAJCkBAIC0yNTAsMTMgKzI1MCwxMyBAQAogCQkKIAkJbCA9IGNwdV90b19sZTMyKGlubChw
b3J0KSk7CiAJCSoodW5zaWduZWQgc2hvcnQgKikgZHN0ID0gbCA+PiAxNjsKLQkJKCh1bnNpZ25l
ZCBzaG9ydCAqKSBkc3QpKys7CisJCWRzdCArPSBzaXplb2YodW5zaWduZWQgc2hvcnQpOwogCQkK
IAkJd2hpbGUgKGNvdW50LS0pCiAJCXsKIAkJCWwyID0gY3B1X3RvX2xlMzIoaW5sKHBvcnQpKTsK
IAkJCSoodW5zaWduZWQgaW50ICopIGRzdCA9IChsICYgMHhmZmZmKSA8PCAxNiB8IChsMiA+PiAx
Nik7Ci0JCQkoKHVuc2lnbmVkIGludCAqKSBkc3QpKys7CisJCQlkc3QgKz0gc2l6ZW9mKHVuc2ln
bmVkIGludCk7CiAJCQlsID0gbDI7CiAJCX0KIAkJKih1bnNpZ25lZCBzaG9ydCAqKSBkc3QgPSBs
ICYgMHhmZmZmOwpAQCAtMjY2LDE0ICsyNjYsMTQgQEAKIAkJCiAJCWwgPSBjcHVfdG9fbGUzMihp
bmwocG9ydCkpOwogCQkqKHVuc2lnbmVkIGNoYXIgKikgZHN0ID0gbCA+PiAyNDsKLQkJKCh1bnNp
Z25lZCBjaGFyICopIGRzdCkrKzsKKwkJZHN0ICs9IHNpemVvZih1bnNpZ25lZCBjaGFyKTsKIAkJ
Kih1bnNpZ25lZCBzaG9ydCAqKSBkc3QgPSAobCA+PiA4KSAmIDB4ZmZmZjsKLQkJKCh1bnNpZ25l
ZCBzaG9ydCAqKSBkc3QpKys7CisJCWRzdCArPSBzaXplb2YodW5zaWduZWQgc2hvcnQpOwogCQl3
aGlsZSAoY291bnQtLSkKIAkJewogCQkJbDIgPSBjcHVfdG9fbGUzMihpbmwocG9ydCkpOwogCQkJ
Kih1bnNpZ25lZCBpbnQgKikgZHN0ID0gKGwgJiAweGZmKSA8PCAyNCB8IChsMiA+PiA4KTsKLQkJ
CSgodW5zaWduZWQgaW50ICopIGRzdCkrKzsKKwkJCWRzdCArPSBzaXplb2YodW5zaWduZWQgaW50
KTsKIAkJCWwgPSBsMjsKIAkJfQogCQkqKHVuc2lnbmVkIGNoYXIgKikgZHN0ID0gbCAmIDB4ZmY7
CkBAIC0yODMsMTYgKzI4MywxNiBAQAogCQkKIAkJbCA9IGNwdV90b19sZTMyKGlubChwb3J0KSk7
CiAJCSoodW5zaWduZWQgY2hhciAqKSBkc3QgPSBsID4+IDI0OwotCQkoKHVuc2lnbmVkIGNoYXIg
KikgZHN0KSsrOworCQlkc3QgKz0gc2l6ZW9mKHVuc2lnbmVkIGNoYXIpOwogCQl3aGlsZSAoY291
bnQtLSkKIAkJewogCQkJbDIgPSBjcHVfdG9fbGUzMihpbmwocG9ydCkpOwogCQkJKih1bnNpZ25l
ZCBpbnQgKikgZHN0ID0gKGwgJiAweGZmZmZmZikgPDwgOCB8IGwyID4+IDI0OwotCQkJKCh1bnNp
Z25lZCBpbnQgKikgZHN0KSsrOworCQkJZHN0ICs9IHNpemVvZih1bnNpZ25lZCBpbnQpOwogCQkJ
bCA9IGwyOwogCQl9CiAJCSoodW5zaWduZWQgc2hvcnQgKikgZHN0ID0gKGwgPj4gOCkgJiAweGZm
ZmY7Ci0JCSgodW5zaWduZWQgc2hvcnQgKikgZHN0KSsrOworCQlkc3QgKz0gc2l6ZW9mKHVuc2ln
bmVkIHNob3J0KTsKIAkJKih1bnNpZ25lZCBjaGFyICopIGRzdCA9IGwgJiAweGZmOwogCQlicmVh
azsKIAl9CkBAIC0zMDgsOSArMzA4LDkgQEAKIHZvaWQgb3V0c2IodW5zaWduZWQgbG9uZyBwb3J0
LCBjb25zdCB2b2lkICogc3JjLCB1bnNpZ25lZCBsb25nIGNvdW50KQogewogCXdoaWxlIChjb3Vu
dCkgewotCQljb3VudC0tOwogCQlvdXRiKCooY2hhciAqKXNyYywgcG9ydCk7Ci0JCSgoY2hhciAq
KSBzcmMpKys7CisJCXNyYyArPSBzaXplb2YoY2hhcik7CisJCWNvdW50IC09IHNpemVvZihjaGFy
KTsKIAl9CiB9CiAKQEAgLTMzMyw3ICszMzMsNyBAQAogCQl3aGlsZSAoY291bnQ+PTIpIHsKIAkJ
CWNvdW50IC09IDI7CiAJCQlsID0gKih1bnNpZ25lZCBpbnQgKikgc3JjOwotCQkJKCh1bnNpZ25l
ZCBpbnQgKikgc3JjKSsrOworCQkJc3JjICs9IHNpemVvZih1bnNpZ25lZCBpbnQpOwogCQkJb3V0
dyhsZTE2X3RvX2NwdShsID4+IDE2KSwgcG9ydCk7CiAJCQlvdXR3KGxlMTZfdG9fY3B1KGwgJiAw
eGZmZmYpLCBwb3J0KTsKIAkJfQpAQCAtMzQ1LDEzICszNDUsMTMgQEAKIAkgY2FzZSAweDAyOgkJ
CS8qIEJ1ZmZlciAxNi1iaXQgYWxpZ25lZCAqLwogCQkKIAkJb3V0dyhsZTE2X3RvX2NwdSgqKHVu
c2lnbmVkIHNob3J0KilzcmMpLCBwb3J0KTsKLQkJKCh1bnNpZ25lZCBzaG9ydCAqKSBzcmMpKys7
CisJCXNyYyArPSBzaXplb2YodW5zaWduZWQgc2hvcnQpOwogCQljb3VudC0tOwogCQkKIAkJd2hp
bGUgKGNvdW50Pj0yKSB7CiAJCQljb3VudCAtPSAyOwogCQkJbCA9ICoodW5zaWduZWQgaW50ICop
IHNyYzsKLQkJCSgodW5zaWduZWQgaW50ICopIHNyYykrKzsKKwkJCXNyYyArPSBzaXplb2YodW5z
aWduZWQgaW50KTsKIAkJCW91dHcobGUxNl90b19jcHUobCA+PiAxNiksIHBvcnQpOwogCQkJb3V0
dyhsZTE2X3RvX2NwdShsICYgMHhmZmZmKSwgcG9ydCk7CiAJCX0KQEAgLTM2NSwxMyArMzY1LDEz
IEBACiAJCSAqIGluIHRoaXMgY2FzZSwgMTZiaXQgd2lsbCBoYXZlIHRvIGRvIC0tIERFICovCiAJ
CQogCQlsICA9ICoodW5zaWduZWQgY2hhciAqKSBzcmMgPDwgODsKLQkJKCh1bnNpZ25lZCBjaGFy
ICopIHNyYykrKzsKKwkJc3JjICs9IHNpemVvZih1bnNpZ25lZCBjaGFyKTsKIAkJY291bnQtLTsK
IAkJd2hpbGUgKGNvdW50KQogCQl7CiAJCQljb3VudC0tOwogCQkJbDIgPSAqKHVuc2lnbmVkIHNo
b3J0ICopIHNyYzsKLQkJCSgodW5zaWduZWQgc2hvcnQgKikgc3JjKSsrOworCQkJc3JjICs9IHNp
emVvZih1bnNpZ25lZCBzaG9ydCk7CiAJCQlvdXR3KGxlMTZfdG9fY3B1KGwgfCBsMiA+PiA4KSwg
cG9ydCk7CiAJCSAgICAgICAgbCA9IGwyIDw8IDg7CiAJCX0KQEAgLTQwMiw3ICs0MDIs
NyBAQAogCQl3aGlsZSAoY291bnQtLSkKIAkJewogCQkJb3V0bChsZTMyX3RvX2NwdSgqKHVuc2ln
bmVkIGludCAqKSBzcmMpLCBwb3J0KTsKLQkJCSgodW5zaWduZWQgaW50ICopIHNyYykrKzsKKwkJ
CXNyYyArPSBzaXplb2YodW5zaWduZWQgaW50KTsKIAkJfQogCQlicmVhazsKIAkKQEAgLTQxMCwx
MiArNDEwLDEyIEBACiAJCS0tY291bnQ7CiAJCQogCQlsID0gKih1bnNpZ25lZCBzaG9ydCAqKSBz
cmM7Ci0JCSgodW5zaWduZWQgc2hvcnQgKikgc3JjKSsrOworCQlzcmMgKz0gc2l6ZW9mKHVuc2ln
bmVkIHNob3J0KTsKIAkJCiAJCXdoaWxlIChjb3VudC0tKQogCQl7CiAJCQlsMiA9ICoodW5zaWdu
ZWQgaW50ICopIHNyYzsKLQkJCSgodW5zaWduZWQgaW50ICopIHNyYykrKzsKKwkJCXNyYyArPSBz
aXplb2YodW5zaWduZWQgaW50KTsKIAkJCW91dGwgKGxlMzJfdG9fY3B1KGwgPDwgMTYgfCBsMiA+
PiAxNiksIHBvcnQpOwogCQkJbCA9IGwyOwogCQl9CkBAIC00MjYsMTMgKzQyNiwxMyBAQAogCQkt
LWNvdW50OwogCQkKIAkJbCAgPSAqKHVuc2lnbmVkIGNoYXIgKikgc3JjIDw8IDI0OwotCQkoKHVu
c2lnbmVkIGNoYXIgKikgc3JjKSsrOworCQlzcmMgKz0gc2l6ZW9mKHVuc2lnbmVkIGNoYXIpOwog
CQlsIHw9ICoodW5zaWduZWQgc2hvcnQgKikgc3JjIDw8IDg7Ci0JCSgodW5zaWduZWQgc2hvcnQg
Kikgc3JjKSsrOworCQlzcmMgKz0gc2l6ZW9mKHVuc2lnbmVkIHNob3J0KTsKIAkJd2hpbGUgKGNv
dW50LS0pCiAJCXsKIAkJCWwyID0gKih1bnNpZ25lZCBpbnQgKikgc3JjOwotCQkJKCh1bnNpZ25l
ZCBpbnQgKikgc3JjKSsrOworCQkJc3JjICs9IHNpemVvZih1bnNpZ25lZCBpbnQpOwogCQkJb3V0
bCAobGUzMl90b19jcHUobCB8IGwyID4+IDI0KSwgcG9ydCk7CiAJCQlsID0gbDIgPDwgODsKIAkJ
fQpAQCAtNDQzLDE2ICs0NDMsMTYgQEAKIAkJLS1jb3VudDsKIAkJCiAJCWwgID0gKih1bnNpZ25l
ZCBjaGFyICopIHNyYyA8PCAyNDsKLQkJKCh1bnNpZ25lZCBjaGFyICopIHNyYykrKzsKKwkJc3Jj
ICs9IHNpemVvZih1bnNpZ25lZCBjaGFyKTsKIAkJd2hpbGUgKGNvdW50LS0pCiAJCXsKIAkJCWwy
ID0gKih1bnNpZ25lZCBpbnQgKikgc3JjOwotCQkJKCh1bnNpZ25lZCBpbnQgKikgc3JjKSsrOwor
CQkJc3JjICs9IHNpemVvZih1bnNpZ25lZCBpbnQpOwogCQkJb3V0bCAobGUzMl90b19jcHUobCB8
IGwyID4+IDgpLCBwb3J0KTsKIAkJCWwgPSBsMiA8PCAyNDsKIAkJfQogCQlsMiAgPSAqKHVuc2ln
bmVkIHNob3J0ICopIHNyYyA8PCAxNjsKLQkJKCh1bnNpZ25lZCBzaG9ydCAqKSBzcmMpKys7CisJ
CXNyYyArPSBzaXplb2YodW5zaWduZWQgc2hvcnQpOwogCQlsMiB8PSAqKHVuc2lnbmVkIGNoYXIg
Kikgc3JjOwogCQlvdXRsIChsZTMyX3RvX2NwdShsIHwgbDIpLCBwb3J0KTsKIAkJYnJlYWs7Cg==

--========/40561E710000662F/mail.tiscali.be--
