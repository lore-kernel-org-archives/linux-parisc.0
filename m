Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay-2m.club-internet.fr (relay-2m.club-internet.fr [194.158.104.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98967482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 09:37:43 -0700 (MST)
Received: from club-internet.fr (f14m-5-74.d1.club-internet.fr [212.195.92.74])
	by relay-2m.club-internet.fr (Postfix) with SMTP id 764CF1820
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 17:37:41 +0100 (CET)
From: Bad Max <badmax@club-internet.fr>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 11 Feb 2003 17:38:24 +0200
Message-ID: <yam9172.1240.149231680@mail.club-internet.fr>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [parisc-linux] Squid freeze
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

Hi,

I've tried to run squid on my PA box under Debian 3.0. But squid freeze
at launch : it do nothing, it is simply frozen, it is not possible to parse
any line command (squid -v print nothing).

I did a dist-upgrade but nothing change. So I get the lastest version
of squid 2.5 and compiled it. Same symptom, squid is frozen. I did a
little modification to src/main.c in squid, in the main() function : I
took mainParseOptions() and put it in first of main() (it was executed
later after several others miscellaneous functions).

Now squid work perfectly. I suspect a bug in gcc, what do you think
about ?
-------
Bad Max
========
Amiga User
GNU User
WWW: perso.club-internet.fr/badmax
