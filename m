Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5726482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 12:15:34 -0700 (MST)
Date: Tue, 11 Feb 2003 20:15:30 +0100
Message-ID: <3E48441000000584@ocpmta7.freegates.net>
In-Reply-To: <yam9172.1240.149231680@mail.club-internet.fr>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Squid freeze
To: "Bad Max" <badmax@club-internet.fr>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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
>
>I've tried to run squid on my PA box under Debian 3.0. But squid freeze
>at launch : it do nothing, it is simply frozen, it is not possible to parse
>any line command (squid -v print nothing).
>
>I did a dist-upgrade but nothing change. So I get the lastest version
>of squid 2.5 and compiled it. Same symptom, squid is frozen. I did a
>little modification to src/main.c in squid, in the main() function : I
>took mainParseOptions() and put it in first of main() (it was executed
>later after several others miscellaneous functions).
>
Don't do this.

'dmesg' would inform you too that squid make a segfault?

I already report this problem in this ml and in Debian bug report (sorry
I do not remember # but it is easy to find back).

The problem was in fact due to a bad update of libpam-modules and a modification
in /etc/security/limits.conf which didn't occurs by default. You would found
tree line:
*       hard    core      0
*       hard    rss       5000
*       hard    nproc     20

which you can remove (what the update should do if you answer Y at this time)

Now, you have to quit completely your loging; login again and you should
now be able to use squid.


hth,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
