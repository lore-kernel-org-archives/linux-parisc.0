Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B6644858
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 18:10:26 -0600 (MDT)
To: Igor Grinchenko <green@grinchenko.org>
Cc: parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] 715/33 PDC v1.4 firmware 
In-Reply-To: Your message of "Sun, 14 Jul 2002 13:13:11 PDT."
             <20020714201311.GA175@igor.grinchenko.org>
References: <20020714201311.GA175@igor.grinchenko.org> 
Date: Sun, 14 Jul 2002 18:10:24 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020715001024.BCA0737E97@carmen.fc.hp.com>
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

Igor Grinchenko writes...

> HEllo everyone,
> 
> does anybody on that list have an old Firmware patch for 715/33?
> 1.6 doesn't seem to support 715/33 so I think 1.4 is what I need.
> HP calles it PF_C7X50014, but I can't download it from their website, b/c
> it was substituted by 1.6(which doesn't support 33)

The 715/old (aka 33,50,75) are not user upgradable, you'd have to swap
the firmware chip. The version you're talking about above(1.6, 1.4) are
for the 715/new (aka 64,80,100). And as someone(ggg?) recently pointed
out these don't work for the 715/100XC either.

Since your system isn't user upgradable, you have the same firmware as
everyone else. So you can bet any generic problem encountered will either
be worked around in software or broken for everyone :)

-- 
Matt Taggart
taggart@fc.hp.com
