Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web21205.mail.yahoo.com (web21205.mail.yahoo.com [216.136.131.248])
	by dsl2.external.hp.com (Postfix) with SMTP id 09DB2482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 00:37:09 -0700 (MST)
Message-ID: <20020218073706.35199.qmail@web21205.mail.yahoo.com>
Date: Mon, 18 Feb 2002 08:37:06 +0100 (CET)
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

When I push the power-button on my 715/80, it prints a
message on the screen, that a shuwdown is requested,
and then shuts down immediatly. On the next start up a
fsck is required.
It seems to be software controlled, or it would not
print that message(I think).
Maybe a shutdown signal is emmited from the kernel at
one point, but the runlevel isn't changed before.
So it should be possible to isolate that signal and
use it seperately in the atx style.
(I'm not a kernel hacker, but maybe this is a starting
point?)
Just speculating.


__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Ihre E-Mail noch individueller? - http://domains.yahoo.de
