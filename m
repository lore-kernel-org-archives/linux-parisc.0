Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48324482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 18:08:56 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19IHA6-0008F9-6z; Wed, 21 May 2003 01:08:54 +0100
Date: Wed, 21 May 2003 01:08:54 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	m68k-build@nocrew.org
Subject: Re: [parisc-linux] gcc-3.3 configuration
Message-ID: <20030521000854.GN31518@parcelfarce.linux.theplanet.co.uk>
References: <16074.48509.259405.775905@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16074.48509.259405.775905@gargle.gargle.HOWL>
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

On Wed, May 21, 2003 at 01:42:53AM +0200, Matthias Klose wrote:
> For Debian GNU/Linux gcc-3.3 is currently configured with
> 
> 	--with-sjlj-exceptions
> 
> to allow a binary compatible upgrade from gcc-3.2 to gcc-3.3. The
> other Debian platform, where sjlj based exceptions changed to dwarf2
> based exceptions is m68k, therefore the CC.

*sigh*.  I'm very conflicted over this.  On one hand, Debian is the de-facto
standard for PA-RISC/Linux binaries.  If another distro cares about
binary compatibility, they should follow Debian.

On the other hand, dwarf exceptions are clearly superior to sjlj.
We've never _released_ a distro compiled with 3.2 so we can break the
binary ABI without major repurcussions.

I'm not sure it's my call to make; I can see arguments on both sides.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
