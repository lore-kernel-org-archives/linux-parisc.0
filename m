From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C240 and Linux 2.6.x
Date: Wed, 5 Jan 2005 10:27:14 -0700
Message-ID: <20050105172714.GC24439@colo.lackof.org>
References: <20041230231420.GA15674@nilpferd.asyl>
	<41D553CB.6070802@tiscali.be>
	<20041231174649.GA21212@nilpferd.asyl>
	<20041231212330.GB23592@colo.lackof.org>
	<20050103181334.GB21212@nilpferd.asyl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Alexander Bartolich <alexander.bartolich@gmx.at>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050103181334.GB21212@nilpferd.asyl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 03, 2005 at 07:13:34PM +0100, Alexander Bartolich wrote:
> http://cvs.parisc-linux.org/download/linux-2.6/autobuild/b180_defconfig/
> and build a nice vmlinux-2.6.10-pa2.
...
> CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz

Sorry - I should have recognized this sooner.
The B180 defconfig will NOT run on C-class machines:
#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
# 
CONFIG_GSC=y
# CONFIG_HPPB is not set
# CONFIG_IOMMU_CCIO is not set
...

CONFIG_IOMMU_CCIO needs to be enabled.
The failing function call was probably dma_ops table not being initialized.

Can you try this "32" bit kernel?
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/32/palinux-32-2.6.10-pa5_0-2_all.deb

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
