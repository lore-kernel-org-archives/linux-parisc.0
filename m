From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PATCH/RFC: discontig mem support for hppa
Date: Sat, 3 Jul 2004 12:37:12 -0600
Message-ID: <20040703183712.GA10458@colo.lackof.org>
References: <20040703180852.GD18628@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040703180852.GD18628@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 03, 2004 at 11:08:52AM -0700, Randolph Chung wrote:
> I am not clear about whether we need to treat "low memory"
> differently from "high memory" in any cases. willy pointed out to me
> that since we have a IOMMU we don't really need to care about ZONE_DMA
> vs ZONE_NORMAL,

That's correct. Becuase the virtual coherence index needed for cache
coherency, 32-bit PCI devices will always go through the IOMMU
even to DMA to physical memory < 4GB.

My hope is with ZX1 IOMMU, 64-bit devices can provide the virtual
coherence index as part of the DMA address. I haven't done all the
research yet to verify this will actually work.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
