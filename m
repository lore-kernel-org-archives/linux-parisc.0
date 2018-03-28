From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video/console/sticore: Delete an error message for a
 failed memory allocation in sti_try_rom_generic()
Date: Wed, 28 Mar 2018 16:19:31 +0200
Message-ID: <1899328.6kM0nNg5W5@amdc3058>
References: <CGME20171205180033epcas4p3cb5142e079695c72736e1f27489466d3@epcas4p3.samsung.com>
 <6b8dde60-0550-5fb3-c7a5-5f6282259186@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org, "James E. J.
 Bottomley" <jejb@parisc-linux.org>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <6b8dde60-0550-5fb3-c7a5-5f6282259186@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
List-ID: <linux-parisc.vger.kernel.org>

T24gVHVlc2RheSwgRGVjZW1iZXIgMDUsIDIwMTcgMDc6MDA6MjIgUE0gU0YgTWFya3VzIEVsZnJp
bmcgd3JvdGU6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9y
Z2UubmV0Pgo+IERhdGU6IFR1ZSwgNSBEZWMgMjAxNyAxODo0NTo0MiArMDEwMAo+IAo+IE9taXQg
YW4gZXh0cmEgbWVzc2FnZSBmb3IgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlIGluIHRoaXMg
ZnVuY3Rpb24uCj4gCj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2Np
bmVsbGUgc29mdHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJp
bmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgoKUGF0Y2ggcXVldWVkIGZvciA0LjE3LCB0aGFua3Mu
CgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQg
SW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
