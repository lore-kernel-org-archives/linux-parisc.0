Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72E8E482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 13:14:56 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15dGEJ-00063z-00; Sat, 01 Sep 2001 20:14:55 +0100
Date: Sat, 1 Sep 2001 20:14:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What's a "Trace/breakpoint trap" and why does he crash my system?
Message-ID: <20010901201455.M5126@parcelfarce.linux.theplanet.co.uk>
References: <20010901155006.A4594@middle.of.nowhere> <20010901203232.A5963@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010901203232.A5963@middle.of.nowhere>; from thunder7@xs4all.nl on Sat, Sep 01, 2001 at 08:32:32PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 01, 2001 at 08:32:32PM +0200, thunder7@xs4all.nl wrote:
> should be 'Trace/breakpoint trap'

hmm.. what version of glibc do you have installed?  something else you
can do is run strace -ff which will attempt to follow fork/clone/vfork.

-- 
Revolutions do not require corporate support.
