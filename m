Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id F15AC482D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jun 2003 12:53:51 -0600 (MDT)
Date: Thu, 5 Jun 2003 18:53:13 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
In-Reply-To: <Pine.BSF.4.53.0306051838490.27036@e0-0.zab2.int.zabbadoz.net>
Message-ID: <Pine.BSF.4.53.0306051851430.27036@e0-0.zab2.int.zabbadoz.net>
References: <3ED4C8B600002915@ocpmta1.freegates.net>
 <Pine.BSF.4.53.0306051838490.27036@e0-0.zab2.int.zabbadoz.net>
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

On Thu, 5 Jun 2003, Bjoern A. Zeeb wrote:

Hi,

> got it again. started minicom when it already waited for input.
> perhaps that's the problem...
> it's the same sequence I got last time for 1 .. 5

sorry for replying to myself but I discovered another thing:

it boots fine also with this command line ???

--- cut ---
Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: '74 00L 1X c 1Q root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.69-pa1'
Selected kernel: /boot/vmlinux-2.5.69-pa1 from partition 3
ELF32 executable
Entry 001002a0 first 00100000 n 3
Segment 0 load 00100000 size 1688080 mediaptr 0x1000
Segment 1 load 0029e000 size 307316 mediaptr 0x19e000
Segment 2 load 002ec000 size 438400 mediaptr 0x1ea000
Branching to kernel entry point 0x001002a0.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.5.69-pa1 (bz@apollo) (gcc version 3.3 20030509 (Debian prerelease)) #22 Sat May 17 16:48:19 UTC 2003
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
...
--- /cut ---


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
