Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id NAA25978
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 13:40:37 -0500
Received: from cllmail.cup.hp.com (cllmail.cup.hp.com [15.28.98.139])
	by palrel1.hp.com (8.8.6/8.8.5tis) with ESMTP id KAA08437
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 10:40:26 -0800 (PST)
Received: from [15.0.97.82] (cc757591.cup.hp.com [15.0.97.82]) by cllmail.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id KAA25312 for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 10:40:26 -0800 (PST)
Message-Id: <199903181840.KAA25312@cllmail.cup.hp.com>
Subject: Re: [hppa-linux] Gateway instructions
Date: Thu, 18 Mar 1999 10:43:44 -0800
From: Cary Coutant <cary@cup.hp.com>
To: <hppa-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

The PSW B bit is set to indicate that an instruction is executing in the 
delay slot of another branch. Gateway instructions trap if the B bit is 
set to prevent a malicious process from using sequence like the following 
to gain a higher privilege level:

     B    gateway
     B    my_routine

Without this protection, the first branch to the gateway instruction 
would promote the privilege level, but control would immediately be 
transferred to the user's own code. 

Branches in delay slots are tricky; here's what's really happening in the 
hardware:

                                       PC offset queue after instruction
    PC           Instruction           head         tail

    user+0       ...                   user+4       user+8
    user+4       B gateway             user+8       gateway
    user+8       B my_routine          gateway      my_routine
    gateway      B,GATE syscall        my_routine   syscall
    my_routine   B my_routine+4        syscall      my_routine+4
    syscall      ...                   my_routine+4 my_routine+8
    my_routine+4 ...

When a page's access rights are 4, 5, 6, or 7, a gateway instruction on 
that page causes the privilege promotion. Most HP-UX system calls are 
branches to a common gateway instruction on a gateway page in the fourth 
quadrant. This gateway instruction then branches to a common syscall 
entry sequence that ultimately switches on the syscall number passed in a 
GR. Some "lightweight" syscalls may be implemented with their own 
gateways.

The B bit is not a problem as long as the delay slot of the branch to the 
gateway is either nullified or filled in with a non-branch instruction. 
For example,

    LDIL L'GATEWAY,%r1
    BLE  R'GATEWAY(%sr7,%r1)
    LDO  sycallnum,%r22



Cary Coutant
Hewlett-Packard Co.
Application Delivery Lab
