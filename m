Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id E11694829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 May 2003 06:10:22 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h4UCAI624633
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 May 2003 13:10:20 +0100
Date: Fri, 30 May 2003 13:10:17 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0305301120390.11291-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] compiler & kernel
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

Hi,

I just wanted to share the experience I made after experimenting with
different compilers and linux-2.4.20-pa35 on Debian/testing on a C240.
Maybe it's of some use for you or somebody has some remarks how to
solve an issue or whether it's just me who has problems ;)
This is not a request for fixing things, I'm just curious whether
developers/users had similar problems and/or are aware of them.


Some general problems:


I use quite a lot of additional non-HP hardware in my C240:

I'm using a 4port USB2.0-card, a IBM Token Ring card, (soon hopefully a
NetGEAR MA311 Wireless NIC) and a 8193too-compatible Network card)

So far I can only use USB1.1 drivers, since the EHCI code seems to
dislike parisc (kernel oops with any compiler).

Another general problem (which exists as far as I can remember):

It also seems that I can only use drivers for hardware if they are
directly compiled into the kernel, since otherwise 'lspci -v' will
show ioports/memory for devices marked as 'disabled' and trying to
modprobe h/w driver modules will fail.
Modules not accessing the hardware directly however work fine.



Oh yes, one important issue:
I have this 'target suffers from tag starvation' problem as some others
seem to have aswell. I just have a 20GB SE SCSI (50 pin), no other SCSI
devices (the original internal UW-SCSI drive is in my AlphaStation now).

I tried several configurations ... actually all configurations possible.
It is definitely NOT a SCSI termination issue, nor a faulty HD (it works
perfectly on my SUN and my Alpha). Moreover it works quite well with
older kernels, such as 2.4.19-pa2.

Newer kernels (starting with about 2.4.20) often report "target is
suffering from tag starvation" and after that the kernel will most likely
oops and hang. Most the time I even can't boot the kernel, since
mounting the root fs alone will most likely cause a kernel crash.
Older kernels either don't display the message at all, or
not very often (such as once a day if the disk is in HEAVY use), and the
kernel will never crash after displaying the message.

So I copied the /usr/src/linux-2.4.19-pa2/drivers/scsi/53c700.c driver
to the corresponding directory in the 2.4.20-pa35 kernel and now the
kernel is perfectly stable again!
I don't know what causes this trouble, but I really don't think it's my
SCSI hardware (I use SCSI devices for quite a long time. I should know by
know which cables to use and how to do proper SCSI termination etc.
Moreover I exchanged everything just to be sure it's not faulty
cables/terminators).
Maybe it's just the software driver, maybe it's a bug in the HP SCSI chip
when using SE disks ... I just know the older driver is much more stable!


And finally some issues I have found when using certain versions of gcc
to compile linux-2.4.20-pa35:

(for all different compilers I used the same configuration, except for
choosing 32/64bit kernels. I use the PA8000 CPU option by default)



hppa64-gcc (3.2.3, from ftp.p-l.org unofficial-debs)
  seems to work fine but obviously ipt_limit.o is miscompiled:
  I can insmod it, but iptable wouldn't recognize the --limit* options.
  There are still some problems with some modules and canonicalize_funcptr,
  (IIRC networking VLAN support, TUN/TAP, zlib_deflate), but when
  compiled into the kernel (not compiled as modules) they seems to work

  Also some stability issues:
  Ie. wmrack makes the kernel crash immeadiately (no kernel Oops output),
  xosview doesn't work (no windows opened)

gcc-3.0
  still propably the recommended compiler, no problems!
  IIRC I still used the PA7000 CPU setting when compiling with gcc-3.0
  at that time

gcc-3.2.3
  I don't recall having the same issues in ipt_limit.o that the 64bit
  version of gcc-3.2.3 has, everythink seems to work quite well. compiling
  the kernel is slower than gcc-3.0

gcc-3.3
  compiled fine after commenting out the references $mulU in parisc_ksyms.c
  and fixing drivers/net/tokenring/olympic.c (yes, some people still use
  tokenring!):
     - type cast error in the use of memcpy_fromio, casting the parameter
       to ulong works
     - one text string spread over two lines, but without a '\' at the end.

  Man, gcc-3.3 is SLOW! it takes ages to compile the kernel!

  Kernel compiled with 3.3 definitely have a bogomips problem (they report
  0.8 instead of about 470 on a C240);
  The kernel takes forever to boot up (it 'waits' for over one minute
  after palo loads the kernel (right after the 'switch to another console'
  message)), propably because of the bogomips calculation.
  Also the userspace programme 'bogomips' has the same issue.

  Apart to make from this issues, gcc-3.3 produces a kernel that is at
  least as stable as those compiled with 3.0 or 3.2


BTW, I've quite alot of networking stuff in the kernel:
IPv6, Bridging, VLan, PPP, PPPoE, Netfilter, Network devices etc.
Apart from that it is a pretty 'normal' configuration (I'll send the
.config and System.map if somebody wants it).


Right now I'm running linux-2.4.20-pa35 for over a week now, and the
machine is really stable. It's actively used as DHCP-server,
SMB-server, router/firewall and for several other stuff in our LAN.



Thanks, Max
