From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2 1/2] video/fbdev/stifb: Return -ENOMEM after a failed
 kzalloc() in stifb_init_fb()
Date: Sun, 7 Jan 2018 12:56:45 +0100
Message-ID: <6341951e-df28-0b40-974e-dedd890b5228@users.sourceforge.net>
References: <7dcd32b6-9691-14a1-29cf-3a746ef5adfc@users.sourceforge.net>
 <CGME20171124213055epcas4p45c641222185056871b97f4e7bc235d2e@epcas4p4.samsung.com>
 <25624997.nONnEdNj0s@daneel.sf-tec.de> <1680261.Msdj7gi9fB@amdc3058>
 <889131fe-199c-3bef-0781-00761b807426@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Helge Deller <deller@gmx.de>, "James E. J. Bottomley"
 <jejb@parisc-linux.org>, Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <889131fe-199c-3bef-0781-00761b807426@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
List-ID: <linux-parisc.vger.kernel.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTdW4sIDcgSmFuIDIwMTggMTE6MzM6NTkgKzAxMDAKClJlcGxhY2UgYW4gZXJyb3IgY29kZSBm
b3IgdGhlIGluZGljYXRpb24gb2YgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlCmluIHRoaXMg
ZnVuY3Rpb24uCgpGaXhlczogMWRhMTc3ZTRjM2Y0MTUyNGU4ODZiN2YxYjhhMGMxZmM3MzIxY2Fj
ICgiTGludXgtMi42LjEyLXJjMjogSW5pdGlhbCBnaXQgcmVwb3NpdG9yeSBidWlsZCIpClN1Z2dl
c3RlZC1ieTogUm9sZiBFaWtlIEJlZXIgPGVpa2Uta2VybmVsQHNmLXRlYy5kZT4KU2lnbmVkLW9m
Zi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgotLS0K
IGRyaXZlcnMvdmlkZW8vZmJkZXYvc3RpZmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvc3RpZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3RpZmIuYwppbmRleCA2ZGVkNWMxOTg5
OTguLjUxMWE1OTQ4ODlhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zdGlmYi5j
CisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3RpZmIuYwpAQCAtMTEyOCw3ICsxMTI4LDcgQEAg
c3RhdGljIGludCBfX2luaXQgc3RpZmJfaW5pdF9mYihzdHJ1Y3Qgc3RpX3N0cnVjdCAqc3RpLCBp
bnQgYnBwX3ByZWYpCiAJZmIgPSBremFsbG9jKHNpemVvZigqZmIpLCBHRlBfQVRPTUlDKTsKIAlp
ZiAoIWZiKSB7CiAJCXByaW50ayhLRVJOX0VSUiAic3RpZmI6IENvdWxkIG5vdCBhbGxvY2F0ZSBz
dGlmYiBzdHJ1Y3R1cmVcbiIpOwotCQlyZXR1cm4gLUVOT0RFVjsKKwkJcmV0dXJuIC1FTk9NRU07
CiAJfQogCQogCWluZm8gPSAmZmItPmluZm87Ci0tIAoyLjE1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
