From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: 05 Sep 2004 10:36:43 -0400
Message-ID: <1094395005.1690.1.camel@mulgrave>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2004-09-05 at 02:27, John David Anglin wrote:
> > I think the best implementation is probably
> > 
> > barrier();
> > a = __ldcw_align(x);
> 
> I don't understand why you put the barrier before the __ldcw_align
> operation.  The alignment operation is non-critical and could be done
> much earlier if that's desireable from a scheduling standpoint.

Actually, you're right.  I think all we need is the mb() after the
spin_lock code and another mb before the spin_unlock code.  How the
taking or releasing of the lock is optimised by gcc should be irrelevant
as long as it's locked when we cross the barrier.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
