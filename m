Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73235482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Feb 2002 14:12:05 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel11.hp.com (Postfix) with ESMTP id 762656001AB
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Feb 2002 13:12:04 -0800 (PST)
Received: from cup.hp.com (maverick.cup.hp.com [15.13.105.84])
	by hpindda.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with ESMTP id NAA13988
	for <parisc-linux@lists.parisc-linux.org>; Wed, 6 Feb 2002 13:12:03 -0800 (PST)
Message-ID: <3C619C13.8293C241@cup.hp.com>
Date: Wed, 06 Feb 2002 13:11:47 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: XFree86
 Question%26In-Reply-To=%26lt;F272OJlN0hju8qNABIT0000d6c2@hotmail.com>
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




I am facing simila problem and tried the fix suggested
Rather, I don't know whether I have applied the fix xorrectly.
Could anyone please explain how to fix this problem.


Question
----------

And now, an X question :-)

I'm getting this on startup of the X server,

        FBIOPUT_VSCREENINFO: Invalid argument

        Fatal server error:
        AddScreen/ScreenInit failed for driver 0

Any ideas? Ran the release note patch, and upgraded to 2.4.16-pa24 to no

avail. X server is rev 4.1.0-9.0.1.
-----------------------------------------------------

>Date: Wed, 26 Dec 2001 13:51:17 -0800
>To: bheadley@interaccess.com
>From: Christian Suder <csuder@cisco.com>
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux] Re: XFree86 Question
>
>
>In case you still have the problem, if I remember correctly the reason
>is
>that the XFree config file is generated in a "PC-ish" manner with a
>lot of
>different screen definitions and tries to start X in a >combination the
fb
>device does not support. Edit it to have just an >entry for the type of

>screen you have (likely 1280x1024, 8bit).
>
> Christian

I was having the same problem on a B132L+. This fix got me up and going.

Thanx Christian!

_________________________________________________________________
Join the world?s largest e-mail service with MSN Hotmail.
http://www.hotmail.com
