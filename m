From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: linux-next: manual merge of the parisc tree with Linus' tree
Date: Fri, 9 Oct 2009 14:39:14 -0400
Message-ID: <20091009183914.GG11702@bombadil.infradead.org>
References: <20091009112158.7d37ed23.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20091009112158.7d37ed23.sfr@canb.auug.org.au>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 09, 2009 at 11:21:58AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the parisc tree got conflicts in
> arch/parisc/include/asm/thread_info.h and arch/parisc/kernel/entry.S
> between commit d0420c83f39f79afb82010c2d2cafd150eef651b ("KEYS: Extend
> TIF_NOTIFY_RESUME to (almost) all architectures [try #6]") from Linus'
> tree and commit 9f4259771faf1ffd99888796d925adae4c93630b ("parisc: add
> TIF_NOTIFY_RESUME and use tracehook_notify_resume") from the parisc tree.
> 
> It looks like the parisc tree version is a superset of the version in
> Linus' tree (for parisc).  I fixed it up (hopefully - using the parisc
> tree versions) and can carry the fix for a while.

Sorry, forgot to push out a new #next. Should be sorted now.

Thanks for the heads up.
 - Kyle
