Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3F744829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Feb 2003 09:57:57 -0700 (MST)
Date: Tue, 4 Feb 2003 09:57:54 -0700
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: Michael Wood <mwood@its.uct.ac.za>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030204165754.GA23535@paul.bame>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron> <20030203060359.GF29454@dsl2.external.hp.com> <20030203064328.GD1046@hadron> <20030203101959.GA28668@marmite.its.uct.ac.za> <20030203153735.GE1046@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203153735.GE1046@hadron>
From: bame@fc.hp.com (Paul Bame)
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

On Mon, Feb 03, 2003 at 10:37:35AM -0500, Aaron St. Pierre wrote:
> Yes, the boot partition is < 2GB. In fact here is the partion table as 
> reported from fdisk. 
> 
> Disk /dev/sda: 9100 MB, 9100044288 bytes
> 64 heads, 32 sectors/track, 8678 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sda1   *         1        29     29680   f0  Linux/PA-RISC boot
> /dev/sda2            30       267    243712   83  Linux

Your TOC dump indicated a likely death in firmware, which is consistent
with trying to load a kernel from beyond the 2G mark.  Indeed your
/dev/sda2 ends past the 2G mark, so you can expect that sometimes
it'll work and sometimes it won't.

	-P
