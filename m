Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D090482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Apr 2002 22:48:10 -0600 (MDT)
Date: Sun, 28 Apr 2002 00:48:08 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HIL -> Keymap ok?
Message-ID: <20020428004808.C13522@systemhalted>
References: <20020427171144.C12610@systemhalted> <200204280209.52360.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200204280209.52360.deller@gmx.de>; from deller@gmx.de on Sun, Apr 28, 2002 at 02:09:52AM +0200
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

Helge,

> > p.s. This is just the start of my quest to stop the unbliking eye...
> >      a.k.a. "hardware cusor blinking" ... from _always_ appearing
> >      during framebuffer writes.
> 
> Shouldn't be that hard.
>

I've done a few nasty things to /drivers/video/sti to attempt to
stop the hardware cursor bliking, but I've not succeeded.

Even if I have no console on /dev/fb0 the penguin and blinking
cursor are the first things to appear as the fb device is initialized.

Any hints?

c.
