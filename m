From: David Miller <davem@davemloft.net>
Subject: Re: sungem: fix compile failure caused by trivial #include
 consolidation
Date: Fri, 29 Jul 2011 07:17:10 -0700 (PDT)
Message-ID: <20110729.071710.1864654661956416171.davem@davemloft.net>
References: <1311948524.8190.39.camel@mulgrave>
	<alpine.LNX.2.00.1107291611030.7300@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: James.Bottomley@HansenPartnership.com, vitalivanov@gmail.com,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: jkosina@suse.cz
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1107291611030.7300@pobox.suse.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 29 Jul 2011 16:11:54 +0200 (CEST)

> On Fri, 29 Jul 2011, James Bottomley wrote:
> 
>> This patch:
>> 
>> commit e44ba033c5654dbfda53461c9b1f7dd9bd1d198f
>> Author: Vitaliy Ivanov <vitalivanov@gmail.com>
>> Date:   Mon Jun 20 16:08:07 2011 +0200
>> 
>>     treewide: remove duplicate includes
>> 
>> Causes this compile failure on parisc:
>> 
>>   CC [M]  drivers/net/sungem.o
>> drivers/net/sungem.c:49:22: error: asm/prom.h: No such file or directory
>> make[2]: *** [drivers/net/sungem.o] Error 1
>> 
>> Only Sparc and PPC actually have the asm/prom.h include, so you can't
>> consolidate it outside of the ifdefs.
>> 
>> Signed-off-by: James Bottomley <JBottomley@Parallels.com>
>> 
>> ---
>> 
>> This really shouldn't be happening with a trivial patch, since it's an
>> obviously non-trivial transformation ... I assume the duplicate include
>> checker isn't taking #ifdefs into account?
> 
> Ah, right. I am afraid this was simply overlooked. David, do you want me 
> to take this, or will you fix that up in your tree? (I am fine either 
> way).

Take what, although James signed off he seemd to simply repost your
patch again rather than a fix, unless I'm reading it wrong :-)

But yeah once there is a fix please push it.
