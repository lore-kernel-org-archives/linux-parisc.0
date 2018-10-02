From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] parisc fixes for kernel v4.19
Date: Tue, 2 Oct 2018 14:16:45 -0700
Message-ID: <20181002211645.GA6454@kroah.com>
References: <20181002210213.GA17826@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002210213.GA17826@ls3530.fritz.box>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 02, 2018 at 11:02:13PM +0200, Helge Deller wrote:
> Hi Greg,
> 
> please pull a last set of fixes for the parisc architecture for kernel 4.19 from:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.19-3
> 
> The major change is for parisc64 to use a 64-bit suseconds_t type to
> match what glibc expects for 64-bit userspace. It's an ABI change, but
> since we don't have a 64-bit userspace on parisc yet, it won't introduce
> a breakage.

Isn't it a bit "late" in the release cycle for such a change?  Why not
do this on the -rc1 release?

> Other than that we simply drop unused code and outdated gcc version
> checks.

Why are those needed now?

thanks,

greg k-h
