Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA10785
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 19:03:49 -0700
Message-Id: <199911170204.VAA11108@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 16 Nov 1999 21:04:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199911162256.RAA03404@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 16, 99 05:56:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > > The _end symbol is not a reliable indicator of where
> > > the kernel's memory ends.  And the hpux
> > > bootloader doesn't provide the SOM header from whence this could
> > > theoretically be calculated.  I haven't tried out the _end trick
> > > posted last week, but it looks like it'll work (don't call the symbol
> > > _end if you try it).  As long as your kernel links, the guess is
> > > probably OK for now.
> > 
> > Ok, I see the problem now.  The section $DLT$ contains a bunch of
> > undefined common symbols as well as _end.  For example,
> > 
> > boot_cpu_data       |       416|undef |common |$CODE$
> > 
> > The _end defined by the linker is the end of the bss section but not
> > the end of last section of the kernel.
> 
> Ok, this is a programing problem.  For objects that don't need external
> linkage, declare them static.  For those that do, initialize them!  This
> will eliminate those pesky common variables.  For example,

The problem of uninitialized global data is present throughout the kernel.
Initializing these objects might make the kernel unnecessarily larger.  Thus,
I thought I would try the suggestion of Jeff Law.  However, after a little
experimentaion, I found that there isn't a sort key that will put the
$AFTERDLT$ section after the $DLT$ section.  However, I think the following
solution will do the job.  Try it out.  It might depend on linker version
or who knows what else.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

;    theend.S

;    Copyright (C) 1999 John David Anglin
;
;    This program is free software; you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation; either version 2, or (at your option)
;    any later version.

;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.

;    You should have received a copy of the GNU General Public License
;    along with this program; if not, write to the Free Software
;    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;    Wierd hack to force the linker to define _end correctly.

;    The sort key of 255 causes the linker to rename the $DLT$
;    section to $AFTERDLT$ and size it.  As a result, the _end
;    symbol defined by the linker correctly reflects the end of
;    the undefined common section.

	.space $PRIVATE$
	.subspa $AFTERDLT$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=255
	.globl _start_dlt
_start_dlt:
