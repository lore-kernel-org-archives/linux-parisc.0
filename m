Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 414B6484C
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 12:14:41 -0600 (MDT)
Date: Sat, 10 Apr 2004 12:14:39 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
Message-ID: <20040410181439.GA13387@colo.lackof.org>
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org> <40770BDF.10209@tiscali.be>
	<20040409211507.GB32385@colo.lackof.org>
	<4077B104.9030707@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4077B104.9030707@tiscali.be>
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Apr 10, 2004 at 08:32:04AM +0000, Joel Soete wrote:
> I will so just reversed mentioned patches, check if it is the real
> cause of my pb.

ok

> If yes (I don't see what else) re-apply patch hunk by hunk until it breaks 
> again?

That won't work with the changes to ccio driver. It's all or nothing.

> Any better idea?

I don't understand why C360 (James' machine) works and C110 (your machine)
does not.  C110 doesn't have PCI and maybe different keyboard/LAN.
Find out what is different between the two machines and see if ccio
changes broke one of the drivers for the different HW.

You might need to add pdc_io_reset_devices() to ccio_ioc_init()
since we moved that out of the common code path. I don't see that
in CCIO driver and it's not clear to me if HIL or LAN need it on C110.

It *might* need pdc_io_reset() call instead (or in addition)
but I don't know.  Just another thing to be aware of.

grant
