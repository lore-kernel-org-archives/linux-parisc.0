From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: How to determine whether a device is PCI or not
Date: Sat, 30 Oct 2004 16:40:07 +0100
Message-ID: <20041030154007.GI8958@parcelfarce.linux.theplanet.co.uk>
References: <20041027121955.GH3450@parcelfarce.linux.theplanet.co.uk>
	<416174800000772D@mail-4-bnl.tiscali.it>
	<20041027141522.GK3450@parcelfarce.linux.theplanet.co.uk>
	<20041030023718.GA1099@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-pci@atrey.karlin.mff.cuni.cz,
 parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Greg KH <greg@kroah.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041030023718.GA1099@kroah.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 29, 2004 at 07:37:18PM -0700, Greg KH wrote:
> Ick, no.  Devices do not "show" their type, you have to explicitly know
> what type they are in order to use them.
> 
> Why are you wanting to know this?  What are you trying to do with a
> generic struct device * where you don't know exactly what type it is?

In order to communicate with PA-RISC firmware, you have to know the path
to a device.  It's typically represented as something like [10/8/4/5/0].
This device can be PCI, GSC or EISA.  There's some moderately arcane
rules for turning a device into a path that you really don't care about,
but we need the devfn for PCI devices and the hw_path for GSC devices.

So what we want to do is, given a struct device, determine its path;
and given a path, turn it into a struct device.  The device model lets
us do this quite nicely -- much better than having duplicated routines
for starting with a pci_dev or a parisc_device.

If you prefer to keep this out of linux/pci.h, that's fine, we can keep
it private to arch/parisc.  I thought this might be something other
architectures might want to use (maybe for openfirmware?)

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
