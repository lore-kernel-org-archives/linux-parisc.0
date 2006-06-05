From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Mon, 05 Jun 2006 12:40:45 -0500
Message-ID: <1149529245.3489.34.camel@mulgrave.il.steeleye.com>
References: <200606051649.k55Gnqtf004110@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606051649.k55Gnqtf004110@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2006-06-05 at 12:49 -0400, John David Anglin wrote:
> It's crossed my mind that locking could break if there is a memory
> aliasing issue,

This should never happen, since all our mmap areas are allocated on the
congruence boundary.  DaveM recently pointed out that mremap can violate
the congruence rules on sparc.  This could theoretically also happen on
pa, but only if you're enlarging below, which is an unusual case.

I did catch a few congruence errors when I redid the cache flushing via
tmpalias space, but it all looked to be due to kernel processes which
don't allocate correctly anyway ... and would never take user locks.
But I should probably get back and try to identify all the processes
with this problem.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
