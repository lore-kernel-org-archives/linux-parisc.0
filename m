Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx05.cluster1.charter.net (dc-mx05.cluster1.charter.net [209.225.8.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49C4D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 20:45:45 -0600 (MDT)
Message-ID: <3D66F38B.40705@charter.net>
Date: Fri, 23 Aug 2002 22:46:35 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: Tobias Giesen <tobias_subscriber@tgtools.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Question (fbdev, fbset, debconf)
References: <002901c24afe$88ca1990$a80251d9@PLUTO>
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

Don't get a Visualize-24 card. I don't think those
work right now either. Your choice of graphics boards
for a C200 is pretty slim. You have to be careful,
I found that out the HCRX-24Z board apparently fried
my onboard LAN devices when I plugged it onto the GSC bus.
I'm selling it on Ebay right now, so don't buy it,
it won't work :-)

Visualize-EG boards were the low-end boards for C-200
and I think C-180 machines. You may be able to scrounge
one if you are patient. I believe the one you want
is the A4450A. Even still it only has 8-bit color.

I'm going to be attempting to get a *Voodoo2* board
working with X, so if you hang around I may be able
to write a HOWTO-hppa-Voodoo2-XFree86 guide, assuming
it works.

In the meantime, consider getting a used dumb terminal.
I have one and it is pretty convenient at times like
these. If I was getting a new one I think I'd take my
chances on a Wyse-30, they are extremely compact, but
I'm not sure how developed their terminfo support is.
I used my dumb terminal to initially bootstrap my
machine.

Or just run a null modem cable into the serial port
of your other linux box and use something like minicom
to be its terminal.

I realize I'm ramlbing here. Well, I believe that people
are working on getting the FX2/4/6 board working, so
don't get rid of it just yet.




Tobias Giesen wrote:
>>get a used cheap Visualize-EG card somewhere.
> 
> 
> I see - any other models that will work? I read your post about a
> Visualize-24. Also, do all the different Visualize-EG models work?
> 

Not sure. Be careful about putting cards from older machines
into the C200. May cause hardware damage.
