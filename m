Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80E454829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 07:22:35 -0600 (MDT)
Date: Wed, 16 Apr 2003 14:22:23 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: willy@debian.org, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Presicionbook success
In-Reply-To: <20030416151333.72921928.varenet@esiee.fr>
Message-ID: <Pine.LNX.4.44.0304161417140.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 16 Apr 2003, Thibaut VARENE wrote:

> something went wrong. I've got some html code in the attache dmesg file.
>
> Could you send it again, as well as cat /proc/cpuinfo and uname -a, so
> that i can update our listing at pateam.esiee.fr ?

Sorry, I know. I resent the dmesg to the list!


bucephaslas:~# more /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 1.1e
cpu             : PA7300LC (PCX-L2)
cpu MHz         : 160.000000
model           : 9000/778/B160L
model name      : Merlin L2 160 (9000/778/B160L)
hversion        : 0x00005020
sversion        : 0x00000481
I-cache         : 64 KB
D-cache         : 64 KB (WB)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (8 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 106.49
software id     : 2015040524

bucephaslas:~# uname -a
Linux bucephaslas 2.4.20-pa32 #2 Wed Apr 16 11:03:26 IST 2003 parisc unknown unknown GNU/Linux


Actually it doesn't have a name yet (using the IP and the name of my
other laptop). Any suggestions?


Slan, Max
