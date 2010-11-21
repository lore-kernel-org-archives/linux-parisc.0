From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Sun, 21 Nov 2010 10:38:29 -0500
Message-ID: <20101121153828.GA24339@hiauly1.hia.nrc.ca>
References: <20101117052218.GB27930@lackof.org> <20101117160319.984F14DA1@hiauly1.hia.nrc.ca> <20101120210120.GA20947@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101120210120.GA20947@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 20 Nov 2010, John David Anglin wrote:

> On Wed, 17 Nov 2010, John David Anglin wrote:
> 
> > > On that note, can you try a 32-bit kernel? (SMP maybe)
> > 
> > rp3440 doesn't support a 32-bit kernel.  I don't have a 32-bit SMP
> > machine.  I did try a UP 2.6.36 kernel on my c3750.  It crashed doing
> > its first gcc build.  Don't know why.  My 2.6.34.7 build is stable.

I'm seeing messages like the following with 32-bit 2.6.36:

Nov 20 16:43:29 hiauly6 kernel: vgaarb: this pci device is not a vga device
Nov 20 17:03:50 hiauly6 kernel: swap_free: Bad swap offset entry 00100009
Nov 20 17:03:54 hiauly6 last message repeated 119 times
Nov 20 17:12:48 hiauly6 kernel: swap_free: Bad swap offset entry 00100009
Nov 20 17:13:11 hiauly6 last message repeated 871 times
Nov 20 17:19:39 hiauly6 kernel: swap_free: Bad swap offset entry 00100009
Nov 20 17:19:49 hiauly6 last message repeated 462 times
Nov 20 17:21:41 hiauly6 last message repeated 113 times
Nov 20 17:22:42 hiauly6 last message repeated 692 times
Nov 20 17:22:45 hiauly6 last message repeated 32 times
Nov 20 17:25:42 hiauly6 kernel: swap_free: Bad swap offset entry 00100009

System hung when I tried shutdown -r.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
