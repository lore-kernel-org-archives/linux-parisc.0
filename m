Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id A03EC482C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Mar 2002 21:57:25 -0700 (MST)
Date: Tue, 26 Mar 2002 20:57:24 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] X on J5000
In-Reply-To: <20020326222046.B10013@systemhalted>
Message-ID: <Pine.LNX.4.33L2.0203262056120.13376-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 26 Mar 2002, Carlos O'Donell Jr. wrote:

> I believe the J5000 has a Visualize EG PCI card, and that should
> be working.
>
> fbset -i will give you all the geometry you need, but won't work
> without the compiled fbdev.
>
> You need to go into [Console Drivers] and turn on the frame-buffer
> support for your system ("Generic STI Framebuffer Support").

It is already there

-- 
QOTD:
	"I tried buying a goat instead of a lawn tractor; had to return
	it though.  Couldn't figure out a way to connect the snow blower."
