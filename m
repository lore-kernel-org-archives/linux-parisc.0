Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from protactinium (protactinium.btinternet.com [194.73.73.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74546482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Apr 2001 13:17:40 -0600 (MDT)
Date: Sat, 21 Apr 2001 20:13:15 +0100 (BST)
From: Dave Gilbert <gilbertd@treblig.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI problems on 73[05]
In-Reply-To: <20010421173756.N11226@linuxcare.com>
Message-ID: <Pine.LNX.4.10.10104211954400.702-100000@tardis.home.dave>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

uOn Sat, 21 Apr 2001, Richard Hirst wrote:

> Please can you try booting with
> 
> 	sim700=nodisc:0xff
> 
> added to the PALO command line, and let me know if it helps.

Yes, it works a treat. (I edited into the header of the LIF image I
downloaded using vi.....)

> Oh, and how often/quickly does it fail?

Every time; it runs for perhaps 10 seconds (well I don't know if its
running or about to timeout) and then gives the errors I posted.  Same
errors every time.

With your command line option I've just zero'd both discs with no errors
at all.

> Are you confident that scsi disks, cable and terminators are ok?

No. I've just been given the machine and don't know what its previous
state was (other than it was working fine a few months ago).  Its a 735
with the two discs internal in the mounting to the right of the box
(behind the LED bit I guess) with one of the little tiny HP SCSI-SCSI link
leads to the fast-narrow connector on the back of the machine.  This is
going off to another box (not switched on) which has a terminator on the
back and some other discs in.  That box is a known good one (as is the
cable to it).

 > Do you get the problems with both disks?

Yes.

Oh, also HP-UX booted off it OK - well it did until I just cleaned it
down.....

Dave

-- 
 ---------------- Have a happy GNU millennium! ----------------------   
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \ 
\ gro.gilbert @ treblig.org | MIPS,x86,ARM, SPARC and HP-PA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
