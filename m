Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DA24488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 23:51:01 -0700 (MST)
Date: Sat, 21 Feb 2004 23:51:00 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Re: can't compile 2.4.24: pdc_cons.o problem!
Message-ID: <20040222065100.GG30849@colo.lackof.org>
References: <1077183184.403482d04a190@clients.latnet.lv>
	<20040222005241.GA30849@colo.lackof.org>
	<20040222012033.GN11824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040222012033.GN11824@parcelfarce.linux.theplanet.co.uk>
Cc: dub@latnet.lv, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 22, 2004 at 01:20:33AM +0000, Matthew Wilcox wrote:
> deb http://cvs.parisc-linux.org/downloads/autobuild-kernels/ 32/
> 
> should do the trick, but I think you have the URL wrong.  I get:
> 
> /downloads/autobuild-kernels/32: unknown location

oopps...my bad. It's "download" (without 's')
And I confirmed the following sources.list line works:

deb http://cvs.parisc-linux.org/download/autobuild-kernels/ 32/

apt-get update says:
Hit http://cvs.parisc-linux.org 32/ Packages                                   
Ign http://cvs.parisc-linux.org 32/ Release                                    

And dselect doesn't see the kernel-image-2.4.25-pa0 .deb.
(I ran "update" from dselect menu)

DOH! two things:
1) I'm doing this on an a500 - use 64/ instead
2) packages are called "palinux-64-2.4...." (not "kernel-image-2.4...")

hrmm...dselect is getting:
Err http://cvs.parisc-linux.org 64/ palinux-64-2.4.25-pa0 0-2        
  404 Not Found
...
Failed to fetch http://cvs.parisc-linux.org/download/autobuild-kernels/./palinux-64-2.4.25-pa0_0-2_all.deb  404 Not Found
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?

OIC... '64/' is missing. Ideas?

thanks,
grant
