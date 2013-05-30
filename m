From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] parisc/PCI: lba: fix: convert to pci_create_root_bus()
 for correct root bus resources
Date: Thu, 30 May 2013 12:04:54 -0600
Message-ID: <CAErSpo69AxKgz8Dg8+T7n5jsuOzdSoCUstqrX+uUh8TZ08ayqg@mail.gmail.com>
References: <20130530141033.GA3665@ls3530.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=089e0118289e1e93a904ddf357d5
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130530141033.GA3665@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--089e0118289e1e93a904ddf357d5
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 30, 2013 at 8:10 AM, Helge Deller <deller@gmx.de> wrote:
> This commit dc7dce280a26d069ad5a58bf3da86e5e83415c65
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Fri Oct 28 16:27:27 2011 -0600
>    parisc/PCI: lba: convert to pci_create_root_bus() for correct root bus
>                     resources
>
>   Supply root bus resources to pci_create_root_bus() so they're correct
>   immediately.  This fixes the problem of "early" and "header" quirks seeing
>   incorrect root bus resources.
>
> forgot to set the IORESOURCE_BUS bus flag which led to incorrect resource
> assignments and a non-working stifb framebuffer on most parisc machines.
>
> LBA 10:1: PCI host bridge to bus 0000:01
> pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
> pci_bus 0000:01: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff])
> pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff])
> pci_bus 0000:01: root bus resource [??? 0x00000001 flags 0x0]
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
> index 2ef7103..29f3d7d 100644
> --- a/drivers/parisc/lba_pci.c
> +++ b/drivers/parisc/lba_pci.c
> @@ -1494,7 +1494,7 @@ lba_driver_probe(struct parisc_device *dev)
>
>         pci_add_resource_offset(&resources, &lba_dev->hba.io_space,
>                                 HBA_PORT_BASE(lba_dev->hba.hba_num));
> -       if (lba_dev->hba.elmmio_space.start)
> +       if (lba_dev->hba.elmmio_space.flags)

Commit dc7dce280a added this test of "elmmio_space.start", which
indeed looks like it should be for "flags" instead.

>                 pci_add_resource_offset(&resources, &lba_dev->hba.elmmio_space,
>                                         lba_dev->hba.lmmio_space_offset);
>         if (lba_dev->hba.lmmio_space.flags)
> @@ -1503,6 +1503,7 @@ lba_driver_probe(struct parisc_device *dev)
>         if (lba_dev->hba.gmmio_space.flags)
>                 pci_add_resource(&resources, &lba_dev->hba.gmmio_space);
>
> +       lba_dev->hba.bus_num.flags = IORESOURCE_BUS;

But I think this one is actually related to commit 30aa80da43
("parisc/PCI: register busn_res for root buses").  I would set the
bus_num resource type in lba_legacy_resources() to be parallel with
lba_pat_resources(), as in the attached patch, but this way is OK,
too.

Whichever way you go, both fixes look good to me:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

>         pci_add_resource(&resources, &lba_dev->hba.bus_num);
>
>         dev->dev.platform_data = lba_dev;

--089e0118289e1e93a904ddf357d5
Content-Type: application/octet-stream; name=lba-bus
Content-Disposition: attachment; filename=lba-bus
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hhc95mvy0

Y29tbWl0IDhkOWQ2MWRmOTUxOTk2Njc5ZjJmYTE5YTUwYWUwMWM4MTkzYjgzNDgKQXV0aG9yOiBC
am9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpEYXRlOiAgIFRodSBNYXkgMzAgMTE6
NDU6MzkgMjAxMyAtMDYwMAoKICAgIHBhcmlzYy9QQ0k6IFNldCB0eXBlIGZvciBMQkEgYnVzX251
bSByZXNvdXJjZQogICAgCiAgICBUaGUgbm9uLVBBVCByZXNvdXJjZSBwcm9iaW5nIGNvZGUgZmFp
bGVkIHRvIHNldCB0aGUgdHlwZSBvZiB0aGUgTEJBIGJ1c19udW0KICAgIHJlc291cmNlICgzMGFh
ODBkYTQzICJwYXJpc2MvUENJOiByZWdpc3RlciBidXNuX3JlcyBmb3Igcm9vdCBidXNlcyIgZGlk
CiAgICB0aGUgY29ycmVzcG9uZGluZyB0aGluZyBmb3IgdGhlIFBBVCBjYXNlKS4KICAgIAogICAg
VGhpcyBjYXVzZXMgaW5jb3JyZWN0IHJlc291cmNlIGFzc2lnbm1lbnRzIGFuZCBhIG5vbi13b3Jr
aW5nIHN0aWZiCiAgICBmcmFtZWJ1ZmZlciBvbiBtb3N0IHBhcmlzYyBtYWNoaW5lcy4KICAgIAog
ICAgU2lnbmVkLW9mZi1ieTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BhcmlzYy9sYmFfcGNpLmMgYi9kcml2ZXJzL3BhcmlzYy9sYmFf
cGNpLmMKaW5kZXggMmVmNzEwMy4uNWQyNTAzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wYXJpc2Mv
bGJhX3BjaS5jCisrKyBiL2RyaXZlcnMvcGFyaXNjL2xiYV9wY2kuYwpAQCAtMTA5Niw2ICsxMDk2
LDcgQEAgbGJhX2xlZ2FjeV9yZXNvdXJjZXMoc3RydWN0IHBhcmlzY19kZXZpY2UgKnBhX2Rldiwg
c3RydWN0IGxiYV9kZXZpY2UgKmxiYV9kZXYpCiAJci0+bmFtZSA9ICJMQkEgUENJIEJ1c3NlcyI7
CiAJci0+c3RhcnQgPSBsYmFfbnVtICYgMHhmZjsKIAlyLT5lbmQgPSAobGJhX251bT4+OCkgJiAw
eGZmOworCXItPmZsYWdzID0gSU9SRVNPVVJDRV9CVVM7CiAKIAkvKiBTZXQgdXAgbG9jYWwgUENJ
IEJ1cyByZXNvdXJjZXMgLSB3ZSBkb24ndCBuZWVkIHRoZW0gZm9yCiAJKiogTGVnYWN5IGJveGVz
IGJ1dCBpdCdzIG5pY2UgdG8gc2VlIGluIC9wcm9jL2lvbWVtLgo=
--089e0118289e1e93a904ddf357d5--
