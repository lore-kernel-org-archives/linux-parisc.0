From: dann frazier <dannf@dannf.org>
Subject: Re: [parisc-linux] Re: 2.6.14 has been released, please all checks
	build and configs, we upload today :)
Date: Fri, 28 Oct 2005 09:11:06 -0600
Message-ID: <1130512266.26310.18.camel__24949.6936020025$1416623934$gmane$org@localhost>
References: <20051028052909.GA24788@localhost.localdomain>
	<20051028053740.GB24788@localhost.localdomain>
	<20051028080239.GE24155@mail.lowpingbastards.de>
	<20051028083312.GD11045@debian.org>
	<20051028132020.GC1612@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Sven Luther <sven.luther@wanadoo.fr>,
 parisc-linux@lists.parisc-linux.org,
 debian-kernel@lists.debian.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051028132020.GC1612@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-10-28 at 07:20 -0600, Matthew Wilcox wrote:
> On Fri, Oct 28, 2005 at 05:34:06PM +0900, Horms wrote:
> > Also, can someone look into HPPA, or point me at which patch to use?
> > http://packages.vergenet.net/testing/linux-2.6-2.6.14/linux-2.6_2.6.14-1-hppa.log.gz
> 
> I know I *said* not to use the -pa0 kernel, but it's booted fine for me
> on a K460 and an N4000.   Any other reports?
> 
> http://cvs.parisc-linux.org/download/linux-2.6/patch-2.6.14-pa0.gz

Thanks - I've committed this patch for now.
-- 
dann frazier <dannf@dannf.org>

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
