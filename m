Return-Path: <esproul@ntelos.net>
Received: from mailrtr02.ntelos.net (mailrtr02.ntelos.net [216.12.0.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C7A7483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 12:56:51 -0700 (MST)
Received: from thunderbolt.oss.ntelos.net (thunderbolt.oss.ntelos.net
	[216.12.8.195])
	by mailrtr02.ntelos.net (8.11.7/8.11.7) with ESMTP id i2OJupP23675
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 14:56:51 -0500
Subject: Re: [parisc-linux] gdth driver on L2000
From: Eric Sproul <esproul@ntelos.net>
To: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040324173117.GA32052@colo.lackof.org>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
	<20040324173117.GA32052@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Date: Wed, 24 Mar 2004 14:56:49 -0500
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 2004-03-24 at 12:31, Grant Grundler wrote:
> I've hacked a quick patch together that lets this driver *build* without
> ISA/EISA support using linux-2.6/arch/parisc/configs/a500_defconfig.
> Just enable CONFIG_GDTH and apply this patch:
> 	ftp://ftp.parisc-linux.org/patches/diff-2.6.5-gdth-01
> 
> If it "works for you", please submit the patch to linux-scsi mailing list
> (linux-scsi@vger.kernel.org) and cc parisc-linux mailing list.

Grant,
I'm working with Debian's 2.6.4 sources, but the gdth driver must be
unchanged since the patch applies cleanly.  Thanks!

All,
Does anyone else who is running Debian have a working config I could use
to start from?  I've started with the stock Debian config (with changes
applied from the parisc Kconfig) but I'm having ugly build problems and
I know I've probably screwed up somewhere.  When I built my 2.4.25
kernel, I started with the config from Debian's stock 2.4.20-64-smp
kernel and made my adjustments from there.  I don't have that luxury
with 2.6.4 as there is no stock hppa kernel yet.  If you have a working
2.6 config, please post it or email me off-list.

Thanks,
Eric
