Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 75740482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 09:19:19 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Date: Sat, 13 Oct 2001 17:18:37 +0200
References: <20011013162103.A3604@dogbert.localdomain> <20011013164548.B4317@dogbert.localdomain> <20011013165925.C4317@dogbert.localdomain>
In-Reply-To: <20011013165925.C4317@dogbert.localdomain>
MIME-Version: 1.0
Message-Id: <20011013151919.75740482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> SCSI subsystem driver Revision: 1.00
> 53c700: consistent memory allocation failed
>
> Is it normal for the consitent memory allocation to fail as indicated
> above? What does this mean?

Hi Albert.

Yes, it's normal that it fails that way on your machine.
It just says, that your machine/CPU needs a "cache-writeback"
command by the cpu before any other chips may access that 
area of memory directly via dma. 
In other words, your machine isn't cache-coherent and this
will be handled automatically by the driver. 
Btw, harmony (sound), lasi_82596 (LAN)  and other drivers have 
the same problem, but mostly don't inform you about that.

Greetings,
Helge
