Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 8 Mar 2003 10:24:39 -0700
To: "David S. Miller" <davem@redhat.com>
Cc: jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030308172439.GA10161@dsl2.external.hp.com>
References: <200303061414.HAA26321@udlkern.fc.hp.com> <20030308063043.GB27859@dsl2.external.hp.com> <20030307.222945.32673395.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030307.222945.32673395.davem@redhat.com>
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

On Fri, Mar 07, 2003 at 10:29:45PM -0800, David S. Miller wrote:
> If you flush caches exactly what sparc64 does in 2.5.x, and you do
> have a virtually indexed, physically tagged cache, you should have no
> correctness.

After getting some sleep and thinking about how IOMMUs work on parisc,
I've convinced myself the CPU caches are virtually tagged and
virtually indexed. Part of the IOMMU function is to provide the
virtual address tag/index bits in order to acquire cacheline ownership
on behalf of the device doing DMA. I don't know exactly how that
matters to the VM design, but it seems relevant that parisc is not
physically indexed.

thanks,
grant
