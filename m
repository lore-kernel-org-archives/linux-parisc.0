From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: Unable to get PALO to install on A180 Debian
	install
Date: 06 Jun 2004 11:27:16 -0500
Message-ID: <1086539237.1747.71.camel@mulgrave>
References: <20040605212309.GC8098@colo.lackof.org>
	<FHEGKPBPFFGIFBGOANOKMELLEGAA.h.cochran@comcast.net>
	<20040606161748.GC25343@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Harry Cochran <h.cochran@comcast.net>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040606161748.GC25343@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2004-06-06 at 11:17, Grant Grundler wrote:
> > 	Looking at sda1 with "Partition a Hard Disk" says the disk looks like:
> > 
> > 
> >    Name	Flags		Part Type	FS Type		Label		Size(MB)
> > /dev/sda1   Boot		Primary	Linux/PA-RISC boot  		59.11
> > /dev/sda2               Primary	Linux swap			     519.31
> > /dev/sda3             	Primary	Linux				    3715.32
> 
> That should be fine IFF sda1 is formatted as ext2 and THEN run palo on it.
> And then it can be mounted as /boot. This all has to be done by hand
> from "execute a shell" since the installer doesn't know anything about it.
> 
> At least I think that's how it should work since palo needs to mark
> bits in the ext2 block usage map as "used" or "bad". James?

Actually, you need to have palo itself format /dev/sda1 using the
--format-as=2 (2 is for ext2) option.  If you use this, you also
*cannot* specify a recovery kernel.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
