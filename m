Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12506.mail.yahoo.com (web12506.mail.yahoo.com [216.136.173.198])
	by dsl2.external.hp.com (Postfix) with SMTP id 296354829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 00:59:42 -0600 (MDT)
Message-ID: <20021002065939.80022.qmail@web12506.mail.yahoo.com>
Date: Tue, 1 Oct 2002 23:59:39 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] firmware update using BOOTP
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021002050022.GB1454@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

--- Grant Grundler <grundler@dsl2.external.hp.com> wrote:
> On Tue, Oct 01, 2002 at 09:31:35AM +0200, Frank Cornelis wrote:
> > I know, BOOTP booting also worked with me before the firmware
> patching.
> > But anyway, upgrading never hurts and the HP/linux FAQ recommended
> it.
> 
> That's not true. Upgrades can fail. It's rare but it happens.
> I wrote the FAQ entry and it also says:
> 
> | BEWARE: It's possible to kill a system by either upgrading the
> wrong
> | firmware or the upgrade doesn't finish properly for any reason.
> Don't
> | upgrade unless you have evidence of a PDC problem. Text files on
> the HP
> | patch depot describe what was fixed in each revision since the
> machine
> | model was released.
> 
> It's easy to download the wrong firmware to a machine.
> My favorite example is installing 715/100 PDC on a 715/100XC (need a
> "dagger" card and working 715/100XC to resurrect the dead 715/100XC).
> I've done it and know of others who've done it. Sounds stupid but
> it happens.
> 
> grant


My C180 is actually using 6.3 (for the C200/240) firmware and not 6.1. 
All the official HP websites say 6.1 is the latest for the C180, but my
firmware cheat sheet that was sent to all of us hardware CE's says that
6.3 will work.  Haven't had any problems to date.  It also says that I
can't run more than 1.5GB of memory on my box, but I am.  I just loaded
the wrong firmware on a hard drive today....anyone want a paper weight?
 It's completely brain dead.  But Grant is right...doesn't take much to
kill a motherboard with a firmware update if it's not done properly.

derek

__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
