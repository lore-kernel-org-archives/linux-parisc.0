Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhenium (rhenium.btinternet.com [194.73.73.93])
	by dsl2.external.hp.com (Postfix) with ESMTP id 050AF482A
	for <parisc-linux@parisc-linux.org>; Sat, 21 Apr 2001 05:21:03 -0600 (MDT)
Date: Sat, 21 Apr 2001 12:16:46 +0100 (BST)
From: Dave Gilbert <gilbertd@treblig.org>
To: Sandy Harris <sandy@storm.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Appollo 730
In-Reply-To: <3AE101B7.5EFB4E2F@storm.ca>
Message-ID: <Pine.LNX.4.10.10104211207561.702-100000@tardis.home.dave>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 20 Apr 2001, Sandy Harris wrote:

> I've found a pile of machines with an Appollo nameplate, rather than
> HP, and a 730 model number. They look a fair bit like a 735, deeper
> case than 712 or 715, boards that slide in from the back. The vendor
> assures me they use a first generation PA-RISC CPU.

As of yesterday I got my first HP - it is marked as Hewlett Packard Apollo
735.

I'm told it is actually a 730 that was upgraded to the 735 - but
/proc/cpuinfo still shows it as a 730 - hmm:

> processor     : 0
> cpu family    : PA-RISC 1.1a
> cpu           : PA7000 (PCX-S)
> cpu MHz               : 99.000000
> model         : 9000/730
> model name    : King Cobra (730)

The SCSI is being a bit of a pain - but the machine appears to be missing
a SCSI terminator, something that I'll hopefully solve today.

One thing to remember is that this thing uses 'rboot' rather than the
normal bootp - you'll need to find yourself a copy of rbootd; I found a
copy nestling on the Debian unstable site; it built with a bit of fight on
the Linux/Alpha box I'm booting it off.

Dave

-- 
 ---------------- Have a happy GNU millennium! ----------------------   
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \ 
\ gro.gilbert @ treblig.org | MIPS,x86,ARM, SPARC and HP-PA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
