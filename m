Return-Path: <marnix.vd.berg@hccnet.nl>
Received: from smtp10.hccnet.nl (smtp10.hccnet.nl [62.251.0.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id A78C64891
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 15:08:19 -0700 (MST)
Received: from hccnet.nl by smtp10.hccnet.nl
	via fia65-26.dsl.hccnet.nl [62.251.26.65] with ESMTP for
	<parisc-linux@lists.parisc-linux.org>
	id i2IM8IF1017297 (8.12.10/2.04); Thu, 18 Mar 2004 23:08:18 +0100 (MET)
Message-ID: <405A1FBE.5040609@hccnet.nl>
Date: Thu, 18 Mar 2004 23:16:30 +0100
From: Marnix van den Berg <marnix.vd.berg@hccnet.nl>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Common Console Problem booting HP C3000 From CD-Rom
References: <mailman.112.1079643013.2398.parisc-linux@lists.parisc-linux.org>
	<1079643703.11454.13.camel@lugh.ecew2k.ncsu.edu>
In-Reply-To: <1079643703.11454.13.camel@lugh.ecew2k.ncsu.edu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Reply-To: marnix.vd.berg@hccnet.nl
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

Have you tried booting the standard 32 bit kernel? There isn't really a
reason to use the 64 bit kernel unless of course you're one of those
lucky people with more than 4gb of memory  I myself have a C3000 and
Debian installed on it without a problem. I can't use the framebuffer
since it's a FX4. I take it you'll be using the serial console? Or did
you fit them all with Vis-EG cards?

Regards,

Marnix van den Berg

Adam Parrish wrote:

> Good Day,
> 
> I am attempting to load Debian on a good many of our C3000 Visualize
> workstation per user request. Unfortunately I am stumbling upon a
> "Common Error" while booting. 
> 
> When booting without altering any of the boot options from the pdl I get
> a High Priority Machine Check error:
> 
> (HPMC): Code=1 regs=102F3080 (ADDR = 00000000) 
> 
> When using the 64 bit version by editing line 0 to have vmlinuz64 on it
> so that it boots the 64 bit kernel I get the error that I need to switch
> the console. 
> 
> I have tried multiple consoles but am unable to get it to show me the
> linux interactive boot screen. The LCD on the front of my computer leads
> me to believe that the kernel booted though since it says Linux 2.4.17. 
> 
> I have skimmed the Mailing List and I apologize if this is a repeat,
> although none of the messages I read reflected my problem or the
> solution. 
> 
> Any help or suggestion in debugging this problem would be greatly
> appreciated. 
> 
> Thanks and Regards,
