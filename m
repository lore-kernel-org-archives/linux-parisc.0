From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: Sun, 5 Sep 2004 22:19:52 -0600
Message-ID: <20040906041952.GA17107@colo.lackof.org>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
	<1094395005.1690.1.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1094395005.1690.1.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 05, 2004 at 10:36:43AM -0400, James Bottomley wrote:
> On Sun, 2004-09-05 at 02:27, John David Anglin wrote:
> Actually, you're right.  I think all we need is the mb() after the
> spin_lock code and another mb before the spin_unlock code.  How the
> taking or releasing of the lock is optimised by gcc should be irrelevant
> as long as it's locked when we cross the barrier.

Actaully, I don't think it's irrelevant.  If a lock is contended for,
re-ordering by gcc could excerbate the problem by adding additional
instructions (good for the instruction pipeline) to the "critical
section" (the period we actually hold the lock).

I know, lock contention is bad and it should never happen.
Reality is some workload will contend for a lock. I want to
have some confidence gcc is not making it any worse.
This is why I'm asking about use of "memory" in the actual
asm instruction that either acquire or release the lock
instead of using mb().

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
