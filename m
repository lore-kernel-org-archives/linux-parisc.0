Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id D34C84835
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 May 2002 01:29:23 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id 466E87BC46
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 May 2002 00:29:22 -0700 (PDT)
Date: Sun, 26 May 2002 00:29:22 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <20020526060948.0676E4834@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0205260013010.1491-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 26 May 2002, Grant Grundler wrote:

> Robert Stanford wrote:
> > Regarding the below post, have the SMP issues been worked out on 2.4.18
> > yet? Im running 2.4.18-25 and the machine seems to lock whenever I try
> > to use apt with an smp kernel.
In my playing w/ a J5000, the SMP kernel locks up when loading samba.  
With samba disabled, the box boots, but eventually crashes for some 
mysterious reason (I never tracked it down, just said "oh well" and went 
back to UP).  

...
> The only other possibility is processes are only running on CPU 0.
> ie when loading a device driver later, it always gets initialized on the
> monarch. This scenario would also match the "top" output where
> a 2-way system is always 50% idle and a 4-way is 75% idle.
> 
> I'd like to learn some way of seeing which CPU is running which
> processes. top doesn't seem to indicate that. I'll look at sysstat
> package later.
I tried all sorts of things to try to find out what CPU stuff's on.  Top 
is no help, /proc/stat shows all but a tiny amount of time on CPU1 (?), 
and /proc/(pid)/cpu tends to agree.  It's been a little while since I 
tried SMP, and looked at this stuff.  I forget exactly what 
/proc/(pid)/cpu said.  I havent booted an SMP kernel for about a week.  
Probably should do a cvs update and rebuild, see what happens.  If samba 
crashes that thing again, I think I'll scream :)  I just went back to the 
logs to see if anything useful was there.  There wasn't.  Just standard 
boot stuff, then it stops for about a day (I tend to screw with the box 
by remote on off-hours), then starts again.  I'll try again w/ latest 
kernel and report what happens.

-- 
Kaufman's First Law of Party Physics:
	Population density is inversely proportional
	to the square of the distance from the keg.
