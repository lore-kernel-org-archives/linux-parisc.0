Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 24 Jan 2003 18:53:08 -0700
To: Sir Ace <chandler@nateng.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Um... WTF?
Message-ID: <20030125015308.GC6228@dsl2.external.hp.com>
References: <Pine.LNX.4.33.0301241520210.25246-100000@jordan.eng.nateng.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0301241520210.25246-100000@jordan.eng.nateng.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Jan 24, 2003 at 03:37:28PM -0800, Sir Ace wrote:
> 
>   I have no idea who to direct this to, and everyone keeps directing me to
> this liste, so here goes.

parisc-linux mailing list is really intended for kernel stuff.
lists.debian.org has lots of mailing lists to post rants.

> Who was the CRACK HEAD that built the debian 3.0 dist for hppa?

yeah, debian-hppa list would have been better.  Or debian-devel.
Your problem is not hppa specific.

/me sits back to watch the late New Years fireworks...

> I am trying to build everyday things on the system to at least make it
> useable.  I just built ncurses {current} on my box, but to install the
> ncurses, I had to remove the current debian package.

Why remove the existing package?
I overwrite existing files when I need to.


> Herein lies the problem, some how EVERY DAMN THING on the system seems to
> be built against ncurses,

Right. *system* being the operative word here.

> I am either reduced to working off the cd for a repair if possible.

yes. The CD has a shell which will let you fix *most* things.

You might also try booting with "init=/bin/bash" or if you are lucky,
"init=/bin/sash". Then by hand re-install the libncurses.


> Not to mention 4 days of software builds...

uhm...what are you building that takes 4 days?
Not even glibc or xfree86 takes that long.


grant
