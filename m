From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Mon, 27 Dec 2004 09:08:13 -0600
Message-ID: <1104160093.5295.8.camel@mulgrave>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<20041227073654.GI29492@colo.lackof.org> <41CFE6B1.6010707@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41CFE6B1.6010707@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2004-12-27 at 10:40 +0000, Joel Soete wrote:
> Should be why it was removed but as far as I didn't find any explanation (that's obvious: that's nearly impossible to explain all 
> details of implementation ;-)

I haven't time to look through the patch, but I can explain what the
pdtlb's are about in pacache.S.

Both copy_user_page_asm and __clear_user_page_asm use something called
the tmpalias mapping.  This is a 8MB reserved area that's used to prime
the user space cache.  What you do is to set up a temporary mapping for
the target of the copy which is congruent to the user space address
somewhere in the tmpalias region.  Then when you do the copy, the user
alias is automatically up to date as well (because the cache sees the
collision by virtue of its congruence properties).

It's a nice idea, but we've never been able to make it work in practise,
because the user page we're copying can be an executable page, and this
scheme only makes the d-cache correct.  If we had a way of telling
whether it's a data page or and instruction page, we could make it work.
That's why the mechanism is #if 0'd out.

On the other hand, we can use it for clear_user_page, because no-one
ever wants to clear an executable page before returning it to the user.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
