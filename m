From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Fri, 31 Dec 2004 13:56:22 -0700
Message-ID: <20041231205622.GA24116@colo.lackof.org>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<41CFE6B1.6010707@tiscali.be> <1104160093.5295.8.camel@mulgrave>
	<200412311426.13425.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412311426.13425.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 31, 2004 at 02:26:13PM -0600, Michael S. Zick wrote:
>     This path should not be within the set of user observable execution times.
...
> NOTE: Zeroing a page on return to (any) free pool is not 'user observable' only
> the 'add to free pool incoming queue' is in the 'user observable' code path.
> 
> NOTE: Pages handled by this daemon may have both d-cache and i-cache
> representations.  But the code which deals with this situation is not 'user 
> observable' because the entire 'return to free pool' operation is not 'user
> observable'.
...
> Q.E.D: Zeroing a page with the destination of user space assignment need not
> be a 'user observable' execution time.

Mike,
The copy_user_page and zero_page functions *are* observable since they
affect metrics reported by "time" and readprofile. I don't care if they
are in invoked in the application context or some other context.

Certainly, it would reduce startup latency to pre-zero the pages in
the kernel (daemon) and have them ready when apps want them.
But on a loaded system, I expect this will be slightly less efficient
and more complex since one doesn't know how many need to be pre-zero'd
or when to steal pre-zero'd pages for other uses (e.g. load in an
executable).

> There should be additional gains made in 'copy-[to|from]-user' when these four
> conditions are enforced.

I read the conditions and thought "neat".
I don't pretend to understand all of them or what they mean.
But instead of trying to explain them, could you send me a patch that works?
Maybe something that has a chance of going back upstream to linus?

thanks,
grant

> 
> Mike
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
