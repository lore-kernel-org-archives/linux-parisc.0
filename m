From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 22:25:04 -0400 (EDT)
Message-ID: <20090706022506.D3E405146@hiauly1.hia.nrc.ca>
References: <119aab440907051659p5d3cb93dk1034ce053034d192@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907051659p5d3cb93dk1034ce053034d192@mail.gmail.com> from "Carlos O'Donell" at Jul 5, 2009 07:59:59 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Jul 5, 2009 at 1:19 PM, John David
> Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> > Carlos, what do you think?
> 
> I think the dynamic linker is always the first to touch the mmap'd
> file and therefore the most likely to fail if something is wrong in
> our VM layer.

>From the core dump, this is the data supposed processed by
elf_get_dynamic_info:

(gdb) x/64x l->l_ld
0x4029e5fc <.LC11+4>:	0x00000001	0x00000167	0x00000001	0x00000171
0x4029e60c <.LC11+20>:	0x0000000e	0x00000179	0x0000000c	0x00000c9c
0x4029e61c <.LC11+36>:	0x0000000d	0x000020bc	0x00000019	0x00003590
0x4029e62c <.LC11+52>:	0x0000001b	0x00000004	0x00000004	0x00002168
0x4029e63c <.LC11+68>:	0x6ffffef5	0x00000134	0x00000005	0x0000047c
0x4029e64c <.LC11+84>:	0x00000006	0x000001ec	0x0000000a	0x000001c8
0x4029e65c <.LC11+100>:	0x0000000b	0x00000010	0x00000003	0x000037fc
0x4029e66c <.LC11+116>:	0x00000002	0x0000015c	0x00000014	0x00000007
0x4029e67c <.LC11+132>:	0x00000017	0x00000b40	0x00000007	0x000007b0
0x4029e68c <.LC11+148>:	0x00000008	0x00000390	0x00000009	0x0000000c
0x4029e69c <.LC11+164>:	0x6ffffffc	0x00000698	0x6ffffffd	0x00000006

(gdb) p l->l_ld[9]
$15 = {d_tag = 5, d_un = {d_val = 1148, d_ptr = 1148}}
(gdb) p/x 1148
$16 = 0x47c

The numbers seem to match that printed by readelf.  So, maybe Carlos
is right and this is a VM issue.  Is it possible the code saw different
data (e.g., the mmap operation was not complete before the mmap call
returned)?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
