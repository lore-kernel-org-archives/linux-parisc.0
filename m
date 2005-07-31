From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Sun, 31 Jul 2005 16:23:38 -0400
Message-ID: <20050731202338.GK21753@roadwarrior.mcmartin.ca>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
	<20050731090005.GD5500@levanta.com>
	<20050731193229.GE5500@levanta.com>
	<20050731193821.GI21753@roadwarrior.mcmartin.ca>
	<20050731200144.GF5500@levanta.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Richard Hirst <rhirst@levanta.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050731200144.GF5500@levanta.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 31, 2005 at 09:01:44PM +0100, Richard Hirst wrote:
> OK; booted 2.6.12-pa2 and and got the same allocations, with ps/2
> on irq 20.
> 

Can you try something like this?

#define check_dev(padev) (padev->id.hw_type != HPHW_FAULTY) \
				? padev : next_device(padev)


static struct parisc_device *
next_device(struct parisc_device *padev) {
	struct device *dev;
	struct klist_iter i;
	struct parisc_device *next = NULL;

	if (!padev)
		return NULL;

	klist_iter_init(&padev->dev.klist_children, &i);
	
	dev = next_device(&i);
	if (dev)
		next = to_parisc_device(dev);
	klist_iter_exit(&i);

	return next;
}

-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
