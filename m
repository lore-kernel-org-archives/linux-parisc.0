From: Andrew Gaylard <ag@computer.org>
Subject: [parisc-linux] Any chance of an HP AutoRAID array working?
Date: Thu, 12 Oct 2006 21:21:36 +0200
Message-ID: <452E95C0.3050307@computer.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello PA-people,

Today I purchased 2 K370s and a K570 for roughly US$75 ($25 each).
All of the machines have 4 internal disks: 4, 4, 9, and 9 GB.

However, one K370 and the K570 have each got a disk array in them,
full of 18GB disks, and sporting a fancy LCD display.  These arrays
take up roughly half a rack each, and are labelled "HP AutoRAID".

The boxes have HPUX-10.20 on them, and SAM identifies the AutoRAID
unit as a single logical drive (with extra goodies such as the
power and fan status, etc.  Nice.)  Each array is connected to
its server via a large HSC board with what appears to be several
differential SCSI cables.

I'm keen to use Linux (probably Gentoo but Debian's also fine) on
these boxes, but I'm wondering if that'll mean I'll have to forfeit
the 8 x 18G disks in each array, which would be a pity...

I don't need to know the PSU and fan statuses, I just want the space.
If necessary, I can dedicate one of the 4 internal disks to HPUX,
just in case I need to reconfigure the RAID system.

Has anyone tried Linux on one of these AutoRAID systems?  A brief spin
though Google didn't reveal anything.  It also didn't reveal a manual
on how to configure the arrays, so any pointers to *that* would also
be useful.

Also, I presume that I can strip two of the machines to fill up
the remaining machine with RAM and CPUs;  the HWDB seems to suggest
that multiple processors will work OK under recent kernels.  Right?

Thanks,
Andrew

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
