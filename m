Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 25 Jun 2003 13:21:57 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge pb?[was: Re: HP C180 video card]
Message-ID: <20030625192157.GD8965@dsl2.external.hp.com>
References: <20030624034442.GA28169@dsl2.external.hp.com> <3ED4C8B600009CA3@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED4C8B600009CA3@ocpmta1.freegates.net>
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

On Wed, Jun 25, 2003 at 11:43:51AM +0200, Joel Soete wrote:
> Do you know where can I get more info on what have todo
> (naturaly only pci_enable_device() doesn't help)?

Track down where in the code the MMIO read fails.
If it's crashing *after* pci_enable_device() is called,
then need to make sure the driver isn't directly reading
PCI BARs and is using struct resources in the pci_dev.

grant
