Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA27321
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 19:16:09 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 25 Jul 2000 01:17:59 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA10994;
	Tue, 25 Jul 2000 11:12:28 +1000
Date: Tue, 25 Jul 2000 11:12:28 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Cary Coutant <cary@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PIC code generation in gcc/binutils
In-Reply-To: <87zon7qcqr.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0007251104320.6775-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 24 Jul 2000, David Huggins-Daines wrote:

> Cary Coutant <cary@cup.hp.com> writes:
> 
> > The model used for PA-RISC is a a consequence of the segmented 
> > architecture, where the text and data segments are not adjacent.
> 
> For what it's worth our ELF32 runtime conventions do not use
> segmentation at all.  That is, in user space, %sr0 and %sr4 through
> %sr7 are all set to the same space identifier.

Hmm, I haven't been making this assumption in the elf32-hppa binutils
shared lib support.  If userland uses the same space id, then import
stubs can be simplified quite a bit, and there's no need for export stubs.

> This is in keeping with accepted practice on other 32-bit Linux
> platforms where segmentation is used only to provide separate 4G
> address spaces for the kernel and userland.

On parisc, doesn't a single space id limit your address space to 1G?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
