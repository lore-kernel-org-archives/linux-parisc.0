From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Fri, 19 Aug 2005 11:46:55 -0600
Message-ID: <20050819174655.GA6376__41568.3607374833$1416623909$gmane$org@colo.lackof.org>
References: <20050817101017.008D03658E8@mail.esiee.fr>
	<Pine.HPX.4.33n.0508171249360.19860-200000@studcom.urz.uni-halle.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: kyle@parisc-linux.org,
 alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Clemens Ladisch <clemens@ladisch.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.HPX.4.33n.0508171249360.19860-200000@studcom.urz.uni-halle.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 18, 2005 at 05:35:20PM +0200, Clemens Ladisch wrote:
...
> > reading the patch through webmail doesn't help a lot getting a grasp
> > of its whole but i wonder if we could still find some debugging
> > purposes for these values. Remember this driver is work in progress ;)
> 
> Those fields just aren't used anymore; anything interesting is in the
> chip's registers.

Clemens,
You don't want to be reading chip registers all the time.
It's *very* expensive. Cache any values that don't change
in a local struct if they get referenced regularly.

You might find the mmio_test results interesting.
It would be great if you could add one or two audio devices
to mmio_test program here:
	svn co http://svn.gnumonks.org/trunk/mmio_test/

Please send a patch to Harald Welte <laforge@gnumonks.org>.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
