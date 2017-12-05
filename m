From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] video/console/sticore: Delete an error message for a failed
 memory allocation in sti_try_rom_generic()
Date: Tue, 5 Dec 2017 19:00:22 +0100
Message-ID: <6b8dde60-0550-5fb3-c7a5-5f6282259186@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Helge Deller <deller@gmx.de>, "James E. J. Bottomley" <jejb@parisc-linux.org>
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
OiBUdWUsIDUgRGVjIDIwMTcgMTg6NDU6NDIgKzAxMDAKCk9taXQgYW4gZXh0cmEgbWVzc2FnZSBm
b3IgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlIGluIHRoaXMgZnVuY3Rpb24uCgpUaGlzIGlz
c3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KClNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2NvbnNvbGUvc3RpY29yZS5jIHwgNCArLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9jb25zb2xlL3N0aWNvcmUuYyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9zdGljb3Jl
LmMKaW5kZXggZDFkMzc5Njc3M2FhLi4wOGI4MjI2NTY4NDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vY29uc29sZS9zdGljb3JlLmMKKysrIGIvZHJpdmVycy92aWRlby9jb25zb2xlL3N0aWNv
cmUuYwpAQCAtODI3LDEwICs4MjcsOCBAQCBzdGF0aWMgc3RydWN0IHN0aV9zdHJ1Y3QgKnN0aV90
cnlfcm9tX2dlbmVyaWModW5zaWduZWQgbG9uZyBhZGRyZXNzLAogCX0KIAkKIAlzdGkgPSBremFs
bG9jKHNpemVvZigqc3RpKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFzdGkpIHsKLQkJcHJpbnRrKEtF
Uk5fRVJSICJOb3QgZW5vdWdoIG1lbW9yeSAhXG4iKTsKKwlpZiAoIXN0aSkKIAkJcmV0dXJuIE5V
TEw7Ci0JfQogCiAJc3Bpbl9sb2NrX2luaXQoJnN0aS0+bG9jayk7CiAKLS0gCjIuMTUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
