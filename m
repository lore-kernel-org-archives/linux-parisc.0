Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] highmem_io for the sym53c8xx_2 driver?? 
In-Reply-To: Message from Ryan Bradetich <rbradetich@uswest.net>
   of "23 Nov 2002 00:38:26 MST." <1038037106.14815.4.camel@beavis>
References: <1038037106.14815.4.camel@beavis> 
Date: Sat, 23 Nov 2002 19:13:57 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021124021357.0EDBA482E@dsl2.external.hp.com>
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

Ryan Bradetich wrote:
...
> I am not sure what the highmem_io flag does, but when it is enabled it
> causes my C200 to HPMC.

That's for the SCSI midlayer to know whether or not the driver can do
64-bit DMA or not. Basically it means SCSI will use "page+offset"
instead of "address" when building SG lists.

All parisc machines require 32-bit DMA - ie through an IO MMU or direct.
Failures with highmem_io enabled suggests we aren't handling
"page+offset" correctly in the iommu code.

grant
