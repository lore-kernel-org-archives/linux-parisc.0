Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 7 Mar 2003 23:30:43 -0700
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, davem@redhat.com
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030308063043.GB27859@dsl2.external.hp.com>
References: <200303061414.HAA26321@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303061414.HAA26321@udlkern.fc.hp.com>
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

On Thu, Mar 06, 2003 at 07:14:53AM -0700, John Marvin wrote:
> Dave Miller designed the cache flushing strategy to have hooks in the
> machine independent code to support virtual tagged caches.

While Dave Miller has my respect, he doesn't get everything exactly
right on the first try.  Design review and feedback are needed
(eg pci_set_dma_mask()) to fix remaining issues with the design
(e.g. nits/extensions to PCI DMA support).

My point is the VM design may have "flaws" WRT parisc architecture.
If the existing hooks mean performance sucks on parisc, davem is
usually open (though a PITA to convince) to discussing the issues.

I don't pretend to understand the issues with virtual tags and
linux VM design, I just want to encourage the discussion since
I'd really like to see SMP work right on parisc.

grant
