Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 23 Jun 2003 21:44:42 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge pb?[was: Re: HP C180 video card]
Message-ID: <20030624034442.GA28169@dsl2.external.hp.com>
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions> <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be> <20030615161948.GA12995@dsl2.external.hp.com> <3EF46AA9.7040703@tiscali.be> <20030623050450.GA449@dsl2.external.hp.com> <20030623111836.GA2620@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030623111836.GA2620@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Jun 23, 2003 at 12:18:36PM +0100, Matthew Wilcox wrote:
> x86 typically doesn't need to call pci_enable_device, so people who've
> never tried their driver on any other box may have missed it.

Happen to know if that is true for hotplug support?
ie does x86 requires something like pci_enable_device() for hotplug to work?

BTW, my comment was actually intended for other parts of the code I
was digging though, not the just lack of pci_enable_device().

grant
