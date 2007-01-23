From: "James K. Love" <jlove@scires.com>
Subject: [parisc-linux] Floppy disk support for 9000 series (715, 755,
	etc.) workstations.
Date: Tue, 23 Jan 2007 15:51:32 -0500
Message-ID: <45B67554.6010208__49578.8838169121$1416624267$gmane$org@scires.com>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
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

All:

I posted this to debian-hppa, but I thought I'd pass this along to
parisc-linux in case anyone isn't a member of both lists. If you are,
I apologize in advance for cluttering you inbox...

Could someone provide some details about why the TEAC floppy disk drives
(scsi) in the 9000 series workstations are not supported in the parisc
port?  Is it due to a lack of documentation, missing sd/53c700 support for
floppy drives, or lack of interest in floppy devices in general (or some
combination of the three)?  I realize floppy drives are antiquated and
scsi floppy drives are an enigma, but the application I'd like to run on
these machines requires floppy support, which worked fine under HP-UX. 
In an attempt investigate further, I installed MKLinux on a 715, and the
scsi floppy drive was supported through some combination of the MACH
kernel and it's hosted Linux kernel.  I've looked through the MKLinux
source code, and it appears that the MACH scsi driver had some support
for flexible disk drives (which I assume is the floppy drive), but I'm
uncertain if this is the only missing piece to the puzzle.  If anyone
has any additional info/insight, I'd really appreciated it.

Thanks,
James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
