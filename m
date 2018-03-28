From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 2/2] video/fbdev/stifb: Delete an error message for a
 failed memory allocation in stifb_init_fb()
Date: Wed, 28 Mar 2018 15:36:15 +0200
Message-ID: <1633440.9F4sjlxLYt@amdc3058>
References: <7dcd32b6-9691-14a1-29cf-3a746ef5adfc@users.sourceforge.net>
 <889131fe-199c-3bef-0781-00761b807426@users.sourceforge.net>
 <f92f41b1-d4fa-4ffa-8c19-af4eb0d2d8cf@users.sourceforge.net>
 <CGME20180328133621epcas2p2865976351cf3dc28ac258d2c9530ffcd@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org, "James E. J.
 Bottomley" <jejb@parisc-linux.org>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Rolf Eike Beer <eike-kernel@sf-tec.de>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <f92f41b1-d4fa-4ffa-8c19-af4eb0d2d8cf@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
List-ID: <linux-parisc.vger.kernel.org>

T24gU3VuZGF5LCBKYW51YXJ5IDA3LCAyMDE4IDEyOjU4OjQ3IFBNIFNGIE1hcmt1cyBFbGZyaW5n
IHdyb3RlOgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdl
Lm5ldD4KPiBEYXRlOiBTdW4sIDcgSmFuIDIwMTggMTI6MzQ6MjIgKzAxMDAKPiAKPiBPbWl0IGFu
IGV4dHJhIG1lc3NhZ2UgZm9yIGEgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSBpbiB0aGlzIGZ1
bmN0aW9uLgo+IAo+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5l
bGxlIHNvZnR3YXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5n
QHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KClBhdGNoIHF1ZXVlZCBmb3IgNC4xNywgdGhhbmtzLgoK
QmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIElu
c3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
