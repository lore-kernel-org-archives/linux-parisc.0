Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32F914829
	for <parisc-linux@parisc-linux.org>; Sun,  1 Dec 2002 09:40:40 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.36 #1 (Debian))
	id 18IX91-0005dr-00
	for <parisc-linux@parisc-linux.org>; Sun, 01 Dec 2002 11:40:35 -0500
Date: Sun, 1 Dec 2002 11:40:35 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org
Message-ID: <20021201164035.GA21610@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPPA Proc problems?
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

pa,

I'm seeing some weird proc behaviour, like cpu times in the
billions of seconds, but only for a transient amount of time, after
which it corrects itself. Very odd. Just doing 'ps aux www' triggers
this... and not always.

---
root       306  0.0  0.1  4996 1600 ?        S    Nov26   0:00 /usr/sbin/apache
root      7897  0.0  0.0 12992  864 ?        S    Nov27   0:00 /usr/sbin/nscd
root      7898  0.0  0.0 12992  864 ?        S    Nov27   0:00 /usr/sbin/nscd
root      7899  0.0  0.0 12992  864 ?        S    Nov27   0:00 /usr/sbin/nscd
root      7900 99.9  0.0 12992  864 ?        S    Nov27 13600729:46 /usr/sbin/nscd
                                                        ^^^^^^^^^^^ ???

root      7901  0.0  0.0 12992  864 ?        S    Nov27   0:00 /usr/sbin/nscd
root      7902  0.0  0.0 12992  864 ?        S    Nov27   0:00 /usr/sbin/nscd
root      7903  0.0  0.0 12992  864 ?        S    Nov27   0:00 /usr/sbin/nscd
root      7909  0.0  0.2  5200 3384 ?        S    Nov27   0:00 /usr/bin/X11/xfs -daemon
---
procps 3.1.0-1 The /proc file system utilities.
2.4.19-pa22, gcc-3.1.1 compiled, toolset from unstable.

Any ideas aobut this? Is anyone seeing any odd behavour? 

Berthold from SuSE was commenting about this (building SuSE on HPPA :)
and also noted that his gcc-3.3 compiled kernel has procinfo problems:
procinfo complains that it can't grok his gcc version.

--
Linux 2.4.19-pa20 (xxxx@xxx) (gcc [can't parse]) #???  1CPU [raven.]
-- Berthold's

Linux 2.4.19-pa22 (xxxx@xxx) (gcc 3.1.1 20020715 ) #5 1CPU [firin]
-- Carlos'

In sysutils/procinfo/routines.c

    269     ret = sscanf (line, "Linux version %s (%[^)]) (gcc %[^)]) #%s %[^\n]",
    270                   ver, host, gcc, compno, date);
    271 
    272     if (ret != 5)       /* Damn egcs uses nested ()'s... */
    273         ret = sscanf (line, "Linux version %s (%[^)]) (gcc %[^(] (%*[^)])) #%s %[^\n]",
    274                       ver, host, gcc, compno, date);
    275 
    276     if (ret == 3) {     /* At least we've got ver & host right... */
    277         strcpy (gcc, "[can't parse]");
    278         strcpy (compno, "???");
    279         date[0] = 0;
    280     }

Looks like it might be a regex problem?

c.
