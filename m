Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BF54485F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 09:26:09 -0700 (MST)
Date: Fri, 10 Jan 2003 08:29:07 -0800
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-ID: <20030110162906.GG31470@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E1AA8D500000877@ocpmta8.freegates.net> <3E1AA8D5000009DC@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E1AA8D5000009DC@ocpmta8.freegates.net>
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

> Unfortunately this doesn't reproduce the actual problem of which I save
> the following traces (from the evms_vgscan 1.1.0: once again this was fix
> since next release):

i'm not sure i correctly parsed what you wrote... the structure you
posted is fine, but that doesn't mean it cannot cause unaligned accesses
if used incorrectly.

for a simple example:
struct foo {
    int bar;
};

this structure if placed on the stack by gcc is always int-aligned. but
you can easily generate unaligned accesses from it:

void botch(void)
{
    char buf[1024];
    struct foo x;
    struct foo *a, *b;

    a = &x;
    b = (struct foo *)buf[2];

    printf("%d\n", a->bar); /* aligned */
    printf("%d\n", b->bar); /* unaligned! */
}

in this case, the structure gives you no guarantees that things will be
aligned properly.

it's also possible to have much more involved scenarios, (e.g. with
unions of things with different alignments), where things can get messed
up.... you need to carefully look at how the code works to debug these
things. while gcc may not be bug-free in this area, it's much more
likely to be an application bug than a gcc one.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
