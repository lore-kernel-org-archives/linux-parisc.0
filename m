From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Sun, 2 Jan 2005 00:58:32 +0000
Message-ID: <20050102005832.GI18080@parcelfarce.linux.theplanet.co.uk>
References: <200412260504.40205.vapier@gentoo.org>
	<20041229034331.GS11543@parcelfarce.linux.theplanet.co.uk>
	<200412291419.36568.vapier@gentoo.org>
	<200501011839.13090.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501011839.13090.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jan 01, 2005 at 06:39:13PM -0500, Mike Frysinger wrote:
> On Wednesday 29 December 2004 02:19 pm, Mike Frysinger wrote:
> > system booted nicely :)
> 
> fyi, i have two of these drives ... the other i use in an alpha of mine ...
> 
> on the alpha, 2.6.10 mainline just hangs at boot during SCSI negotiation ... i 
> ripped out the hunks that apply to the files in drivers/scsi/sym53c8xx_2/ 
> from patch-2.6.10-pa2 and applied it to 2.6.10 mainline and the resulting 
> kernel booted nicely ... again, the system fell back to async transfer mode, 
> but that's better than nothing at all

I build i386 and ia64 kernels from the parisc CVS tree ... alpha should
work as well in the pa tree as it does in mainline.  If something
*doesn't* work, let me know.

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
