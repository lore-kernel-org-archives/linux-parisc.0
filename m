Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-3.cisco.com (sj-msg-core-3.cisco.com [171.70.157.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id F08144853
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 11:50:00 -0700 (MST)
Message-ID: <3C2B6D56.1000507@cisco.com>
Date: Thu, 27 Dec 2001 10:49:58 -0800
From: Christian Suder <csuder@cisco.com>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] [Q] on EISA support
References: <4.3.2.7.2.20011227103742.02a018e8@mira-sjc5-9.cisco.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> 
> 
>> 
>> 
>> Hi Christian,
>> 
>> try the default config (remove your .config file and then run "make  
>> oldconfig").
>> It just booted here for me with -pa27, so I assume you may have 
>> forgotten the
>> CONFIG_GSC_WAX=y configuration entry
> 
No,

the entry is in the .config file. I'll try -pa27 later, there seem to be 
some issues with the -pa25 in general,

thanks,
   Christian

>> 
