From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Cupertino test ring problem?
Date: Fri, 1 Aug 2008 17:31:42 -0600
Message-ID: <20080801233142.GC26550@colo.lackof.org>
References: <1217254746.3503.61.camel@localhost.localdomain> <20080728145712.GH18026@parisc-linux.org> <488DFD62.4080307@hp.com> <20080728171500.GB16059@parisc-linux.org> <488F777E.6090405@hp.com> <1217363136.6103.68.camel@localhost.localdomain> <488F842F.3040000@hp.com> <1217369386.6103.73.camel@localhost.localdomain> <20080731051524.GC18732@colo.lackof.org> <4891F5C0.8010307@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Matthew Wilcox <matthew@wil.cx>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Rick Jones <rick.jones2@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4891F5C0.8010307@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 31, 2008 at 10:26:24AM -0700, Rick Jones wrote:
...
> I can confirm that gsyperf3 was/is not set to autoboot.  I can also state 
> that it cannot successfully boot.  During POST it spits-out FRU problem 
> messages and during OS boot boatloads of Segmentation Fault output while it 
> tries to boot, and end-up in busybox.

Debian kernel didn't find it's root disk...older kernel I built booted fine.
It's up and I restored the default to a kernel that boots. I can test
other debian kernels on other machines and update gsyprf3 once those
are proven to work.

Rick and I swapped gsyprf3 (1.5Ghz proto CPUs and pre-production mother
board and case) for a production unit (1.3 Ghz CPUs and 8GB of RAM).

> I'm not sure that gsyprf11 (pa) is connected to the external net.

It wasn't and the default debian kernel didn't boot either.
I've set the default kernel to jda's 2.6.22.19 patched kernel.

> I tried swapping the cables on gsyprf10 (the lp1000r)  I have to see if I 
> can find the old monitor and keyboard to see what its boot state happens to 
> be.

again, bad 2.6.24 debian kernel. Rebooting to older (2.6.21) debian
kernel worked. Updated the machine but not willing to try a newer
kernel on this box unless I'm sitting in front of it with a console.

> Grant - wrt times, I'm here all week, from about 0930 to about 0330 each 
> day.  I'd be around later but this week I'm playing single-parent :)

thanks for helping this morning.
Getting the three key systems up was critical.
I can continue to muck with the rest.


cheers,
grant

>
> rick jones
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
