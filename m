From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] Some warning: ... cleanup?
Date: Mon, 18 Jun 2007 15:22:02 +0200
Message-ID: <JJU2GQ$2E3260944876E304C0F637A3B8C6B4DB__36994.9074266062$1416624397$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1182172922.2A.103215.42.6082.52.42.007.2075067635"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "kyle" <kyle@mcmartin.ca>
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

--_=__=_XaM3_.1182172922.2A.103215.42.6082.52.42.007.2075067635
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Kyle,

I was trying your patch v2.6.22-rc4 and fiure out some warnings:

/CAD/linux-2.6.22-rc4/drivers/parisc/dino.c:821: warning: format =91%lx=92=
 expects
type =91long unsigned int=92, but argument 4 has type =91resource_size_t=92=

/CAD/linux-2.6.22-rc4/drivers/parisc/dino.c:821: warning: format =91%lx=92=
 expects
type =91long unsigned int=92, but argument 5 has type =91resource_size_t=92=

/CAD/linux-2.6.22-rc4/drivers/parisc/dino.c:901: warning: format =91%lx=92=
 expects
type =91long unsigned int=92, but argument 3 has type =91resource_size_t=92=

/CAD/linux-2.6.22-rc4/drivers/parisc/dino.c:901: warning: format =91%lx=92=
 expects
type =91long unsigned int=92, but argument 4 has type =91resource_size_t=92=

/CAD/linux-2.6.22-rc4/drivers/parisc/asp.c:85: warning: format =91%lx=92 =
expects
type =91long unsigned int=92, but argument 4 has type =91resource_size_t=92=

/CAD/linux-2.6.22-rc4/drivers/parisc/eisa.c:317: warning: format =91%08lx=
=92
expects type =91long unsigned int=92, but argument 3 has type =91resource=
_size_t=92
/CAD/linux-2.6.22-rc4/drivers/parisc/eisa_enumerator.c:101: warning: form=
at
=91%lx=92 expects type =91long unsigned int=92, but argument 2 has type =91=
resource_size_t=92
/CAD/linux-2.6.22-rc4/drivers/parisc/eisa_enumerator.c:101: warning: form=
at
=91%lx=92 expects type =91long unsigned int=92, but argument 3 has type =91=
resource_size_t=92
/CAD/linux-2.6.22-rc4/drivers/parisc/eisa_enumerator.c:191: warning: form=
at
=91%lx=92 expects type =91long unsigned int=92, but argument 2 has type =91=
resource_size_t=92
/CAD/linux-2.6.22-rc4/drivers/parisc/eisa_enumerator.c:191: warning: form=
at
=91%lx=92 expects type =91long unsigned int=92, but argument 3 has type =91=
resource_size_t=92
/CAD/linux-2.6.22-rc4/drivers/parport/parport_gsc.c:362: warning: format =
=91%lx=92
expects type =91long unsigned int=92, but argument 2 has type =91resource=
_size_t=92
/CAD/linux-2.6.22-rc4/drivers/serial/8250_gsc.c:44: warning: format =91%l=
x=92
expects type =91long unsigned int=92, but argument 2 has type =91resource=
_size_t=92

I just got this SomeStuff.diff.

(imho just the same kind of patch already applied upstream a while ago,
regarding resource_size_t change:
<http://www.linuxhq.com/kernel/v2.6/18/kernel/resource.c>)

Fill free to use it at your best convenience.

J.

=0A---=0Ahttp://www.scarlet.be/
--_=__=_XaM3_.1182172922.2A.103215.42.6082.52.42.007.2075067635
Content-Type: application/octet-stream; name="=?iso-8859-1?Q?SomeStuff.diff?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?SomeStuff.diff?="

LS0tIC4vZHJpdmVycy9wYXJpc2MvZGluby5jLk9yaWcJMjAwNy0wNi0xOCAwOTowNTowNS4w
MDAwMDAwMDAgKzAwMDAKKysrIC4vZHJpdmVycy9wYXJpc2MvZGluby5jCTIwMDctMDYtMTgg
MDg6NTk6NDMuMDAwMDAwMDAwICswMDAwCkBAIC04OTksOCArODk5LDggQEAKIAlyZXMtPmZs
YWdzID0gSU9SRVNPVVJDRV9JTzsgLyogZG8gbm90IG1hcmsgaXQgYnVzeSAhICovCiAJaWYg
KHJlcXVlc3RfcmVzb3VyY2UoJmlvcG9ydF9yZXNvdXJjZSwgcmVzKSA8IDApIHsKIAkJcHJp
bnRrKEtFUk5fRVJSICIlczogcmVxdWVzdCBJL08gUG9ydCByZWdpb24gZmFpbGVkICIKLQkJ
ICAgICAgICIweCVseC8lbHggKGhwYSAweCVwKVxuIiwKLQkJICAgICAgIG5hbWUsIHJlcy0+
c3RhcnQsIHJlcy0+ZW5kLCBkaW5vX2Rldi0+aGJhLmJhc2VfYWRkcik7CisJCSAgICAgICAi
MHglbGx4LyVsbHggKGhwYSAweCVwKVxuIiwKKwkJICAgICAgIG5hbWUsICh1bnNpZ25lZCBs
b25nIGxvbmcpIHJlcy0+c3RhcnQsICh1bnNpZ25lZCBsb25nIGxvbmcpIHJlcy0+ZW5kLCBk
aW5vX2Rldi0+aGJhLmJhc2VfYWRkcik7CiAJCXJldHVybiAxOwogCX0KIAotLS0gLi9kcml2
ZXJzL3BhcmlzYy9hc3AuYy5PcmlnCTIwMDctMDYtMTggMDk6MDU6MTUuMDAwMDAwMDAwICsw
MDAwCisrKyAuL2RyaXZlcnMvcGFyaXNjL2FzcC5jCTIwMDctMDYtMTggMDk6MDA6NTQuMDAw
MDAwMDAwICswMDAwCkBAIC04MSw4ICs4MSw4IEBACiAJYXNwLm5hbWUgPSAoYXNwLnZlcnNp
b24gPT0gMSkgPyAiQXNwIiA6ICJDdXRvZmYiOwogCWFzcC5ocGEgPSBBU1BfSU5URVJSVVBU
X0FERFI7CiAKLQlwcmludGsoS0VSTl9JTkZPICIlcyB2ZXJzaW9uICVkIGF0IDB4JWx4IGZv
dW5kLlxuIiwgCi0JCWFzcC5uYW1lLCBhc3AudmVyc2lvbiwgZGV2LT5ocGEuc3RhcnQpOwor
CXByaW50ayhLRVJOX0lORk8gIiVzIHZlcnNpb24gJWQgYXQgMHglbGx4IGZvdW5kLlxuIiwg
CisJCWFzcC5uYW1lLCBhc3AudmVyc2lvbiwgKHVuc2lnbmVkIGxvbmcgbG9uZykgZGV2LT5o
cGEuc3RhcnQpOwogCiAJLyogdGhlIElSUSBBU1Agc2hvdWxkIHVzZSAqLwogCXJldCA9IC1F
QlVTWTsKLS0tIC4vZHJpdmVycy9wYXJpc2MvZWlzYS5jLk9yaWcJMjAwNy0wNi0xOCAwOTow
NToyNy4wMDAwMDAwMDAgKzAwMDAKKysrIC4vZHJpdmVycy9wYXJpc2MvZWlzYS5jCTIwMDct
MDYtMTggMTE6NTg6MDAuMDAwMDAwMDAwICswMDAwCkBAIC0zMTMsOCArMzEzLDggQEAKIAog
CWNoYXIgKm5hbWUgPSBpc19tb25nb29zZShkZXYpID8gIk1vbmdvb3NlIiA6ICJXYXgiOwog
Ci0JcHJpbnRrKEtFUk5fSU5GTyAiJXMgRUlTQSBBZGFwdGVyIGZvdW5kIGF0IDB4JTA4bHhc
biIsIAotCQluYW1lLCBkZXYtPmhwYS5zdGFydCk7CisJcHJpbnRrKEtFUk5fSU5GTyAiJXMg
RUlTQSBBZGFwdGVyIGZvdW5kIGF0IDB4JWxseFxuIiwgCisJCW5hbWUsICh1bnNpZ25lZCBs
b25nIGxvbmcpIGRldi0+aHBhLnN0YXJ0KTsKIAogCWVpc2FfZGV2LmhiYS5kZXYgPSBkZXY7
CiAJZWlzYV9kZXYuaGJhLmlvbW11ID0gY2Npb19nZXRfaW9tbXUoZGV2KTsKLS0tIC4vZHJp
dmVycy9wYXJpc2MvZWlzYV9lbnVtZXJhdG9yLmMuT3JpZwkyMDA3LTA2LTE4IDA5OjA1OjQy
LjAwMDAwMDAwMCArMDAwMAorKysgLi9kcml2ZXJzL3BhcmlzYy9laXNhX2VudW1lcmF0b3Iu
YwkyMDA3LTA2LTE4IDA5OjAzOjIyLjAwMDAwMDAwMCArMDAwMApAQCAtMTg4LDcgKzE4OCw3
IEBACiAJCQlyZXMtPnN0YXJ0ID0gZ2V0XzE2KGJ1ZitsZW4rMSk7CiAJCQlyZXMtPmVuZCA9
IGdldF8xNihidWYrbGVuKzEpKyhjJkhQRUVfUE9SVF9TSVpFX01BU0spKzE7CiAJCQlyZXMt
PmZsYWdzID0gSU9SRVNPVVJDRV9JTzsKLQkJCXByaW50aygiaW9wb3J0cyAlbHgtJWx4ICIs
IHJlcy0+c3RhcnQsIHJlcy0+ZW5kKTsKKwkJCXByaW50aygiaW9wb3J0cyAlbGx4LSVsbHgg
IiwgKHVuc2lnbmVkIGxvbmcgbG9uZykgcmVzLT5zdGFydCwgKHVuc2lnbmVkIGxvbmcgbG9u
ZykgcmVzLT5lbmQpOwogCQkJcmVzdWx0ID0gcmVxdWVzdF9yZXNvdXJjZShpb19wYXJlbnQs
IHJlcyk7CiAJCQlpZiAocmVzdWx0IDwgMCkgewogCQkJCXByaW50aygiXG4iIEtFUk5fRVJS
ICJFSVNBIEVudW1lcmF0b3I6IGZhaWxlZCB0byBjbGFpbSBFSVNBIEJ1cyBhZGRyZXNzIHNw
YWNlIVxuIik7Ci0tLSAuL2RyaXZlcnMvcGFyaXNjL3NiYV9pb21tdS5jLk9yaWcJMjAwNy0w
Ni0xOCAwOToyMToxNC4wMDAwMDAwMDAgKzAwMDAKKysrIC4vZHJpdmVycy9wYXJpc2Mvc2Jh
X2lvbW11LmMJMjAwNy0wNi0xOCAwOToyMDozNC4wMDAwMDAwMDAgKzAwMDAKQEAgLTE5MDks
OCArMTkwOSw4IEBACiAJCQlnbG9iYWxfaW9jX2NudCAqPSAyOwogCX0KIAotCXByaW50ayhL
RVJOX0lORk8gIiVzIGZvdW5kICVzIGF0IDB4JWx4XG4iLAotCQlNT0RVTEVfTkFNRSwgdmVy
c2lvbiwgZGV2LT5ocGEuc3RhcnQpOworCXByaW50ayhLRVJOX0lORk8gIiVzIGZvdW5kICVz
IGF0IDB4JWxseFxuIiwKKwkJTU9EVUxFX05BTUUsIHZlcnNpb24sICh1bnNpZ25lZCBsb25n
IGxvbmcpIGRldi0+aHBhLnN0YXJ0KTsKIAogCXNiYV9kZXYgPSBremFsbG9jKHNpemVvZihz
dHJ1Y3Qgc2JhX2RldmljZSksIEdGUF9LRVJORUwpOwogCWlmICghc2JhX2RldikgewotLS0g
Li9kcml2ZXJzL3BhcnBvcnQvcGFycG9ydF9nc2MuYy5PcmlnCTIwMDctMDYtMTggMDk6MDU6
NTEuMDAwMDAwMDAwICswMDAwCisrKyAuL2RyaXZlcnMvcGFycG9ydC9wYXJwb3J0X2dzYy5j
CTIwMDctMDYtMTggMDk6MDQ6MzUuMDAwMDAwMDAwICswMDAwCkBAIC0zNTgsOCArMzU4LDgg
QEAKIAl1bnNpZ25lZCBsb25nIHBvcnQ7CiAKIAlpZiAoIWRldi0+aXJxKSB7Ci0JCXByaW50
ayhLRVJOX1dBUk5JTkcgIklSUSBub3QgZm91bmQgZm9yIHBhcmFsbGVsIGRldmljZSBhdCAw
eCVseFxuIiwKLQkJCWRldi0+aHBhLnN0YXJ0KTsKKwkJcHJpbnRrKEtFUk5fV0FSTklORyAi
SVJRIG5vdCBmb3VuZCBmb3IgcGFyYWxsZWwgZGV2aWNlIGF0IDB4JWxseFxuIiwKKwkJCSh1
bnNpZ25lZCBsb25nIGxvbmcpIGRldi0+aHBhLnN0YXJ0KTsKIAkJcmV0dXJuIC1FTk9ERVY7
CiAJfQogCi0tLSAuL2RyaXZlcnMvc2VyaWFsLzgyNTBfZ3NjLmMuT3JpZwkyMDA3LTA2LTE4
IDA5OjA2OjAxLjAwMDAwMDAwMCArMDAwMAorKysgLi9kcml2ZXJzL3NlcmlhbC84MjUwX2dz
Yy5jCTIwMDctMDYtMTggMDg6NTc6NTQuMDAwMDAwMDAwICswMDAwCkBAIC0zOSw5ICszOSw5
IEBACiAJCSAqIHRoZSB1c2VyIHdoYXQgdGhleSdyZSBtaXNzaW5nLgogCQkgKi8KIAkJaWYg
KHBhcmlzY19wYXJlbnQoZGV2KS0+aWQuaHdfdHlwZSAhPSBIUEhXX0lPQSkgewotCQkJcHJp
bnRrKEtFUk5fSU5GTyAiU2VyaWFsOiBkZXZpY2UgMHglbHggbm90IGNvbmZpZ3VyZWQuXG4i
CisJCQlwcmludGsoS0VSTl9JTkZPICJTZXJpYWw6IGRldmljZSAweCVsbHggbm90IGNvbmZp
Z3VyZWQuXG4iCiAJCQkJIkVuYWJsZSBzdXBwb3J0IGZvciBXYXgsIExhc2ksIEFzcCBvciBE
aW5vLlxuIiwKLQkJCQlkZXYtPmhwYS5zdGFydCk7CisJCQkJKHVuc2lnbmVkIGxvbmcgbG9u
ZykgZGV2LT5ocGEuc3RhcnQpOwogCQl9CiAJCXJldHVybiAtRU5PREVWOwogCX0K

--_=__=_XaM3_.1182172922.2A.103215.42.6082.52.42.007.2075067635
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1182172922.2A.103215.42.6082.52.42.007.2075067635--
