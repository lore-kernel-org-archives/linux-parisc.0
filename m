Return-Path: <soete.joel@tiscali.be>
Received: from spoolo4.tiscali.be (spoolo4.tiscali.be [62.235.13.170])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5ADC64898
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 12:10:43 -0600 (MDT)
Message-ID: <4081731B.7070006@tiscali.be>
Date: Sat, 17 Apr 2004 18:10:35 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <407DA495.1090009@tiscali.be>
	<40711E5500006381@ocpmta2.freegates.net>
	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
In-Reply-To: <26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Andy,

Sorry for delay but I was a bit busy by a production server.

Andy Walker wrote:
>>>That said, thanks to viewcvs, cvs and some tbz I recover from my systems,
>>
>>I >reach to rebuild on my b2k at the office:
>>
>>>2.6.3-pa2 (runing simultaneoulsy 2 find on different linux tree, a
>>>tar of one of those tree) survive :)
>>>2.6.4-rc1-pa3 same test: survive (so no pb with ccio-dma changes) :)
>>>but 2.6.4-rc4-pa6 died with same messages.
>>
>>Sorry a typo: read 2.6.4-rc3-pa6 in place of rc4 :(
>>
>>Joel
>>
>>
> 
> 
> Joel,
> 
> 2.6.6-rc1-pa0 shows the same behaviour,

Thanks.
but not a surprise regarding previous test.

> although it does seem to make it
> through the Gentoo boot process most times.

I would not be surprise if it occures during some fsck. Do you also use ext3 on your Gentoo?
btw Gentoo always install pkg by a local rebuild from src (that's a long time that I visit the site)?

> Typically, 'ls <TAB><TAB>' in
> bash in a largeish directory will do the trick. The bash process ends up
> in disk-wait, the WARN_ON gets logged. I can switch consoles and log in
> but just about anything that goes to disk ends up in disk-wait too.
> 
I will try this also.

> I've compiled 2.6.3-pa2 in the hope of getting the C180 up and stable.

This seems to be the last one enough stable for me and my c110: I just updated my distro (that used a lot tar iirc) and all works 
fine with this kernel.

> Can't boot it until this evening because the machine's at home and
> AUTOBOOT is OFF.
> 
No pb.

Thanks for your feedback ;)

Joel
