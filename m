Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 937D64898
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 14:38:36 -0600 (MDT)
Message-ID: <32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>
In-Reply-To: <4081731B.7070006@tiscali.be>
References: <407DA495.1090009@tiscali.be>   
	<40711E5500006381@ocpmta2.freegates.net>
	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
	<4081731B.7070006@tiscali.be>
Date: Sat, 17 Apr 2004 22:49:19 +0200 (CEST)
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
From: "Andy Walker" <ajwalker@broadpark.no>
To: "Joel Soete" <soete.joel@tiscali.be>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Hello Andy,
>
> Sorry for delay but I was a bit busy by a production server.

No problem.

>> 2.6.6-rc1-pa0 shows the same behaviour,
>
> Thanks.
> but not a surprise regarding previous test.
>
>> although it does seem to make it
>> through the Gentoo boot process most times.
>
> I would not be surprise if it occures during some fsck. Do you also use
> ext3 on your Gentoo?
> btw Gentoo always install pkg by a local rebuild from src (that's a long
> time that I visit the site)?

That's the Gentoo way - so every package on my system is compiled
-march=2.0 -mschedule=8000. The downside is that install and upgrade
takes a long time on slow machines. The upside is that you get total
control over package selection and compilation options. I've played
with Debian before but I find apt a pain compared to Gentoo's portage.
Also all this sid/woody/stable/unstable etc.... stuff confuses me.

>> I've compiled 2.6.3-pa2 in the hope of getting the C180 up and stable.
>
> This seems to be the last one enough stable for me and my c110: I just
> updated my distro (that used a lot tar iirc) and all works
> fine with this kernel.

2.6.3-pa2 is rock solid. I've been running updates, kernel compilation -
pretty heavy stuff, and no problems.
I'm just about to 'emerge' X11 - that should keep it downloading,
untarring and compiling for 24 hours.

Any suggestions for things I might test to narrow our problem down.

cheers,
-Andy
