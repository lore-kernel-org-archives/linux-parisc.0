Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id C021F48B7
	for <parisc-linux@parisc-linux.org>; Sat, 29 Sep 2001 09:17:44 -0600 (MDT)
Date: Sat, 29 Sep 2001 11:17:41 -0400 (EDT)
From: <nick@snowman.net>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>,
	parisc-linux@parisc-linux.org
Subject: Re: Betr.: [parisc-linux] HP C180
In-Reply-To: <20010929142418.N5051@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0109291117210.11237-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Ok, can you point me to a totally current root image?
	Nick

On Sat, 29 Sep 2001, Richard Hirst wrote:

> On Wed, Sep 26, 2001 at 08:56:08AM +0200, Jurriaan Kalkman wrote:
> > >My c180 is now happily booting (current CVS kernel), however whenever I
> > >try to ls some dirs (no all, this example is from /usr/bin) I get errors
> > >along these lines
> > >ls: memory exhausted
> 
> I had this with 2.4.9, turned out I'd booted a root fs with old libc6
> installed.  When I rebooted using a current libc6 the problem went away.
> 
> Richard
> 
