From: "James K. Love" <jlove@scires.com>
Subject: Re: [parisc-linux] Floppy disk support for 9000 series (715, 755,
	etc.) workstations.
Date: Thu, 08 Feb 2007 12:23:41 -0500
Message-ID: <45CB5C9D.1070601__2433.89864122054$1416624278$gmane$org@scires.com>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------030801000502080206080706"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070124162810.GA31075@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------030801000502080206080706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/17/2007 2:16 PM, Matt Taggart wrote:
> "James Love" writes...
>> They use a HP-proprietary TEAC SCSI floppy disk, which appears to be an
>> IDE drive with a SCSI-IO/FDC board piggy-backed on it. Any idea whether
>> the TEAC drive is the one that HP won't provide the documents for?
>
> I hope you are able to make progress on a driver, that would be cool. But I
> don't think anyone from HP is going to be able to help. :(
>
>> Regardless, the drive works in MKLinux, so hopefully someone knows
>> something about how it works...
>
> Yeah it sounds like there is hope of getting it working then.
>

On 1/24/2007 11:28 AM, Grant Grundler wrote:
> On Tue, Jan 23, 2007 at 03:51:32PM -0500, James K. Love wrote:
>> In an attempt investigate further, I installed MKLinux on a 715, and the
>> scsi floppy drive was supported through some combination of the MACH
>> kernel and it's hosted Linux kernel.  I've looked through the MKLinux
>> source code, and it appears that the MACH scsi driver had some support
>> for flexible disk drives (which I assume is the floppy drive), but I'm
>> uncertain if this is the only missing piece to the puzzle.  If anyone
>> has any additional info/insight, I'd really appreciated it.
> 
> If you can figure out what's missing between linux and MKlinux there
> is a good change it could get added. The closer you get to providing
> a patch, the more likely it will get included.
> 

I finally figured some of this out.  I ported the MACH flexible scsi disk
code over to the 2.6 kernel, and I can now mount/read/write with my HP TEAC FC-1
drive.  The modifications I made were inside the scsi device (sd) driver, which
is similar to where they were inside the MACH kernel.  This is obviously not
ideal, since the device major is for a scsi disk, but the drive is really a
floppy.  This breaks some user-space floppy apps like fdformat.  There really
should be a new floppy driver similar to the cdrom driver, but these changes may
not work with any other scsi floppy drive (are there any others?).  I only have
a few HP OEM TEAC revs to test with here.

Bottom line... The scsi disk driver could be patched, but it may only provide
partial/experimental support for this drive without extensive changes.  I'm
traditionally a user-space developer, so I'd appreciate any advice/thoughts
before I get knee deep.  Also, if someone could pass along a few links to some
procedural docs about properly submitting kernel code/patches, I'd really
appreciate it.

Thanks,
James L.






















--------------030801000502080206080706
Content-Type: text/x-vcard; charset=utf-8;
 name="jlove.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="jlove.vcf"

begin:vcard
fn:James K. Love
n:Love;James K.
org:SPAWAR Systems Center Charleston, Code 523;Scientific Research Corporation, ISS Division
adr:Building 3452, WS-20;;One Innovation Drive;Hanahan;SC;29406;USA
email;internet:jlove@scires.com
title:Software Engineer
tel;work:843.218.6532
x-mozilla-html:FALSE
url:http://www.scires.com
version:2.1
end:vcard


--------------030801000502080206080706
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------030801000502080206080706--
