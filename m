Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx12.cluster1.charter.net (dc-mx12.cluster0.hsacorp.net [209.225.8.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3B6F482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Apr 2002 00:59:12 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by mx12.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 5728730 for parisc-linux@lists.parisc-linux.org; Sun, 28 Apr 2002 02:57:33 -0400
Message-ID: <3CCBABDE.5080209@charter.net>
Date: Sun, 28 Apr 2002 03:59:26 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hp9000/827s
References: <1019862967.3cc9dfb797e86@www.lemonia.org> <20020427003030.B12051@parcelfarce.linux.theplanet.co.uk> <3CCA5FD7.9ABE4524@gmx.at>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

IMHO all HP hardware is of exceptional quality. I have used their
products for years all the way from RPN calculators, to a Pavilion PC,
to a 715/80, to a C200. They are without a doubt the best computer
company ever. When I was at Penn State, I learned MC68000 assembly
on a HP minicomputer running a whole lab of terminals (we used VI)
and had a great time with it!

I love this new C200 I got. Unfortunately, as a home computer hobbyist,
I cannot afford to purchase their newer hardware, but they seem to be
a great platform to port linux to. Linux is a great home OS because
it has thousands of apps available and makes an excellent experimenter
system. HP/UX is great for high-end engineering apps on the cutting edge
of technology but by the time these systems filter down to the home
user Linux becomes a lot more attractive because the big $$$ CAD apps
have probably been deleted and us experimenters can't afford to license
such things.

I am probably pushing my luck here as this is not really kernel-specific
stuff, but if any cpu's ever made sense they were the HP ones. They had
their crap together in a big way, a pa-risc cpu is a programmer's dream.

Just do it!



Christoph Plattner wrote:
> Hello,
> 
> by the way, are there plans for supporting the good old machines.
> You know, I am interested in writing the drivers for my E55 server
> machine, my PDC console driver should help for development here.
> 
> I hope we will have a chance to start developing ....
> 
> With friendly regards
> Christoph P.
> 
> 
> Matthew Wilcox wrote:
> 
>>On Sat, Apr 27, 2002 at 12:16:07AM +0100, Dunc wrote:
>>
>>>I have been attempting to install on a hp9000/827s
>>
>>According to hp9000_models;
>>8x7/F10-I40      Old Nova servers    PCXS    NIO, None     NIO(1),NIO(2),NA
>>
>>Basically, nothing is going to work.  There's some limited support for
>>the console in these machines, but no support for the SCSI, the Lan or
>>any other cards.  Sorry.
>>
>>--
>>Revolutions do not require corporate support.
>>
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
