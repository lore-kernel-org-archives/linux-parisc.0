Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C2964840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 21:57:32 -0700 (MST)
Date: Fri, 21 Nov 2003 21:57:31 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: JjDunnjr@aol.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
Message-ID: <20031122045731.GA29917@colo.lackof.org>
References: <171.26ba943e.2cefd34e@aol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <171.26ba943e.2cefd34e@aol.com>
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

On Fri, Nov 21, 2003 at 03:45:02PM -0500, JjDunnjr@aol.com wrote:
> To all who took the time to reply, thank you
> Progress to date:
> 1. Set jumper to 512 k sector on the TEAC.  715/75 recognized it as a 
> different model.

very good - I'm amazed I hadn't heard about the 512 vs 2k sectors before.
But it's been 8 years since I seriously poked at SCSI devices.

> 2. It spun the disk upon issuing the "bo P2" command, however, i still got 
> the
> ENTRY_INIT =-4 message

The PA I/O Architecture Control Document (aka IO ACD) describes the 
ENTRY_INIT returns codes. See "Documentation" on www.parisc-linux.org.

> I will try to do a net boot next
> 
> if that fails, I will try to copy onto the boot 715/75 hard drive the 
> necessary files.  Which leads me to my next question, which files(s) would be 
> necessary for the 715/75 to boot
> 
> Would "lifimage" be enough or should i place "rescue.bin", "linux.bin" and 
> "drivers.gz" on the hard drive

Only the lifimage.
You will need two hard disks.
dd the lifimage you get from ftp.parisc-linux.org onto one harddisk and
 then boot the parisc machine from that disk. Install on the other disk.

It would be useful to check (via the "execute a shell" option) if the CD
is readable by the OS. If so, it can be used as an install source.
It's possible the CD is still readable but not bootable because
the CD burning SW used might have mangled the .ISO data.

hth,
grant
