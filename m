Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDC374829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 04:26:30 -0600 (MDT)
Message-ID: <3ED886A1.10605@tiscali.be>
Date: Sat, 31 May 2003 10:40:33 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] compiler & kernel
References: <Pine.LNX.4.44.0305301120390.11291-100000@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.44.0305301120390.11291-100000@sal.ucc.ie>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

M. Grabert wrote:

>[...]
>
>Oh yes, one important issue:
>I have this 'target suffers from tag starvation' problem as some others
>seem to have aswell. I just have a 20GB SE SCSI (50 pin), no other SCSI
>devices (the original internal UW-SCSI drive is in my AlphaStation now).
>  
>
>I tried several configurations ... actually all configurations possible.
>It is definitely NOT a SCSI termination issue, nor a faulty HD (it works
>perfectly on my SUN and my Alpha). Moreover it works quite well with
>older kernels, such as 2.4.19-pa2.
>
>Newer kernels (starting with about 2.4.20) often report "target is
>suffering from tag starvation" and after that the kernel will most likely
>oops and hang. Most the time I even can't boot the kernel, since
>mounting the root fs alone will most likely cause a kernel crash.
>Older kernels either don't display the message at all, or
>not very often (such as once a day if the disk is in HEAVY use), and the
>kernel will never crash after displaying the message.
>
>So I copied the /usr/src/linux-2.4.19-pa2/drivers/scsi/53c700.c driver
>to the corresponding directory in the 2.4.20-pa35 kernel and now the
>kernel is perfectly stable again!
>
Which scsi driver do you used (I presume a Symbios one but version 1 or 
2; version 2 is recommended now in 2.4.20-pa..)?

OTC this w-e I still experiment such a scsi terminator pb: I recover a 
lvd 30gb scsi-disk (sun); I find a converter sca2 80pins sca 64pins but 
a cable with terminator for hvd disk. The disk seems to works fine 
untill the terminator warm to much then I got scsi parity errors. And 
without terminator the controler do not see the disk at all?

>I don't know what causes this trouble, but I really don't think it's my
>SCSI hardware (I use SCSI devices for quite a long time. I should know by
>know which cables to use and how to do proper SCSI termination etc.
>Moreover I exchanged everything just to be sure it's not faulty
>cables/terminators).
>Maybe it's just the software driver, maybe it's a bug in the HP SCSI chip
>when using SE disks ... I just know the older driver is much more stable!
>  
>

>
>And finally some issues I have found when using certain versions of gcc
>to compile linux-2.4.20-pa35:
>
>(for all different compilers I used the same configuration, except for
>choosing 32/64bit kernels. I use the PA8000 CPU option by default)
>
>
>
>hppa64-gcc (3.2.3, from ftp.p-l.org unofficial-debs)
>  seems to work fine but obviously ipt_limit.o is miscompiled:
>  I can insmod it, but iptable wouldn't recognize the --limit* options.
>  There are still some problems with some modules and canonicalize_funcptr,
>
Are you sure this is with hppa64-gcc (iirc canonicalize.., was just 
recently backport to 3.2)?

[...]

>  Man, gcc-3.3 is SLOW! it takes ages to compile the kernel!
>
>  Kernel compiled with 3.3 definitely have a bogomips problem (they report
>  0.8 instead of about 470 on a C240);
>  The kernel takes forever to boot up (it 'waits' for over one minute
>  after palo loads the kernel (right after the 'switch to another console'
>  message)), propably because of the bogomips calculation.
>  Also the userspace programme 'bogomips' has the same issue.
>
>  Apart to make from this issues, gcc-3.3 produces a kernel that is at
>  least as stable as those compiled with 3.0 or 3.2
>
>
>BTW, I've quite alot of networking stuff in the kernel:
>IPv6, Bridging, VLan, PPP, PPPoE, Netfilter, Network devices etc.
>Apart from that it is a pretty 'normal' configuration (I'll send the
>.config and System.map if somebody wants it).
>
>
>Right now I'm running linux-2.4.20-pa35 for over a week now, and the
>machine is really stable. It's actively used as DHCP-server,
>SMB-server, router/firewall and for several other stuff in our LAN.
>
>  
>
hmm I just reboot (just to exchange cards) some l-w firewall (so only 
ppp, ppoe, netfilter, just ipv4, no ipv6 , no bridging, no vlan)  
running since 79days a kernel 2.4.20-pa22 build with gcc-3.3 on a b180 
and do not presenting this kind of pb. Unfortuantely, I don't have all 
your hw available but can you send me your config file so that I can see 
if I can reproduce.

btw which gcc-3.3 release do you use?
hth,
    Joel
