Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id E39B0482C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Mar 2002 20:19:56 -0700 (MST)
Date: Tue, 26 Mar 2002 22:20:46 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] X on J5000
Message-ID: <20020326222046.B10013@systemhalted>
References: <Pine.LNX.4.33L2.0203261716430.13376-100000@eiger.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33L2.0203261716430.13376-100000@eiger.apptechsys.com>; from jeremyd@apptechsys.com on Tue, Mar 26, 2002 at 05:19:18PM -0800
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

> I've finally got a fairly stable setup - the latest 2.4.18-pa11 single
> proc.  Now I've got a USB card, and I am able to make the graphics console
> and hid keyboard working.  Now I've moved on to X.  I read somewhere, tho
> I forget where, that I have to do fbset -i to get the resolution.  This
> reports no such device.
> 
> So, I'd like a pointer to an X on J5000 setup howto and a little help
> figuring out the fb stuff.
> 
> 
> TIA
>

I believe the J5000 has a Visualize EG PCI card, and that should
be working.

fbset -i will give you all the geometry you need, but won't work
without the compiled fbdev.

You need to go into [Console Drivers] and turn on the frame-buffer
support for your system ("Generic STI Framebuffer Support").

Cheers,
Carlos.
