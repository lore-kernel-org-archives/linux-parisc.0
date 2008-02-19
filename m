From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [patch 0/4] RFC: PCI: consolidate several
	pcibios_enable_resources() implementations
Date: Tue, 19 Feb 2008 01:11:50 -0500
Message-ID: <20080219061150.GA10115@phobos.i.cabal.ca>
References: <20080219043952.845136014@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-pci@atrey.karlin.mff.cuni.cz, linux-arch@vger.kernel.org,
	Russell King <rmk@arm.linux.org.uk>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@ozlabs.org, Chris Zankel <chris@zankel.net>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080219043952.845136014@ldl.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 18, 2008 at 09:39:52PM -0700, Bjorn Helgaas wrote:
>     - PA-RISC always turns on SERR and PARITY, which no other arch does
> 

I suspect this is because we set the host bus adapters to hard fail
(HPMC) on detecting an error, since we don't want to
	1) return possibly bogus (-1) data
	2) write code to use the (undocumented) error detection

More to the point, I suspect it's extra paranoia because firmware has
set it up this way. I put in a quick hack to test whether those bits
were set, and they came enabled that way by firmware on all the boxes I
tested. (Disclaimer, I didn't have any easily accessible boxes with
add-on cards installed, so firmware might just set it up for core
devices, and we're making sure its set everywhere.)

cheers, Kyle
