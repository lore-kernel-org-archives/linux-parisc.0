Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 1 Jan 2003 23:00:30 -0700
To: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] "vmalloc", friends and GFP flags
Message-ID: <20030102060030.GA14071@dsl2.external.hp.com>
References: <20030101214933.A26434@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030101214933.A26434@flint.arm.linux.org.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Wed, Jan 01, 2003 at 09:49:33PM +0000, Russell King wrote:
> a) parisc.  Looking at pa11_dma_alloc_consistent:

If James is wrong and it's un-safe to call dma_alloc_consistent() on
the interrupt path, I'm only slightly worried since I've only seen
dma_alloc_consistent() get called during driver initialization.
DMA-mapping.txt does not restrict what context "driver initialization"
might take place in.

grant
