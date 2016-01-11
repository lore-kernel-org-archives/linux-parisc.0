From: Helge Deller <deller@gmx.de>
Subject: Re: linux-next: strange commit in the parisc-hd tree
Date: Mon, 11 Jan 2016 22:46:48 +0100
Message-ID: <569422C8.4000706@gmx.de>
References: <20160111092822.4b4c0233@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160111092822.4b4c0233@canb.auug.org.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10.01.2016 23:28, Stephen Rothwell wrote:
> I noticed the following commit in the parisc-hd tree today:
> 
>   43122681dd75 ("Fix __ARCH_SI_PREAMBLE_SIZE on parisc")
> 
> which among other things says:
> 
>   This patch is not planned to be committed as it currently is.

Right, I split it up into two.

> [...] Please remove it from linux-next inclusion until it is ready.

Sure, I just removed it now.

> Delibeately introducing a patch to linux-next that may well cause build breakage
> in other architectures just before the merge window opens is a bit antisocial.

That was in no way my intention.
In contrary, I wanted to see if other platforms are affected by the same bug without knowing.
Do you by any chance know if it broke some of the existing platforms?
If yes, that would be valuable info...

Just in case people want to know what this is all about:
On parisc I found __ARCH_SI_PREAMBLE_SIZE to have a wrong value in 64bit kernel builds.
Patch which fixes it is here:
https://patchwork.kernel.org/patch/7994821/

To prevent other (existing and future) architectures to run into the same
problem I wanted to test this patch via linux-next and inform them:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=test__ARCH_SI_PREAMBLE_SIZE

Helge
