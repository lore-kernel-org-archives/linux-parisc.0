Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay-2m.club-internet.fr (relay-2m.club-internet.fr [194.158.104.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BED8482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 10:22:56 -0700 (MST)
Received: from club-internet.fr (f14m-5-74.d1.club-internet.fr [212.195.92.74])
	by relay-2m.club-internet.fr (Postfix) with SMTP id 6E44B17AD
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 18:22:54 +0100 (CET)
From: Bad Max <badmax@club-internet.fr>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 11 Feb 2003 18:23:38 +0200
Message-ID: <yam9172.1907.149231680@mail.club-internet.fr>
In-Reply-To: <200302111656.h1BGudvD012174@hiauly1.hia.nrc.ca>
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

Hello

On 11-fév-03, you wrote:

| >> Now squid work perfectly. I suspect a bug in gcc, what do you think
| >> about ?
| > 
| > I fixed a hang in the libstdc++ locking code on the weekend.  This
| > affects gcc 3.3 and later on PA 1.x machines.  Other than that,
| > there are no reported/known freezes caused by gcc.
| > 
| > Dave

In fact, I did a mistake because I did not resolve the problem by changing
the code but by adding the -X option to command line (it force full debug).

The -v option work without this option because of my change so there is
perhaps a bug somewhere in the code of squid (gcc ? squid ? libc ? don't
know for now).
-------
Bad Max
========
Amiga User
GNU User
WWW: perso.club-internet.fr/badmax
