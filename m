From: Helge Deller <deller@gmx.de>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Fri, 20 Apr 2018 08:37:14 +0200
Message-ID: <2847ef55-b5b1-1867-df6a-ad5ce224abd4@gmx.de>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: debian-hppa@lists.debian.org, linux-parisc
 <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: Frank Scheiner <frank.scheiner@web.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
Resent-Message-ID: <QJ1n6n06xCF.A.jaH.xqY2aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/2847ef55-b5b1-1867-df6a-ad5ce224abd4@gmx.de

On 19.04.2018 21:29, Frank Scheiner wrote:
>>> Apart from the rp3440 - and maybe also the 712/80 which showed some issue with it's built-in NIC after netbooting the Linux kernel and the OS
>>
>> What kind of problems?
> 
> Unfortunately I seem to not have made any notes for the issue with the 712/80, so I retried with the assumed issue creating configuration earlier this week:
> 
> This configuration was using a Debian Linux kernel 4.9.25-1 (4.9.0-3-parisc from 2017-05-02). And when netbooting it, shortly after login the machine seems to loose contact to the NFS server:
> 
> ```
> [...]
> [  OK  ] Started Serial Getty on ttyS0.
> [  OK  ] Started Getty on tty1.
> [  OK  ] Reached target Login Prompts.
> 
> Debian GNU/Linux buster/sid hp-712 ttyS0
> 
> hp-712 login: root
> Password:
> Last login: Thu Sep 18 11:30:50 CET 1902 from 172.16.1.1 on pts/0
> Linux hp-712 4.9.0-3-parisc #1 Debian 4.9.25-1 (2017-05-02) parisc
> 
> The programs included with the Debian GNU/Linux system are free software;
> the exact distribution terms for each program are described in the
> individual files in /usr/share/doc/*/copyright.
> 
> Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
> permitted by applicable law.
> 
> [  232.973913] nfs: server 172.16.0.2 not responding, still trying
> [  233.094265] nfs: server 172.16.0.2 not responding, still trying
> [  233.205127] nfs: server 172.16.0.2 not responding, still trying
> [  233.568429] nfs: server 172.16.0.2 not responding, still trying
> [  233.692383] nfs: server 172.16.0.2 not responding, still trying
> [  233.808818] nfs: server 172.16.0.2 not responding, still trying
> [...]
> [  235.179253] nfs: server 172.16.0.2 OK
> [  235.251896] nfs: server 172.16.0.2 not responding, still trying
> [...]
> ```
> 
> Although it seems to be able to reconnect from time to time, the machine is not accessible.
> 
> Afterwards I found some older notes about this machine which mention
> no issues during diskless operation with the very same configuration
> (kernel and possibly also userland), which made me wonder, if there's
> maybe an issue between the machine's built-in NIC and my used 1000
> Mbit network switch. And indeed, when connecting another 100 Mbit
> network switch in between the 712/80 and the 1000 Mbit network switch
> the issue seemed to be gone and the machine stayed accessible .
> 
> But later this week I retried the 712/80 with the current Linux
> kernel (4.15.x) and Debian userland and the issue hit me again,
> although much later and despite the 100 Mbit network switch in
> between. Looking at it I could see that the collision indicator was
> active on the switch for the port used by the 712/80. I then
> configured a singular port of the 1000 Mbit network switch to 10 Mbit
> full duplex and attached the 712/80 to it. And then the issue again
> seemed to be gone. But trying to install a package or updating the
> package cache again quickly triggered it. Well that's not that of an
> issue, as I can do the package management for the 712/80 with another
> machine (e.g. c8000).
> 
> Also interesting, the kernel messages for 4.15.11, please notice the
> time difference between "random: crng init done" and "Key type
> asymmetric registered":
Seems to be a generic issue.
https://www.linuxquestions.org/questions/showthread.php?p=5803405#post5803405

My assumption is, that the kernel waits until it has
enough randomness for the various encryption algorithms. 

> 
> ```
> [    0.000000] Linux version 4.15.0-2-parisc (debian-kernel@lists.debian.org) (gcc version 7.3.0 (Debian 7.3.0-12)) #1 Debian 4.15.11-1 (2018-03-20)
> [    0.000000] unwind_init: start = 0x1086e8b4, end = 0x108c5644, entries = 22233
> [    0.000000] FP[0] enabled: Rev 1 Model 13
> [    0.000000] The 32-bit Kernel has started...
> [...]
> [    9.919844] workingset: timestamp_bits=14 max_order=15 bucket_order=1
> [   10.168866] zbud: loaded
> [   56.112387] random: crng init done
> [  433.392379] Key type asymmetric registered
> [  433.445502] Asymmetric key parser 'x509' registered
> [...]
> [  544.565451] systemd[1]: Detected architecture parisc.
> 
> Welcome to Debian GNU/Linux buster/sid!
> [...]
> [  OK  ] Started Serial Getty on ttyS0.
> [  OK  ] Started Getty on tty1.
> [  OK  ] Reached target Login Prompts.
> 
> Debian GNU/Linux buster/sid hp-712 ttyS0
> 
> hp-712 login:
> 
> ```
> 
> ...On first try I assumed the machine or the kernel would hang, but no, it was still working all the time.
> 
> Today I tested it again (with 4.15.11) and the issue this time hit me already during login, after I entered the username.
> 
> So I'm actually back at where I'm started. :-(
> 
> I suspect that maybe the built-in 82596 NIC cannot cope with the
> amount of traffic that happens during diskless operation - although I
> then wonder why it doesn't have a problem during the TFTP operation
> to load the lifimage.
When loading via TFTP not much traffic is generated.

> Next thing I'll examine will be the parameters used for the NFS mount
> (especially for rsize and wsize) - if I ever can login to it again
> :-). And maybe a fan for the passive heat sink of the CPU which gets
> quite hot during operation.
> 
> Any suggestions on where to look else?

Not really.


> 
> ****
> 
> For the rp3440 I (also) have to retract my earlier statement as it
> looks like my second rp3440 actually **works** diskless. I have to
> retest with my first rp3440 (currently in storage) as it seems it
> behaves differently in this regard - or maybe I misconfigured
> something there in the past. I have to recheck.
> 
> But for my second rp3440 I still had to blacklist the `radeon` module
> to achieve this, as otherwise the system (console) seems to crash
> shortly before the login prompt would have appeared or just after.
> This is my used kernel command line as configured with palo 1.99 and
> Linux 4.14.x:
> 
> ```
> Current command line:
> 0/vmlinux HOME=/ root=/dev/nfs ip=:::::enp32s2:dhcp modprobe.blacklist=radeon initrd=0/ramdisk TERM=vt102 console=ttyS0
>  0: 0/vmlinux
>  1: HOME=/
>  2: root=/dev/nfs
>  3: ip=:::::enp32s2:dhcp
>  4: modprobe.blacklist=radeon
>  5: initrd=0/ramdisk
>  6: TERM=vt102
>  7: console=ttyS0
> ```
> 
> Interestingly after upgrading all packages (obviously including palo)
> on the NFS root FS and building a new lifimage with Linux 4.15.x,
> blacklisting the radeon module seems to be no longer required. Not
> sure if this is due to palo 2.00 or Linux 4.15.x. Anyways the radeon
> module is no longer loaded automatically with this configuration.

There were two issues fixed regarding rp3440.
1. The radeon module on the management board is automatically
disabled by the Linux kernel. This fixes crashes/hangs.
2. The serial port on the management board is disabled by the
Linux kernel.
-> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bcf3f1752a622f1372d3252d0fea8855d89812e7

Older versions of palo tried to work around problem #2 by 
giving kernel parameter "console=ttyS1" to the Linux kernel when
booting.
So, since you upgraded palo and kernel both workarounds aren't
necessary any longer and rp-class machines should work without
any further quirks.

Helge
