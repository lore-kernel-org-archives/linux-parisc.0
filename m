Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBB5148A5
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Jan 2004 09:18:44 -0700 (MST)
Date: Tue, 20 Jan 2004 11:18:58 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jools Smyth <jools@oxfordinspire.co.uk>
Subject: Re: [parisc-linux] Stability / Kernel 2.6.1 / HD Freezes
Message-ID: <20040120161858.GC15917@baldric.uwo.ca>
References: <200401191930.27090.jools@oxfordinspire.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401191930.27090.jools@oxfordinspire.co.uk>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 19, 2004 at 07:30:26PM +0000, Jools Smyth wrote:
> Hi all,
> 
> I've been reading the list for a while, thought I should join. I'm not really 
> a developer (well not on hppa) but I am happy to test stuff out :-)
> 
> First of all, I want to thank everyone whos worked on linux for HPPA.
> I never really felt comfortable with hp-ux, and getting things working was 
> always a pain. 

Thanks!
 
> I own a model 9000/800/A180c. (512 mb ram / 18gb hd)

Have you registered yourself in the hardware database?
http://hwdb.parisc-linux.org/

> I was running previously the 2.4 series kernels, but had a lot of crashes 
> during HD access. I have seen this mentioned before, and Its probably the 
> same issue ? (In fact most of the crashes were during package 
> unpacking/installation). Since moving to the 2.6 series this hasnt happened. 
> Is this scsi issue now fixed, or have I been lucky ? (I did have a crash 
> recently involving a debug file being written. Could it be this problem 
> again ?)

Need more info. What crashes? Can you get a dump? What compiler did you
use to build the kernel?
 
> I just built Linux hp9000 2.6.1-pa7 and on my system it seems to be working 
> fine.

Yay!
 
> Also, does anyone here know why dovecot wouldnt work with libgnutls on hppa ? 
> the dovecot maintainer has been trying to debug it on my machine (If my 
> machine hadnt crashed). works fine with openssl. Has anybody had any other 
> problems with libgnutls ?

Post to debian-hppa lists. I'll be happy to help if I can see a clear
description of the problem.

c.
