From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Floppy disk support for 9000 series (715, 755,
	etc.) workstations.
Date: Thu, 8 Feb 2007 10:38:08 -0700
Message-ID: <20070208173808.GL13101__35519.0112641596$1416624278$gmane$org@parisc-linux.org>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "James K. Love" <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45CB5C9D.1070601@scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Feb 08, 2007 at 12:23:41PM -0500, James K. Love wrote:
> I finally figured some of this out.  I ported the MACH flexible scsi disk
> code over to the 2.6 kernel, and I can now mount/read/write with my HP TEAC 
> FC-1
> drive.  The modifications I made were inside the scsi device (sd) driver, 
> which
> is similar to where they were inside the MACH kernel.  This is obviously not
> ideal, since the device major is for a scsi disk, but the drive is really a
> floppy.  This breaks some user-space floppy apps like fdformat.  There 
> really
> should be a new floppy driver similar to the cdrom driver, but these 
> changes may
> not work with any other scsi floppy drive (are there any others?).  I only 
> have
> a few HP OEM TEAC revs to test with here.
> 
> Bottom line... The scsi disk driver could be patched, but it may only 
> provide
> partial/experimental support for this drive without extensive changes.  I'm
> traditionally a user-space developer, so I'd appreciate any advice/thoughts
> before I get knee deep.  Also, if someone could pass along a few links to 
> some
> procedural docs about properly submitting kernel code/patches, I'd really
> appreciate it.

That's good work!

Could you post the patch to sd.c here?  I, and others, can look it over,
critique it, and help polish it before you submit it to the linux-scsi
list.  Or if you're brave, you could send it straight to linux-scsi
(there's about 3 of us who're on both lists, so you may well see feedback
>from a familiar name anyway).

Without looking at the source code to check, I suspect the fdformat code
is trying ioctls that are implemented in floppy.c and we might want to
emulate them in sd.c if the device is a floppy.

We certainly could do a sf.c that's similar in spirit to sr, sd, st, etc.
That might be the right approach, or it might be best to extend sd.
The SCSI-2 spec says that floppy drives are Direct Access Devices (which
sd normally drives).  But then, if we want to make it appear to Linux as
if it's a floppy drive, sf.c would be the right way to go.  If we want
to support machines with both a scsi floppy and a regular floppy at the
same time (and such machines can certainly be constructed; eg a C3000
with a SuperIO floppy and a scsi floppy, or a 725 with a Lasi floppy and
a scsi floppy), then I think we have to use the 'sd' approach to avoid
the drivers fighting over the major number.  A disadvantage to that is
the lack of different device nodes for different sector sizes ... otoh,
some may see that as an advantage ;-)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
