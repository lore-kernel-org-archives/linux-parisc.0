Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from humbolt.nl.linux.org (humbolt.nl.linux.org [131.211.28.48])
	by dsl2.external.hp.com (Postfix) with ESMTP id D975D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 May 2002 03:02:34 -0600 (MDT)
Received: (from localhost user: 'armijn' uid#1008 fake: STDIN
	(armijn@humbolt.nl.linux.org)) by humbolt.nl.linux.org
	id <S16270AbSEWJC1>; Thu, 23 May 2002 11:02:27 +0200
Date: Thu, 23 May 2002 11:02:27 +0200
From: Armijn Hemel <armijn@nl.linux.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails
Message-ID: <20020523110227.B10015@humbolt.geo.uu.nl>
References: <20020517130527.J32014@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517152054.4F2CE482A@dsl2.external.hp.com> <20020517172600.I29738@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517154923.47C7E4838@dsl2.external.hp.com> <20020521155220.A28518@humbolt.geo.uu.nl> <20020523063531.GH3471@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020523063531.GH3471@sleepie.demon.co.uk>; from rhirst@linuxcare.com on Thu, May 23, 2002 at 07:35:31AM +0100
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

On Thu, May 23, 2002 at 07:35:31AM +0100, Richard Hirst wrote:

> > > Can you be more specific (and cc the mailing list) where
> > > you got the ISO from (ie file name)?
> 
> Since boot-floppies 3.0.22 (released 3rd April), at least, hppa has used
> a 2.4.17-pa32 kernel.  Final woody b-f will use that same kernel, so
> unless you have a very old ISO, I wouldn't expect a newer one to help.
> 
> If it turns out a more recent kernel is needed for some machines, I
> could do a special b-f build and ISO.

Well, I tried the ISO that Mattias pointed me at. The machine boots, kernel
loads, and the Debian installer starts, but, ehr, the keyboard didn't work,
so I couldn't continue.

I suspect that there's some driver missing for the keyboard (it's a USB
keyboard).

armijn

-- 
 ---------------------------------------------------------------------------
   armijn@nl.linux.org | http://people.nl.linux.org/~armijn/ | Penguin Power
 ---------------------------------------------------------------------------
                 http://nl.linux.org/ | Alles over Linux
 ---------------------------------------------------------------------------
