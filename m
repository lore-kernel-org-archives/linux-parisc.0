Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 632024847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 10:37:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19cpHu-0003Qo-O2; Wed, 16 Jul 2003 17:37:54 +0100
Date: Wed, 16 Jul 2003 17:37:54 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.6.0-test1-pa1 64bits failled to compile
Message-ID: <20030716163754.GL23808@parcelfarce.linux.theplanet.co.uk>
References: <3F0C24F800000FBF@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0C24F800000FBF@ocpmta8.freegates.net>
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

On Wed, Jul 16, 2003 at 06:35:44PM +0200, Joel Soete wrote:
> This today cvs update failled to compile on my N4000-55 with this very short
> message:
> 
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> make: *** [.tmp_vmlinux1] Error 139
> palx4000:/usr/src/linux-2.6.0-test1-pa1# 

that's make segfaulting.  139 is 128 + 11 == signal 11 == segfault.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
