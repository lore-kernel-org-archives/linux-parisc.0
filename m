From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sat, 22 Nov 2008 14:48:13 -0500 (EST)
Message-ID: <20081122194814.10E874EDF@hiauly1.hia.nrc.ca>
References: <20081122061448.GD12724@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, James.Bottomley@HansenPartnership.com,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081122061448.GD12724@colo.lackof.org> from "Grant Grundler" at Nov 21, 2008 11:14:48 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Nov 21, 2008 at 10:57:54PM -0700, Grant Grundler wrote:
> > Maybe the full device pathname (e.g. root=/dev/sda3) is required?
> 
> ok....this was rubish.  Prevous message showed:
>     Command line for kernel: 'root=/dev/sda3 panic=5 console=ttyS1
> 
> I don't know what the problem is here.

Added a couple of printks:

VFS: name="/dev/root", p="cramfs"
err=-6
VFS: Cannot open root device "sda3" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available partitions:
DEBUG_BLOCK_EXT_DEVT is enabled, you need to specify explicit textual name for "root=" boot option.
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Note: there are no partitions printed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
