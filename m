Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5ABEA483C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 11:19:26 -0600 (MDT)
Message-Id: <4.3.2.7.2.20020423101440.0264d218@mira-sjc5-9.cisco.com>
Date: Tue, 23 Apr 2002 10:19:16 -0700
To: Juan Pedro Vilar <dijjvb@uib.es>,
	parisc-linux@lists.parisc-linux.org
From: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] Problem installing Debian woody in PA-RISC
  (HP9000 C100)
In-Reply-To: <5813913456.20020423154804@uib.es>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Juan Pedro,

does the machine have a wide-differential SCSI harddrive ? Then this 
applies to you :

Filesystem Corruption! Systems with NCR/LSI 53c720 Fast/Wide/Differential 
SCSI interface need to use
"ncr53c8xx=burst:3" palo boot parameter. This avoids overflowing the 
on-chip DMA FIFO which results in file
system corruption on disks behind that interface. Either edit 
/etc/palo.conf or add this manually at boot time. 2.4.16-pa14
(and newer) kernels with a "real" fix are available on our FTP site.

You need to manually give the paramter when booting from the CD. Otherwise 
all sorts of weird things happen - been there, done that ;-)

         Christian














At 03:48 PM 4/23/2002 +0200, Juan Pedro Vilar wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Hi,
>
>I've been trying to install the latest Debian woody
>release(palinux-0.9.3.iso) on a PA-RISC (HP9000 C100) and I can't get
>it
>to install the base system.
>I follow all the installation steps and everything runs smoothly
>until I
>get to the "Install base system". While installing it, I get the
>following warning "Failure trying to run:chroot /target mount" and
>then
>if I try to swap to another console and issue the same command, I get
>a
>"segmentation fault" error. When I hit the continue button, then I
>get a
>"Base Installation error, debootstrap exited with an error (return
>value
>1)" and he then asks me to install again the base system. We also
>tried
>to skip this step the second time and everything seem to worked but
>the
>system was, of course, not usable after that as some packages were
>missing and we were getting plenty of segmentation faults.
>The machine has no special hardware added and we think we have
>followed
>all the steps from the installation guide. We have also browsed the
>web
>looking for this problem and we've found no reference.
>Are we missing something? Any hints anybody?
>thanks in advance,
>
>
>
>- --
>Saludos,
>  Juan Pedro                         mailto:dijjvb@uib.es
>
>-----BEGIN PGP SIGNATURE-----
>Version: PGP 6.5i
>
>iQA/AwUBPMVYDmh0yy+67OVzEQKudQCgwtfl6+6zSEfLP6E6JEq1Rp3DOEsAn1Fa
>wtegncIohNFq3nHiJ8BHQz1w
>=hCMK
>-----END PGP SIGNATURE-----
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
