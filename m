Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA08233
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Mar 2000 12:12:02 -0700
From: blacky@xanaxis.dyndns.org
Received: from xanaxis.dyndns.org by xanaxis.dyndns.org with RAW (MDaemon.v2.7.SP4.R) for <parisc-linux@thepuffingroup.com>; Sat, 11 Mar 2000 19:13:39 +0100
Date: Sat, 11 Mar 2000 19:13:39 +0100
To: parisc-linux <parisc-linux@thepuffingroup.com>
Reply-To: blacky@xanaxis.dyndns.org
Message-ID: <MDAEMON80008200003111913.AA1339046@xanaxis.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] undefined reference in libgcc.a
List-ID: <linux-parisc.vger.kernel.org>

hiya all,

I've been trying to make a parisc-linux crosscompiler from a
i586-linux-gnu platform, the binutils build with no problems, but
at the final stage of building gcc it stops at the libgcc-test
with the following error :

libgcc1-test.o: In function `main_without__main':
/home/blacky/cvs/build/gcc/../../gcc/gcc/libgcc1-test.c:20: undefined reference to `$global$'

it seems to reference to the integer-divide function in libgcc.

How can I get around this problem ?

thanx in advance,

Signed, Marco van den Heuvel
