Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id B550A482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Apr 2002 23:56:23 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Tue, 30 Apr 2002 17:58:59 +1200
Message-ID: <002a01c1f00c$1f288eb0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Subject: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel
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

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have a dual CPU L2000 and have installed the 0.9.3 release of
PA-RISC Linux and dist-upgraded to the latest unstable Debian
packages. I am running kernel 2.4.9-64, but this problem also occurs
with 2.4.17-64-smp and non-smp, and 2.4.18-64-smp and non-smp.

When I attempt to make a software RAID0 array on 3 1Gb partitions on
3 18.2gb internal SCSI disks, I get this error:

hypo:~# mkraid /dev/md0
handling MD device /dev/md0
analyzing super-block
disk 0: /dev/sdb1, 976880kB, raid superblock at 976768kB
disk 1: /dev/sdc1, 976880kB, raid superblock at 976768kB
disk 2: /dev/sdd1, 976880kB, raid superblock at 976768kB
mkraid: aborted, see the syslog and /proc/mdstat for potential clues.

Syslog says:

hypo:~# tail /var/log/syslog
Apr 30 05:36:34 hypo kernel: sys32_ioctl: Unknown cmd fd(3)
cmd(400c0910) arg(00028a44)
Apr 30 05:36:34 hypo kernel: sys32_ioctl: Unknown cmd fd(4)
cmd(400c0910) arg(bff00350)
Apr 30 05:36:34 hypo kernel: sys32_ioctl: Unknown cmd fd(4)
cmd(80480923) arg(00029390)

/proc/mdstat says:

hypo:~# cat /proc/mdstat
Personalities : [raid0]
read_ahead not set
unused devices: <none>

I've had a look through the archives and found a few posts about
32-bit to 64-bit IOCTLs but nothing seemed to specifically mention
the RAID stuff.

I also had a look in arch/parisc/kernel/ioctl32.c and there were a
couple of lines commented out with comments like "new RAID code is
half merged". Is RAID on 64-bit PA-RISC a work in progress?

Also, I have noticed that the 2nd CPU in the L2000 is always disabled
when I boot with a SMP kernel, errors like SMP: CPU3 is stuck appear
near the start of bootup. (Sorry I don't have any more detail on
these, but I can provide it if needed)

Any ideas/help would be greatly appreciated. I can provide more
details if needed.

Cheers, James

BTW: Great job on the port to PA-RISC :)

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.1.1

iQA/AwUBPM4yo1W+bhIOiSqWEQJSZQCguc5h0mrXQ7pD352VuLeZDeSJ7PkAnjdl
P8k6Y/oUEcFa8kS95ISO+xQz
=2axk
-----END PGP SIGNATURE-----
