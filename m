Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web21206.mail.yahoo.com (web21206.mail.yahoo.com [216.136.175.8])
	by dsl2.external.hp.com (Postfix) with SMTP id DA2E34838
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 01:50:58 -0700 (MST)
Message-ID: <20020219085057.17411.qmail@web21206.mail.yahoo.com>
Date: Tue, 19 Feb 2002 09:50:57 +0100 (CET)
From: =?iso-8859-1?q?Hinrich=20Aue?= <hinrich_aue@yahoo.de>
Subject: [parisc-linux] Power LED
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

I use 2.4.17-pa26

I tried to increase push-time to 5*HZ.
But as you said, the machine doesn't seem to recognize
when I release the button. So the shutdown is
initiated correctly, but after 5 sec the machine shuts
down, ignoring whether the runlevel 6 is reached or
not.
BTW why does the halt command not shut down the
machine?
I heared it would work. :-<
Is it possible to change the bit 0 if CPU diagnose
register 25 by hand?






__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Ihre E-Mail noch individueller? - http://domains.yahoo.de
