Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA16529
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 15:36:51 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id 65ECB543
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 17:39:58 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 5F22637C97
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 15:41:53 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Same boot problem on a 9000/720/50 HP machine as
 on 712/60 of Niskanen
In-Reply-To: Message from Matt Taggart <taggart@carmen.fc.hp.com>
   of "Wed, 27 Dec 2000 13:59:17 MST." <20001227205917.CF5B037C97@carmen.fc.hp.com>
References: <3A4940BF.3EB18F61@dot.at> <20001227012741.A150937C97@carmen.fc.hp.com> <20001227043446.6DCFD37C97@carmen.fc.hp.com>  <20001227205917.CF5B037C97@carmen.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Dec 2000 15:41:53 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001227224153.5F22637C97@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Matt Taggart writes...

[bash problems snipped]
> Just to see how bad the problem was I built helloworld and it runs ok. I'll 
> try to narrow it down more than that :)

It seems to just be the xcompiled static bash I built. I xcompiled sash and it 
worked ok. I setup an nfsroot with a bunch of stuff I had cross-compiled and 
except for bash and a couple other things, it's working normally. I will try 
compiling bash native and see if that helps.

-- 
Matt Taggart
taggart@fc.hp.com
