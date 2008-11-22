From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sat, 22 Nov 2008 16:37:44 -0500
Message-ID: <20081122213744.GA26202@hiauly1.hia.nrc.ca>
References: <20081122061448.GD12724@colo.lackof.org> <20081122194814.10E874EDF@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081122194814.10E874EDF@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 22 Nov 2008, John David Anglin wrote:

> Added a couple of printks:
> 
> VFS: name="/dev/root", p="cramfs"
> err=-6
> VFS: Cannot open root device "sda3" or unknown-block(0,0)
> Please append a correct "root=" boot option; here are the available partitions:

Boots if I add initrd=1/initrd.img.  Have to say the error message isn't
very helpful.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
