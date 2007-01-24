From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Floppy disk support for 9000 series (715, 755,
	etc.) workstations.
Date: Wed, 24 Jan 2007 09:28:10 -0700
Message-ID: <20070124162810.GA31075__41211.9019580588$1416624268$gmane$org@colo.lackof.org>
References: <45B67554.6010208@scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "James K. Love" <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45B67554.6010208@scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 23, 2007 at 03:51:32PM -0500, James K. Love wrote:
> All:
> 
> I posted this to debian-hppa, but I thought I'd pass this along to
> parisc-linux in case anyone isn't a member of both lists. If you are,
> I apologize in advance for cluttering you inbox...
> 
> Could someone provide some details about why the TEAC floppy disk drives
> (scsi) in the 9000 series workstations are not supported in the parisc
> port?

At one point I thought they did work.

>   Is it due to a lack of documentation, missing sd/53c700 support for
> floppy drives, or lack of interest in floppy devices in general (or some
> combination of the three)?

THere is clearly a lack of interest in the non-scsi floppy.
I've handed out some SCSI floppy drives in the past.

>   I realize floppy drives are antiquated and
> scsi floppy drives are an enigma, but the application I'd like to run on
> these machines requires floppy support, which worked fine under HP-UX. 
> In an attempt investigate further, I installed MKLinux on a 715, and the
> scsi floppy drive was supported through some combination of the MACH
> kernel and it's hosted Linux kernel.  I've looked through the MKLinux
> source code, and it appears that the MACH scsi driver had some support
> for flexible disk drives (which I assume is the floppy drive), but I'm
> uncertain if this is the only missing piece to the puzzle.  If anyone
> has any additional info/insight, I'd really appreciated it.

If you can figure out what's missing between linux and MKlinux there
is a good change it could get added. The closer you get to providing
a patch, the more likely it will get included.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
