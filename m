Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EA914829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 06:31:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Jw6N-0001vU-00; Thu, 05 Dec 2002 13:31:39 +0000
Date: Thu, 5 Dec 2002 13:31:39 +0000
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	debian-glibc@lists.debian.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Randolph Chung <tausq@debian.org>
Message-ID: <20021205133139.C5327@parcelfarce.linux.theplanet.co.uk>
References: <20021205010845.GU16331@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021205010845.GU16331@systemhalted>; from carlos@baldric.uwo.ca on Wed, Dec 04, 2002 at 08:08:45PM -0500
Subject: [parisc-linux] Re: GNU/Libc 2.3.1 on HP-PARISC requires >= 2.4.19 kernel.
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

On Wed, Dec 04, 2002 at 08:08:45PM -0500, Carlos O'Donell wrote:
> What?
> =====
> During the changeover from GNU/Libc 2.2.x to 2.3.x HPPA has changed
> it's minimum GNU/Libc kernel version to 2.4.19.

I feel this was a mistake.

> Why?
> ====
> - More testing.
> - Bugs fixed in unaligned handlers.
> - Trap handler fixes.
> - More things than you can shake a stick at, and all thanks to the
>   wonderful kernel hacking team that parisc-linux has.

That's great, but there are still problems with 2.4.19 and 2.4.20.  I think
you're doing our users a disservice by requiring them to upgrade to 2.4.19.
Why not relax the minimum version requirement down to 2.4.17?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
