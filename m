Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 284C6482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 17:19:14 -0600 (MDT)
Subject: Re: [parisc-linux] c200 fx graphics status?
From: Ryan Bradetich <rbradetich@uswest.net>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3CC5E580.5090403@charter.net>
References: <3CC5E580.5090403@charter.net>
Content-Type: text/plain
Date: 23 Apr 2002 17:19:12 -0600
Message-Id: <1019603952.1635.5.camel@beavis>
Mime-Version: 1.0
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

The answer is it depends upon the graphics card.  I have a C200+
that I use at work that I have been self-hosting on at work with 
a GSC video card:

5. Coral SGC Graphics (10) at 0xfa000000 [8/4], versions 0x4, 0x0, 0x77

using framebuffers and X.  I also have a C200+ at home with a PCI
video card 

Dec  5 22:11:05 vega kernel: STI device: HPA4552A

in which STI is supported, but not the framebuffer device (ie. 
no X).

Sorry I can't provide much additional advice, that is just
works and does not work for me.

thanks,

- Ryan



On Tue, 2002-04-23 at 16:51, B. Douglas Hilton wrote:
> Hi list!
> 
> I just subscribed here. I'm on debian-hppa but that doesn't
> seem to get much traffic, so I'll repost my question here.
> 
> I have previous experience with parisc-linux in that I had
> it installed and working ( with X ) on a 715/80. Thinking
> to move on to bigger things, I sold it on Ebay and rolled
> my profits into a C200 with some unspecified FX graphics
> board.
> 
> Now, from what I have gleaned, this machine only works in
> serial console mode? Do any graphics cards work with it
> for X yet? I do have a HP7000/60 dumb terminal, but of
> course I want to run X if I can.
> 
> I'm an accomplished kernel recompiler if that means anything.
> 
> (Nervously gnawing fingernails waiting for reply's)
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
