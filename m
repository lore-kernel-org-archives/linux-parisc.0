Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0DD2482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Feb 2002 14:54:56 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GR4SVJ00.U4W for
          <parisc-linux@lists.parisc-linux.org>; Wed, 6 Feb 2002 12:54:55 -0900
Date: Wed, 6 Feb 2002 12:49:03 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: XFree86 Question%26In-Reply-To=%26lt;F272OJlN0hju8qNABIT0000d6c2@hotmail.com>
In-Reply-To: <3C619C13.8293C241@cup.hp.com>
Message-ID: <Pine.LNX.4.33.0202061247500.20819-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 6 Feb 2002, Gururaj Ananthateerta wrote:
> I am facing simila problem and tried the fix suggested
> Rather, I don't know whether I have applied the fix xorrectly.
> Could anyone please explain how to fix this problem.
>
> Question
> ----------
>
> And now, an X question :-)
>
> I'm getting this on startup of the X server,
>
>         FBIOPUT_VSCREENINFO: Invalid argument
>
>         Fatal server error:
>         AddScreen/ScreenInit failed for driver 0
>
> Any ideas? Ran the release note patch, and upgraded to 2.4.16-pa24 to no
> avail. X server is rev 4.1.0-9.0.1.

I had the same error when I had my X config set to default to 24-bit color
and the FB wanted 8-bit color. Didn't seem like a very intuitive error :-)

This was on a C180 with default adapter...
