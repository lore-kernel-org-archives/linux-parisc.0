Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 158524829
	for <parisc-linux@parisc-linux.org>; Mon, 21 Oct 2002 08:15:27 -0600 (MDT)
Received: from 127.0.0.1 (localhost.esiee.fr [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 2490E49C21
	for <parisc-linux@parisc-linux.org>; Mon, 21 Oct 2002 16:15:23 +0200 (CEST)
Received: from esiee.fr (grobluk.esiee.fr [147.215.7.22])
	by mail.esiee.fr (Postfix) with ESMTP id 1567649BDE
	for <parisc-linux@parisc-linux.org>; Mon, 21 Oct 2002 16:15:21 +0200 (CEST)
Message-ID: <3DB40B4F.4050807@esiee.fr>
Date: Mon, 21 Oct 2002 16:12:31 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Pb with shared lib/or keymap after apt-get upgrade
References: <3DB3E2AC.7FC260A8@admin.france.hp.com> <3DB406BB.71C9BC9C@admin.france.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Bruno Vidal wrote:
 > 	Hi
 > I've found there the problem is: bash is using the libreadline.so.4
 > -> when I've upgraded the system this morning, this lib has been
 > upgraded, but the timestamp for this lib is:
 > Aug  2 02:03 libreadline.so.4.3
 > but for bash it is:
 > Nov 17  2001 /bin/bash
 >
 > -> bash is older than a lib that it use -> that's not correct.
 > If I downgrade libreadline to libreadline.so.4.2
 > it correct the problem. So I think it would be a good
 > idea to re-link bash with the latest lib.

I guess you are running debian unstable, which i wouldn't recommend for
a production machine.

Debian unstable is currently _really_ unstable.

We use testing on some of our prod machines (including the webserver),
it seems far more reliable.

Anyway, as usual, userland problems should be reported to debian mailing
lists.

HTH, Greetings,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
