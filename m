Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "James S" <smithjames@comcast.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Formatting Scsi disks 
In-Reply-To: Message from "James S" <smithjames@comcast.net>
   of "Fri, 06 Sep 2002 08:44:29 CDT." <005201c255ab$a3bf7f80$02c1a8c0@james.co.uk>
References: <20020902234752.GA6718@systemhalted>  <005201c255ab$a3bf7f80$02c1a8c0@james.co.uk> 
Date: Fri, 06 Sep 2002 21:10:09 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020907031009.BB562482A@dsl2.external.hp.com>
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

"James S" wrote:
> the search command from the boot console on the 712 sees the disk
> the kernel sees & correctly identifies the disk
> just wont partition it
> any ideas?

hmm...
dd if=/dev/zero of=/dev/sda bs=64k count=10
reboot and then try to partition it.

I'm guessing the partition tool does not know the current partition scheme
(or maybe just thinks it does).

grant
