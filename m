From: Valerie Henson <val_henson@linux.intel.com>
Subject: Re: [parisc-linux] [git patches] tulip fixes from parisc-linux
Date: Mon, 31 Jul 2006 20:10:25 -0700
Message-ID: <20060801031024.GF11415__4312.79285480759$1416624152$gmane$org@goober>
References: <20060729225459.GA4835@athena.road.mcmartin.ca>
	<20060730004339.GC11975@colo.lackof.org>
	<20060730165607.GB4835@athena.road.mcmartin.ca>
	<20060730113532.4db2fcb5.akpm@osdl.org>
	<20060730185456.GA17066@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 netdev@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060730185456.GA17066@tachyon.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 30, 2006 at 02:54:56PM -0400, Kyle McMartin wrote:
> On Sun, Jul 30, 2006 at 11:35:32AM -0700, Andrew Morton wrote:
> > hm.  A couple of those patches have been futzing around in -mm for over a
> > year and have been nacked by Jeff and are a regular source of grumpygrams. 
> > I've been sitting on them in the pathetic hope that someone will one day
> > get down and address the bugs which they fix in an acceptable fashion,
> > whatever that is.
> > 
> 
> Jeff/Val seemed willing to merge the fixes as they stood. parisc-linux
> merged Francois' tulip workqueue patch some time ago, and have been
> running with it since without issue. This defers the tulip_select_media
> work to process context, and so should be less of an issue.

Hey Kyle,

Thanks for splitting these out.  Could you do us a favor and post the
patches themselves?  I'm not the only one who doesn't use git, and it
will be a lot less confusing if we can directly ack the patches in
email instead of referring to them third-hand.  Thanks,

-VAL
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
