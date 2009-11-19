From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Changes to fcntl.h and F_* numbers?
Date: Wed, 18 Nov 2009 22:22:20 -0500
Message-ID: <20091119032220.GG28962@bombadil.infradead.org>
References: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 18, 2009 at 03:22:15PM -0500, Carlos O'Donell wrote:
> Kyle, Helge,
> 
> I've seen some recent churn regarding the kernel fcntl.h and F_* numbers.
> 
> If our numbers change please keep me in the loop so I can update the C
> library side.
> 

?

Unless you added things based on what's in git to libc, there's been no
changes recently. It would be fairly unwise to pick things out before
they've been in a released kernel, since they're subject to change up
until that point...

After that, the assignments are absolutely immutable...

--Kyle
