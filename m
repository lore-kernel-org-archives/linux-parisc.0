From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [PATCH] [PARISC] fix section mismatch in superio serial drivers
Date: Sun, 27 May 2007 15:02:34 -0400
Message-ID: <20070527190234.GG25860__13327.8970759877$1416624370$gmane$org@fattire.cabal.ca>
References: <200705272038.47588.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200705272038.47588.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 27, 2007 at 08:38:47PM +0200, Helge Deller wrote:
> This patch fixes two section mismatches in superio serial setup:
> WARNING: drivers/built-in.o(.text.superio_serial_init+0x78): Section mismatch: reference to .init.text:early_serial_setup (after 'superio_serial_init')
> WARNING: drivers/built-in.o(.text.superio_serial_init+0xa4): Section mismatch: reference to .init.text:early_serial_setup (after 'superio_serial_init')
> 

applied
