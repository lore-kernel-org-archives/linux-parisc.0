Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id E50C2483D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 15:13:50 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-1.cisco.com (8.11.3/8.9.1) with ESMTP id fBQMDnL07870
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 14:13:49 -0800 (PST)
Message-Id: <4.3.2.7.2.20011226135241.027fc090@mira-sjc5-9.cisco.com>
Date: Wed, 26 Dec 2001 14:13:35 -0800
To: parisc-linux@lists.parisc-linux.org
From: Christian Suder <csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] [Q] on EISA support
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

Hello,

I finally got the C110 running a couple of days ago (thanks to the "magic" 
FW-SCSI command) and things are well so far. I'm trying to add a network 
card needed for the planned use of the machine but so far no luck.

I'm not an expert on the HP HW, but I do remember the (short) EISA days on 
PCs where a .cfg file was needed to teach the PC the specifics of the cards 
(IO ports, interrupts etc.). How does this work with the HP machines ? I 
tried an SMC Ultra 32 and an AC3200 with no luck. One hurdle here is that 
there is a function call in both drivers (as well as other drivers that use 
similar controller chips) that the compiler barks about. (Something like 
isa_eth_copy_and_chksm - don't have the exact at hand right now). I found a 
way around it but the cards are not detected at all. Note these cards use a 
memory window - is that possible with the current EISA support ? Is it 
possible to use generic EISA cards at all or do they have to be supported 
by the boot rom in some way ?

Tried a NE2000 clone too, which was detected but with the wrong interrupt. 
That might be because it's a "hard" configured plug&pray card. PCs have no 
problems detecting the settings correctly, though.

Thanks,
	Christian
