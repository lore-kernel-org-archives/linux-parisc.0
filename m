From: "Andy Walker" <ajwalker@broadpark.no>
Subject: Patch for stifb=bpp:x:y handling
Date: Mon, 1 Nov 2004 23:12:04 +0100 (CET)
Message-ID: <36432.127.0.0.1.1099347124.squirrel@127.0.0.1>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_20041101231204_87131"
Cc: "Helge Deller" <deller@gmx.de>
To: "Matthew Wilcox" <matthew@wil.cx>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <ajwalker@broadpark.no>
List-ID: <linux-parisc.vger.kernel.org>

------=_20041101231204_87131
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

> ---------------------------- Original Message
---------------------------- > Subject: Re: Penguin color problems on
HCRX-24
> From:    "Helge Deller" <deller@gmx.de>
> Date:    Mon, November 1, 2004 6:21 pm
> To:      "Andy Walker" <ajwalker@broadpark.no>
> Cc:      "Johannes Raspe" <j.raspe@t-online.de>
>          parisc-linux@lists.parisc-linux.org
> --------------------------------------------------------------------------
>
> On Monday 01 November 2004 15:03, Andy Walker wrote:
>> Hi Helge,
>>
>> The logic is all wrong though IMHO. What it say is:
>>
>> - If I have specified a bpp for *ANY* fb, then default
>>   the others to their "capability" - for HCRX24 this is 32.
>>
>> - If I have not specified any bpp's then default to 8bpp
>>   on all.
>>
>> e.g. with a Vis-EG on fb0 and an HCRX24's on fb1 and the commandline:
>>
>>   stif=bpp:8
>>
>> fb0 comes up 8bpp and fb1 comes up 32bpp, but with no commandline they
>> both come up 8bpp. That's weird.
>>
>> My change made the logic:
>>
>> - Default all fb's to their "capability", except where the
>>   user says otherwise for a given fb (you can default an fb
>>   by setting 0 e.g. stifb=bpp=0:8).
>
> Ok - please commit your patch, but without this unnecessary part:
> +       for (i = 0; i < MAX_STI_ROMS; i++)
> +               stifb_bpp_pref[i] = 0;
>
> Rgs,
> Helge

Okay, here's the revised patch. Although the diff says its against
rc1-pa5 it should apply cleanly to rc1-pa8 (my rc1-pa5 has Helge's
second HCRX24 patch applied, making it equivalent to rc1-pa8).

Willy (or some other kind soul), can this get submitted please -
it fixes cruft in the previous options patch.

-Andy


------=_20041101231204_87131
Content-Type: application/octet-stream; name="stifb.c.awa.ud"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="stifb.c.awa.ud"

LS0tIGxpbnV4LTIuNi4xMC1yYzEtcGE1L2RyaXZlcnMvdmlkZW8vc3RpZmIuYwkyMDA0LTExLTAx
IDIyOjA4OjU4LjIwMTc1MDAwMCArMDEwMAorKysgbGludXgtMi42LjEwLXJjMS1wYTUuYXdhL2Ry
aXZlcnMvdmlkZW8vc3RpZmIuYwkyMDA0LTExLTAxIDE5OjMyOjQzLjAwMDAwMDAwMCArMDEwMApA
QCAtMTE1LDggKzExNSw3IEBACiAJdTMyIHBzZXVkb19wYWxldHRlWzI1Nl07CiB9OwogCi1zdGF0
aWMgaW50IF9faW5pdGRhdGEgYnBwID0gODsJLyogcGFyYW1ldGVyIGZyb20gbW9kcHJvYmUgKi8K
LXN0YXRpYyBpbnQgX19pbml0ZGF0YSBzdGlmYl9mb3JjZV9icHBbTUFYX1NUSV9ST01TXTsKK3N0
YXRpYyBpbnQgX19pbml0ZGF0YSBzdGlmYl9icHBfcHJlZltNQVhfU1RJX1JPTVNdOwogCiAvKiAt
LS0tLS0tLS0tLS0tLS0tLS0tIGNoaXBzZXQgc3BlY2lmaWMgZnVuY3Rpb25zIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tICovCiAKQEAgLTExNTgsNyArMTE1Nyw3IEBACiAgKi8KIAogaW50IF9f
aW5pdAotc3RpZmJfaW5pdF9mYihzdHJ1Y3Qgc3RpX3N0cnVjdCAqc3RpLCBpbnQgZm9yY2VfYnBw
KQorc3RpZmJfaW5pdF9mYihzdHJ1Y3Qgc3RpX3N0cnVjdCAqc3RpLCBpbnQgYnBwX3ByZWYpCiB7
CiAJc3RydWN0IGZiX2ZpeF9zY3JlZW5pbmZvICpmaXg7CiAJc3RydWN0IGZiX3Zhcl9zY3JlZW5p
bmZvICp2YXI7CkBAIC0xMjYxLDggKzEyNjAsOCBAQAogI2VuZGlmCiAJCWZiLT5kZXZpY2VTcGVj
aWZpY0NvbmZpZyA9IF9fcmF3X3JlYWRsKHN0aV9yb21fYWRkcmVzcyk7CiAJCWlmIChJU18yNF9E
RVZJQ0UoZmIpKSB7Ci0JCQlpZiAoZm9yY2VfYnBwID09IDggfHwgZm9yY2VfYnBwID09IDMyKQot
CQkJCWJwcCA9IGZvcmNlX2JwcDsKKwkJCWlmIChicHBfcHJlZiA9PSA4IHx8IGJwcF9wcmVmID09
IDMyKQorCQkJCWJwcCA9IGJwcF9wcmVmOwogCQkJZWxzZQogCQkJCWJwcCA9IDMyOwogCQl9IGVs
c2UKQEAgLTE0MTIsMjEgKzE0MTEsMjQgQEAKIAkKIAlkZWZfc3RpID0gc3RpX2dldF9yb20oMCk7
CiAJaWYgKGRlZl9zdGkpIHsKLQkJZm9yIChpID0gMTsgaSA8IE1BWF9TVElfUk9NUzsgaSsrKSB7
CisJCWZvciAoaSA9IDE7IGkgPD0gTUFYX1NUSV9ST01TOyBpKyspIHsKIAkJCXN0aSA9IHN0aV9n
ZXRfcm9tKGkpOwotCQkJaWYgKHN0aSA9PSBkZWZfc3RpICYmIGJwcCA+IDApCi0JCQkJc3RpZmJf
Zm9yY2VfYnBwW2ldID0gYnBwOworCQkJaWYgKCFzdGkpCisJCQkJYnJlYWs7CisJCQlpZiAoc3Rp
ID09IGRlZl9zdGkpIHsKKwkJCQlzdGlmYl9pbml0X2ZiKHN0aSwgc3RpZmJfYnBwX3ByZWZbaSAt
IDFdKTsKKwkJCQlicmVhazsKKwkJCX0KIAkJfQotCQlzdGlmYl9pbml0X2ZiKGRlZl9zdGksIHN0
aWZiX2ZvcmNlX2JwcFtpXSk7CiAJfQogCi0JZm9yIChpID0gMTsgaSA8IE1BWF9TVElfUk9NUzsg
aSsrKSB7CisJZm9yIChpID0gMTsgaSA8PSBNQVhfU1RJX1JPTVM7IGkrKykgewogCQlzdGkgPSBz
dGlfZ2V0X3JvbShpKTsKLQkJaWYgKCFzdGkgfHwgc3RpPT1kZWZfc3RpKQorCQlpZiAoIXN0aSkK
IAkJCWJyZWFrOwotCQlpZiAoYnBwID4gMCkKLQkJCXN0aWZiX2ZvcmNlX2JwcFtpXSA9IGJwcDsK
LQkJc3RpZmJfaW5pdF9mYihzdGksIHN0aWZiX2ZvcmNlX2JwcFtpXSk7CisJCWlmIChzdGkgPT0g
ZGVmX3N0aSkKKwkJCWNvbnRpbnVlOworCQlzdGlmYl9pbml0X2ZiKHN0aSwgc3RpZmJfYnBwX3By
ZWZbaSAtIDFdKTsKIAl9CiAJcmV0dXJuIDA7CiB9CkBAIC0xNDQxLDcgKzE0NDMsNyBAQAogCXN0
cnVjdCBzdGlfc3RydWN0ICpzdGk7CiAJaW50IGk7CiAJCi0JZm9yIChpID0gMTsgaSA8IE1BWF9T
VElfUk9NUzsgaSsrKSB7CisJZm9yIChpID0gMTsgaSA8PSBNQVhfU1RJX1JPTVM7IGkrKykgewog
CQlzdGkgPSBzdGlfZ2V0X3JvbShpKTsKIAkJaWYgKCFzdGkpCiAJCQlicmVhazsKQEAgLTE0NzMs
MTEgKzE0NzUsOSBAQAogCWlmIChzdHJuY21wKG9wdGlvbnMsICJicHAiLCAzKSA9PSAwKSB7CiAJ
CW9wdGlvbnMgKz0gMzsKIAkJZm9yIChpID0gMDsgaSA8IE1BWF9TVElfUk9NUzsgaSsrKSB7Ci0J
CQlpZiAoKm9wdGlvbnMrKyA9PSAnOicpIHsKLQkJCQlzdGlmYl9mb3JjZV9icHBbaV0gPSBzaW1w
bGVfc3RydG91bChvcHRpb25zLCAmb3B0aW9ucywgMTApOwotCQkJCWJwcCA9IC0xOwotCQkJfSBl
bHNlCisJCQlpZiAoKm9wdGlvbnMrKyAhPSAnOicpCiAJCQkJYnJlYWs7CisJCQlzdGlmYl9icHBf
cHJlZltpXSA9IHNpbXBsZV9zdHJ0b3VsKG9wdGlvbnMsICZvcHRpb25zLCAxMCk7CiAJCX0KIAl9
CiAJcmV0dXJuIDA7Cg==
------=_20041101231204_87131--
