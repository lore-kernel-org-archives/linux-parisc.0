Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay-4v.club-internet.fr (relay-4v.club-internet.fr [194.158.96.115])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54A67482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 14:53:28 -0700 (MST)
Received: from club-internet.fr (f06v-7-27.d1.club-internet.fr [212.194.114.27])
	by relay-4v.club-internet.fr (Postfix) with SMTP id 8452F1883
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 22:53:25 +0100 (CET)
From: Bad Max <badmax@club-internet.fr>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 11 Feb 2003 22:54:09 +0200
Message-ID: <yam9172.490.149231680@mail.club-internet.fr>
In-Reply-To: <3E48441000000584@ocpmta7.freegates.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: Squid freeze
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

Le 11-fév-03, Joel Soete a écrit :

[snip]
| > Don't do this.
| > 
| > 'dmesg' would inform you too that squid make a segfault?
| > 
| > I already report this problem in this ml and in Debian bug report (sorry
| > I do not remember # but it is easy to find back).
| > 
| > The problem was in fact due to a bad update of libpam-modules and a
| > modification in /etc/security/limits.conf which didn't occurs by
| > default. You would found tree line:
| > * hard core 0
| > * hard rss 5000
| > * hard nproc 20
| > 
| > which you can remove (what the update should do if you answer Y at this
| > time)
| > 
| > Now, you have to quit completely your loging; login again and you should
| > now be able to use squid.
| > 
| > 
| > hth,
| >    Joel
| > 

Sorry but there are no messages at all about squid in dmesg. I checked
/etc/security/limits.conf and the three lines you indicated are already
removed.

I repeat : I must pass the option -X (force full debug) to have squid
working. I will spend time tomorow to locate what seems to be at the
origin of this lock.
-------
Bad Max
========
Amiga User
GNU User
WWW: perso.club-internet.fr/badmax
