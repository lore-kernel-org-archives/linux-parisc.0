Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kuolema.infodrom.north.de (kuolema.infodrom.north.de [217.89.86.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id B71A5482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 14:07:05 -0600 (MDT)
Date: Thu, 5 Jul 2001 22:04:59 +0200
From: Torsten Neumann <torsten@imke.infodrom.ffis.de>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: unaligned memory accesses
Message-ID: <20010705220459.A13333@imke.infodrom.ffis.de>
References: <20010704155108.H31475@tausq.org> <20010705201520.A3618@imke.infodrom.ffis.de> <20010705120435.B30014@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010705120435.B30014@tausq.org>
Sender: torsten@imke.infodrom.north.de
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 05, 2001 at 12:04:35PM -0700, Randolph Chung wrote:
> > Tried latest kernel from cvs ( 2.4.0-pa51 ) and still got the same result,
> > 
> > pvcreate(204): unaligned access to 0x40067cf3 at ip=0x400310db
> > pvcreate(204): unaligned access to 0x40067cf7 at ip=0x400310e3
> 
> Do you see any other message about "Not-handled insn" like before? If
> not this may be a different issue. 

No,
I don't see any messages like "Not-handled unaligned insn" anymore, so it might
be a different issue.

  Torsten
