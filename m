Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 4 Feb 2003 11:03:26 -0700
To: Paul Bame <bame@fc.hp.com>
Cc: "Aaron St. Pierre" <asp@ungod.com>,
	Michael Wood <mwood@its.uct.ac.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030204180326.GB15904@dsl2.external.hp.com>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron> <20030203060359.GF29454@dsl2.external.hp.com> <20030203064328.GD1046@hadron> <20030203101959.GA28668@marmite.its.uct.ac.za> <20030203153735.GE1046@hadron> <20030204165754.GA23535@paul.bame>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030204165754.GA23535@paul.bame>
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

On Tue, Feb 04, 2003 at 09:57:54AM -0700, Paul Bame wrote:
> On Mon, Feb 03, 2003 at 10:37:35AM -0500, Aaron St. Pierre wrote:
> > Yes, the boot partition is < 2GB. In fact here is the partion table as 
> > reported from fdisk. 
> > 
> > Disk /dev/sda: 9100 MB, 9100044288 bytes
> > 64 heads, 32 sectors/track, 8678 cylinders
> > Units = cylinders of 2048 * 512 = 1048576 bytes
> > 
> >    Device Boot    Start       End    Blocks   Id  System
> > /dev/sda1   *         1        29     29680   f0  Linux/PA-RISC boot
> > /dev/sda2            30       267    243712   83  Linux
> 
> Your TOC dump indicated a likely death in firmware, which is consistent
> with trying to load a kernel from beyond the 2G mark.  Indeed your
> /dev/sda2 ends past the 2G mark, so you can expect that sometimes
> it'll work and sometimes it won't.

Paul,
Are you sure?

267*1048576 == 279969792 == 279,969,792

That's 280MB if I've placed the comas right.

grant
