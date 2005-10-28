From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Measuring kernel compile times on smp system.
Date: Thu, 27 Oct 2005 21:19:10 -0600
Message-ID: <20051028031910.GB1612@parisc-linux.org>
References: <1130389617.31977.16.camel@localhost.localdomain>
	<20051027201333.GA3107@netfall.com> <43618813.9060804@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43618813.9060804@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 28, 2005 at 10:08:19AM +0800, Randolph Chung wrote:
> > To really understand these numbers, you need three things: the amount
> > of memory on the system, the L2 (and L3?) cache sizes,
> 
> http://en.wikipedia.org/wiki/PA-RISC
> 
> "An interesting aspect of the PA-RISC line is that most of its
> generations have no Level 2 cache. Instead large Level 1 caches are
> used, formerly as separate chips connected by a bus, now integrated
> on-chip. Only the PA-7100LC and PA-7300LC had L2 caches."

Technically, PA-8800 and 8900 have an L2 cache.  However, it's completely
transparent to software.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
