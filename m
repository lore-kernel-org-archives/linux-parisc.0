Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39AAD4830
	for <parisc-linux@parisc-linux.org>; Mon, 17 Feb 2003 08:26:32 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18knA7-0007eV-00; Mon, 17 Feb 2003 15:26:31 +0000
Date: Mon, 17 Feb 2003 15:26:31 +0000
From: Matthew Wilcox <willy@debian.org>
To: Harri Haataja <harri.haataja@kolumbus.fi>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] removal of gnat
Message-ID: <20030217152631.E28902@parcelfarce.linux.theplanet.co.uk>
References: <20030217151659.D28902@parcelfarce.linux.theplanet.co.uk> <20030217172157.A83956@azrael.blades.cxm>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030217172157.A83956@azrael.blades.cxm>; from harri.haataja@kolumbus.fi on Mon, Feb 17, 2003 at 05:21:58PM +0200
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

On Mon, Feb 17, 2003 at 05:21:58PM +0200, Harri Haataja wrote:
> If there's ada stuff and gnat in particular there, I hope removing that
> won't take out the last ada system available. I believe it's quite hard
> to get back.

No danger of that -- it's built as part of the debian gcc-3.2 build,
so there are substantially more recent compilers available.  gnat is
written in Ada, so it is known to work at least well enough to compile
itself.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
