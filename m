Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F674482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jul 2003 09:07:30 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 19hW1f-0002d2-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jul 2003 17:04:31 +0200
Date: Tue, 29 Jul 2003 17:07:28 +0200
Message-ID: <3F1E4E740000161F@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] k-2.6.0-test2-pa1 failled to build as 64bits
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

Hi pa,

As I do not reach to boot 2.6.0-test2-pa1 in 32bits mode on my b2k, I would
try it in 64bits.

To do so I get last cvs ; make mrproper ; make defconfig.
With make menu config, I select PA8000 and 64bits kernel
(install gcc-hppa64_3.0.ds9-3 and binutils-hppa64_2.11.90.0.19.cvs1)

But make vmlinux failled with following message:
  CPIO    usr/initramfs_data.cpio
  GZIP    usr/initramfs_data.cpio.gz
  AS      usr/initramfs_data.o
usr/initramfs_data.S: Assembler messages:
usr/initramfs_data.S:29: Error: Unknown pseudo-op:  `.incbin'
make[1]: *** [usr/initramfs_data.o] Error 1
make: *** [usr] Error 2

Even if I uncheck InitRamFs support, it also failed?

(I check: it compiles well in 32 gcc-3.0 or 3.3 + __canonicalize_f_f_c patch)

Thanks in advance for further help,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
