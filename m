Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4F90482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Mar 2002 08:08:47 -0700 (MST)
To: Chris Rampson <crampson@ford.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mounting HPUX volumes/disks under PA-LINUX
From: "Martin K. Petersen" <mkp@mkp.net>
References: <200203201423.g2KENo323881@dymwsm09.mailwatch.com>
Date: 20 Mar 2002 10:08:43 -0500
In-Reply-To: <200203201423.g2KENo323881@dymwsm09.mailwatch.com>
Message-ID: <yq1k7s7nuo4.fsf@austin.mkp.net>
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

>>>>> "Chris" == Chris Rampson <crampson@ford.com> writes:

Chris> 1. I tried using sistina.com's LVM to try to mount a HPUX
Chris>    volume - and found out after testing (and reading from this
Chris>    list) that the two LVMs are NOT the same, nor even similar -
Chris>    except for the executable names.

Linux LVM is modelled after HP/UX'. But they don't share a common
codebase.


Chris> 2. I also tried mounting a HPUX full-disk partition, and
Chris>    palinux GRONKED and couldn't even recognize that the disk
Chris>    had a partition.

Huhm.  Odd.  That used to work.


Chris> 3. I tried loading the HPUX executables for vgscan, vg-pv-lv
Chris>    whatever, to see if they would work. No dice, if they were
Chris>    dynamically linked, I might be able to load the
Chris>    corresponding library to get them to work - but alas, they
Chris>    are statically linked. I get mmap failures when I try to use
Chris>    them.

The userland utilities are not going to help you without being able to
talk to the HP/UX kernel LVM driver.


Chris> Is there a way to do this? Has anyone had success in mounting
Chris> HPUX volumes/partitions? (JFS or HFS). Is there a plan to make
Chris> this work?

We can read HFS filesystems.  JFS (aka VxFS) may work now.  I sent
Christoph Hellwig some fs images to play with, anyway.

You can't access HP LVM volumes under Linux and nobody is working on
fixing that.  Given a bit of header file snooping and the EVMS plugin
infrastructure it should be too hard to do.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
