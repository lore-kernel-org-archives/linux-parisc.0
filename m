From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Git head doesn't boot on A500
Date: Sat, 17 May 2008 09:26:23 -0600
Message-ID: <20080517152623.GA26649@colo.lackof.org>
References: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 17, 2008 at 03:20:46PM +0200, Thibaut VARENE wrote:
> Hi pa-ckers
> 
> Just a quick failure report, I tested git head + jejb's zonelist patch
> on my A500 (gcc-4.2) and it hpmc'd the box (afaict) very early during
> bootup. I'll dig that more ASAP.

Two questions:
1) I suspect you missed the final email of the thread:
      http://thread.gmane.org/gmane.linux.ports.parisc/301/focus=309
   where jejb conceded the original proposed fix was correct.
   Try that instead?
2) PIM dump would help point where in the kernel it HPMC'd.

I'll try current TOB from
    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6

unless someone has a better suggestion.

thanks,
grant
