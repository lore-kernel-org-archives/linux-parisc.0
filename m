Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A01D4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Feb 2003 14:07:17 -0700 (MST)
Date: Mon, 17 Feb 2003 16:07:20 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 jejb
Message-ID: <20030217210720.GB14711@systemhalted>
References: <20030216181021.6A8514829@dsl2.external.hp.com> <20030217155753.GD3061@systemhalted> <1045499434.1749.27.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1045499434.1749.27.camel@mulgrave>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > This item is on my personal todo list, but I haven't talked to anyone who has 
> > suggested a solution. I'm just a lowly GNU/Libc hacker, but if you suggest 
> > something I _will_ write it. 
> 
> In general, we should probably be relying more on the generic 32/64
> compatibility layer recently introduced.  I suspect the best role model
> for all of this is sparc64, since that's habitually run as a 64 bit
> kernel with (mostly) 32 bit user space.

The sparc64 code is quite frightening, but I will look to it for a role
model.
 
> The HACK thing should continue to work OK as long as PA-RISC has no 64
> bit user binary support, though.

Yeah, it's OK until I attempt to write make/get/set/swap/context support
in libc :)

c.
