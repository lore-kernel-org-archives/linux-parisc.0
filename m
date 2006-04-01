From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sat, 01 Apr 2006 08:30:52 -0600
Message-ID: <1143901853.3368.0.camel@mulgrave.il.steeleye.com>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
	 <20060331155448.GP13590@parisc-linux.org>
	 <20060401070236.GC23508@colo.lackof.org> <200604010935.42819.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <200604010935.42819.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 2006-04-01 at 09:35 +0200, Helge Deller wrote:
> I'm pretty sure.
> We never vmalloc'ed IOmem before.

Where are you taking the ioremap virtual range from?  If it's the
vmalloc range, which is the only one I can think we have available for
arbitrary kernel mappings, then that would explain the behaviour.

James
