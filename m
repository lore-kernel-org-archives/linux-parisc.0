From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] some other small bitops.h suggestion?
Date: Tue, 5 Apr 2005 11:28:26 +0200
Message-ID: <42134E6200012F70@mail-2-bnl.tiscali.it>
References: <20050403143246.GE8921@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="========/42134E6200012F70/mail-2-bnl.tiscali.it"
To: "Randolph Chung" <randolph@tausq.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050403143246.GE8921@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--========/42134E6200012F70/mail-2-bnl.tiscali.it
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Randolph,

Thanks for previous ci :-)

Here is some other change to suggest (even thought it doesn't fix anythin=
g
:-( ):
--- include/asm-parisc/bitops.h.Orig    2005-04-05 10:29:52.000000000 +02=
00
+++ include/asm-parisc/bitops.h 2005-04-05 10:58:36.000000000 +0200
@@ -304,17 +304,10 @@
  * hweightN: returns the hamming weight (i.e. the number
  * of bits set) of a N-bit word
  */
-#define hweight64(x)                                           \
-({                                                             \
-       unsigned long __x =3D (x);                                \
-       unsigned int __w;                                       \
-       __w =3D generic_hweight32((unsigned int) __x);            \
-       __w +=3D generic_hweight32((unsigned int) (__x>>32));     \
-       __w;                                                    \
-})
-#define hweight32(x) generic_hweight32(x)
-#define hweight16(x) generic_hweight16(x)
-#define hweight8(x) generic_hweight8(x)
+#define hweight64(x)   generic_hweight64(x)
+#define hweight32(x)   generic_hweight32(x)
+#define hweight16(x)   generic_hweight16(x)
+#define hweight8(x)    generic_hweight8(x)
 
 /*
  * Every architecture must define this function. It's the fastest
@@ -337,10 +330,8 @@
 #else
        if (unlikely(b[0]))
                return __ffs(b[0]);
-       if (unlikely(((unsigned int)b[1])))
+       if (unlikely(b[1]))
                return __ffs(b[1]) + 64;
-       if (b[1] >> 32)
-               return __ffs(b[1] >> 32) + 96;
        return __ffs(b[2]) + 128;
 #endif
 }
=3D=3D=3D=3D><=3D=3D=3D=3D

The first hunk was because hweight64() was not 32bit ok (even thought not=

actually used right now) and willy suggest me this change (as other arch
:-) ).

The second hunk just because I didn't understand why this form (looks lik=
e
sparc64) and not another (e.g. ppc64).
I so wrote a small test (here attached bitops-t5.c) and don't see signifi=
cant
performance lost/win (excepted if I made mistakes)

Thanks,
    Joel



--========/42134E6200012F70/mail-2-bnl.tiscali.it
Content-Type: text/plain
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="include_asm-parisc_bitops.h.diff"

LS0tIGluY2x1ZGUvYXNtLXBhcmlzYy9iaXRvcHMuaC5PcmlnCTIwMDUtMDQtMDUgMTA6Mjk6NTIu
MDAwMDAwMDAwICswMjAwCisrKyBpbmNsdWRlL2FzbS1wYXJpc2MvYml0b3BzLmgJMjAwNS0wNC0w
NSAxMDo1ODozNi4wMDAwMDAwMDAgKzAyMDAKQEAgLTMwNCwxNyArMzA0LDEwIEBACiAgKiBod2Vp
Z2h0TjogcmV0dXJucyB0aGUgaGFtbWluZyB3ZWlnaHQgKGkuZS4gdGhlIG51bWJlcgogICogb2Yg
Yml0cyBzZXQpIG9mIGEgTi1iaXQgd29yZAogICovCi0jZGVmaW5lIGh3ZWlnaHQ2NCh4KQkJCQkJ
CVwKLSh7CQkJCQkJCQlcCi0JdW5zaWduZWQgbG9uZyBfX3ggPSAoeCk7CQkJCVwKLQl1bnNpZ25l
ZCBpbnQgX193OwkJCQkJXAotCV9fdyA9IGdlbmVyaWNfaHdlaWdodDMyKCh1bnNpZ25lZCBpbnQp
IF9feCk7CQlcCi0JX193ICs9IGdlbmVyaWNfaHdlaWdodDMyKCh1bnNpZ25lZCBpbnQpIChfX3g+
PjMyKSk7CVwKLQlfX3c7CQkJCQkJCVwKLX0pCi0jZGVmaW5lIGh3ZWlnaHQzMih4KSBnZW5lcmlj
X2h3ZWlnaHQzMih4KQotI2RlZmluZSBod2VpZ2h0MTYoeCkgZ2VuZXJpY19od2VpZ2h0MTYoeCkK
LSNkZWZpbmUgaHdlaWdodDgoeCkgZ2VuZXJpY19od2VpZ2h0OCh4KQorI2RlZmluZSBod2VpZ2h0
NjQoeCkJZ2VuZXJpY19od2VpZ2h0NjQoeCkKKyNkZWZpbmUgaHdlaWdodDMyKHgpCWdlbmVyaWNf
aHdlaWdodDMyKHgpCisjZGVmaW5lIGh3ZWlnaHQxNih4KQlnZW5lcmljX2h3ZWlnaHQxNih4KQor
I2RlZmluZSBod2VpZ2h0OCh4KQlnZW5lcmljX2h3ZWlnaHQ4KHgpCiAKIC8qCiAgKiBFdmVyeSBh
cmNoaXRlY3R1cmUgbXVzdCBkZWZpbmUgdGhpcyBmdW5jdGlvbi4gSXQncyB0aGUgZmFzdGVzdApA
QCAtMzM3LDEwICszMzAsOCBAQAogI2Vsc2UKIAlpZiAodW5saWtlbHkoYlswXSkpCiAJCXJldHVy
biBfX2ZmcyhiWzBdKTsKLQlpZiAodW5saWtlbHkoKCh1bnNpZ25lZCBpbnQpYlsxXSkpKQorCWlm
ICh1bmxpa2VseShiWzFdKSkKIAkJcmV0dXJuIF9fZmZzKGJbMV0pICsgNjQ7Ci0JaWYgKGJbMV0g
Pj4gMzIpCi0JCXJldHVybiBfX2ZmcyhiWzFdID4+IDMyKSArIDk2OwogCXJldHVybiBfX2Zmcyhi
WzJdKSArIDEyODsKICNlbmRpZgogfQo=


--========/42134E6200012F70/mail-2-bnl.tiscali.it
Content-Type: text/x-csrc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bitops-t5.c"

LyoKICAgICMgZ2NjIC1PMiAtbWFyY2g9Mi4wIC1EX19MUDY0X18gLURWT1JJRyAtbyBiaXRvcHMt
byBiaXRvcHMtdDUuYwogICAgIyBnY2MgLU8yIC1tYXJjaD0yLjAgLURfX0xQNjRfXyAtbyBiaXRv
cHMtbiBiaXRvcHMtdDUuYwogICAgIyBmb3IgaSBpbiAxIDIgMyA0IDUgOyBkbyBlY2hvICJMb29w
ICRpIjsgdGltZSAuL2JpdG9wcy1vIDsgdGltZSAuL2JpdG9wcy1uIDsgZG9uZQpMb29wIDEKLS0t
LS0tCkNvbXB1dGluZyBzY2hlZF9maW5kX2ZpcnN0X2JpdF9wYSgpIGZvciBpID0gMCB0byAyMTQ3
NDgzNjQ4Li4uCkxPT1BfU0laRSA9IDB4MDAwMDAwMDA4MDAwMDAwMC4KCnJlYWwgICAgMG0yMi41
ODJzCnVzZXIgICAgMG0yMi41NTBzCnN5cyAgICAgMG0wLjAyMXMKCkNvbXB1dGluZyBzY2hlZF9m
aW5kX2ZpcnN0X2JpdF9wcGM2NCgpIGZvciBpID0gMCB0byAyMTQ3NDgzNjQ4Li4uCkxPT1BfU0la
RSA9IDB4MDAwMDAwMDA4MDAwMDAwMC4KCnJlYWwgICAgMG0yMi41NzNzCnVzZXIgICAgMG0yMi41
NDRzCnN5cyAgICAgMG0wLjAyMHMKCkxvb3AgMgotLS0tLS0KQ29tcHV0aW5nIHNjaGVkX2ZpbmRf
Zmlyc3RfYml0X3BhKCkgZm9yIGkgPSAwIHRvIDIxNDc0ODM2NDguLi4KTE9PUF9TSVpFID0gMHgw
MDAwMDAwMDgwMDAwMDAwLgoKcmVhbCAgICAwbTIyLjYyNXMKdXNlciAgICAwbTIyLjU0NnMKc3lz
ICAgICAwbTAuMDIzcwoKQ29tcHV0aW5nIHNjaGVkX2ZpbmRfZmlyc3RfYml0X3BwYzY0KCkgZm9y
IGkgPSAwIHRvIDIxNDc0ODM2NDguLi4KTE9PUF9TSVpFID0gMHgwMDAwMDAwMDgwMDAwMDAwLgoK
cmVhbCAgICAwbTIyLjYwMXMKdXNlciAgICAwbTIyLjU2MnMKc3lzICAgICAwbTAuMDE1cwoKTG9v
cCAzCi0tLS0tLQpDb21wdXRpbmcgc2NoZWRfZmluZF9maXJzdF9iaXRfcGEoKSBmb3IgaSA9IDAg
dG8gMjE0NzQ4MzY0OC4uLgpMT09QX1NJWkUgPSAweDAwMDAwMDAwODAwMDAwMDAuCgpyZWFsICAg
IDBtMjIuNjE5cwp1c2VyICAgIDBtMjIuNTU0cwpzeXMgICAgIDBtMC4wMjNzCgpDb21wdXRpbmcg
c2NoZWRfZmluZF9maXJzdF9iaXRfcHBjNjQoKSBmb3IgaSA9IDAgdG8gMjE0NzQ4MzY0OC4uLgpM
T09QX1NJWkUgPSAweDAwMDAwMDAwODAwMDAwMDAuCgpyZWFsICAgIDBtMjIuNTgycwp1c2VyICAg
IDBtMjIuNTU4cwpzeXMgICAgIDBtMC4wMTNzCgpMb29wIDQKLS0tLS0tCkNvbXB1dGluZyBzY2hl
ZF9maW5kX2ZpcnN0X2JpdF9wYSgpIGZvciBpID0gMCB0byAyMTQ3NDgzNjQ4Li4uCkxPT1BfU0la
RSA9IDB4MDAwMDAwMDA4MDAwMDAwMC4KCnJlYWwgICAgMG0yMi42NTlzCnVzZXIgICAgMG0yMi41
NTlzCnN5cyAgICAgMG0wLjAyMnMKCkNvbXB1dGluZyBzY2hlZF9maW5kX2ZpcnN0X2JpdF9wcGM2
NCgpIGZvciBpID0gMCB0byAyMTQ3NDgzNjQ4Li4uCkxPT1BfU0laRSA9IDB4MDAwMDAwMDA4MDAw
MDAwMC4KCnJlYWwgICAgMG0yMy4wMDZzCnVzZXIgICAgMG0yMi41NjFzCnN5cyAgICAgMG0wLjAz
MHMKCkxvb3AgNQotLS0tLS0KQ29tcHV0aW5nIHNjaGVkX2ZpbmRfZmlyc3RfYml0X3BhKCkgZm9y
IGkgPSAwIHRvIDIxNDc0ODM2NDguLi4KTE9PUF9TSVpFID0gMHgwMDAwMDAwMDgwMDAwMDAwLgoK
cmVhbCAgICAwbTIyLjYyN3MKdXNlciAgICAwbTIyLjU2OXMKc3lzICAgICAwbTAuMDE4cwoKQ29t
cHV0aW5nIHNjaGVkX2ZpbmRfZmlyc3RfYml0X3BwYzY0KCkgZm9yIGkgPSAwIHRvIDIxNDc0ODM2
NDguLi4KTE9PUF9TSVpFID0gMHgwMDAwMDAwMDgwMDAwMDAwLgoKcmVhbCAgICAwbTIyLjYzMHMK
dXNlciAgICAwbTIyLjU1MnMKc3lzICAgICAwbTAuMDE5cwoKICovCgojaW5jbHVkZSA8c3RkaW8u
aD4KCi8qIGluY2x1ZGUvbGludXgvY29tcGlsZXIuaCAqLwojZGVmaW5lIGxpa2VseSh4KSAgICAg
ICBfX2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAxKQojZGVmaW5lIHVubGlrZWx5KHgpICAgICBfX2J1
aWx0aW5fZXhwZWN0KCEhKHgpLCAwKQoKIC8qIGluY2x1ZGUvbGludXgva2VybmVsLmggKi8KI2Rl
ZmluZSBVTExPTkdfTUFYICAgICAgKH4wVUxMKQoKLyoqCiAqIF9fZmZzIC0gZmluZCBmaXJzdCBi
aXQgaW4gd29yZC4KICogQHdvcmQ6IFRoZSB3b3JkIHRvIHNlYXJjaAogKgogKiBVbmRlZmluZWQg
aWYgbm8gYml0IGV4aXN0cywgc28gY29kZSBzaG91bGQgY2hlY2sgYWdhaW5zdCAwIGZpcnN0Lgog
Ki8KCnN0YXRpYyBfX2lubGluZV9fIHVuc2lnbmVkIGxvbmcgbG9uZyBfX2Zmcyh1bnNpZ25lZCBs
b25nIGxvbmcgeCkKewoJdW5zaWduZWQgbG9uZyBsb25nIHJldDsKCglfX2FzbV9fKAojaWZkZWYg
X19MUDY0X18KCQkiIGxkaSAgICAgICA2MywlMVxuIgoJCSIgZXh0cmQsdSwqPD4gICUwLDYzLDMy
LCUlcjBcbiIKCQkiIGV4dHJkLHUsKlRSICAlMCwzMSwzMiwlMFxuIgkvKiBtb3ZlIHRvcCAzMi1i
aXRzIGRvd24gKi8KCQkiIGFkZGkgICAgLTMyLCUxLCUxXG4iCiNlbHNlCgkJIiBsZGkgICAgICAg
MzEsJTFcbiIKI2VuZGlmCgkJIiBleHRydSw8PiAgJTAsMzEsMTYsJSVyMFxuIgoJCSIgZXh0cnUs
VFIgICUwLDE1LDE2LCUwXG4iCS8qIHh4eHgwMDAwIC0+IDAwMDB4eHh4ICovCgkJIiBhZGRpICAg
IC0xNiwlMSwlMVxuIgoJCSIgZXh0cnUsPD4gICUwLDMxLDgsJSVyMFxuIgoJCSIgZXh0cnUsVFIg
ICUwLDIzLDgsJTBcbiIJLyogMDAwMHh4MDAgLT4gMDAwMDAweHggKi8KCQkiIGFkZGkgICAgLTgs
JTEsJTFcbiIKCQkiIGV4dHJ1LDw+ICAlMCwzMSw0LCUlcjBcbiIKCQkiIGV4dHJ1LFRSICAlMCwy
Nyw0LCUwXG4iCS8qIDAwMDAwMHgwIC0+IDAwMDAwMDB4ICovCgkJIiBhZGRpICAgIC00LCUxLCUx
XG4iCgkJIiBleHRydSw8PiAgJTAsMzEsMiwlJXIwXG4iCgkJIiBleHRydSxUUiAgJTAsMjksMiwl
MFxuIgkvKiAwMDAwMDAweSwgMTEwMGIgLT4gMDAxMWIgKi8KCQkiIGFkZGkgICAgLTIsJTEsJTFc
biIKCQkiIGV4dHJ1LD0gICUwLDMxLDEsJSVyMFxuIgkvKiBjaGVjayBsYXN0IGJpdCAqLwoJCSIg
YWRkaSAgICAtMSwlMSwlMVxuIgoJCQk6ICIrciIgKHgpLCAiPXIiIChyZXQpICk7CgoJcmV0dXJu
IHJldDsKfQoKLyoKICogRXZlcnkgYXJjaGl0ZWN0dXJlIG11c3QgZGVmaW5lIHRoaXMg
ZnVuY3Rpb24uIEl0J3MgdGhlIGZhc3Rlc3QKICogd2F5IG9mIHNlYXJjaGluZyBhIDE0MC1iaXQg
Yml0bWFwIHdoZXJlIHRoZSBmaXJzdCAxMDAgYml0cyBhcmUKICogdW5saWtlbHkgdG8gYmUgc2V0
LiBJdCdzIGd1YXJhbnRlZWQgdGhhdCBhdCBsZWFzdCBvbmUgb2YgdGhlIDE0MAogKiBiaXRzIGlz
IGNsZWFyZWQuCiAqLwpzdGF0aWMgaW5saW5lIGludCBzY2hlZF9maW5kX2ZpcnN0X2JpdF9wYShj
b25zdCB1bnNpZ25lZCBsb25nIGxvbmcgKmIpCnsKI2lmbmRlZiBfX0xQNjRfXwoJaWYgKHVubGlr
ZWx5KGJbMF0pKQoJCXJldHVybiBfX2ZmcyhiWzBdKTsKCWlmICh1bmxpa2VseShiWzFdKSkKCQly
ZXR1cm4gX19mZnMoYlsxXSkgKyAzMjsKCWlmICh1bmxpa2VseShiWzJdKSkKCQlyZXR1cm4gX19m
ZnMoYlsyXSkgKyA2NDsKCWlmIChiWzNdKQoJCXJldHVybiBfX2ZmcyhiWzNdKSArIDk2OwoJcmV0
dXJuIF9fZmZzKGJbNF0pICsgMTI4OwojZWxzZQoJaWYgKHVubGlrZWx5KGJbMF0pKQoJCXJldHVy
biBfX2ZmcyhiWzBdKTsKCWlmICh1bmxpa2VseSgoKHVuc2lnbmVkIGludCliWzFdKSkpCgkJcmV0
dXJuIF9fZmZzKGJbMV0pICsgNjQ7CglpZiAoYlsxXSA+PiAzMikKCQlyZXR1cm4gX19mZnMoYlsx
XSA+PiAzMikgKyA5NjsKCXJldHVybiBfX2ZmcyhiWzJdKSArIDEyODsKI2VuZGlmCn0KCnN0YXRp
YyBpbmxpbmUgaW50IHNjaGVkX2ZpbmRfZmlyc3RfYml0X3BwYzY0KGNvbnN0IHVuc2lnbmVkIGxv
bmcgbG9uZyAqYikKewojaWZuZGVmIF9fTFA2NF9fCglpZiAodW5saWtlbHkoYlswXSkpCgkJcmV0
dXJuIF9fZmZzKGJbMF0pOwoJaWYgKHVubGlrZWx5KGJbMV0pKQoJCXJldHVybiBfX2ZmcyhiWzFd
KSArIDMyOwoJaWYgKHVubGlrZWx5KGJbMl0pKQoJCXJldHVybiBfX2ZmcyhiWzJdKSArIDY0OwoJ
aWYgKGJbM10pCgkJcmV0dXJuIF9fZmZzKGJbM10pICsgOTY7CglyZXR1cm4gX19mZnMoYls0XSkg
KyAxMjg7CiNlbHNlCglpZiAodW5saWtlbHkoYlswXSkpCgkJcmV0dXJuIF9fZmZzKGJbMF0pOwoJ
aWYgKHVubGlrZWx5KGJbMV0pKQoJCXJldHVybiBfX2ZmcyhiWzFdKSArIDY0OwoJcmV0dXJuIF9f
ZmZzKGJbMl0pICsgMTI4OwojZW5kaWYKfQoKI2lmbmRlZiBfX0xQNjRfXwojZGVmaW5lIEJJVE1B
UF9TSVpFCTUKI2Vsc2UKI2RlZmluZSBCSVRNQVBfU0laRQkzCiNlbmRpZgoKI2RlZmluZSBMT09Q
X1NJWkUJMHg4MDAwMDAwMFVMTAoKbWFpbigpCnsKCWNoYXIgYnVmWzUxMl07CglpbnQgbSxuOwoJ
dW5zaWduZWQgbG9uZyBsb25nIGksIEV4dHJkOwoKCXN0cnVjdCBwcmlvX2FycmF5X3NhbXBsZSB7
CgkJdW5zaWduZWQgbG9uZyBsb25nIGJpdG1hcFtCSVRNQVBfU0laRV07Cgl9IHNfYXJyYXk7CgoJ
Zm9yIChtPTA7IG08QklUTUFQX1NJWkU7IG0rKykgewoJCXNfYXJyYXkuYml0bWFwW21dID0gMFVM
TDsKCX0KCiNpZmRlZiBWT1JJRwoJcHJpbnRmKCJDb21wdXRpbmcgc2NoZWRfZmluZF9maXJzdF9i
aXRfcGEoKSBmb3IgaSA9ICV1IHRvICVsbHUuLi5cbiIsIDAsIExPT1BfU0laRSk7CiNlbHNlCglw
cmludGYoIkNvbXB1dGluZyBzY2hlZF9maW5kX2ZpcnN0X2JpdF9wcGM2NCgpIGZvciBpID0gJXUg
dG8gJWxsdS4uLlxuIiwgMCwgTE9PUF9TSVpFKTsKI2VuZGlmCglwcmludGYoIkxPT1BfU0laRSA9
ICUjMDE4bGx4LlxuIiwgTE9PUF9TSVpFKTsKCglmb3IgKG09MDsgbTxCSVRNQVBfU0laRTsgbSsr
KSB7CgkJc19hcnJheS5iaXRtYXBbbV0gPSAweDEyMzQ1Njc4OWFiY2RlMGZVTEw7Cgl9CgoJZm9y
IChpPTB4MFVMTDsgaTxMT09QX1NJWkU7IGkrKykgewojaWZkZWYgVk9SSUcKCQlzY2hlZF9maW5k
X2ZpcnN0X2JpdF9wYShzX2FycmF5LmJpdG1hcCk7CiNlbHNlCgkJc2NoZWRfZmluZF9maXJzdF9i
aXRfcHBjNjQoc19hcnJheS5iaXRtYXApOwojZW5kaWYKCX0KCn0KCg==

--========/42134E6200012F70/mail-2-bnl.tiscali.it
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--========/42134E6200012F70/mail-2-bnl.tiscali.it--
