Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020705075529.A2C604847@dsl2.external.hp.com>
Date: Fri,  5 Jul 2002 01:55:29 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] user_mode() right?
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

Hi all,
top currently reports the following on my a500:
CPU states:   0.3% user,  99.7% system,   0.0% nice,   0.0% idle

while the system is idle. ie idle time is being accounted
to the system time.

While trying to understand this, I ran across the following comment:

/* XXX should we use iaoq[1] or iaoq[0] ? */
#define user_mode(regs)                 (((regs)->iaoq[0] &  3) ? 1 : 0)

Is iaoq[0] correct?

thanks
grant
