Return-Path: <waparris@ncsu.edu>
Received: from uni09mr.unity.ncsu.edu (uni09mr.unity.ncsu.edu [152.1.1.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 407F14891
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 14:04:02 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by uni09mr.unity.ncsu.edu (8.12.10/8.12.10/N.20031118.07) with ESMTP id
	i2IL41rv017201 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 16:04:01 -0500 (EST)
Received: from uni09mr.unity.ncsu.edu ([127.0.0.1])
	by localhost (uni09mr.unity.ncsu.edu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 16892-10 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 16:04:01 -0500 (EST)
Received: from lugh.ecew2k.ncsu.edu (lugh.ecew2k.ncsu.edu [152.1.47.107])
	by uni09mr.unity.ncsu.edu (8.12.10/8.12.10/N.20031118.07) with ESMTP id
	i2IL40PF017191 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 16:04:00 -0500 (EST)
From: Adam Parrish <waparris@ncsu.edu>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <mailman.112.1079643013.2398.parisc-linux@lists.parisc-linux.org>
References: <mailman.112.1079643013.2398.parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Message-Id: <1079643703.11454.13.camel@lugh.ecew2k.ncsu.edu>
Mime-Version: 1.0
Date: 18 Mar 2004 16:01:44 -0500
Subject: [parisc-linux] Common Console Problem booting HP C3000 From CD-Rom
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Good Day,

I am attempting to load Debian on a good many of our C3000 Visualize
workstation per user request. Unfortunately I am stumbling upon a
"Common Error" while booting. 

When booting without altering any of the boot options from the pdl I get
a High Priority Machine Check error:

(HPMC): Code=1 regs=102F3080 (ADDR = 00000000) 

When using the 64 bit version by editing line 0 to have vmlinuz64 on it
so that it boots the 64 bit kernel I get the error that I need to switch
the console. 

I have tried multiple consoles but am unable to get it to show me the
linux interactive boot screen. The LCD on the front of my computer leads
me to believe that the kernel booted though since it says Linux 2.4.17. 

I have skimmed the Mailing List and I apologize if this is a repeat,
although none of the messages I read reflected my problem or the
solution. 

Any help or suggestion in debugging this problem would be greatly
appreciated. 

Thanks and Regards,
-- 
Adam Parrish
Asst. Linux Administrator
ECE Dept, North Carolina State University
