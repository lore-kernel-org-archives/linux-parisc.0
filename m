From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when compiling
Date: Wed, 17 Dec 2008 19:05:26 -0500 (EST)
Message-ID: <20081218000527.7F4144EE7@hiauly1.hia.nrc.ca>
References: <4949812D.7080608@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4949812D.7080608@gmx.de> from "Helge Deller" at Dec 17, 2008 11:46:05 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> r20-23  8210c000 00000000 0020fd0e 8210c39e
> r24-27  00000000 00000001 8e7c5660 105e7a90
> r28-31  0000000f 00190834 8210c500 101a12b8
> sr00-03  00000000 00000000 00000000 00000847
> sr04-07  00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 101a147c 101a1480
>  IIR: 0ed5d240    ISR: 00000847  IOR: 0020fd0e
>  CPU:        0   CR30: 8210c000 CR31: d22344f0
>  ORIG_R28: 00001000
>  IAOQ[0]: do_sys_poll+0x1ac/0x1b8
>  IAOQ[1]: do_sys_poll+0x1b0/0x1b8
>  RP(r2): do_sys_poll+0x14c/0x1b8

The faulting instruction is:

dave@hiauly6:~/opt/gnu/bin$ disasm 0x0ed5d240
   0:	0e d5 d2 40 	sth r21,0(sr3,r22)

r22 is 0.  r22 being 0 is a bit wierd as revents has on offset of 6.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
