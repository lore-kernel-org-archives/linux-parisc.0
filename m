Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hadron.dyndns.org (ma-amesbury1e-100.mrrmnh.adelphia.net [68.168.107.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 687104829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 08:38:02 -0700 (MST)
Date: Mon, 3 Feb 2003 10:37:35 -0500
From: "Aaron St. Pierre" <asp@ungod.com>
To: Michael Wood <mwood@its.uct.ac.za>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203153735.GE1046@hadron>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron> <20030203060359.GF29454@dsl2.external.hp.com> <20030203064328.GD1046@hadron> <20030203101959.GA28668@marmite.its.uct.ac.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203101959.GA28668@marmite.its.uct.ac.za>
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

Yes, the boot partition is < 2GB. In fact here is the partion table as 
reported from fdisk. 

Disk /dev/sda: 9100 MB, 9100044288 bytes
64 heads, 32 sectors/track, 8678 cylinders
Units = cylinders of 2048 * 512 = 1048576 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1        29     29680   f0  Linux/PA-RISC boot
/dev/sda2            30       267    243712   83  Linux
/dev/sda3           268      1221    976896   82  Linux swap
/dev/sda4          1222      5989   4882432    5  Extended
/dev/sda5          1222      3128   1952752   83  Linux
/dev/sda6          3129      5989   2929648   83  Linux

I will also add this info to my parisc page. I am going to start ripping
things out of the kernel a bit later today. One thing I will admit
ignorance about is the F0 partition. The debian install got vmlinux32 to
live in there but I haven't gotten any other kernels to live in there.
Not that that really matters since once can boot off of a kernel that
lives in an ext2 fs as long as it is within the first 2GB. Yawn, just
waking up ... 

In another life Michael Wood wrote:

> On Mon, Feb 03, 2003 at 01:43:28AM -0500, Aaron St. Pierre wrote:
> [snip]
> > As far as the palo message, i only started noticing it when I went to
> > v1.2 of palo. One thing I should note, when I set up / i made it ext3,
> > boot is off of / and not its own fs so when i realized what i did I
> [snip]
> 
> Your boot partition (/) is < 2GB, right?
> 
> -- 
> Michael Wood <mwood@its.uct.ac.za>

-- 
Aaron St. Pierre			tel: 978.828.6177
asp@ungod.com

 Have at you!
