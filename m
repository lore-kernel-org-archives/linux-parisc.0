From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2 0/2] video/fbdev/stifb: Adjustments for stifb_init_fb()
Date: Sun, 7 Jan 2018 12:55:17 +0100
Message-ID: <889131fe-199c-3bef-0781-00761b807426@users.sourceforge.net>
References: <7dcd32b6-9691-14a1-29cf-3a746ef5adfc@users.sourceforge.net>
 <CGME20171124213055epcas4p45c641222185056871b97f4e7bc235d2e@epcas4p4.samsung.com>
 <25624997.nONnEdNj0s@daneel.sf-tec.de> <1680261.Msdj7gi9fB@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Helge Deller <deller@gmx.de>, "James E. J. Bottomley"
 <jejb@parisc-linux.org>, Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1680261.Msdj7gi9fB@amdc3058>
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
OiBTdW4sIDcgSmFuIDIwMTggMTI6NDU6NTQgKzAxMDAKClR3byB1cGRhdGUgc3VnZ2VzdGlvbnMg
d2VyZSB0YWtlbiBpbnRvIGFjY291bnQuCgpNYXJrdXMgRWxmcmluZyAoMik6CiAgUmV0dXJuIC1F
Tk9NRU0gYWZ0ZXIgYSBmYWlsZWQga3phbGxvYygpCiAgRGVsZXRlIGFuIGVycm9yIG1lc3NhZ2Ug
Zm9yIGEgZmFpbGVkIG1lbW9yeSBhbGxvY2F0aW9uCgogZHJpdmVycy92aWRlby9mYmRldi9zdGlm
Yi5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgotLSAKMi4xNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
