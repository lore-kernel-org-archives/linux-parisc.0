From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: gcc-4.2-hppa64 bug
Date: Wed, 5 Dec 2007 13:02:23 -0500
Message-ID: <20071205180223.GB3608@fattire.cabal.ca>
References: <20071205170219.GA3608@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071205170219.GA3608@fattire.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 05, 2007 at 12:02:19PM -0500, Kyle McMartin wrote:
> The troublesome source file appears to be fs/ocfs2/alloc.o, the rest
> seem to build fine.
> 

Randolph pointed out the "-da" argument to me, the last pass it makes it
to is alloc.c.160r.shorten.

I'll leave this one going to check for forward progress as well.

cheers,
	Kyle
