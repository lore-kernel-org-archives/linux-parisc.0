From: Elliott Potter <mailinglist@eep.burdell.org>
Subject: [parisc-linux] Success! [Was: SCSI hang in 2.6.6-pa4]
Date: Fri, 21 May 2004 17:23:20 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0405211711030.1564@trillian.uni>
References: <Pine.LNX.4.58.0405191939460.30587@trillian.uni>
	<40AC8294.7030303@tiscali.be>
	<Pine.LNX.4.58.0405202222240.18175@trillian.uni>
	<40ADCA04.10502@tiscali.be>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40ADCA04.10502@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 21 May 2004, Joel Soete wrote:

> >>>[...]
> >>>I've got a J5000 that appeared to work mostly OK under 2.4.25-pa.
> >>>I just put 2.6.6-pa4 on there and when I boot, the machine hangs:
> >>> [...]
> >>umm 32bit or 64bit kernel?
> >
> > 32 bit?  I assume.  If it was 64 bit it wasn't on purpose.  Under CPU
> > selection I chose the PA7000 option (or whatever the first one on the
> > list was).
> >
> >
> >>>[...]
> >>>sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
> >>>sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
> >>>sym0: SCSI BUS has been reset.
> >>>scsi0 : sym-2.1.18j
> >>>sym0:0:0: ABORT operation started.
> >>>sym0:0:0: ABORT operation timed-out.
> >>>sym0:0:0: DEVICE RESET operation started.
> >>>sym0:0:0: DEVICE RESET operation timed-out.
> >>>sym0:0:0: BUS RESET operation started.
> >>>sym0:0:0: BUS RESET operation timed-out.
> >>>sym0:0:0: HOST RESET operation started.
> >>>sym0: SCSI BUS has been reset.
> >>><hang>
> >>>
> > [...]
> well ok, may be try first the same default config file
> (c3000_defconfig) as I decribe above (may be just unselect
> 64bit option in
> CPU sub-menu with 'make menuconfig' if you don't want 64bit)
> and certainly not smp (smp is not yet ready for 2.6 on hppa) !!!

I was about to try the c3000_defconfig but on a whim I turned off the
SMP option, turned on SCSI verbose error logging for good measure,
recompiled, and presto!  It appears to work.  This leaves me with two
questions:

1) No SMP?  <pout>I want my SMP!</pout> :)  ... or in the form of a
question: is this something that's going to work maybe in a bit but not
for now, or is it just broken beyond all patience?  Just wondering.
Come to think of it, I had SMP turned on with the 2.4.25-pa0 kernel and
it appeared to work OK, but I was getting some odd data corruption.
Maybe that was the cause?  Are you wondering how I've gone from two
questions to four while I'm still on question 1?  :)

2) I'm a bit confused on the whole 64 bit thing.  I've been selecting
the PA7000 CPU option on kernel configs for the various machines I have
(j5k, c3k, c360) because when I picked PA8*00 I was getting lots of
weird errors regarding modules - I assumed that was an issue with 64
bits, and I also was under the impression from recent posts that 64 bit
kernels aren't quite right yet.  Right?  Or is that just userland?
Granted I don't think I have any real need for a 64 bit kernel, but just
wondering.  What I really want is one modular kernel config I can use
for the three machines.


Thanks again everyone for the help.  Glad to have the machine running
again.
--
Elliott
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
