From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 13:29:20 -0500 (EST)
Message-ID: <20100104182920.CA6EB4EA9@hiauly1.hia.nrc.ca>
References: <20100104181138.GA2252@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100104181138.GA2252@hiauly1.hia.nrc.ca> from "John David Anglin" at Jan 4, 2010 01:11:39 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, 04 Jan 2010, Carlos O'Donell wrote:
> 
> > On Mon, Jan 4, 2010 at 11:27 AM, Helge Deller <deller@gmx.de> wrote:
> > This is wrong. Each thread should have 8MB of stack. If we only get ~
> > 0x40 bytes then npt/nptl-init.c is setting __default_stacksize
> > incorrectly.
> 
> The 0x40 bytes is the initial frame allocated for clone running in
> the child thread.   The code is not running out of stack space.

If only 0x40 bytes of stack were allocated, start_thread would fault
almost immediately:

Dump of assembler code for function start_thread:
   0x40a40300 <+0>:     stw rp,-14(sp)
   0x40a40304 <+4>:     ldo 1c0(sp),sp
   0x40a40308 <+8>:     ldo 274(r26),r21
   0x40a4030c <+12>:    stw r9,-6c(sp)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
