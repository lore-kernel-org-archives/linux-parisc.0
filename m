Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 535C64829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 Jan 2003 16:33:51 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0ONlQT13546
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 Jan 2003 15:47:26 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0ONbSA25254
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 Jan 2003 15:37:28 -0800
Date: Fri, 24 Jan 2003 15:37:28 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0301241520210.25246-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Um... WTF?
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

  I have no idea who to direct this to, and everyone keeps directing me to
this liste, so here goes.

Who was the CRACK HEAD that built the debian 3.0 dist for hppa?
I am trying to build everyday things on the system to at least make it
useable.  I just built ncurses {current} on my box, but to install the
ncurses, I had to remove the current debian package.

Herein lies the problem, some how EVERY DAMN THING on the system seems to
be built against ncurses, I can't open a login shell, I can't run apt* I
can't even run half the system commands without getting an error
complaining that ncurses is not on the system.

I am kinda peaved since I put the files on the system to add ncurses back,
then went home for the weekend to fix it.  Well, since I can't log in
anymore.  Unfortunatly now I no longer have any shells open, and I am
either reduced to working off the cd for a repair if possible.
Or stuck re-installing the system. Which took a day between the slowness
of the machine and the slowness of the internet connection. Not to mention
4 days of software builds...

Does anyone have an explination for this? Or better yet a way that isn't
going to involve a massive amount of work to get the machine in order
again?

-------------------------------------------------------------------------
chandler@jordan:~$ telnet 172.16.100.148
Trying 172.16.100.148...
Connected to 172.16.100.148.
Escape character is '^]'.
Debian GNU/Linux 3.0 HPTux
HPTux login: root
Password:
Last login: Fri Jan 24 23:13:14 2003 from asok.eng.nateng.com on pts/2
Linux HPTux 2.4.17-32 #1 Sat Mar 16 17:09:00 MST 2002 parisc unknown

Most of the programs included with the Debian GNU/Linux system are
freely redistributable; the exact distribution terms for each program
are described in the individual files in /usr/share/doc/*/copyright

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
-bash: error while loading shared libraries: libncurses.so.5: cannot open
shared
 object file: No such file or directory
Connection closed by foreign host.
-------------------------------------------------------------------------
chandler@jordan:~$ ssh -l root 172.16.100.148
root@172.16.100.148's password:
Last login: Fri Jan 24 23:25:12 2003 from jordan.eng.nateng.com on pts/2
Linux HPTux 2.4.17-32 #1 Sat Mar 16 17:09:00 MST 2002 parisc unknown

Most of the programs included with the Debian GNU/Linux system are
freely redistributable; the exact distribution terms for each program
are described in the individual files in /usr/share/doc/*/copyright

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Jan 24 23:25:12 2003 from jordan.eng.nateng.com
-bash: error while loading shared libraries: libncurses.so.5: cannot open
shared
 object file: No such file or directory
Connection to 172.16.100.148 closed.
