From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Fri, 31 Dec 2004 15:21:50 -0600
Message-ID: <1104528110.5247.20.camel@mulgrave>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<41CFE6B1.6010707@tiscali.be> <1104160093.5295.8.camel@mulgrave>
	<200412311426.13425.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
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

On Fri, 2004-12-31 at 14:26 -0600, Michael S. Zick wrote:
> Page must contain zeros on return.
> 
> Contents of system caches must correspond to contents of page (zeros).

Actually, no, this is precisely what we don't do for performance
reasons.  If we just wanted to the caches and main memory in sync, we
wouldn't need to muck with the tmpalias space.

What clear_user_page_asm does is to prime the cache covering the page
with zeros, but return the page to user space with a dirty cache (i.e.
with the real memory not necessarily zero'd but with the cache in a
state to zero it on a flush).  The reason for using the tmpalias space
is so that the user's VIPT cache lines covering the page are congruent
and thus the same ones the kernel wrote the zeros to.

This means that if the user is simply going to fill the page again, we
stand a good chance of *not* having to write the zeros to main memory in
the first place (this saves us quite a bit of execution time because
writing to main memory is an expensive operation).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
