From: Richard Hirst <rhirst@levanta.com>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Mon, 1 Aug 2005 21:02:56 +0100
Message-ID: <20050801200256.GM5500@levanta.com>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
	<20050731090005.GD5500@levanta.com>
	<20050731184722.GH21753@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050731184722.GH21753@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 31, 2005 at 02:47:22PM -0400, Kyle McMartin wrote:
> On Sun, Jul 31, 2005 at 10:00:05AM +0100, Richard Hirst wrote:
> > Then it hangs.  TOC shows it is in _spin_lock_irqsave() with a return
> > address in gscps2_interrupt().
> > 
> 
> Are you compiling with SMP? I seem to recall some spinlock reorganization
> patches may have gone in that we have not yet merged...

Just for the mail list archive... turning off SMP makes this problem
go away.

Richard

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
