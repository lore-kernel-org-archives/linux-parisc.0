From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Fri, 14 Jun 2013 00:28:32 -0700
Message-ID: <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
References: <20130614071142.GB10443@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130614071142.GB10443@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 14, 2013 at 12:11 AM, Helge Deller <deller@gmx.de> wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>
> The LMMIO length reported by PAT and the length given by the LBA MASK
> register are not consistent. This leads e.g. to a non-working ATI FireGL
> card with the radeon DRM driver since the memory can't be mapped.
>
> Fix this by correctly adjusting the resource sizes.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
> index 1f05913..7dc0e40 100644
> --- a/drivers/parisc/lba_pci.c
> +++ b/drivers/parisc/lba_pci.c
> @@ -994,6 +994,15 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
>                 case PAT_LMMIO:
>                         /* used to fix up pre-initialized MEM BARs */
>                         if (!lba_dev->hba.lmmio_space.flags) {
> +                               unsigned long lba_len;
> +                               lba_len = ~READ_REG32(lba_dev->hba.base_addr
> +                                               + LBA_LMMIO_MASK);
> +                               if ((p->end - p->start) != lba_len) {
> +                                       pr_warn("PCI%02x LMMIO mismatch between PAT length (0x%lx) and MASK register (0x%lx), fixing.\n",
> +                                         (int)lba_dev->hba.bus_num.start,
> +                                               p->end - p->start, lba_len);
> +                                       p->end = p->start + lba_len;
> +                               }
>                                 sprintf(lba_dev->hba.lmmio_name,
>                                                 "PCI%02x LMMIO",
>                                                 (int)lba_dev->hba.bus_num.start);
> --

With these two patches, does kernel modesetting (and X11?) work?
