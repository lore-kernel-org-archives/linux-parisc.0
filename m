From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: 16 Nov 2004 09:30:37 -0600
Message-ID: <1100619043.2574.19.camel@mulgrave>
References: <20041116063733.GA27633@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041116063733.GA27633@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2004-11-16 at 00:37, Grant Grundler wrote:
> If someone else can review/test and/or commit, that would be great.
> Otherwise I can commit this tomorrow. (Assuming CVS is still alive and well)

It looks fine to me ... I didn't realise this was broken ...

> Patch below is partially inspired by include/asm-ia64/pci.h.
> Though it might be better to define/declare parisc_bus_is_phys
> elsewhere if EISA support also eventually needs it.

Unfortunately, EISA support needs a per bus check for the iommu (since
WAX on some of the machines has its own IOMMU but the rest of the system
doesn't).  I was going to look at introducing this abstraction, but we
never managed to get an unencumbered copy of the WAX specs to get it all
working.

Thanks for debugging this.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
