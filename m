Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76344482C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Mar 2002 21:54:02 -0700 (MST)
Date: Tue, 26 Mar 2002 20:54:01 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] X on J5000
In-Reply-To: <1017193152.8324.6.camel@beavis>
Message-ID: <Pine.LNX.4.33L2.0203262045310.13376-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Sorry, no tux.  But, due to extenuating circumstances I had to boot
serial console, so the display wasn't initted until late in the boot
process.
So, if the fb is not working, why wouldn't it be and what can I do to make
it work.
Here's the /proc/pci entry for the card

  Bus  4, device   7, function  0:
    3D controller: PCI device 103c:108b (Hewlett-Packard Company) (rev 3).
      IRQ 160.
      Master Capable.  Latency=255.
      Prefetchable 64 bit memory at 0xfb000000 [0xfbffffff].
      Non-prefetchable 64 bit memory at 0xfa000000 [0xfaffffff].

Here's from dmesg
Linux version 2.4.18-pa11 (root@krakatoa) (gcc version 3.0.4) #1 Tue Mar 26 16:24:33 PST 2002
...
STI PCI ROM enabled at 0xf7000000
PCI graphic ROM found at f7000000 (128 kB), fb @ fb000000 (16 MB)
PCI region 0: fb000000 with 16384 kB
PCI region 1: 00000000 with 0 kB
PCI region 2: fa000000 with 16384 kB
PCI region 3: 00000000 with 0 kB
PCI region 4: 00000000 with 0 kB
PCI region 5: 00000000 with 0 kB
PCI region 6: f7000000 with 128 kB
PCI region 7: 00000000 with 0 kB
PCI region 8: 00000000 with 0 kB
PCI region 9: 00000000 with 0 kB
PCI region 10: 00000000 with 0 kB
PCI region 11: 00000000 with 0 kB
Trying PCI STI ROM at f7000000, PCI hpa at fb000000
STI word mode ROM at f7000044, hpa=fb000000
STI word mode ROM, id 35acda16-9a02587, conforms to spec rev. 8.0c
STI PCI ROM disabled
STI device: HPA4982A
...
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64


 On 26 Mar 2002, Ryan Bradetich wrote:

> Jeremy,
>
> When the system booted up, did you see Tux?  If you saw the Tux
> log that means the fb is setup properly and fbset -i should work.
>
> If you didn't see tux that means the fb is not working for your card.
>
> hope that helps!
>
> - Ryan
>
> On Tue, 2002-03-26 at 18:19, Jeremy Drake wrote:
> > I've finally got a fairly stable setup - the latest 2.4.18-pa11 single
> > proc.  Now I've got a USB card, and I am able to make the graphics console
> > and hid keyboard working.  Now I've moved on to X.  I read somewhere, tho
> > I forget where, that I have to do fbset -i to get the resolution.  This
> > reports no such device.
> >
> > So, I'd like a pointer to an X on J5000 setup howto and a little help
> > figuring out the fb stuff.
> >
> >
> > TIA
> >
> >
> > --
> > If you sell diamonds, you cannot expect to have many customers.
> > But a diamond is a diamond even if there are no customers.
> > 		-- Swami Prabhupada
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

-- 
	In the beginning there was data.  The data was without form and
null, and darkness was upon the face of the console; and the Spirit of
IBM was moving over the face of the market.  And DEC said, "Let there
be registers"; and there were registers.  And DEC saw that they
carried; and DEC separated the data from the instructions.  DEC called
the data Stack, and the instructions they called Code.  And there was
evening and there was morning, one interrupt.
		-- Rico Tudor, "The Story of Creation or, The Myth of Urk"
