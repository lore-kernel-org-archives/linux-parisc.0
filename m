Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EC4A4841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Nov 2003 10:00:33 -0700 (MST)
Message-ID: <3FB7AD39.9010305@tiscali.be>
Date: Sun, 16 Nov 2003 17:00:41 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be> <20031112032230.GB12000@colo.lackof.org> <3FB68167.10106@tiscali.be> <Pine.LNX.4.58.0311152220070.16980@sal.ucc.ie> <Pine.LNX.4.58.0311152313340.16980@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0311152313340.16980@sal.ucc.ie>
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


M. Grabert wrote:
> Sorry to reply myself,
Don't worry, I do it also frequently (tired or not i need some more time 
to test more stuff or find back more info ;) )
> but think I might need to clarify some points
> (I'm a little bit tired, so I have missed some things in my previous post)
> 
> On Sat, 15 Nov 2003, M. Grabert wrote:
> 
> [...]
> 
> 
>>>So i will continue to see how to set it up in half-duplex (would it not
>>>be the default in 10BT?)
> 
> 
> Yes, usually it defaults to 10Mbit half-duplex and then (if the cards
> support it) it tries to negotiate better connections (full-duplex, 100Mbit ...)
> 
> 
>>Actually if one end point uses Full-Duplex and the other end uses
>>Half-Duplex, there should be no connection possible.
> 
> 
> This is true if the (forced full-duplex) network card test for full-duplex
> capable connection and doesn't find it. However most (cheap?) cards will
> skip the test for full-duplex if it was 'forced', and you can still connect.
> 
> Light traffic will work, but you will have problems with large traffic.
> The explanation:
> 
> The half-duplex side will send a packet, and assumes the other end stops
> sending if a collision occurs, ie. if the other side was sending something
> at the same time (CSMA/CD).
> The full-duplex side will however will always send/receive as fast as it
> can as it doesn't do CSMA/CD, ie. it doesn't care about collisions.
> 
> The effect is that there will be a massive amount of collisions if both
> sides want to send data, and only the half-duplex card will try to resend
> the packets (causing even more collisions).
> You will see slow traffic when sending from half-duplex, and dropped
> packets when sending from full-duplex when both cards are sending.
> 
> This will be most likely your problem, since it fits your description
> perfectly (forced full-duplex mode). Sorry, I overlooked that in
> my first post.
>
That explain perfectly the pb I encounter; thanks :)

> 
> 
> 
>>The same for the situation when one side uses 10Mbit and the other is
>>set to explicitly use 100MBit.
> 
> 
> This will definitely never work.
> 
> 
>>The only situation where such a decreased network performance occurs
>>is IMHO that your have a cheap network equipment.
>>IE. a dodgy network cable that isn't properly shielded or doesn't use all
>>8 wires,
> 
> 
> I mean in the context for 10BaseT, ie. all 4 wires (1/2,3/6) are connected,
> but not the rest. There will be noise/crosstalk that will lead to
> collisions.
> 
I check: all 8 wires are connected
> [...]
> 
> 
>>In this (worst case) scenario there will be a lot of packet drop on
>>the physical layer and the network cards will re-send the ethernet
>>packets autmatically (usually) without notifying you. You will see
>>decreased network performace as you mentioned it.
> 
> 
> The network card (only in half-duplex) will think it detects collisions
> due to noise/crosstalk and will automatically resend the packets without
> notification.
> 
> 
> Slan,
>   Max
> 
> 
Thanks again,
	Joel
