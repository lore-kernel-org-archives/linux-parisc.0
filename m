Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: jes@wildopensource.com
Subject: Re: [parisc-linux] 2.4.18-pa62 acenic-0.91
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Sat, 03 Aug 2002 20:03:47 MDT." <20020804020348.23C414860@dsl2.external.hp.com>
References: <20020804011707.2B9164860@dsl2.external.hp.com>  <20020804020348.23C414860@dsl2.external.hp.com> 
Date: Sat, 03 Aug 2002 20:58:04 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020804025804.3FE6C483E@dsl2.external.hp.com>
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

Grant Grundler wrote:
> This line of output:
> eth1: Enabling PCI Memory Mapped access - was not enabled by BIOS/Firmware
> 
> The driver isn't using pci_enable_device() and it should.
> Jes is aware of the problem.

Jes,
Another TODO item.

Privately, Mathew Wilcox observed cli() is an obsolete interface
and doesn't scale well on SMP boxes. This version of acenic won't
build on 2.5.30 since it still uses cli().  Need to replace that
with spin_lock_irqsave() (or spin_lock()) calls.

hth,
grant
