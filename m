From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] [PARISC] fix section mismatch in parport_gsc
Date: Sun, 27 May 2007 12:15:59 -0400
Message-ID: <20070527161559.GB25860__10627.7460502044$1416624367$gmane$org@fattire.cabal.ca>
References: <200705271807.25326.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200705271807.25326.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 27, 2007 at 06:07:25PM +0200, Helge Deller wrote:
> Hi Kyle,
> 
> this patch fixes the section mismatch in parport_gsc.c:
> WARNING: drivers/built-in.o(.text.parport_init_chip+0xc8): Section mismatch: reference to .init.data:parport_count (after 'parport_init_chip')
> 
> Please apply, Helge
> 

applied
