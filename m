Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tdl.com (tdl.com [206.180.224.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1046482C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 01:04:14 -0600 (MDT)
Date: Tue, 9 Oct 2001 00:04:12 -0700
From: Randall Craig <randall@tdl.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] bad loopback error msg
Message-ID: <20011009000412.B20501@tdl.com>
References: <200110090020.SAA01264@puffin.external.hp.com> <20011009023331.D25819@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011009023331.D25819@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Oct 09, 2001 at 02:33:31AM +0100
List-ID: <linux-parisc.vger.kernel.org>

* Matthew Wilcox (willy@debian.org) [011008 19:46]:
> On Mon, Oct 08, 2001 at 06:20:15PM -0600, Grant Grundler wrote:
> > This B180 is up-to-date but still running 2.4.0-32 vmlinux
> > (original kernels from 0.9.2 I think).
> 
> Um, I think that's fatal.  You should upgrade the kernel before upgrading
> glibc, or you may run into problems.


I got the same error when I originally installed 0.9.2

A 2.4.9-paxx kernel solves this.  I was able to update
the glibc and compile a new kernel with this error (setting the
log level to two with SysRq helps to filter out all of the
errors though).

-- Randall
