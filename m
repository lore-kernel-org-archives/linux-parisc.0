From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Unable to get PALO to install on A180 Debian
	install
Date: Sun, 6 Jun 2004 10:17:48 -0600
Message-ID: <20040606161748.GC25343@colo.lackof.org>
References: <20040605212309.GC8098@colo.lackof.org>
	<FHEGKPBPFFGIFBGOANOKMELLEGAA.h.cochran@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Harry Cochran <h.cochran@comcast.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKMELLEGAA.h.cochran@comcast.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 05, 2004 at 06:55:09PM -0400, Harry Cochran wrote:
> Is there some
> key sequence I can hit at the "continue" screen to get to "execute a shell"
> (in the i386 world, you have a chance to select several different kernels,
> like bf24, at the beginning ... I don't see this capability in the hppa
> version).

Arrow keys? ie down arrow until it scrolls to "execute a shell".

(oh, that reminds me...I have helge's arrow-key patch in my tree and
offered to test it but don't know quite how.)

> 	Looking at sda1 with "Partition a Hard Disk" says the disk looks like:
> 
> 
>    Name	Flags		Part Type	FS Type		Label		Size(MB)
> /dev/sda1   Boot		Primary	Linux/PA-RISC boot  		59.11
> /dev/sda2               Primary	Linux swap			     519.31
> /dev/sda3             	Primary	Linux				    3715.32

That should be fine IFF sda1 is formatted as ext2 and THEN run palo on it.
And then it can be mounted as /boot. This all has to be done by hand
from "execute a shell" since the installer doesn't know anything about it.

At least I think that's how it should work since palo needs to mark
bits in the ext2 block usage map as "used" or "bad". James?

If sda1 can't be mount as /boot, you need to split sda3 into two parts.
The first part (root) needs to end before 2GB offset. The second part
can be the rest of the disk.

> I notice that you don't have the "Boot" flag turned on for you f0 partition.
> Is this an error on my part?

no. neither firmware nor palo cares about it.

> My sdb disk is another 4GB disk that I have concatenated with sda3 to make
> /.

That's fine. Personally, I would use the second disk as /home or /var.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
