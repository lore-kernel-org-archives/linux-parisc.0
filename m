Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FB on c3k 
In-Reply-To: Message from Thomas Bogendoerfer <tsbogend@alpha.franken.de>
   of "Thu, 07 Mar 2002 00:22:39 +0100." <20020307002239.A9224@solo.franken.de>
References: <20020306080101.B6A874859@dsl2.external.hp.com>  <20020307002239.A9224@solo.franken.de> 
Date: Thu, 07 Mar 2002 00:31:16 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020307073117.4C572482F@dsl2.external.hp.com>
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

Thomas Bogendoerfer wrote:
> right of me is a monitor connected to a B2600 with a X screen on it :-)

Cool!

> No jsm is right, the U bit doesn't matter, if we set the right
> physical address in the TLB. I really don't understand why it's
> needed to supply more than 40bit,

B2600 has PA-8600. Maybe PA-8600 needs 44 bits of physical address?
PA-8000 only needed 40-bits, iirc.
I thought N-class (PA-8500) used 44-bits.

> but with the patch below X works
> (fbi still crashes the machine, but that could be a font problem,
> as well). Before I'll commit the change, I'll post it here for
> comments.

I tried it with 32-bit kernel on c3k.  That hpmc'd.
(Vis-EG, 1600x1200 8bit).
Are you using 64-bit kernel?

It's bedtime here and I need to post a diff here as well.

thanks,
grant
