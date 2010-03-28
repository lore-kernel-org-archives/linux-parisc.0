From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 15:07:00 -0400 (EDT)
Message-ID: <20100328190701.20C0C516B@hiauly1.hia.nrc.ca>
References: <20100328180038.GA3732@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328180038.GA3732@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 28, 2010 02:00:38 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > A small note about getpid():
> > 
> > Since the parent and child share the same memory space, the parent
> > temporarily negates the cached PID value just before the vfork. Only
> > the parent, after the vfork, restores the cached PID. This is on
> > purpose to prevent any functions like PID-related functions from
> > working in the child() during the window bewteen vfork and execve.
> 
> Ok, it might be glibc that's broken (i.e., it doesn't restore correct
> dave).

The bad value is stored here:

0x0003f578 <fork+700>:	ldil L%7b800,r26
0x0003f57c <fork+704>:	b,l 0x35d74 <_IO_list_unlock>,rp
0x0003f580 <fork+708>:	stw r19,-414(r6)
(gdb) p/x $r19
$2 = 0x10101364

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
