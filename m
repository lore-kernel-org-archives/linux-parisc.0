From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: Panic in multiple kernels: IA64 SBA IOMMU: Culprit commit on
 Mar 28, 2008
Date: Fri, 7 Nov 2008 08:58:28 -0800
Message-ID: <57C9024A16AD2D4C97DC78E552063EA35C227994@orsmsx505.amr.corp.intel.com>
References: <490F880E.4000801@cse.unsw.edu.au>
	<20081106032605J.fujita.tomonori@lab.ntt.co.jp>
	<49125F21.8010806@cse.unsw.edu.au>
 <20081107125011M.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
	"shehjart@cse.unsw.edu.au" <shehjart@cse.unsw.edu.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081107125011M.fujita.tomonori@lab.ntt.co.jp>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Can you check if data corruption doesn't happen during the tests?

Very important!!!

> Tony, changing the sba IOMMU driver to return an error instead of
> panic in the case of allocation failure is fine with you?

This is fine ... but we do need to audit the callers to make
sure that they check for and handle this new error.

-Tony
