From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: 08 Sep 2004 13:11:12 -0400
Message-ID: <1094663473.7149.136.camel@mulgrave>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
	<1094395005.1690.1.camel@mulgrave>
	<20040906041952.GA17107@colo.lackof.org>
	<1094480131.2037.6.camel@mulgrave>
	<20040907151722.GC18849@colo.lackof.org>
	<1094571019.2068.101.camel@mulgrave>
	<20040908165210.GA10316@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040908165210.GA10316@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2004-09-08 at 12:52, Grant Grundler wrote:
> Yeah - there is a tradeoff between optimizing the pipeline between
> cases where the lock is contended and where it is not. The compiler
> does not have that info unless it could consume Profile info.
> (ie "Profile Based Optimization").
> I was thinking we should favor the contended case to make it
> less painful. I've changed my mind and will not push this patch.

Erm, no, optimisation of the pipeline is something different again.  If
we want to hint to the compiler that the lock will be uncontended, then
our code should read:

        while (unlikely(__ldcw(a) == 0))
                while (likely(*a == 0));


> But the _ldcw() is part of a tight "while" loop.
> What's the penalty for "crossing" the barrier?
> I don't see one.

In this case, probably not much ... it would forbid clever optimisations
of the while loops, but I'm sure the compiler isn't actually optimising
them very much.  However, the *principle* is that you want your barriers
where they're effective but do the least damage to the compiler's
ability to optimise.

> BTW, do you think we should use coherent loads/stores for locks?
> That's the other aspect of the patch that I think jda would like
> to see incorporated.

I'm not really sure what the coherent hint actually does.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
