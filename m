From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [GIT PULL] Disintegrate UAPI for parisc [ver #2]
Date: Tue, 16 Oct 2012 11:48:56 -0700
Message-ID: <1350413336.8077.6.camel@dabdike>
References: <21164.1349774145@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <21164.1349774145@warthog.procyon.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2012-10-09 at 10:15 +0100, David Howells wrote:
> Can you merge the following branch into the parisc tree please.
> 
> This is to complete part of the UAPI disintegration for which the preparatory
> patches were pulled recently.
> 
> Now that the fixups and the asm-generic chunk have been merged, I've
> regenerated the patches to get rid of those dependencies and to take account of
> any changes made so far in the merge window.  If you have already pulled the
> older version of the branch aimed at you, then please feel free to ignore this
> request.
> 
> The following changes since commit 9e2d8656f5e8aa214e66b462680cf86b210b74a8:

I'm getting a fairly massive merge failure over our misc tree:

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.0 misc

It looks like a conflict with the motion to using wrappered Kbuild for
our asm-generic clones.

James


