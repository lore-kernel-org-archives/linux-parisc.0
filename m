From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Measuring kernel compile times on smp system.
Date: Fri, 28 Oct 2005 10:08:19 +0800
Message-ID: <43618813.9060804@tausq.org>
References: <1130389617.31977.16.camel@localhost.localdomain>
	<20051027201333.GA3107@netfall.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Andrew Sharp <andy@netfall.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051027201333.GA3107@netfall.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> To really understand these numbers, you need three things: the amount
> of memory on the system, the L2 (and L3?) cache sizes,

http://en.wikipedia.org/wiki/PA-RISC

"An interesting aspect of the PA-RISC line is that most of its
generations have no Level 2 cache. Instead large Level 1 caches are
used, formerly as separate chips connected by a bus, now integrated
on-chip. Only the PA-7100LC and PA-7300LC had L2 caches."

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
