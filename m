Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id B584D4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 17:52:43 -0700 (MST)
Date: Sat, 21 Feb 2004 17:52:41 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: dub@latnet.lv
Subject: Re: [parisc-linux] Re: can't compile 2.4.24: pdc_cons.o problem!
Message-ID: <20040222005241.GA30849@colo.lackof.org>
References: <1077183184.403482d04a190@clients.latnet.lv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1077183184.403482d04a190@clients.latnet.lv>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Feb 19, 2004 at 11:33:04AM +0200, dub@latnet.lv wrote:
> BTW, it's not possible to navigate to
> http://cvs.parisc-linux.org/download/ from  http://cvs.parisc-linux.org/

I think that's ok. It's just convient to build the kernels
on the same machine that's hosting CVS. It's not obvious to
me a link from cvs.p-l.o is needed since we have a link from
the www.p-l.org navigation bar.

www.p-l.o has a "Prebuilt binaries" in the navigation bar.
And from there, a link to the cvs.p-l.o/download/autobuild-kernels/. 
I'll add links for linux-2.4 and linux-2.6 kernel downloads.


> How to find out status of pasisc-linux.org kernels? (stable vs testing)

Normally, follow the conversations on parisc-linux mailing list.
I don't know how useful bugs.debian.org is for kernel packages.
"stable" hppa kernel is horridly stale (kernel-image-2.4.18*).
Because of security bugs, folks should be using at least 2.4.24.
(2.4.25 is the lastest available, not).
2.6 kernels seem to be working well for me (except for SMP).
But it looks like the most recent debian upload was 2.4.21 based.

I see that http://cvs.parisc-linux.org/downloads/autobuild-kernels/32/
has a Packages.gz. But I don't know how the sources.list entry needs
to look for apt-get to find it.

hth,
grant
