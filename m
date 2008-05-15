From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] flag parameters: arch-specific SOCK_NONBLOCK
Date: Thu, 15 May 2008 10:58:26 -0400
Message-ID: <20080515145826.GM12850@phobos.i.cabal.ca>
References: <200805130431.m4D4Vo5e017311@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	akpm@linux-foundation.org, torvalds@linux-foundation.org
To: Ulrich Drepper <drepper@redhat.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760596AbYEOO6h@vger.kernel.org>
In-Reply-To: <200805130431.m4D4Vo5e017311@devserv.devel.redhat.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, May 13, 2008 at 12:31:50AM -0400, Ulrich Drepper wrote:
> The value of O_NONBLOCK clashes on Alpha dn PARISC with the bits used
> for socket types.  Therefore we cannot define SOCK_NONBLOCK as
> O_NONBLOCK on these platforms.  This patch adds support for an
> arch-specific SOCK_NONBLOCK value which doesn't add costs for
> other architectures.
> 
>  include/asm-alpha/socket.h  |    5 +++++
>  include/asm-parisc/socket.h |    5 +++++
>  include/linux/net.h         |    2 ++
>  net/socket.c                |    9 +++++++++
>  4 files changed, 21 insertions(+)
> 
> 
> Signed-off-by: Ulrich Drepper <drepper@redhat.com>
> 

This looks fine to me. Thanks, Ulrich!

Acked-by: Kyle McMartin <kyle@mcmartin.ca>
