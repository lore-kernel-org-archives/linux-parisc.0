Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D9FA4856
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jun 2003 12:41:52 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Wh7W-0002AI-Jx; Sun, 29 Jun 2003 19:41:50 +0100
Date: Sun, 29 Jun 2003 19:41:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] byte swapping redux
Message-ID: <20030629184150.GX31618@parcelfarce.linux.theplanet.co.uk>
References: <20030629181415.GA21094@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030629181415.GA21094@dsl2.external.hp.com>
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

On Sun, Jun 29, 2003 at 12:14:15PM -0600, Grant Grundler wrote:
> Hi all,
> 
> Can someone explain why include/asm-parisc/byteorder.h uses the following?
> 
> #if !defined(__STRICT_ANSI__) || defined(__KERNEL__)
> #  define __BYTEORDER_HAS_U64__
> #  define __SWAB_64_THRU_32__
> #endif

Protection against userspace inclusion.  Which shouldn't be happening
of course, but some userspace programs are crap.

> vs include/asm-sparc64/byeorder.h:
> #define __BYTEORDER_HAS_U64__
> 
> I'm pretty sure we don't want __SWAB_64_THRU_32__ defined.
> PA-RISC version of ___arch__swab64() is appropriately defined for
> both 32 and 64-bit compiles.

Take it out then; if it works, commit it (to 2.5 anyway).

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
