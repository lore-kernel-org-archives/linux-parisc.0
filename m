Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB5694856
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 14:16:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B0oaQ-0001e8-4F; Tue, 09 Mar 2004 21:16:26 +0000
Date: Tue, 9 Mar 2004 21:16:26 +0000
From: Matthew Wilcox <willy@debian.org>
To: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
Message-ID: <20040309211626.GN2148@parcelfarce.linux.theplanet.co.uk>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<20040309053615.GA11669@colo.lackof.org>
	<53604.193.161.152.244.1078831651.squirrel@www.puszczka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <53604.193.161.152.244.1078831651.squirrel@www.puszczka.com>
Sender: <willy@www.linux.org.uk>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 09, 2004 at 12:27:31PM +0100, Andy Walker wrote:
> Try this then. I just followed the pattern for B160L, C110 et. al.

Thanks, committed.

> There are other issues with the hardware.c array though. I guess they're
> not critical, and I've no idea how to resolve them as they seem to
> indicate duplication on HP's part. I guess this is old news:
> 
> 1. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
> 2. Merlin+ 132 Dino RS-232 at 0xfff83000 [3] { 10, 0x0, 0x022, 0x0008c }
> 5. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
> 19. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085},
>    additional addresses: 0xf0011000
> 
> - Merlin+ 132 is B132L+, as far as I know. But this machine is
>   a plain Merlin/B132L. The Dino ports are marked Merlin+. Weird.
>   Could this imply mean Dino was upgraded to a non-broken rev. using
>   Merlin+ parts? There are separate items in hardware.c for 'Merlin
>   132 Dino PS/2 Port', and 'Merlin 132 Dino RS-232' but these don't
>   match.

Dunno about that one.  It doesn't seem terribly important really ;-)

> - what's listed as 'Coral SGC Graphics' is actually an A4071B_LZ GSC
>   card, aka. HCRX-24 with hardware acceleration board. No separate items
>   in hardware.c for any of A407[01][AB] or H?CRX-(8|24).
> 
> - what's listed as 'Gecko GSC Core Graphics' on my machine is actually
>   the 'Merlin 132 Core Graphics' i.e. the builtin Vis-EG. There is a
>   separate item in hardware.c for 'Merlin 132 Core Graphics' but it
>   doesn't match.

Yeah, the Graphics lab were pretty slap-dash about using the correct
versions on things.  This is something we've been living with since
the earliest days of the port.  Someone who was motivated might want to
collect information from a bunch of machines and fix it up.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
