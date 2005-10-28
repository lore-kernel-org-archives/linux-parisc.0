From: Horms <horms@debian.org>
Subject: [parisc-linux] Re: 2.6.14 has been released,
	please all checks build and configs, we upload today :)
Date: Fri, 28 Oct 2005 17:34:06 +0900
Message-ID: <20051028083312.GD11045__39367.2219165184$1416623933$gmane$org@debian.org>
References: <20051028052909.GA24788@localhost.localdomain>
	<20051028053740.GB24788@localhost.localdomain>
	<20051028080239.GE24155@mail.lowpingbastards.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Sven Luther <sven.luther@wanadoo.fr>,
 debian-kernel@lists.debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051028080239.GE24155@mail.lowpingbastards.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 28, 2005 at 10:02:39AM +0200, Frederik Schueler wrote:
> Hello,
> 
> On Fri, Oct 28, 2005 at 07:37:40AM +0200, Sven Luther wrote:
> >  CONFIG_SCSI_SATA_INTEL_COMBINED=y has been added.
> >  Do you want to make this change [G]lobal, per-[A]rch, or per-[F]lavour? [GAF]
> 
> we could make this global, as other sata stuff is global too.
> 
> >  CONFIG_SCSI_QLA2XXX has been changed from 'n' to 'm'.
> >  Do you want to make this change [G]lobal, per-[A]rch, or per-[F]lavour? [GAF]
> 
> this should be made global, or the
> remove-references-to-removed-drivers.patch should be fixed to remove
> this (in the debian kernel useless) Kconfig option.

I think Svenl was playing with an unpatched tree, and these problems
went away. Well I'm certain that the second one did.

He and I tagged 2.6.14-1 and are planning to upload to unstable
powerpc and i386 rsn. I guess there will be a second upload
in the not to distant future, as some FTBFS bugs are solved.

For now souces are in
http://packages.vergenet.net/testing/linux-2.6-2.6.14/
These may change if the i386 build fails, though that
seems unlikely at this point.

Also, can someone look into HPPA, or point me at which patch to use?
http://packages.vergenet.net/testing/linux-2.6-2.6.14/linux-2.6_2.6.14-1-hppa.log.gz

-- 
Horms
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
