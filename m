From: Miklos Szeredi <miklos@szeredi.hu>
Subject: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init on
	parisc
Date: Thu, 16 Mar 2006 14:13:04 +0100
Message-ID: <E1FJsHo-0006Yf-00__28645.8513270647$1416624586$gmane$org@dorka.pomaz.szeredi.hu>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="++----------20060316140732-041624518----------++"
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org
To: chris@frostnet.net,
 jick.nan@gmail.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu> (message from Miklos
	Szeredi on Mon, 13 Mar 2006 12:26:34 +0100)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--++----------20060316140732-041624518----------++
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Jick, Chris,

Can you please try the following module containing the simplified
versions of the fuse device read/write routines?

Copy the attached files into an empty directory, then do 'make' and
'insmod copytest.ko'.

Then do

  cat /proc/fs/test
  echo hello > /proc/fs/test
  dmesg | tail

I get something like this:

~$ cat /proc/fs/test
Hello!
~$ echo hello > /proc/fs/test
~$ dmesg | tail
test_read 0804d848 1024 0
dst: 0804d848 page: c13a9f40 offset: 2120 mapaddr: dd4fa000 ptr: dd4fa848
  test_read: 7
test_read 0804d848 1024 7
  test_read: 0
test_write 080e9008 6 0
src: 080e9008 page: c1167560 offset: 8 mapaddr: cb3ab000 ptr: cb3ab008
<hello
>
  test_write: 6
~$

You could also try changing the calls to my_copy_{to,from}_user2()
to my_copy_..._user1() and see if it makes a difference.

Thanks,
Miklos

--++----------20060316140732-041624518----------++
Content-Type: text/x-csrc; charset=us-ascii; name="copytest.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGxpbnV4L2ZzLmg+CiNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KI2luY2x1ZGUg
PGxpbnV4L3Byb2NfZnMuaD4KI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4KI2luY2x1ZGUgPGFz
bS91YWNjZXNzLmg+CgpNT0RVTEVfTElDRU5TRSgiR1BMIik7CgpzdGF0aWMgaW50IG15X2NvcHlf
dG9fdXNlcjEoY2hhciBfX3VzZXIgKmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3Qgc2l6ZSkK
ewogICAgcmV0dXJuIGNvcHlfdG9fdXNlcihkc3QsIHNyYywgc2l6ZSkgPyAtRUZBVUxUIDogMDsK
fQoKc3RhdGljIGludCBteV9jb3B5X2Zyb21fdXNlcjEoY2hhciAqZHN0LCBjb25zdCBjaGFyIF9f
dXNlciAqc3JjLCBzaXplX3Qgc2l6ZSkKewogICAgcmV0dXJuIGNvcHlfZnJvbV91c2VyKGRzdCwg
c3JjLCBzaXplKSA/IC1FRkFVTFQgOiAwOwp9CgpzdGF0aWMgaW50IG15X2NvcHlfdG9fdXNlcjIo
Y2hhciBfX3VzZXIgKmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3Qgc2l6ZSkKewogICAgaW50
IGVycjsKICAgIHN0cnVjdCBwYWdlICpwYWdlOwogICAgdW5zaWduZWQgbG9uZyBhZGRyID0gKHVu
c2lnbmVkIGxvbmcpIGRzdDsKICAgIHVuc2lnbmVkIG9mZnNldCA9IGFkZHIgJSBQQUdFX1NJWkU7
CiAgICB2b2lkICptYXBhZGRyOwogICAgdm9pZCAqcHRyOwogICAgaWYgKG9mZnNldCArIHNpemUg
PiBQQUdFX1NJWkUpCiAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgogICAgZG93bl9yZWFkKCZjdXJy
ZW50LT5tbS0+bW1hcF9zZW0pOwogICAgZXJyID0gZ2V0X3VzZXJfcGFnZXMoY3VycmVudCwgY3Vy
cmVudC0+bW0sIGFkZHIsIDEsIDEsIDAsICZwYWdlLCBOVUxMKTsKICAgIHVwX3JlYWQoJmN1cnJl
bnQtPm1tLT5tbWFwX3NlbSk7CiAgICBpZiAoZXJyIDwgMCkKICAgICAgICByZXR1cm4gZXJyOwog
ICAgQlVHX09OKGVyciAhPSAxKTsKICAgIG1hcGFkZHIgPSBrbWFwX2F0b21pYyhwYWdlLCBLTV9V
U0VSMCk7CiAgICBwdHIgPSBtYXBhZGRyICsgb2Zmc2V0OwoKICAgIHByaW50aygiZHN0OiAlcCBw
YWdlOiAlcCBvZmZzZXQ6ICV1IG1hcGFkZHI6ICVwIHB0cjogJXBcbiIsCiAgICAgICAgICAgZHN0
LCBwYWdlLCBvZmZzZXQsIG1hcGFkZHIsIHB0cik7CgogICAgbWVtY3B5KHB0ciwgc3JjLCBzaXpl
KTsKCiAgICBrdW5tYXBfYXRvbWljKG1hcGFkZHIsIEtNX1VTRVIwKTsKICAgIGZsdXNoX2RjYWNo
ZV9wYWdlKHBhZ2UpOwogICAgc2V0X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKICAgIHB1dF9wYWdl
KHBhZ2UpOwoKICAgIHJldHVybiAwOwp9CgpzdGF0aWMgaW50IG15X2NvcHlfZnJvbV91c2VyMihj
aGFyICpkc3QsIGNvbnN0IGNoYXIgX191c2VyICpzcmMsIHNpemVfdCBzaXplKQp7CiAgICBpbnQg
ZXJyOwogICAgc3RydWN0IHBhZ2UgKnBhZ2U7CiAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5z
aWduZWQgbG9uZykgc3JjOwogICAgdW5zaWduZWQgb2Zmc2V0ID0gYWRkciAlIFBBR0VfU0laRTsK
ICAgIHZvaWQgKm1hcGFkZHI7CiAgICB2b2lkICpwdHI7CiAgICBpZiAob2Zmc2V0ICsgc2l6ZSA+
IFBBR0VfU0laRSkKICAgICAgICByZXR1cm4gLUVJTlZBTDsKCiAgICBkb3duX3JlYWQoJmN1cnJl
bnQtPm1tLT5tbWFwX3NlbSk7CiAgICBlcnIgPSBnZXRfdXNlcl9wYWdlcyhjdXJyZW50LCBjdXJy
ZW50LT5tbSwgYWRkciwgMSwgMCwgMCwgJnBhZ2UsIE5VTEwpOwogICAgdXBfcmVhZCgmY3VycmVu
dC0+bW0tPm1tYXBfc2VtKTsKICAgIGlmIChlcnIgPCAwKQogICAgICAgIHJldHVybiBlcnI7CiAg
ICBCVUdfT04oZXJyICE9IDEpOwogICAgbWFwYWRkciA9IGttYXBfYXRvbWljKHBhZ2UsIEtNX1VT
RVIwKTsKICAgIHB0ciA9IG1hcGFkZHIgKyBvZmZzZXQ7CgogICAgcHJpbnRrKCJzcmM6ICVwIHBh
Z2U6ICVwIG9mZnNldDogJXUgbWFwYWRkcjogJXAgcHRyOiAlcFxuIiwKICAgICAgICAgICBzcmMs
IHBhZ2UsIG9mZnNldCwgbWFwYWRkciwgcHRyKTsKCiAgICBtZW1jcHkoZHN0LCBwdHIsIHNpemUp
OwoKICAgIGt1bm1hcF9hdG9taWMobWFwYWRkciwgS01fVVNFUjApOwogICAgcHV0X3BhZ2UocGFn
ZSk7CgogICAgcmV0dXJuIDA7Cn0KCgpzdGF0aWMgc3NpemVfdCB0ZXN0X3JlYWQoc3RydWN0IGZp
bGUgKmZpbGUsIGNoYXIgX191c2VyICpidWYsIHNpemVfdCBuYnl0ZXMsCiAgICAgICAgICAgICAg
ICAgICAgICAgICBsb2ZmX3QgKm9mZikKewogICAgc3NpemVfdCByZXMgPSAwOwogICAgY2hhciBo
ZWxsb1tdID0gIkhlbGxvIVxuIjsKICAgIHNpemVfdCBoZWxsb2xlbiA9IHN0cmxlbihoZWxsbyk7
CiAgICBwcmludGsoInRlc3RfcmVhZCAlcCAlbHUgJWxsdVxuIiwgYnVmLCAodW5zaWduZWQgbG9u
ZykgbmJ5dGVzLAogICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpICpvZmYpOwogICAgaWYg
KCEqb2ZmICYmIG5ieXRlcyA+IGhlbGxvbGVuKSB7CiAgICAgICAgcmVzID0gbXlfY29weV90b191
c2VyMihidWYsIGhlbGxvLCBoZWxsb2xlbik7CiAgICAgICAgaWYgKCFyZXMpIHsKICAgICAgICAg
ICAgKm9mZiArPSBoZWxsb2xlbjsKICAgICAgICAgICAgcmVzID0gaGVsbG9sZW47CiAgICAgICAg
fQogICAgfQogICAgcHJpbnRrKCIgIHRlc3RfcmVhZDogJWxpXG4iLCAobG9uZykgcmVzKTsKICAg
IHJldHVybiByZXM7Cn0KCnN0YXRpYyBzc2l6ZV90IHRlc3Rfd3JpdGUoc3RydWN0IGZpbGUgKmZp
bGUsIGNvbnN0IGNoYXIgX191c2VyICpidWYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6
ZV90IG5ieXRlcywgbG9mZl90ICpvZmYpCnsKICAgIHNzaXplX3QgcmVzID0gbmJ5dGVzOwogICAg
Y2hhciBoZWxsb1szMl07CiAgICBwcmludGsoInRlc3Rfd3JpdGUgJXAgJWx1ICVsbHVcbiIsIGJ1
ZiwgKHVuc2lnbmVkIGxvbmcpIG5ieXRlcywKICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25n
KSAqb2ZmKTsKICAgIGlmICghKm9mZiAmJiBuYnl0ZXMgPCBzaXplb2YoaGVsbG8pIC0gMSkgewog
ICAgICAgIHJlcyA9IG15X2NvcHlfZnJvbV91c2VyMihoZWxsbywgYnVmLCBuYnl0ZXMpOwogICAg
ICAgIGlmICghcmVzKSB7CiAgICAgICAgICAgIGhlbGxvW25ieXRlc10gPSAnXDAnOwogICAgICAg
ICAgICBwcmludGsoIjwlcz5cbiIsIGhlbGxvKTsKICAgICAgICAgICAgKm9mZiArPSBuYnl0ZXM7
CiAgICAgICAgICAgIHJlcyA9IG5ieXRlczsKICAgICAgICB9CiAgICB9CiAgICBwcmludGsoIiAg
dGVzdF93cml0ZTogJWxpXG4iLCAobG9uZykgcmVzKTsKICAgIHJldHVybiByZXM7Cn0KCnN0YXRp
YyBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHRlc3Rfb3BzID0gewoJLm93bmVyCQk9IFRISVNfTU9E
VUxFLAoJLnJlYWQJCT0gdGVzdF9yZWFkLAoJLndyaXRlCQk9IHRlc3Rfd3JpdGUsCn07CgpzdGF0
aWMgaW50IHRlc3RfaW5pdCh2b2lkKQp7CiAgICBzdHJ1Y3QgcHJvY19kaXJfZW50cnkgKmVudDsK
ICAgIGVudCA9IGNyZWF0ZV9wcm9jX2VudHJ5KCJ0ZXN0IiwgU19JRlJFRyB8IDA2NjYsIHByb2Nf
cm9vdF9mcyk7CiAgICBpZiAoZW50KQogICAgICAgIGVudC0+cHJvY19mb3BzID0gJnRlc3Rfb3Bz
OwogICAgcmV0dXJuIDA7Cn0KCnN0YXRpYyB2b2lkIHRlc3RfZXhpdCh2b2lkKQp7CiAgICByZW1v
dmVfcHJvY19lbnRyeSgidGVzdCIsIHByb2Nfcm9vdF9mcyk7Cn0KCm1vZHVsZV9pbml0KHRlc3Rf
aW5pdCk7Cm1vZHVsZV9leGl0KHRlc3RfZXhpdCk7Cg==
--++----------20060316140732-041624518----------++
Content-Type: application/octet-stream; name="Makefile"
Content-Transfer-Encoding: base64

b2JqLW0gOj0gY29weXRlc3QubwoKYWxsOgoJJChNQUtFKSAtQyAvbGliL21vZHVsZXMvYHVuYW1l
IC1yYC9idWlsZCBNPWBwd2RgCgpjbGVhbjoKCXJtIC1mICoubyAqLmtvICoubW9kLmMgLiouY21k
CglybSAtcmYgLnRtcF92ZXJzaW9ucwo=
--++----------20060316140732-041624518----------++
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--++----------20060316140732-041624518----------++--
