Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump: need disk layout function. 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Tue, 26 Mar 2002 07:21:41 GMT." <20020326072141.E22220@parcelfarce.linux.theplanet.co.uk>
References: <3CA01EB4.52B5F416@admin.france.hp.com>  <20020326072141.E22220@parcelfarce.linux.theplanet.co.uk> 
Date: Thu, 28 Mar 2002 10:00:30 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020328170030.C4CA9482A@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> How can a disc have HPA and SPA?  Are you trying to find the HPA/SPA of
> the disc's controller?

I thought the boot and dump devices have a faked HPA for IODC.
The code in palo/ipl/pdc_misc.c looks like it:

int
pdc_iodc_bootin(unsigned devaddr, char *memaddr, unsigned size)
{
    int r;

        r = firmware_call(PAGE0->mem_boot.iodc_io,
			PAGE0->mem_boot.hpa, ENTRY_IO_BOOTIN,
			PAGE0->mem_boot.spa, PAGE0->mem_boot.dp.layers,
			pdc_result, devaddr, memaddr, size, size);
....
