Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0DD5483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 15:55:19 -0600 (MDT)
Date: Sun, 19 Oct 2003 17:51:30 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20031019215130.GG8642@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPPA FPU Specification? (FE_INEXACT raised by accident)
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

jda,

I've noticed that I cannot generate an underflow or overflow exception
without also forcing an inexact exception on my PA 2.0 system. Are you
familiar with this behaviour at all? I'm trying to straighten our fenv
setup, and this is really the last crinkle.

Raising an overflow is done with "DBL_MAX + DBL_MAX", while the
underflow is "DBL_MIN/3.0". Both raise FE_INEXACT aswell.

Cheers,
Carlos.
