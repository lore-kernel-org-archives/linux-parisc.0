Return-Path: <taggart@carmen.fc.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id E27EC48E2
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Mar 2004 10:56:37 -0700 (MST)
To: SilverHampster@aol.com
Subject: Re: [parisc-linux] c360 and graphics card recommendations. 
In-Reply-To: Message from SilverHampster@aol.com
	of "Thu, 11 Mar 2004 09:25:26 EST." <9e.56d9638.2d81d0d6@aol.com>
References: <9e.56d9638.2d81d0d6@aol.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Mar 2004 10:56:35 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20040311175636.A97DC37D0C@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


SilverHampster@aol.com writes...

> I know the fx2 does not work. cos I read all about it. I have found out  that
> the vis eg works but does it work with 24-bit colour and a 1280x1024  
> resalution.

No. The VisEG hardware can only support 8-bit color(at up to 1600x1200). It 
also has support for something called Color Recovery in order to get more 
colors but support for that has only been implemented in the HP-UX Xserver 
and will probably never be done for Linux.

> I was also wondering if a old nvidia card would work but have a fealing 
> they need the x86 bios.

There has been lots of discussion on the mailing list about using PC 
graphics cards. Please search the list archives.(this should probably be 
added to the faq too) Short answer: it is possible for some cards, but I 
don't know if nvidia is one of them.

-- 
Matt Taggart        Linux and Open Source Lab
taggart@fc.hp.com   Hewlett-Packard
