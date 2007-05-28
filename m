From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [PATCH] [PARISC] fix section mismatch in smp.c
Date: Mon, 28 May 2007 12:22:20 -0400
Message-ID: <20070528162220.GE16029__2258.3820195452$1416624376$gmane$org@fattire.cabal.ca>
References: <200705280026.03015.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200705280026.03015.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 28, 2007 at 12:26:02AM +0200, Helge Deller wrote:
> [PARISC] fix section mismatch for smp_boot_one_cpu:
> WARNING: arch/parisc/kernel/built-in.o(.text.__cpu_up+0x20): Section mismatch: reference to .init.text:smp_boot_one_cpu (after '__cpu_up')
> 

applied
