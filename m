Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB5BD482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 23:40:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ch2D-0006l8-00; Fri, 31 Aug 2001 06:40:05 +0100
Date: Fri, 31 Aug 2001 06:40:05 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel failures
Message-ID: <20010831064005.F30497@parcelfarce.linux.theplanet.co.uk>
References: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3B8F18EF.9060404@hrzpub.tu-darmstadt.de>; from rscholz@hrzpub.tu-darmstadt.de on Fri, Aug 31, 2001 at 06:56:15AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 31, 2001 at 06:56:15AM +0200, Rüdiger Scholz wrote:
> The last Bootmessages are:
> SNIP----------
>         sticonsole_init: searching for STI ROMs
>         STI word mode ROM at f0025000, hpa=f8000000
>         STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
>         STI device: HPA208LC1024
>         STI word mode ROM at f0025000, hpa=f4000000
>         STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
> SNAP---------
> 
> Trying the same thing with kernel 2.4.9-pa5 leeds to a crash right after 
> detecting the first card.
> SNIP----------
>         sticonsole_init: searching for STI ROMs
>         STI word mode ROM at f0025000, hpa=f4000000
>         STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
> SNAP---------

Notice that both stop after trying hpa f4000000.  I think this is probably
where the bug lies.  I did change the detection order between than and now.

> 1. Every time my machine dumps the stack, and I check GR02 and IAOQ, 
> they tell me that the function which trashed the kernel are 
> parisc_terminate and parisc_showstack (or s.th like that). This isn't 
> normal, isn't it?

No.  There's astk in the build-tools CVS module which will dissect that
stack dump for you and maybe show you what's really going on.

> 2. Enabling IO_HPPA_REMAP in io.h causes a error in ioremap.c while 

Don't do that then :-)

> 3. Enabling SMB-Fs in the kernel gives an error message:

Yeah... i promised to fix this a while back; haven't got round to it yet.

> 4. My HIL-Keyboard isn't detected anymore by the new 2.4.9-kernel. Using 
> Kernel 2.4.7-pa1, after the initalisation of HIL, I get a bootmessage like
>  "HIL: keyboard found".  Booting the new Kernel gives me only the two 
> lines of HIL initalisation, but nothing about my Keyboard. Which is a 
> PS/2-Keyboard on a HIL-Adaptorbox. Both Kernel were configured via "make 
> oldconfig".

I'm interested in debugging this one - I don't quite understand what's going on though.  You should see:

Found HIL at 0x%x, IRQ %d

then one of:

HIL: timed out, assuming no keyboard present.
HIL: no keyboard present.
HIL: keyboard found at id %d

which?

-- 
Revolutions do not require corporate support.
