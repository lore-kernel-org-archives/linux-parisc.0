Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37299482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 23:33:13 -0700 (MST)
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Peter Mottram <peter@petescaff.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] partitioned md to enable root on raid
References: <Pine.LNX.4.42.0201220007440.13910-100000@r6.petescaff.com>
	<20020122022033.C1685482A@dsl2.external.hp.com>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 22 Jan 2002 01:32:10 -0500
In-Reply-To: <20020122022033.C1685482A@dsl2.external.hp.com>
Message-ID: <yq1665ukiad.fsf@jaguar.wave.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Grant" == Grant Grundler <grundler@dsl2.external.hp.com> writes:

>> Here's the next question - does palo understand how to boot from
>> LVM?

Grant> No. HPUX LVM is derived from the same original sources as
Grant> linux's LVM but is not compatible. 

Linux LVM is closely modeled after the HP/UX LVM from a sysadmin
perspective.  But there's no code sharing involved.

What I really said was that IBM wrote the original LVM and donated the
code to OSF.  HP then picked it up and ported it to HP/UX.  So AIX,
OSF/1 and HP/UX volume managers share a common ancestor.  These days
they have diverted greatly, though.


Grant> HP cannot release the disk layout since it's not HP's to give
Grant> away. MKP tried to reverse engineer it early in the port and
Grant> gave up after a while. 

I didn't spend a lot of time on it (a couple of hours of poking).  I
also tried getting specs for the LVM metadata out of HP with no avail.

A read-only implementation for palo should be fairly trivial to write
but hardly worth the effort.


I do agree with the concensus that MD partitioning is not worth it.

Mirror the palo partition as md0, swap as md1 and / as md2.  Or
whatever.  That's the way to do it.

As long as you don't need autodetection (and you don't since PDC/IODC
don't understand MD devices anyway), you'll be fine leaving the
palo partition type as F0.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
