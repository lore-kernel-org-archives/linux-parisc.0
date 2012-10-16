From: David Howells <dhowells@redhat.com>
Subject: Re: [GIT PULL] Disintegrate UAPI for parisc [ver #2]
Date: Tue, 16 Oct 2012 20:08:06 +0100
Message-ID: <31900.1350414486@warthog.procyon.org.uk>
References: <1350413336.8077.6.camel@dabdike> <21164.1349774145@warthog.procyon.org.uk>
Cc: dhowells@redhat.com, jejb@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1350413336.8077.6.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> I'm getting a fairly massive merge failure over our misc tree:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.0 misc
> 
> It looks like a conflict with the motion to using wrappered Kbuild for
> our asm-generic clones.

I can try merging your branch in and then disintegrating on top of that.

David
