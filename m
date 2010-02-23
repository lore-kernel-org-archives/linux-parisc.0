From: Grant Grundler <grundler@google.com>
Subject: Re: PCI patch breaks boot on rp2470 (2xPA8700)
Date: Mon, 22 Feb 2010 16:54:33 -0800
Message-ID: <da824cf31002221654if698808i88709293223b5cd3@mail.gmail.com>
References: <119aab441002221525m4595b37w875891cd8f95e633@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Kyle McMartin <kyle@redhat.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441002221525m4595b37w875891cd8f95e633@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 22, 2010 at 3:25 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> Kyle,
>
> I spent the weekend bisecting to determine which patch broke booting
> from scsi on my rp2470.
...
> The attached patch allows me to boot again by setting the PCI CLS to
> 64 early-on in pcibios_init().

What is the boot failure message?


> I don't know *why* it works, what a shame, can anyone see something I've missed?

pci_cache_line_size is uninitialized and I expect is zero.
If zero, pci_set_cacheline_size() immediately returns an error and
causes the sym53c8xx_2
driver to assert there is no SCSI host controller present (returns
-ENODEV). Ergo no booting.

fs_initcall_sync(pci_apply_final_quirks) should be called before the
device_initcall() stuff.
I expect pci_cache_line_size should be non-zero before sym2 driver is invoked.

There was a bug in pci_apply_final_quirks() could cause
pci_set_cacheline_size() to
not set pci_cache_line_size, but the fix is in the current linus tree:
   http://patchwork.kernel.org/patch/69755/

Is it possible your tree is missing that fix for some reason?

In any case, your patch looks good to me. Please add:
   Reviewed-by: Grant Grundler <grundler@google.com>

thanks,
grant
