From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Generic IRQ support
Date: Fri, 10 Dec 2004 13:10:28 +0000
Message-ID: <20041210131028.GA11305@parcelfarce.linux.theplanet.co.uk>
References: <20041209152944.GP10881@parcelfarce.linux.theplanet.co.uk>
	<20041210055140.GC26739@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041210055140.GC26739@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 09, 2004 at 10:51:40PM -0700, Grant Grundler wrote:
> Yes - it's certainly feasible.
> I've proposed something similar several years ago:
>     http://lists.parisc-linux.org/pipermail/parisc-linux/2000-October/009640.html
> 
> Last year Thibaut Varene and I even took a run at it.
> Our goal was to pickup/add generic support for IRQ affinity.
> We got ~60% done after a few monthes but ran out of time.

I found
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-August/024593.html
but I couldn't find the patch that was referenced there.

> > Machines with iosapic have one CPU interrupt per iosapic interrupt,
> > so we can get rid of the hierarchy.  The iosapic still needs to be told
> > that we've finished processing the interrupt, but that can be done by
> > the ->end method.
> 
> We can't entirely get rid of the hierarchy.
> There are configurations where we might have to share a CPU EIR.
> Since N-class is working now, I'm mostly concerned about it on that
> class of platform. Especially if we want to support MSI or MSI-X.

Once we start to hit problems like this (more than 64 interrupts per CPU),
we can write some code to reintroduce a hierarchy, I guess.

> You probably want to look at the source tree from Thibaut since
> that's basically the same approach we took then...most of the
> changes should still apply.
> Please poke (gently) if I can help.

If you could find that work ...

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
