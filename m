Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 982774838
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Apr 2004 05:09:14 -0600 (MDT)
Message-ID: <26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
In-Reply-To: <40711E5500006381@ocpmta2.freegates.net>
References: <407DA495.1090009@tiscali.be>
	<40711E5500006381@ocpmta2.freegates.net>
Date: Fri, 16 Apr 2004 13:19:51 +0200 (CEST)
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
From: "Andy Walker" <ajwalker@broadpark.no>
To: "Joel Soete" <Soete.joel@tiscali.be>
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

>>That said, thanks to viewcvs, cvs and some tbz I recover from my systems,
> I >reach to rebuild on my b2k at the office:
>>2.6.3-pa2 (runing simultaneoulsy 2 find on different linux tree, a
>> tar of one of those tree) survive :)
>>2.6.4-rc1-pa3 same test: survive (so no pb with ccio-dma changes) :)
>>but 2.6.4-rc4-pa6 died with same messages.
>
> Sorry a typo: read 2.6.4-rc3-pa6 in place of rc4 :(
>
> Joel
>
>

Joel,

2.6.6-rc1-pa0 shows the same behaviour, although it does seem to make it
through the Gentoo boot process most times. Typically, 'ls <TAB><TAB>' in
bash in a largeish directory will do the trick. The bash process ends up
in disk-wait, the WARN_ON gets logged. I can switch consoles and log in
but just about anything that goes to disk ends up in disk-wait too.

I've compiled 2.6.3-pa2 in the hope of getting the C180 up and stable.
Can't boot it until this evening because the machine's at home and
AUTOBOOT is OFF.

-Andy
