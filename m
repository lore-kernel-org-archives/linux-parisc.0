From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 08/18] parisc: remove big kernel lock
Date: Tue, 14 Sep 2010 21:14:05 -0400
Message-ID: <20100915011405.GM24791@bombadil.infradead.org>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de>
 <1284492909-7147-9-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1284492909-7147-9-git-send-email-arnd@arndb.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 14, 2010 at 09:34:59PM +0200, Arnd Bergmann wrote:
> The parisc version of the perf code is sufficiently
> protected by its own spinlock, no need to use the BKL.
> 

I'd rather just remove the file entirely, as it doesn't work, probably
will never work, and all the relevant people who could have made it work
have left HP and so no longer have access to the documentation. I'll
commit a patch removing it from the kernel for the next merge window.

Nice work Arnd, it's great to see the BKL finally gasping its last
breaths. :)

--Kyle
