Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.126.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D0414971
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 06:25:01 -0600 (MDT)
Received: from [212.227.126.208] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1A7wKJ-0007ui-00
	for parisc-linux@lists.parisc-linux.org; Fri, 10 Oct 2003 14:24:59 +0200
Received: from [138.245.177.138] (helo=mail.malloc.de)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 1A7wKJ-0006N7-00
	for parisc-linux@lists.parisc-linux.org; Fri, 10 Oct 2003 14:24:59 +0200
Date: 10 Oct 2003 12:22:06 -0000
Message-ID: <20031010122206.714.qmail@w2.w-local>
From: "Wolfram Gloger" <wg@malloc.de>
To: carlos@baldric.uwo.ca
Cc: parisc-linux@lists.parisc-linux.org
In-reply-to: "carlos@baldric.uwo.ca"'s message of Thu, 25 Sep 2003 17:15:09
	-0400
References: 
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="++----------20031010142201-104024179----------++"
Subject: [parisc-linux] Re: [RFC] Where to put arch-dependant locking in malloc/thread-m.h
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

This is a multi-part message in MIME format.
--++----------20031010142201-104024179----------++
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

>The following patch fixes the issue, but I'm not content about it's
>placement in malloc/thread-m.h. Any comments about where I might put
>this in order to make maintenance easier?

The malloc-machine.h specific headers are now in place,
so you might want to propose something like the following?

Regards,
Wolfram.

2003-10-10  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/hppa/malloc-machine.h: New file.

--++----------20031010142201-104024179----------++
Content-Type: application/octet-stream; name="malloc-machine.h"
Content-Transfer-Encoding: base64

LyogQmFzaWMgcGxhdGZvcm0taW5kZXBlbmRlbnQgbWFjcm8gZGVmaW5pdGlvbnMgZm9yIG11dGV4
ZXMsCiAgIHRocmVhZC1zcGVjaWZpYyBkYXRhIGFuZCBwYXJhbWV0ZXJzIGZvciBtYWxsb2MuCiAg
IENvcHlyaWdodCAoQykgMjAwMyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KICAgVGhp
cyBmaWxlIGlzIHBhcnQgb2YgdGhlIEdOVSBDIExpYnJhcnkuCgogICBUaGUgR05VIEMgTGlicmFy
eSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKICAgbW9k
aWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYwog
ICBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIKICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikg
YW55IGxhdGVyIHZlcnNpb24uCgogICBUaGUgR05VIEMgTGlicmFyeSBpcyBkaXN0cmlidXRlZCBp
biB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogICBidXQgV0lUSE9VVCBBTlkgV0FS
UkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgogICBNRVJDSEFOVEFC
SUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQog
ICBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgoKICAgWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1
YmxpYwogICBMaWNlbnNlIGFsb25nIHdpdGggdGhlIEdOVSBDIExpYnJhcnk7IGlmIG5vdCwgd3Jp
dGUgdG8gdGhlIEZyZWUKICAgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBs
YWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEKICAgMDIxMTEtMTMwNyBVU0EuICAqLwoKI2lmbmRl
ZiBfTUFMTE9DX01BQ0hJTkVfSAojZGVmaW5lIF9NQUxMT0NfTUFDSElORV9ICgojdW5kZWYgdGhy
ZWFkX2F0Zm9ya19zdGF0aWMKCiNpbmNsdWRlIDxhdG9taWMuaD4KI2luY2x1ZGUgPGJpdHMvbGli
Yy1sb2NrLmg+CgpfX2xpYmNfbG9ja19kZWZpbmUgKHR5cGVkZWYsIG11dGV4X3QpCgovKiBTaW5j
ZSBvdXIgbG9jayBzdHJ1Y3R1cmUgZG9lcyBub3QgdG9sZXJhdGUgYmVpbmcgaW5pdGlhbGl6ZWQg
dG8KICAgemVybywgd2UgbXVzdCBtb2RpZnkgdGhlIHN0YW5kYXJkIGZ1bmN0aW9uIGNhbGxzIG1h
ZGUgYnkgbWFsbG9jICovCgojZGVmaW5lIG11dGV4X2luaXQobSkJCVwKCV9fbGliY19tYXliZV9j
YWxsIChfX3B0aHJlYWRfbXV0ZXhfaW5pdCwgKG0sIE5VTEwpLCBcCgkJCSgoKG0pLT5fX21fbG9j
ay5fX3NwaW5sb2NrID0gX19MVF9TUElOTE9DS19JTklUKSwoKihpbnQgKikobSkpKSApCiNkZWZp
bmUgbXV0ZXhfbG9jayhtKQkJXAoJX19saWJjX21heWJlX2NhbGwgKF9fcHRocmVhZF9tdXRleF9s
b2NrLCAobSksIFwKCQkJKF9fbG9hZF9hbmRfY2xlYXIoJigobSktPl9fbV9sb2NrLl9fc3Bpbmxv
Y2spKSwgMCkpCiNkZWZpbmUgbXV0ZXhfdHJ5bG9jayhtKQlcCglfX2xpYmNfbWF5YmVfY2FsbCAo
X19wdGhyZWFkX211dGV4X3RyeWxvY2ssIChtKSwgXAoJCQkoKihpbnQgKikobSkgPyAxIDogKF9f
bG9hZF9hbmRfY2xlYXIoJigobSktPl9fbV9sb2NrLl9fc3BpbmxvY2spKSwgMCkpKQojZGVmaW5l
IG11dGV4X3VubG9jayhtKQlcCglfX2xpYmNfbWF5YmVfY2FsbCAoX19wdGhyZWFkX211dGV4X3Vu
bG9jaywgKG0pLCBcCgkJCSgoKG0pLT5fX21fbG9jay5fX3NwaW5sb2NrID0gX19MVF9TUElOTE9D
S19JTklUKSwgKCooaW50ICopKG0pKSkgKQoKLyogVGhpcyBpcyBkZWZpbmVkIGJ5IG5ld2VyIGdj
YyB2ZXJzaW9uIHVuaXF1ZSBmb3IgZWFjaCBtb2R1bGUuICAqLwpleHRlcm4gdm9pZCAqX19kc29f
aGFuZGxlIF9fYXR0cmlidXRlX18gKChfX3dlYWtfXykpOwoKI2luY2x1ZGUgPGZvcmsuaD4KCiNp
ZmRlZiBTSEFSRUQKIyBkZWZpbmUgdGhyZWFkX2F0Zm9yayhwcmVwYXJlLCBwYXJlbnQsIGNoaWxk
KSBcCiAgIF9fcmVnaXN0ZXJfYXRmb3JrIChwcmVwYXJlLCBwYXJlbnQsIGNoaWxkLCBfX2Rzb19o
YW5kbGUpCiNlbHNlCiMgZGVmaW5lIHRocmVhZF9hdGZvcmsocHJlcGFyZSwgcGFyZW50LCBjaGls
ZCkgXAogICBfX3JlZ2lzdGVyX2F0Zm9yayAocHJlcGFyZSwgcGFyZW50LCBjaGlsZCwJCQkJICAg
ICAgXAoJCSAgICAgICZfX2Rzb19oYW5kbGUgPT0gTlVMTCA/IE5VTEwgOiBfX2Rzb19oYW5kbGUp
CiNlbmRpZgoKLyogdGhyZWFkIHNwZWNpZmljIGRhdGEgZm9yIGdsaWJjICovCgojaW5jbHVkZSA8
Yml0cy9saWJjLXRzZC5oPgoKdHlwZWRlZiBpbnQgdHNkX2tleV90WzFdOwkvKiBubyBrZXkgZGF0
YSBzdHJ1Y3R1cmUsIGxpYmMgbWFnaWMgZG9lcyBpdCAqLwpfX2xpYmNfdHNkX2RlZmluZSAoc3Rh
dGljLCBNQUxMT0MpCS8qIGRlY2xhcmF0aW9uL2NvbW1vbiBkZWZpbml0aW9uICovCiNkZWZpbmUg
dHNkX2tleV9jcmVhdGUoa2V5LCBkZXN0cikJKCh2b2lkKSAoa2V5KSkKI2RlZmluZSB0c2Rfc2V0
c3BlY2lmaWMoa2V5LCBkYXRhKQlfX2xpYmNfdHNkX3NldCAoTUFMTE9DLCAoZGF0YSkpCiNkZWZp
bmUgdHNkX2dldHNwZWNpZmljKGtleSwgdnB0cikJKCh2cHRyKSA9IF9fbGliY190c2RfZ2V0IChN
QUxMT0MpKQoKI2luY2x1ZGUgPHN5c2RlcHMvZ2VuZXJpYy9tYWxsb2MtbWFjaGluZS5oPgoKI2Vu
ZGlmIC8qICFkZWZpbmVkKF9NQUxMT0NfTUFDSElORV9IKSAqLwo=
--++----------20031010142201-104024179----------++--
