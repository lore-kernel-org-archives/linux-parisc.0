Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tomir.uib.es (tomir.uib.es [130.206.33.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E18E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 07:49:00 -0600 (MDT)
Received: from aisci11 ([130.206.77.217]) by clust.uib.es (PMDF V5.2-33 #30169)
 with ESMTP id <01KGWPOLJTOK000W3G@clust.uib.es> for
 parisc-linux@lists.parisc-linux.org; Tue, 23 Apr 2002 15:48:49 +0200
Date: Tue, 23 Apr 2002 15:48:04 +0200
From: Juan Pedro Vilar <dijjvb@uib.es>
To: parisc-linux@lists.parisc-linux.org
Reply-To: Juan Pedro Vilar <dijjvb@uib.es>
Message-id: <5813913456.20020423154804@uib.es>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem installing Debian woody in PA-RISC (HP9000 C100)
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

Hi,

I've been trying to install the latest Debian woody
release(palinux-0.9.3.iso) on a PA-RISC (HP9000 C100) and I can't get
it
to install the base system.
I follow all the installation steps and everything runs smoothly
until I
get to the "Install base system". While installing it, I get the
following warning "Failure trying to run:chroot /target mount" and
then
if I try to swap to another console and issue the same command, I get
a
"segmentation fault" error. When I hit the continue button, then I
get a
"Base Installation error, debootstrap exited with an error (return
value
1)" and he then asks me to install again the base system. We also
tried
to skip this step the second time and everything seem to worked but
the
system was, of course, not usable after that as some packages were
missing and we were getting plenty of segmentation faults.
The machine has no special hardware added and we think we have
followed
all the steps from the installation guide. We have also browsed the
web
looking for this problem and we've found no reference.
Are we missing something? Any hints anybody?
thanks in advance,



- --
Saludos,
 Juan Pedro                         mailto:dijjvb@uib.es


-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5i

iQA/AwUBPMVYDmh0yy+67OVzEQKudQCgwtfl6+6zSEfLP6E6JEq1Rp3DOEsAn1Fa
wtegncIohNFq3nHiJ8BHQz1w
=hCMK
-----END PGP SIGNATURE-----
