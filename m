Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id EAA29771
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 04:33:58 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13yBh2-0000al-00; Tue, 21 Nov 2000 11:34:32 +0000
Date: Tue, 21 Nov 2000 11:34:32 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
Message-ID: <20001121113432.B883@parcelfarce.linux.theplanet.co.uk>
References: <20001120111726.C5196@parcelfarce.linux.theplanet.co.uk> <200011201734.JAA18526@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011201734.JAA18526@milano.cup.hp.com>; from grundler@cup.hp.com on Mon, Nov 20, 2000 at 09:34:31AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Nov 20, 2000 at 09:34:31AM -0800, Grant Grundler wrote:
> Ok. What's the first step to getting arch/parisc* and include/asm-parisc*
> into Linus's tree?

Someone (probably me) sends him a patch.  He told me at the Toronto
show that he was quite happy to apply anything that only touched those
two directories. (oh, and drivers/gsc wouldn't be a problem either).
Can I just check that no-one wants to rename drivers/gsc again?  :-)

> I had dinner with Bdale Garbee last night and one of two things he made
> clear was we need to unfork from debian and linus's tree in order to move
> forward. All our CVS branches need to become obsolete or "local sandboxes"
> of the respective upstream partners. Feeding kernel bits upstream will
> bring a new level of visibility (and *HELP*) to the parisc-linux port.

that's true.  last time we discussed this several people were unhappy
with the idea of sending our current work to Linus.  Is anyone unhappy
with doing this now?

> I also find it odd that glibc is merged upstream *before* the kernel is.

glibc is more portable :-)

> The part you described above is the easy part - np.
> I'm worried about labels and tracking how we "name" the releases.
> Mang or other CVS ninja's care to comment?

don't tag it.  just commit it.  tags are laid down at big events, not
when you fix bugs or undo changes.

-- 
Revolutions do not require corporate support.
