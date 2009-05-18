From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: random freezes B2000 running debian hppa lenny
Date: Sun, 17 May 2009 21:04:11 -0600
Message-ID: <20090518030411.GB10973@lackof.org>
References: <49FB108B.9030803@ieee.org> <20090503112554.GB6617@lackof.org> <4A0DEF5F.6090401@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A0DEF5F.6090401@ieee.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 16, 2009 at 12:40:31AM +0200, Dirk Van Hertem wrote:
> Dear Grant,
> Dear linux-parisc enthousiasts,
> 
> Sorry for the late reply: in the last week, my vt220 terminal died and
> the power supply of my old (i386) server died as well, so I was busy
> with other things.

No problem.

> I attached the "ser pim" output to this email, I hope it helps. If you
> need any other information, please ask, I hope I'll be more responsive
> next time...

HPMC Chassis Codes = 2cbf0  2500b  2cbf2  2cbfc

Looking at:
    ftp://ftp.parisc-linux.org/docs/platforms/A2375-90004.pdf

CBF0 HPMC handling initiated.
CBF2 Invalid length for OS HPMC handler
CBFC Branch to OS HPMC failed

Just means the linux HPMC handler didn't get called. Hrm. This worked once
upon a time and I thought got fixed 6-8 months ago.

Next thing I look at is:
RUN_ADDR                     = 0xc1bff0fffed08040

So whatever is at 0xfffed08040 (40 bit addresses physically)
was the either the victim or the culprit. Often this is a MMIO BAR
plus some offset (probably 0x40). I suggest looking in the
Controller driver for that offset and where it's used in the
initialization


System Responder Path        = 0x00ffffff0a010400

This is supposed to match the HPA (Host Phys Address) of one of the
devices that is listed at the beginning of the parisc-linux boot.
I'm not sure it' accurate though.

And then the last part of the PIM that's interesting basically confirms
what we have been guessing:

'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/1/4/0 (PCI slot 4).

I forgot how to check if the "I/O Fetch Timeout" occurred because
the IOMMU already went "fatal" (DMA was attempted to an unmapped address).


FYI, I also found the C3000 service manual here:
    http://sysdoc.doors.ch/HP/lpv38336.pdf

and uploaded a copy to:
	ftp://ftp.parisc-linux.org/docs/platforms/c3000-service.pdf

TODO: add an entry to http://www.parisc-linux.org/documentation/ 

hth,
grant
