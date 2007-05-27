From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [PATCH] [PARISC] fix section mismatch in parisc eisa driver
Date: Sun, 27 May 2007 15:02:26 -0400
Message-ID: <20070527190226.GF25860__30208.4513394677$1416624370$gmane$org@fattire.cabal.ca>
References: <200705271957.11716.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200705271957.11716.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 27, 2007 at 07:57:11PM +0200, Helge Deller wrote:
> Hi Kyle,
> 
> this patch fixes the following section mismatch (EISA cards should be hotplug aware, but the EISA bus itself shouldn't):
> WARNING: drivers/built-in.o(.text.eisa_probe+0x220): Section mismatch: reference to .init.text:eisa_root_register (after 'eisa_probe')
> 
> Please apply, 
> Helge
> 

applied
