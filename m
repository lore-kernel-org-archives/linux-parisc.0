From: "James K. Love" <jlove@scires.com>
Subject: Re: [parisc-linux] Floppy disk support for 9000 series (715, 755,
	etc.) workstations.
Date: Thu, 08 Feb 2007 15:08:55 -0500
Message-ID: <45CB8357.2050703__29868.5974245474$1416624274$gmane$org@scires.com>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------010700030702010309060200"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070208173808.GL13101@parisc-linux.org>
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
--------------010700030702010309060200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/8/2007 12:38 PM, Matthew Wilcox wrote:
> Could you post the patch to sd.c here?  I, and others, can look it over,
> critique it, and help polish it before you submit it to the linux-scsi
> list.  Or if you're brave, you could send it straight to linux-scsi
> (there's about 3 of us who're on both lists, so you may well see feedback
> from a familiar name anyway).

Sure.  I'm working on this for a project that is running Sarge with the 2.6.8
kernel, so I'll need to migrate the changes over to the latest sd.c from the
parisc-2.6 tree, then clean it up a bit.  I'll post a patch as soon as its ready
for general consumption.

> Without looking at the source code to check, I suspect the fdformat code
> is trying ioctls that are implemented in floppy.c and we might want to
> emulate them in sd.c if the device is a floppy.

I haven't looked at the fdformat code either, but it aborts early due to the
scsi floppy device having the wrong major number.  I don't think it even gets to
any ioctls.  BTW, the mtools functions all appear to work.





















--------------010700030702010309060200
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


--------------010700030702010309060200
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------010700030702010309060200--
