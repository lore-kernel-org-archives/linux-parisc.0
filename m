Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77E624854
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Mar 2004 01:21:16 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1B1LRL-0002hs-00
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Mar 2004 09:21:15 +0100
Date: Thu, 11 Mar 2004 09:21:14 +0100
Message-ID: <404EC1C600001375@ocpmta1.freegates.net>
In-Reply-To: <404EC1C6000012B4@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] RE: [parisc-linux-cvs] tty[2..6]: respawning too
	fast with 2.6
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Please apologies me for wrong m-l addressing.

Joel

> -- Original Message --
> Date: Thu, 11 Mar 2004 08:35:57 +0100
> From: "Joel Soete" <soete.joel@tiscali.be>
> To: parisc-linux-cvs@lists.parisc-linux.org
> Subject: [parisc-linux-cvs] tty[2..6]: respawning too fast with 2.6
> 
> 
> Hi All,

What do I miss: since runing 2.6 (even though the last 2.6.4-rc3-pa0) I
got messages:
"Mar 11 06:51:37 palinux init: Id "3" respawning too fast: disabled for 5
minutes
Mar 11 06:51:38 palinux init: Id "5" respawning too fast: disabled for  5
minutes
Mar 11 06:51:39 palinux init: Id "2" respawning too fast: disabled for 5
minutes
Mar 11 06:51:39 palinux init: Id "6" respawning too fast: disabled for 5
minutes
Mar 11 06:51:39 palinux init: Id "4" respawning too fast: disabled for 5
minutes"

the inittab file containing:
[snip]
# The default runlevel.
id:2:initdefault:

1:2345:respawn:/sbin/getty 38400 tty1
2:23:respawn:/sbin/getty 38400 tty2
3:23:respawn:/sbin/getty 38400 tty3
4:23:respawn:/sbin/getty 38400 tty4
5:23:respawn:/sbin/getty 38400 tty5
6:23:respawn:/sbin/getty 38400 tty6
[snip]

and the kernel config (the default one) contains well the support for 256
pty?

Thanks in advance for advise,
    Joel





-----------------------------------------
> ----------------------------------------------
Tiscali ADSL: 19,50 ?/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr



_______________________________________________
parisc-linux-cvs 
> ailing list
parisc-linux-cvs@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux-cvs



----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
