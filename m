Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77A5D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Jun 2001 07:31:11 -0600 (MDT)
Received: from esiee.fr (mail.esiee.fr [147.215.1.3])
	by mail.esiee.fr (Postfix) with ESMTP id 7201BD15AC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Jun 2001 15:30:56 +0200 (CEST)
Date: Tue, 12 Jun 2001 15:30:56 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed;boundary="'ThIs-RaNdOm-StRiNg-/=_.80630276:"
From: Clement MOYROUD <moyroudc@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20010612133056.7201BD15AC@mail.esiee.fr>
Subject: [parisc-linux] patch  for Dino serial port (again !)
List-ID: <linux-parisc.vger.kernel.org>

--'ThIs-RaNdOm-StRiNg-/=_.80630276:
Content-Type: text/plain; charset=iso-8859-1
Content-Length: 790
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0

Hi all !                                                              
                                                                      
Based on Grant's comments (thanks Grant !), I decided to keep the     
method used in my first patch, as the other one was making things more
complicated. So I modified the parts that needed clearing, and I make 
this patch available for you to test before commitment to cvs.        
Don't hesitate to test, as it has only been tested on a B132L+ and a  
B180. Any remarks or suggestions appreciated !                        
                                                                      
Clement MOYROUD                                                       
ESIEE Team                                                            
--'ThIs-RaNdOm-StRiNg-/=_.80630276:
Content-Disposition: attachment;filename=dinors232.patch
Content-Type: application/octet-stream
Content-Length: 4564
Content-Transfer-Encoding: base64
MIME-Version: 1.0

ZGlmZiAtTnJ1IGxpbnV4L2RyaXZlcnMvZ3NjL2Rpbm8uYyBsaW51eC5uZXcvZHJpdmVycy9nc2Mv
ZGluby5jCi0tLSBsaW51eC9kcml2ZXJzL2dzYy9kaW5vLmMJVHVlIEp1biAxMiAxNDo0OTo0MiAy
MDAxCisrKyBsaW51eC5uZXcvZHJpdmVycy9nc2MvZGluby5jCVR1ZSBKdW4gMTIgMTQ6NDk6NTkg
MjAwMQpAQCAtNjYsNiArNjYsNyBAQAogI2luY2x1ZGUgPGFzbS9pcnEuaD4JCS8qIGZvciAiZ3Nj
IiBpcnEgZnVuY3Rpb25zICovCiAjaW5jbHVkZSA8YXNtL2dzYy5oPgogCisjaW5jbHVkZSAiYnVz
ZGV2aWNlLmgiCiAKICN1bmRlZiBESU5PX0RFQlVHCiAKQEAgLTU0Miw2ICs1NDMsMjEgQEAKIAl9
CiB9CiAKK3N0YXRpYyBpbnQKK2Rpbm9fZmluZF9pcnEoc3RydWN0IGJ1c2RldmljZSAqZGlub19k
ZXYsIHN0cnVjdCBocF9kZXZpY2UgKmRldikKK3sJCisgICAgICAgIGludCBpcnE7CisgICAgICAg
IGludCBvZmYgPSAoKGludCkgZGV2LT5ocGEpICYgMHhmZmZmOworCisJc3dpdGNoIChvZmYpIHsK
KwljYXNlIDB4MTAwMDoJaXJxID0gODsgIGJyZWFrOyAvKiBQUy8yIEtleWJvYXJkIGFuZCBNb3Vz
ZSAqLworCWNhc2UgMHgzMDAwOglpcnEgPSAxMDsgYnJlYWs7IC8qIFJTMjMyICovCisJZGVmYXVs
dDogICAgICAgIGlycSA9IC0xOyBicmVhazsgLyogdW5rbm93biAqLworCX0KKworCXJldHVybiBp
cnE7Cit9CisKIHN0YXRpYyB2b2lkIF9faW5pdAogZGlub19iaW9zX2luaXQodm9pZCkKIHsKQEAg
LTgwNCwxOCArODIwLDMzIEBACiB9CiAKIHN0YXRpYyBpbnQgX19pbml0Ci1kaW5vX2NvbW1vbl9p
bml0KHN0cnVjdCBkaW5vX2RldmljZSAqZGlub19kZXYpCitkaW5vX2NvbW1vbl9pbml0KHN0cnVj
dCBocF9kZXZpY2UgKmQsIHN0cnVjdCBkaW5vX2RldmljZSAqZGlub19kZXYpCiB7CiAJaW50IHN0
YXR1czsKIAl1MzIgZWltOwogCXN0cnVjdCBnc2NfaXJxIGdzY19pcnE7CiAJc3RydWN0IHJlc291
cmNlICpyZXM7CiAKKwlzdHJ1Y3QgYnVzZGV2aWNlICpkaW5vX2J1c2RldmljZTsKKwlpbnQgcmV0
OworCiAJcGNpYmlvc19yZWdpc3Rlcl9oYmEoKHN0cnVjdCBwY2lfaGJhX2RhdGEgKikgZGlub19k
ZXYpOwogCiAJcGNpX2Jpb3MgPSAmZGlub19iaW9zX29wczsgICAvKiB1c2VkIGJ5IHBjaV9zY2Fu
X2J1cygpICovCiAJcGNpX3BvcnQgPSAmZGlub19wb3J0X29wczsKIAorCisgICAgICAgIC8qIE5l
ZWRlZCBmb3IgdGhlIHNlcmlhbCBwb3J0IHRvIHdvcmsuICovCisKKwlkaW5vX2J1c2RldmljZSA9
IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBidXNkZXZpY2UpLCBHRlBfS0VSTkVMKTsKKwlpZighZGlu
b19idXNkZXZpY2UpCisJCXJldHVybiAtRU5PTUVNOworCQorCWRpbm9fYnVzZGV2aWNlLT5uYW1l
ID0gIkRpbm8iOworCWRpbm9fYnVzZGV2aWNlLT5ocGEgPSBkLT5ocGE7CisJZGlub19idXNkZXZp
Y2UtPmZpbmRfaXJxID0gZGlub19maW5kX2lycTsKKwkKKwogCS8qCiAJKiogTm90ZTogU01QIHN5
c3RlbXMgY2FuIG1ha2UgdXNlIG9mIElSUjEvSUFSMSByZWdpc3RlcnMKIAkqKiAgIEJ1dCBpdCB3
b24ndCBidXkgbXVjaCBwZXJmb3JtYW5jZSBleGNlcHQgaW4gdmVyeQpAQCAtODU5LDYgKzg5MCwy
MSBAQAogCQlyZXR1cm4oMSk7CiAJfQogCisJLyogUmVnaXN0ZXIgYnVzZGV2aWNlIGZvciB0aGUg
c2VyaWFsIHBvcnQgKi8KKworCWRpbm9fYnVzZGV2aWNlLT5wYXJlbnRfaXJxID0gZ3NjX2lycS5p
cnE7CisJZGlub19idXNkZXZpY2UtPmVpbSA9ICgodTMyKSBnc2NfaXJxLnR4bl9hZGRyKSB8IGdz
Y19pcnEudHhuX2RhdGE7CisKKwlyZXQgPSByZWdpc3Rlcl9idXNkZXZpY2UoZCxkaW5vX2J1c2Rl
dmljZSk7CisJaWYgKHJldCkgeworCSAgICBrZnJlZShkaW5vX2J1c2RldmljZSk7CisJICAgIHJl
dHVybiByZXQ7CisJfQorCisJa2ZyZWUoZGlub19idXNkZXZpY2UtPmJ1c2Rldl9yZWdpb24pOwor
CWRpbm9fYnVzZGV2aWNlLT5idXNkZXZfcmVnaW9uID0gZGlub19kZXYtPmRpbm9fcmVnaW9uOwor
CQorCiAJLyoKIAkqKiBUaGlzIGVuYWJsZXMgRElOTyB0byBnZW5lcmF0ZSBpbnRlcnJ1cHRzIHdo
ZW4gaXQgc2VlcwogCSoqIGFueSBvZiBpdCdzIGlucHV0cyAqY2hhbmdlKi4gSnVzdCBhc3NlcnRp
bmcgYW4gSVJRCkBAIC05NDUsNyArOTkxLDcgQEAKIAkJZGlub19icmlkZ2VfaW5pdChkaW5vX2Rl
dik7CiAJfQogCi0JaWYgKGRpbm9fY29tbW9uX2luaXQoZGlub19kZXYpKQorCWlmIChkaW5vX2Nv
bW1vbl9pbml0KGQsZGlub19kZXYpKQogCQlyZXR1cm4oMSk7CiAKIAkvKgpAQCAtOTU3LDUgKzEw
MDMsMTAgQEAKIAogCXJldHVybiAwOwogfQorCisKKworCisKIAogCmRpZmYgLU5ydSBsaW51eC9k
cml2ZXJzL2dzYy9zZXJpYWwuYyBsaW51eC5uZXcvZHJpdmVycy9nc2Mvc2VyaWFsLmMKLS0tIGxp
bnV4L2RyaXZlcnMvZ3NjL3NlcmlhbC5jCVR1ZSBKdW4gMTIgMTQ6NDk6MzIgMjAwMQorKysgbGlu
dXgubmV3L2RyaXZlcnMvZ3NjL3NlcmlhbC5jCVR1ZSBKdW4gMTIgMTQ6NTA6MDYgMjAwMQpAQCAt
MzUsNiArMzUsNyBAQAogCiAjaW5jbHVkZSAiYnVzZGV2aWNlLmgiCiAKKwogc3RhdGljIGludCBz
ZXJpYWxfbGluZV9ucjsKIAogc3RhdGljIGludCBfX2luaXQgCkBAIC04Nyw5ICs4OSwxMiBAQAog
CXJldHVybiAwOwogfQogCi0KLXN0YXRpYyBzdHJ1Y3QgcGFfaW9kY19kcml2ZXIgc2VyaWFsX2Ry
aXZlcnNfZm9yW10gPSB7Ci0gIHtIUEhXX0ZJTywgMHgwNUYsIDB4MCwgMHgwMDA4MSwgMHgwLCAw
LAkJLyogQS1jbGFzcyAxODAgKi8KK3N0YXRpYyBzdHJ1Y3QgcGFfaW9kY19kcml2ZXIgc2VyaWFs
X2RyaXZlcnNfZm9yW10gPSB7ICAKKyAgIHtIUEhXX0ZJTywgMHgwMjIsIDB4MCwgMHgwMDA4Qywg
MHgwLCAwLAkJLyogQi1DbGFzcyAxMzIgJiAxODAgKi8KKwlEUklWRVJfQ0hFQ0tfSFZFUlNJT04g
KyBEUklWRVJfQ0hFQ0tfSFZFUlNJT05fUkVWICsgCisJRFJJVkVSX0NIRUNLX1NWRVJTSU9OICsg
RFJJVkVSX0NIRUNLX0hXVFlQRSwKKwkic2VyaWFsIGRldmljZSIsICJCIENsYXNzIiwgc2VyaWFs
X2luaXRfY2hpcH0sCisgICB7SFBIV19GSU8sIDB4MDVGLCAweDAsIDB4MDAwODEsIDB4MCwgMCwJ
CS8qIEEtY2xhc3MgMTgwICovCiAJRFJJVkVSX0NIRUNLX0hWRVJTSU9OICsgRFJJVkVSX0NIRUNL
X0hWRVJTSU9OX1JFViArIAogCURSSVZFUl9DSEVDS19TVkVSU0lPTiArIERSSVZFUl9DSEVDS19I
V1RZUEUsCiAJInNlcmlhbCBkZXZpY2UiLCAidW5rbm93biIsIHNlcmlhbF9pbml0X2NoaXB9LApA
QCAtMTEwLDMgKzExNSwxMSBAQAogI2VuZGlmCiAJcmVnaXN0ZXJfZHJpdmVyKHNlcmlhbF9kcml2
ZXJzX2Zvcik7CiB9CisKKworCisKKworCisKKwo=
--'ThIs-RaNdOm-StRiNg-/=_.80630276:--
