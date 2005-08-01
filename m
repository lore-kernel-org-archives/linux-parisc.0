From: Richard Hirst <rhirst@levanta.com>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Mon, 1 Aug 2005 14:48:44 +0100
Message-ID: <20050801134844.GI5500@levanta.com>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
	<20050731090005.GD5500@levanta.com>
	<20050731193229.GE5500@levanta.com>
	<20050731193821.GI21753@roadwarrior.mcmartin.ca>
	<20050731200144.GF5500@levanta.com>
	<20050731202338.GK21753@roadwarrior.mcmartin.ca>
	<20050731202709.GL21753@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050731202709.GL21753@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 31, 2005 at 04:27:09PM -0400, Kyle McMartin wrote:
> On Sun, Jul 31, 2005 at 04:23:38PM -0400, Kyle McMartin wrote:
> > static struct parisc_device *
> > next_device(struct parisc_device *padev) {
> 
> ...
> 
> > 	dev = next_device(&i);
> 
> Err, oops. The function should be next_dev, and next_device should be
> a la the one in sba_iommu.c and gsc.c.

Not tried this yet, but I'm unclear as to which problem you are
trying to fix...

a) "Found devices" display order

b) an alternative to my match_by_id() change that removed a check_dev() call

c) a fix to gscps2.c hanging my C360 (unlikely, I guess)

d) multiple of the above :-)


The old version of drivers.c had a for_each_padev() that did a depth
first walk of the tree reporting parents before children.  The new
code is reporting children before parents which is what causes (a)
above, I think.

check_dev() is used in several places now, all of which just check
for null/non-null return, so I'm not convinced that making it walk
the tree via next_dev() is right; take this for example:

static int print_one_device(struct device * dev, void * data)
{
        struct parisc_device * pdev = to_parisc_device(dev);

        if (check_dev(pdev))
                print_parisc_device(pdev);
        return 0;
}

if check_dev(pdev) might call next_dev() and return some other
pdev, does it make sense to be calling print_parisc_device() on the
original pdev?

I'm happy to poke at this some more anyway,

Richard

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
