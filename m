Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20C10485C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 11:44:32 -0600 (MDT)
Message-Id: <200207101744.g6AHiKW0011045@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] SMP (in)stability
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 10 Jul 2002 13:44:19 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rhirst@linuxcare.com, grundler@dsl2.external.hp.com,
	varenet@esiee.fr, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200207101707.g6AH7xMS010810@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 10, 2002 01:07:59 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > > -pa52 kernel panic'd at 22:07
> > > running gcc1 test in background
> 
> In hacking gcc this morning trying to fix a bug in loading 64-bit
> constants, I seem to have achieved a state where the gcc build crashes
> gsyprf11 in a deterministic manner.  It's gone down three times.
> It only takes a few seconds after the build starts for the machine
> to crash.

Moving the code to hpux11, this is the error that causes the crash:

stage1/xgcc -Bstage1/ -B/opt/gnu/hppa2.0w-hp-hpux11.11/bin/ -c -DIN_GCC    -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. -I. -I../../gcc/gcc -I../../gcc/gcc/. -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cfgbuil
d.c -o cfgbuild.o
Pi 16528 received a SIGSEGV for stck growth ailure.
Possible caues: insufficient memory or swap space,
or stack size exceeded maxssiz. 
xgcc: Internal error: Segmentation fault (program cc1)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
