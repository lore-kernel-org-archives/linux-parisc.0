Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from majestix.stromi.at (212186002109.11.vie.surfer.at [212.186.2.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CACC482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Apr 2002 12:18:55 -0600 (MDT)
Received: from miraculix (miraculix.stromi.at [192.168.204.200])
	by majestix.stromi.at -  with SMTP id g3AIIkL03857
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Apr 2002 20:18:47 +0200
Reply-To: <office@stromi.at>
From: "Ing. Peter Hans Strohmayer" <office@stromi.at>
To: <parisc-linux@lists.parisc-linux.org>
Date: Wed, 10 Apr 2002 20:18:45 +0200
Message-ID: <000301c1e0bc$276e5460$c8cca8c0@stromi.at>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] XFree86 on C180 with HPMC
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

Hello,

i have installed the isoimage 0.93 and then made a update of
the packages via apt/dselect. I choosed the kernel 2.4.17-32.

When i am starting xdm or gdm the machines works a little bit
and then i get the following message:

High Priority Machine Check (HPMC): Code=1 regs=102f3080 (Addr=00000000)

I do not know if i need a package or made a mistake, i have no
gpm running and i tested it with and without the fontserver xfs.

What should i do?

Machinetype: C180, 1.5GB RAM, 9GB HDD for Debian and 4GB for HPUX11

Greetings,
Peter

Ing. Peter Hans Strohmayer

+ mailto: office@stromi.at
( +43 1 95 230 42
( +43 699 195 230 42
