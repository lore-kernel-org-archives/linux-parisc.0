Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx12.cluster1.charter.net (dc-mx12.cluster1.charter.net [209.225.8.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC92B482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Sep 2002 19:07:03 -0600 (MDT)
Message-ID: <3D795118.1060709@charter.net>
Date: Fri, 06 Sep 2002 21:06:32 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: Tobias Giesen <tobias_subscriber@tgtools.com>
Cc: 'palinux' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: C200 Voodoo2 Progress Report
References: <000001c25607$c1fcdf90$0100a8c0@PLUTO>
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

The C200 and probably C160, 180, 240, and 360
have two three different busses inside: the
Hewlett-Packard GSC bus, 5V/32bit PCI (dino),
and 3V/64bit PCI (cujo). Some PCI cards are
universal and have two punchouts. The 3V cards
have the punchout close to the outside edge of
the card, and 5V are the other way around.
You can use a 3V/32bit card in a 3V/64bit
slot with no problems. The Voodoo2 is 5V
only and will not fit into one of the Cujo slots.


Tobias Giesen wrote:
>>For one, the Voodoo2 is a 5V PCI card so it 
>>will not fit into the Cujo slots, only Dino.
> 
> 
> Which means some people can't use it? But you and I 
> have 5V slots allright, don't we.
> 

Right, C200 has both types. See above.

> 
>>programming video cards is a bit above my level
> 
> 
> Mine too!! Things always seem to be more difficult than
> you'd think at first. In any case I will now try to 
> repeat your initial steps, and I'll be very happy if I get
> to the checkerboard pattern.
> 

Yeah, not sure what did that. After rebuilding the sstfb
as a module and modprobe'ing it, I got a couple of colored
blocks, but not the checkerboard. I'm not sure of the exact
sequence as I haven't hooked up the spare monitor yet but
was switching the VGA cable back and forth. Further testing
seems warranted.

My C200 is back offline temporarily. I'm re-wiring my LAN
as it has gotten to be a horrendous mess of tangled wires
and cables after unplugging and replugging things for
several months. Need to straighten it out again :-)

I think I'll put the C200 onto my KVM switch with my X86 box
and reconsolidate it. I don't believe I'll be cracking the
case open anymore so it can be stowed away better than it is.
I put something like 370Mb RAM into it, a cdrom, an EEPro100,
and the Voodoo2. It is pretty well maxed out unless I run
low on HDD space which seems unlikely considering I just use
it as a hobby linux hacking box.

Thats it for now.

- Doug
