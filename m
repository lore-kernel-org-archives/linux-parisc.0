Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] get_initiator for sym53c8xx_2 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Thu, 25 Jul 2002 00:54:00 MDT." <20020725065400.871B5482B@dsl2.external.hp.com>
References: <20020725065400.871B5482B@dsl2.external.hp.com> 
Date: Fri, 26 Jul 2002 15:46:55 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020726214655.908A8482B@dsl2.external.hp.com>
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
> Hi all,
> I've hacked up a patch to sym53c8xx_2 driver to query PDC
> for SCSI ID and other operating parameters:
> 
> 	ftp://ftp.parisc-linux.org/patches/sym2_pdc.diff

I've reworked this patch and commited the code...only to find that
while sym53c8xx_2 works on C3000, it hangs on my A500 after finding
the interface cards but before any disks are discovered:
CPU 0   GR02 0x1010bbc8 do_irq+f8
CPU 0   IOAQ 0x102245f0 sym53c8xx_intr+140

I'll be looking at this over the weekend.

grant
