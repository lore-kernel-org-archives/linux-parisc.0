Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B01884848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 08:21:47 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19nIz4-00032b-Um; Thu, 14 Aug 2003 15:21:46 +0100
Date: Thu, 14 Aug 2003 15:21:46 +0100
From: Matthew Wilcox <willy@debian.org>
To: Naresh <knaresh@india.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Discontig memory.
Message-ID: <20030814142146.GL10015@parcelfarce.linux.theplanet.co.uk>
References: <3F3B98D6.84D2464F@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F3B98D6.84D2464F@india.hp.com>
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

On Thu, Aug 14, 2003 at 07:42:38PM +0530, Naresh wrote:
> Hi,
> What exactly are the implications of turning on CONFIG_DISCONTIGMEM?
> Does this lead to serious system degradation? I do see a message being
> printed on the console during bootup, stating that heavy swapping could
> take place, and it is a mistake to turn on this option. I also see a
> comment in the code saying that this option is not implemented well. How
> seriously will it affect a system thats not running too many processes?

The discontigmem code in 2.4 is very badly written.  it basically
limits you to using the size of the smallest area multiplied by the
number of areas.  on an astro-based system, that's 256MB * 3 = 768MB.
as the warning says, don't turn it on.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
