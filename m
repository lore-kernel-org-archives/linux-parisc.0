From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 09/13] parisc: Remove useless altinstructions code
	copied from x86.
Date: Wed, 23 Sep 2009 15:55:40 -0400
Message-ID: <20090923195540.GI11961@bombadil.infradead.org>
References: <1253629347-23119-1-git-send-email-tabbott@ksplice.com> <1253629347-23119-10-git-send-email-tabbott@ksplice.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: Tim Abbott <tabbott@ksplice.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1253629347-23119-10-git-send-email-tabbott@ksplice.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 22, 2009 at 10:22:23AM -0400, Tim Abbott wrote:
> Signed-off-by: Tim Abbott <tabbott@ksplice.com>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Heh, I had a patch to use this, but I guess I never finished it, (to nop
out some cache flushes and syncs on coherent architectures in the iommu
code.) I'll add a hunk to bring it back if/when I ever submit that
change.

cheers, Kyle
