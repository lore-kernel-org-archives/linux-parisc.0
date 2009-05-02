From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 3/5] parisc: use new macros for .data.init_task.
Date: Sat, 02 May 2009 18:16:38 +0200
Message-ID: <49FC71E6.4000100@gmx.de>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu> <1241135719-9286-2-git-send-email-tabbott@mit.edu> <1241135719-9286-3-git-send-email-tabbott@mit.edu> <1241135719-9286-4-git-send-email-tabbott@mit.edu> <49FBD681.9080605@gmx.de> <20090502141308.GA28342@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Tim Abbott <tabbott@MIT.EDU>, Sam Ravnborg <sam@ravnborg.org>,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090502141308.GA28342@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> On Sat, May 02, 2009 at 07:13:37AM +0200, Helge Deller wrote:
>> I think this patch is wrong, although it is theoretically correct.
>>
>> IIRC, gcc on hppa is not able to provide an alignment >= 8k, which is
>> why we have done the 16k alignment inside the linker script.
>> So, I think this change will prevent the parisc kernel to boot up.
>> Needs testing.
>>
> 
> I think you're confusing this with the 8-byte maximum alignment from
> kmalloc and on-stack that prevents us from just using a 16-byte aligned
> word as a lock on pa1.1?

No, I was not confusing it with the 8byte-alignment.

I really meant that a > 8k alignment was not possible.
I tried exactly the same stuff once and failed.
I think the restriction came from hpux compatibility or some old gas...

Anyway, I just tried some assembly and it seems to work.

> The patch I trimmed from this mail looks correct to me.

If you apply it and it boots OK for you, I'm fine.

Helge
