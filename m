Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 968344831
	for <parisc-linux@parisc-linux.org>; Wed, 10 Sep 2003 12:58:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19xAAk-0003uC-D4; Wed, 10 Sep 2003 19:58:34 +0100
Date: Wed, 10 Sep 2003 19:58:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: Sebastian =?iso-8859-1?Q?Br=FCckner?= <sebastian.brueckner@epost.de>
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] HP B132L hangs
Message-ID: <20030910185834.GC21596@parcelfarce.linux.theplanet.co.uk>
References: <3F5F24D9.7030800@epost.de> <1063208722.1984.10.camel@mulgrave> <3F5F71C8.7060605@epost.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3F5F71C8.7060605@epost.de>
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

On Wed, Sep 10, 2003 at 08:47:36PM +0200, Sebastian Brückner wrote:
> I installed the latest available kernel image (2.4.20-32) and it worked 
> - only compiling seems to raise the error... strange!
> 
> I ran make-kpkg again and this time captured the first messages:

Could you redirect the output from make-kpkg to a file or /dev/null so the
messages from the compilation aren't interleaved with the kernel messages.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
