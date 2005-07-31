From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Sun, 31 Jul 2005 15:38:21 -0400
Message-ID: <20050731193821.GI21753@roadwarrior.mcmartin.ca>
References: <20050730231056.GC5500@levanta.com>
	<20050731061254.GG21753@roadwarrior.mcmartin.ca>
	<20050731090005.GD5500@levanta.com>
	<20050731193229.GE5500@levanta.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Richard Hirst <rhirst@levanta.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050731193229.GE5500@levanta.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 31, 2005 at 08:32:29PM +0100, Richard Hirst wrote:
> I noticed the 2.6.13 kernel is using completely different IRQ allocations
> from 2.6.8 (cat /proc/interrupts); is this expected?
> 

Yeah, willy rewrote our interrupt support sometime around 2.6.10.

-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
