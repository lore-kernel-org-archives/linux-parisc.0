From: Matt Domsch <Matt_Domsch@dell.com>
Subject: [parisc-linux] Re: How to determine whether a device is PCI or not
Date: Sat, 30 Oct 2004 11:46:30 -0500
Message-ID: <20041030164630.GA6434@lists.us.dell.com>
References: <20041027121955.GH3450@parcelfarce.linux.theplanet.co.uk>
	<416174800000772D@mail-4-bnl.tiscali.it>
	<20041027141522.GK3450@parcelfarce.linux.theplanet.co.uk>
	<20041030023718.GA1099@kroah.com>
	<20041030154007.GI8958@parcelfarce.linux.theplanet.co.uk>
	<20041030154822.GA9036@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-pci@atrey.karlin.mff.cuni.cz,
 parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Greg KH <greg@kroah.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041030154822.GA9036@kroah.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 30, 2004 at 08:48:22AM -0700, Greg KH wrote:
> On Sat, Oct 30, 2004 at 04:40:07PM +0100, Matthew Wilcox wrote:
> > 
> > If you prefer to keep this out of linux/pci.h, that's fine, we can keep
> > it private to arch/parisc.  I thought this might be something other
> > architectures might want to use (maybe for openfirmware?)
> 
> Let's keep it private for now.  If openfirmware ever moves to the device
> tree properly, we can deal with it then :)

The EDD sysfs symlinks would like something like this, not only for
PCI (it does this today by calling pci_find_slot() with the values
BIOS tells it), but doesn't have the infrastructure for making
symlinks to the underlying ATA, SCSI, SAS (coming), ... devices.  I
removed the horrible hacks I put in to try to guess what a device is,
and don't create the symlink from the EDD device to the actual disk
device.  But it would be nice to have a generic method to do it so I
can add that back in.

Thanks,
Matt

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
