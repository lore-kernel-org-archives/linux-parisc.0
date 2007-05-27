From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] [PARISC] fix section mismatch in parisc/kernel
Date: Sun, 27 May 2007 13:37:34 -0400
Message-ID: <20070527173734.GE25860__3653.15752937949$1416624369$gmane$org@fattire.cabal.ca>
References: <200705271930.36593.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200705271930.36593.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 27, 2007 at 07:30:36PM +0200, Helge Deller wrote:
> Hi Kyle,
> 
> this patch fixes two section mismatches in parisc/kernel:
> WARNING: arch/parisc/kernel/built-in.o(.data.read_mostly+0xd8): Section mismatch: reference to .init.text:processor_probe (between 'cpu_driver' and 'boot_cpu_data')
> WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x140): Section mismatch: reference to .init.text:parisc_hardware_description (after 'alloc_pa_dev')
> 
> Additionally, mark some tables as constants.
> 
> Please apply, Helge
> 

applied, thanks
