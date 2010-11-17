From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Wed, 17 Nov 2010 10:33:03 -0500
Message-ID: <20101117153303.GG22651@bombadil.infradead.org>
References: <20101117054210.GD27930@lackof.org>
 <20101117143809.1F8A14DA1@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>, kyle@mcmartin.ca,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117143809.1F8A14DA1@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 17, 2010 at 09:38:08AM -0500, John David Anglin wrote:
> I also agree that the kernel shouldn't fix unaligned accesses occuring
> in the kernel.  It allows for sloppy coding and the fixup can be a
> major performance hit on strict alignment machines like sparc and hppa.
> 
> It would appear handle_unaligned can't always fixup kernel accesses.
> At least, emulate_ldd causes a hpmc attempting to fixup the ldd in
> init_page_buffers.  This may be because this is a wrong code error
> and the address is in someway invalid.  Maybe more address checking
> is needed.
> 

I'll take a look at emulate_ldd. It's entirely possible that it's broken
and we just haven't noticed because we would so rarely hit one in
userspace. (The only PA2.0 code I know of was the code Thibaut wrote to
do ffmpeg in pa2.0 asm. I imagine something like that wouldn't take
unaligned traps if performance was desired... ;-)

> The unaligned access in __tcp_v6_send_check seems to be caused by
> saddr being misaligned.  It's possible daddr is also misaligned.
> I was going to add a BUG_ON or two to try and get more info.  Don't
> know if emulate_ldd can fix this access.
> 
> In the case of ipv4, it's possible to pad/start packets in a manner
> to make it easier to access the ip header.  Don't know about ipv6.
> This may be what Kyle is suggesting.
> 

Right, I'll take a look at what other arches do and get back to you.

No arch should be taking unaligned traps in the packet recv path, as
that would just add unimaginable amounts of overhead...

--Kyle

> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> 
