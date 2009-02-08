From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Hacking SuperDome
Date: Sun, 8 Feb 2009 04:33:07 -0700
Message-ID: <20090208113307.GE31509@parisc-linux.org>
References: <20090207142906.GA8553@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207142906.GA8553@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Feb 07, 2009 at 03:29:06PM +0100, Thomas Bogendoerfer wrote:
> The bigger partition produces following boot log:
[...]
> sym0: <895> rev 0x2 at pci 0000:18:00.0 irq 67
> sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> sym0: SCSI BUS has been reset.
> scsi0 : sym-2.2.3
> scsi 0:0:0:0: ABORT operation started
> scsi 0:0:0:0: ABORT operation timed-out.
> scsi 0:0:0:0: DEVICE RESET operation started
> 
> After that it hangs...

Generally, this means that interrupts are broken; sym2 didn't get an
interrupt saying the command completed.

Looking through the rest of the log, I don't see any information
pertaining to interrupt setup.  I forget whether we have debug related
to interrupts, but I bet we do ...

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
