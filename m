Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 0239E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 13:36:53 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Torsten Neumann <torsten@imke.infodrom.ffis.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems compiling LVM
Date: Thu, 28 Jun 2001 21:36:15 +0200
References: <20010628202937.A13724@imke.infodrom.ffis.de>
In-Reply-To: <20010628202937.A13724@imke.infodrom.ffis.de>
MIME-Version: 1.0
Message-Id: <20010628193654.0239E482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Torsten,

The problem is that your userspace program tries to do a direct 16 or 32-bit 
read- or write-access to address 0x40067cf3 - which lies on a "unaligned 
address" (e.g. not a a 32-bit boundary). 
On Intel architectures this fault is automatically handled by the hardware, 
while you get an unaligned access trap on parisc.

The first parisc-kernel which should handle this trap correctly is 2.4.0-pa39 
(in CVS), so I would encourage you to update your kernel.

Greetings,
Helge

On Thursday 28 June 2001 20:29, Torsten Neumann wrote:
> Hi,
>
> the linux-lvm code was inspired by the hp-ux LVM. So I thougt it would be
> real cool if the linux-lvm runs under hppa-linux.
> Compiling the kernel with lvm support is no problem, the userspace tools
> have some problems with gcc-3 (code uses #ifdef constructs in printf
> macro), but then also compiles cleanly.
>
> Now I want to create a VG but I only got the error message
> imke kernel: pvcreate(188): unaligned access to 0x40067cf3 at ip=0x400310db
> imke kernel: Not-handled unaligned insn 0x48350376
>
> >from the program pvcreate.
>
> Could somebody tell what kind of problem this is. Is it a kernel problem or
> a userspace problem ?
> Is there a way to avoid this problem ?
>
>   Torsten
