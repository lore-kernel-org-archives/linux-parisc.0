Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 9 May 2003 09:48:26 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@helplets.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic on D270/1 when loading EISA driver
Message-ID: <20030509154826.GB23008@dsl2.external.hp.com>
References: <00000B0A.3EBBCBE2@helplets.tobit.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <00000B0A.3EBBCBE2@helplets.tobit.net>
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

On Fri, May 09, 2003 at 01:40:20PM +0000, parisc-linux@helplets.com wrote:
> (Are EISA devices treated as PCI devices? Otherwise it might be ok for dev
> to be NULL...)

Yes. But there needs to be a fake pci_dev so the ccio mapping services
can find it's IOMMU data structures. Either Ryan Bradetich or James
Bottomley might know off hand what the problem is for EISA. This
is not a new problem.

grant
