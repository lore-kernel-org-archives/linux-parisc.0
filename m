Return-Path: <oliver.fuhrer@bluewin.ch>
Received: from mail2.bluewin.ch (mail2.bluewin.ch [195.186.4.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9307F4840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  1 Mar 2004 15:24:59 -0700 (MST)
Received: from warez (62.203.178.208) by mail2.bluewin.ch (Bluewin AG 7.0.024)
	id 4043356B0001819C for parisc-linux@lists.parisc-linux.org;
	Mon, 1 Mar 2004 22:24:58 +0000
Message-ID: <4043356B0001819C@mail2.bluewin.ch> (added by
	postmaster@bluewin.ch)
From: "Oliver Fuhrer" <oliver.fuhrer@bluewin.ch>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Maybe OT: Login problem
Date: Mon, 1 Mar 2004 23:26:45 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-reply-to: <yq18yikmpgb.fsf@wilson.mkp.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

 Hello martin,
It was the system date, which was about 12000 days in the past. I guess, it
could also be a problem with the pdc which can only display two-digit years.
But for now it works, that's enough.
Thx very much!
Regards,
Oliver


-----Original Message-----
From: mkp@mkp.net [mailto:mkp@mkp.net] 
Sent: Monday, March 01, 2004 18:45
To: Oliver Fuhrer
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Maybe OT: Login problem

>>>>> "Oliver" == Oliver Fuhrer <oliver.fuhrer@bluewin.ch> writes:

Oliver> I'm having trouble to log in to my apollo 9000/705 workstation 
Oliver> with debian 3. every time i log in, i have to change my 
Oliver> password. No matter if i log in as root or as user.  I'v already 
Oliver> reinstalled debian, but this problem persists.

Sounds like your system time is off.  Most likely your onboard battery is
dead.

Not sure whether replacements for 705 are easy to come by.  But if you set
the time at the PDC prompt before installing Debian, things should work out
better for you.

-- 
Martin K. Petersen      http://mkp.net/
