Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kuolema.infodrom.north.de (kuolema.infodrom.north.de [217.89.86.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFC95482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 14:15:35 -0600 (MDT)
Date: Thu, 28 Jun 2001 22:14:50 +0200
From: Torsten Neumann <torsten@imke.infodrom.ffis.de>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems compiling LVM
Message-ID: <20010628221450.A28337@imke.infodrom.ffis.de>
References: <20010628202937.A13724@imke.infodrom.ffis.de> <20010628193653.77706115D6@finlandia.infodrom.north.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010628193653.77706115D6@finlandia.infodrom.north.de>
Sender: torsten@imke.infodrom.north.de
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 28, 2001 at 09:36:15PM +0200, Helge Deller wrote:
> Hi Torsten,

[ unaligned access problem ]
> 
> The problem is that your userspace program tries to do a direct 16 or 32-bit 
> read- or write-access to address 0x40067cf3 - which lies on a "unaligned 
> address" (e.g. not a a 32-bit boundary). 
> On Intel architectures this fault is automatically handled by the hardware, 
> while you get an unaligned access trap on parisc.
> 
> The first parisc-kernel which should handle this trap correctly is 2.4.0-pa39 
> (in CVS), so I would encourage you to update your kernel.

This was with kernel
Linux imke 2.4.0-pa43 #2 Wed Jun 27 20:09:41 CEST 2001 parisc unknown

Any Hints ?
Or could somebody tell me what more info is needed to solve the problem ?

  Torsten
