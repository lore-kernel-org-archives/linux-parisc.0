Return-Path: <esproul@ntelos.net>
Received: from mailrtr03.ntelos.net (mailrtr03.ntelos.net [216.12.0.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4234A4829
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 25 Mar 2004 10:04:08 -0700 (MST)
Received: from thunderbolt.oss.ntelos.net (thunderbolt.oss.ntelos.net
	[216.12.8.195])
	by mailrtr03.ntelos.net (8.11.7/8.11.7) with ESMTP id i2PH47L11807
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 25 Mar 2004 12:04:07 -0500
Subject: Re: [parisc-linux] gdth driver on L2000
From: Eric Sproul <esproul@ntelos.net>
To: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040325032639.GA7587@colo.lackof.org>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
	<20040324173117.GA32052@colo.lackof.org>
	<1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
	<20040325032639.GA7587@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1080234247.17438.31.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 12:04:07 -0500
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, 2004-03-24 at 22:26, Grant Grundler wrote:
> On Wed, Mar 24, 2004 at 02:56:49PM -0500, Eric Sproul wrote:
> > Grant,
> > I'm working with Debian's 2.6.4 sources, but the gdth driver must be
> > unchanged since the patch applies cleanly.  Thanks!
> 
> good

I successfully ported Grant's patch to 2.4.25, and have attached a diff
for gdth.c.  All credit for this goes to Grant-- I just adjusted the
line numbers. ;)  I'll be submitting this patch as requested to
linux-scsi.

The driver appears to work now in my 2.4.25-64-smp kernel:

GDT: Storage RAID Controller Driver. Version: 2.05
GDT: Found 1 PCI Storage RAID Controllers
GDT CTR0: Configuring GDT-PCI HA at 32/0 IRQ 128

lspci:
20:00.0 RAID bus controller: Intel Corp. RAID Controller

I'm moving now to check out the RAID management utility from Intel that
supposedly worked under Debian 2.2.  I haven't even peeked at it yet.

Many thanks to Grant for getting me going.
Eric
