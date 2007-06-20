From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Unaligned handler broken (kernel BUG at mm/mmap.c:1991!)
Date: Wed, 20 Jun 2007 14:45:02 -0400
Message-ID: <20070620184502.GE8184__45148.2110577219$1416624399$gmane$org@fattire.cabal.ca>
References: <200706182131.06930.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200706182131.06930.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 18, 2007 at 09:31:06PM +0200, Helge Deller wrote:
> The following small test case - which is itself wrong - crashes 2.6.22-rc5 (32bit kernel) badly:
> 
> #include <stdio.h>
> int main()
> {
>         int *ptr = (int *) 0xffffffff;
>         printf("ptr=%x, val=%d\n", ptr, *ptr);
> }
> 

I have a fix for this, will post after rudimentary testing.

Cheers,
	Kyle
