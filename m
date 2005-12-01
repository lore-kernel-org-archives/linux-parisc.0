From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] FLT CBFB on B1000 when accessing second graphics
	card
Date: Thu, 1 Dec 2005 10:29:31 -0700
Message-ID: <200512011029.31134.bjorn.helgaas@hp.com>
References: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
	<200511301224.39435.bjorn.helgaas@hp.com>
	<20051201050612.GA30663@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051201050612.GA30663@tachyon.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 30 November 2005 10:06 pm, Kyle McMartin wrote:
> At the moment, there's absolutely no support for legacy VGA
> registers. Legacy IO port accesses will likely timeout doing an access
> to the PCI bus behind rope0. Legacy VGA mmio will, uh, do something
> funny.

Oh, yes, I vaguely remember that :-)

IIRC, there was a back-door approach that Grant thought might work.
My patch provides the hooks you'd need for that.  Instead of
reprogramming the chipset VGA routing and doing inb/outb, you'd
just do the LBA magic for I/O port accesses.

I don't know how MMIO would be handled (or even what chipset is
in the box in question).  But my guess is that it's similar to
how the current chipsets work.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
