Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 17 Mar 2003 09:14:45 -0700
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FC driver?
Message-ID: <20030317161445.GA31378@dsl2.external.hp.com>
References: <3E68A12A00002910@ocpmta3.freegates.net> <20030317111801.GF17073@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030317111801.GF17073@lug-owl.de>
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

On Mon, Mar 17, 2003 at 12:18:01PM +0100, Jan-Benedict Glaw wrote:
> So your device is called "PCI_DEVICE_ID_HP_TACHYON".

Please don't ever call a TachLite (TL) devices "Tachyon".
Tachyon (5000) was the first FC chip made by HP (now Agilent)
and was a nightmare to program. TachLite  (5100/5166)
had a simpler programming model and fewer bugs. TachLite XL2
chips (5200) use the same programming model.


> See, it's quite easy to see if a PCI card seems to be supported:-)

Yes, but sometimes it's easier to start with "lspci -n" output.

cpqfc code suggests it supports all Tachlite HBAs.
But it depends on GBIC/HBA configuration and HPUX folks haven't
been interested in making cpqfc work with their XL2 HBA.
Jes Sorensen/Martin Petersen did get older (5100/5166) TL HBAs
from HP working with cpqfc driver.

grant
