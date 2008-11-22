From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 23 Nov 2008 08:01:51 +0900
Message-ID: <1227394911.4366.0.camel@localhost.localdomain>
References: <20081122061448.GD12724@colo.lackof.org>
	 <20081122194814.10E874EDF@hiauly1.hia.nrc.ca>
	 <20081122213744.GA26202@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081122213744.GA26202@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2008-11-22 at 16:37 -0500, John David Anglin wrote:
> On Sat, 22 Nov 2008, John David Anglin wrote:
> 
> > Added a couple of printks:
> > 
> > VFS: name="/dev/root", p="cramfs"
> > err=-6
> > VFS: Cannot open root device "sda3" or unknown-block(0,0)
> > Please append a correct "root=" boot option; here are the available partitions:
> 
> Boots if I add initrd=1/initrd.img.  Have to say the error message isn't
> very helpful.

Um, I think you're using a configuration where SCSI is modular?  So it
finds the root disk if you have an initrd (by loading the modules) and
it can't if you don't.

James


