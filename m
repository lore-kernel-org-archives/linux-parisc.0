Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx09.cluster1.charter.net (dc-mx09.cluster1.charter.net [209.225.8.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3C44483A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Aug 2002 19:56:37 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by dc-mx09.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 61682497 for parisc-linux@lists.parisc-linux.org; Wed, 21 Aug 2002 21:54:34 -0400
Message-ID: <3D644497.7090709@charter.net>
Date: Wed, 21 Aug 2002 21:55:35 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <3D5E0430.2000407@charter.net>  	<20020818044613.0969E4829@dsl2.external.hp.com> <1029666136.15858.3.camel@irongate.swansea.linux.org.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Voodoo2 PCI as XFree86 2D board on HP9000 C200
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

Voodoo2 it is then. I'm sorry but these HP graphics cards
are terrible for X. 8-bit color is really the bottom of the
barrel, and if I can get 16bpp on a Voodoo2 then its well
worth the few bucks one costs these days, plus it adds an
exotic air to the machine... "A HP workstation with a 3dfx
voodoo2 ... oooh aaah." Hmm, might even be able to find some
ancient Quake source with glide support and get it to work.

I used to have a V2 running in Linux several years ago, before
the Banshee, before the Geforce. It really did kick butt and
Quake and Quake2 were super nifty with it. I had my own version
of Mesa compiled with Voodoo2 support and was the envy of my
Linux buddies :-)

What do I do, just use the jumper cable to link the
Visualize-EG to the voodoo2, and start up X? Obviously
I will need the glide libs, but will I also need /dev/tdfx?
Can the Voodoo2 tdfx module be compiled for a 2.4.19-pa3 kernel?

What about console switching? If X is running on the Voodoo2,
and I hit Alt-F2, will it switch back to the Visualize-EG like
it should?

Alan, if you could find a few minutes to send me your XF86Config-4
for one of these boards, or otherwise post some useful tips and
hints that would be great. V2 boards are extremely cheap on Ebay
and such these days, and those monsters deserve a fitting home
in something like a parisc box rather than a dumpster.

Cheers!
- Doug



Alan Cox wrote:
> On Sun, 2002-08-18 at 05:46, Grant Grundler wrote:
> 
>>"B. Douglas Hilton" wrote:
>>
>>>Any hints or tips would be appreciated :-)
>>
>>Search the mail archives.
>>Once upon a time (2 years ago?), Alan Cox explained his ideas
>>on how to make something like this work. He had an A180 in front
>>of him at the time...
> 
> 
> I really doubt you will get a Voodoo3 to work this way. XFree have lots
> of problems with the Voodoo3 INT10 multihead even on x86 - the ROM seems
> to do some quite tricky stuff.
> 
> On the other hand a Voodoo2 should work wonderfully because its got no
> ROM, doesn't appear to be a video card and Glide2 has full source for
> bringing the board up.
> 
> XFree86 also supports using it as a 2D device, but not currently (alas
> 8)) DRI and Xv also. 
> 
> 
