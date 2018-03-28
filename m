From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 1/2] video/fbdev/stifb: Return -ENOMEM after a failed
 kzalloc() in stifb_init_fb()
Date: Wed, 28 Mar 2018 15:34:08 +0200
Message-ID: <2557729.Jl5E8iEh4q@amdc3058>
References: <7dcd32b6-9691-14a1-29cf-3a746ef5adfc@users.sourceforge.net>
 <889131fe-199c-3bef-0781-00761b807426@users.sourceforge.net>
 <6341951e-df28-0b40-974e-dedd890b5228@users.sourceforge.net>
 <CGME20180328133411epcas2p442e8f8a85d6c6e72ec5a5122519fe5eb@epcas2p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org, "James E. J.
 Bottomley" <jejb@parisc-linux.org>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Rolf Eike Beer <eike-kernel@sf-tec.de>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <6341951e-df28-0b40-974e-dedd890b5228@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
List-ID: <linux-parisc.vger.kernel.org>

T24gU3VuZGF5LCBKYW51YXJ5IDA3LCAyMDE4IDEyOjU2OjQ1IFBNIFNGIE1hcmt1cyBFbGZyaW5n
IHdyb3RlOgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdl
Lm5ldD4KPiBEYXRlOiBTdW4sIDcgSmFuIDIwMTggMTE6MzM6NTkgKzAxMDAKPiAKPiBSZXBsYWNl
IGFuIGVycm9yIGNvZGUgZm9yIHRoZSBpbmRpY2F0aW9uIG9mIGEgbWVtb3J5IGFsbG9jYXRpb24g
ZmFpbHVyZQo+IGluIHRoaXMgZnVuY3Rpb24uCj4gCj4gRml4ZXM6IDFkYTE3N2U0YzNmNDE1MjRl
ODg2YjdmMWI4YTBjMWZjNzMyMWNhYyAoIkxpbnV4LTIuNi4xMi1yYzI6IEluaXRpYWwgZ2l0IHJl
cG9zaXRvcnkgYnVpbGQiKQo+IFN1Z2dlc3RlZC1ieTogUm9sZiBFaWtlIEJlZXIgPGVpa2Uta2Vy
bmVsQHNmLXRlYy5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1
c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgpQYXRjaCBxdWV1ZWQgZm9yIDQuMTcsIHRoYW5rcy4KCkJl
c3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0
aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
