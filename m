From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: RE: Panic in multiple kernels: IA64 SBA IOMMU: Culprit commit on
 Mar 28, 2008
Date: Tue, 11 Nov 2008 15:06:13 +0900
Message-ID: <20081111150644Q.fujita.tomonori@lab.ntt.co.jp>
References: <49125F21.8010806@cse.unsw.edu.au>
	<20081107125011M.fujita.tomonori@lab.ntt.co.jp>
	<57C9024A16AD2D4C97DC78E552063EA35C227994@orsmsx505.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: fujita.tomonori@lab.ntt.co.jp, shehjart@cse.unsw.edu.au,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: tony.luck@intel.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <57C9024A16AD2D4C97DC78E552063EA35C227994@orsmsx505.amr.corp.intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 7 Nov 2008 08:58:28 -0800
"Luck, Tony" <tony.luck@intel.com> wrote:

> > Tony, changing the sba IOMMU driver to return an error instead of
> > panic in the case of allocation failure is fine with you?
> 
> This is fine ... but we do need to audit the callers to make
> sure that they check for and handle this new error.

Well, this is the issue discussed in the past several times...

The most of SCSI drivers are fine; they can handle IOMMU mapping
failure properly or panic. But there are some network drivers that
don't even check the failure. Fixing these network drivers has been on
my todo list... But as I said before, we ignore this problem; only
swiotlb and SBA panic in the case of IOMMU mapping failure.
