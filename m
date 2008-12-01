From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] 2.6.28-rc6 update parisc MAINTAINERS
Date: Mon, 1 Dec 2008 00:21:35 -0700
Message-ID: <20081201072134.GE17583@colo.lackof.org>
References: <200811202258.56561.deller@gmx.de> <200811211516.50750.deller@gmx.de> <20081121111705.dc03a465.akpm@linux-foundation.org> <49272F66.1010702@gmx.de> <20081121142013.f8d59b3f.akpm@linux-foundation.org> <20081122055301.GA12724@colo.lackof.org> <20081122122208.GE5707@parisc-linux.org> <20081122180152.GC2690@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	kyle@hera.kernel.org, randolph@tausq.org, stable@kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081122180152.GC2690@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Nov 22, 2008 at 11:01:52AM -0700, Grant Grundler wrote:
> On Sat, Nov 22, 2008 at 05:22:09AM -0700, Matthew Wilcox wrote:
> > On Fri, Nov 21, 2008 at 10:53:01PM -0700, Grant Grundler wrote:
> > > And Helge has been great about fixing stuff - much better than the three
> > > listed maintainers lately.
> > > Kyle, willy, any objection to adding Helge to the MAINTAINERS list
> > > for PARISC port?
> > > I'd rather allow Helge to make a few small mistakes occasionally rather
> > > than watch his parisc specific patches fall on the floor.
> > 
> > No objection from me.  I think it's time to remove me from MAINTAINERS
> > as it's probably been six months since I last turned on any of my parisc
> > machines.
> 
> Thanks!  We have quorum.
> Andrew can you please apply this and send to linus?
> Or should I start acting like a maintainer and send it myself? :)
> 
> Willy, I'm not removing you from Cupertino test ring LDAP or any other
> privileges unless you ask me to. Just note I appreciate all of your past
> (and future) help with the port and you are always welcome in Mountain View.

Andrew,

Updated version of this patch: I'm removing my own name as well for some of
the same reasons as willy. I'll continue to review patches for linux-parisc,
maintaining parisc/ia64 systems for gcc/kernel developer access, and testing
kernels on parisc occasionally (working on autotest.kernel.org to get
that more consistent and easier.)

thanks,
grant

Signed-off-By: Grant Grundler <grundler@parisc-linux.org>
Reviewed-by: Matthew Wilcox <matthew@wil.cx>
Acked-by: Helge Deller <deller@gmx.de>


diff --git a/MAINTAINERS b/MAINTAINERS
index 618c1ef..56e519a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3294,10 +3294,8 @@ S:	Maintained
 PARISC ARCHITECTURE
 P:	Kyle McMartin
 M:	kyle@mcmartin.ca
-P:	Matthew Wilcox
-M:	matthew@wil.cx
-P:	Grant Grundler
-M:	grundler@parisc-linux.org
+P:	Helge Deller
+M:	deller@gmx.de
 L:	linux-parisc@vger.kernel.org
 W:	http://www.parisc-linux.org/
 T:	git kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git
