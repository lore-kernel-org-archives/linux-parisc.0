Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40F844830
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 08:19:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19uuxM-0005BF-I7; Thu, 04 Sep 2003 15:19:28 +0100
Date: Thu, 4 Sep 2003 15:19:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>,
	Linus Torvalds <torvalds@osdl.org>,
	Matthew Wilcox <willy@debian.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <20030904141928.GO18654@parcelfarce.linux.theplanet.co.uk>
References: <20030904135315.GB2411@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030904135315.GB2411@conectiva.com.br>
Subject: [parisc-linux] Re: [PATCH] add MODULE_ALIAS_LDISC to asm-parisc/termios.h
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

On Thu, Sep 04, 2003 at 10:53:15AM -0300, Arnaldo Carvalho de Melo wrote:
> 	This patch makes it compile, doing the same thing that was done to
> include/asm-i386/termios.h, please see if this is acceptable, if it is I can
> provide the same patch for all the other arches.

if it's the same for all arches, why not put it in <linux/termios.h>?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
