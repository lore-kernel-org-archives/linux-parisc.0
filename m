From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2 2/2] video/fbdev/stifb: Delete an error message for a
 failed memory allocation in stifb_init_fb()
Date: Sun, 7 Jan 2018 12:58:47 +0100
Message-ID: <f92f41b1-d4fa-4ffa-8c19-af4eb0d2d8cf@users.sourceforge.net>
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
OiBTdW4sIDcgSmFuIDIwMTggMTI6MzQ6MjIgKzAxMDAKCk9taXQgYW4gZXh0cmEgbWVzc2FnZSBm
b3IgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlIGluIHRoaXMgZnVuY3Rpb24uCgpUaGlzIGlz
c3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KClNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4K
LS0tCgp2MjoKVGhpcyB1cGRhdGUgc3VnZ2VzdGlvbiB3YXMgcmViYXNlZCBvbiBzb3VyY2UgZmls
ZXMgZnJvbSB0aGUgc29mdHdhcmUKIkxpbnV4IG5leHQtMjAxODAxMDUiIHRvZ2V0aGVyIHdpdGgg
YSBjaGFuZ2UgZm9yIGFuIGVycm9yIGNvZGUuCgogZHJpdmVycy92aWRlby9mYmRldi9zdGlmYi5j
IHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zdGlmYi5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9zdGlmYi5jCmluZGV4IDUxMWE1OTQ4ODlhZi4uZGVjOGVmYjRmMjU2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N0aWZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRl
di9zdGlmYi5jCkBAIC0xMTI2LDEwICsxMTI2LDggQEAgc3RhdGljIGludCBfX2luaXQgc3RpZmJf
aW5pdF9mYihzdHJ1Y3Qgc3RpX3N0cnVjdCAqc3RpLCBpbnQgYnBwX3ByZWYpCiAJaW50IGJwcCwg
eHJlcywgeXJlczsKIAogCWZiID0ga3phbGxvYyhzaXplb2YoKmZiKSwgR0ZQX0FUT01JQyk7Ci0J
aWYgKCFmYikgewotCQlwcmludGsoS0VSTl9FUlIgInN0aWZiOiBDb3VsZCBub3QgYWxsb2NhdGUg
c3RpZmIgc3RydWN0dXJlXG4iKTsKKwlpZiAoIWZiKQogCQlyZXR1cm4gLUVOT01FTTsKLQl9CiAJ
CiAJaW5mbyA9ICZmYi0+aW5mbzsKIAotLSAKMi4xNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
