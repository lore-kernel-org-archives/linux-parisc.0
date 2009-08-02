From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] kobject: Read buffer overflow
Date: Sun, 2 Aug 2009 04:16:36 -0600
Message-ID: <20090802101635.GA3711@parisc-linux.org>
References: <4A754814.50506@gmail.com> <7d01f9f00908020306s273eec60u8e50692c0f839828@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Roel Kluin <roel.kluin@gmail.com>, kyle@mcmartin.ca, deller@gmx.de,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Thibaut VARENE <varenet@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00908020306s273eec60u8e50692c0f839828@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 02, 2009 at 12:06:59PM +0200, Thibaut VARENE wrote:
> On Sun, Aug 2, 2009 at 10:02 AM, Roel Kluin<roel.kluin@gmail.com> wrote:
> > Check whether index is within bounds before testing the element.
> 
> The change is correct but:
> - There are other places in the code with that construct. Even though
> they wouldn't trigger an overflow, why not fixing them too?
> - Keep the likely: we are more likely to run out of data in the layers
> than to exhaust the counter (which is why no overflow was ever
> triggered, I believe ;-)

No, lose the likely.  It's a for-loop; gcc will do the right thing.

(If you think I'm wrong, convince me by showing the disassembly of the
compiled code with and without the likely).

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
