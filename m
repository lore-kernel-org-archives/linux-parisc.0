Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe32.law4.hotmail.com [216.33.148.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 55550482C
	for <parisc-linux@parisc-linux.org>; Tue, 23 Jul 2002 07:51:59 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: <parisc-linux@parisc-linux.org>
Date: Tue, 23 Jul 2002 15:51:57 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0080_01C23260.DFA6B950"
Message-ID: <OE32H8BX2vRxFmNHYus00008028@hotmail.com>
Subject: [parisc-linux] unresoved symbols when doing a make modules_install
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

This is a multi-part message in MIME format.

------=_NextPart_000_0080_01C23260.DFA6B950
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,

Today I "baked" myself a new kernel (2.4.18-pa56). After upgrading my box
(using apt-get), INIT was dying upon startup with an "unaligned access"
error. Anyway, all is working well (even the soft-power button), but I am
getting an "unresolved symbols"-error when doing a "make modules_install"
(see attached file). Yes, I copied the System.map to
/boot/System.map-2.4.18-pa56 and created a symbolic link to this file. Any
ideas?

Many thanks in advance.


regards,

Kenneth

------=_NextPart_000_0080_01C23260.DFA6B950
Content-Type: application/octet-stream;
	name="make_modules.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="make_modules.log"

make -C  kernel modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/kernel'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/kernel'=0A=
make -C  drivers modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers'=0A=
make -C block modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/block'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/block'=0A=
make -C cdrom modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/cdrom'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/cdrom'=0A=
make -C char modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/char'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/char'=0A=
make -C hotplug modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/hotplug'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/hotplug'=0A=
make -C media modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/media'=0A=
make -C radio modules_install=0A=
make[3]: Entering directory =
`/usr/src/linux-2.4.18-pa56/drivers/media/radio'=0A=
make[3]: Nothing to be done for `modules_install'.=0A=
make[3]: Leaving directory =
`/usr/src/linux-2.4.18-pa56/drivers/media/radio'=0A=
make -C video modules_install=0A=
make[3]: Entering directory =
`/usr/src/linux-2.4.18-pa56/drivers/media/video'=0A=
make[3]: Nothing to be done for `modules_install'.=0A=
make[3]: Leaving directory =
`/usr/src/linux-2.4.18-pa56/drivers/media/video'=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/media'=0A=
make -C misc modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/misc'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/misc'=0A=
make -C net modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/net'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/net'=0A=
make -C parport modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/parport'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/parport'=0A=
make -C scsi modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/scsi'=0A=
mkdir -p /lib/modules/2.4.18-pa56/kernel/drivers/scsi/=0A=
cp ppa.o /lib/modules/2.4.18-pa56/kernel/drivers/scsi/=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/scsi'=0A=
make -C sound modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/sound'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/sound'=0A=
make -C video modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/drivers/video'=0A=
make -C sti modules_install=0A=
make[3]: Entering directory =
`/usr/src/linux-2.4.18-pa56/drivers/video/sti'=0A=
make[3]: Nothing to be done for `modules_install'.=0A=
make[3]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/video/sti'=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers/video'=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/drivers'=0A=
make -C  mm modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/mm'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/mm'=0A=
make -C  fs modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/fs'=0A=
make -C nls modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/fs/nls'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/fs/nls'=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/fs'=0A=
make -C  net modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/net'=0A=
make -C ipv4 modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/net/ipv4'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/net/ipv4'=0A=
make -C netlink modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/net/netlink'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/net/netlink'=0A=
make -C sched modules_install=0A=
make[2]: Entering directory `/usr/src/linux-2.4.18-pa56/net/sched'=0A=
make[2]: Nothing to be done for `modules_install'.=0A=
make[2]: Leaving directory `/usr/src/linux-2.4.18-pa56/net/sched'=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/net'=0A=
make -C  ipc modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/ipc'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/ipc'=0A=
make -C  lib modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/lib'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/lib'=0A=
make -C  arch/parisc/tools modules_install=0A=
make[1]: Entering directory =
`/usr/src/linux-2.4.18-pa56/arch/parisc/tools'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/arch/parisc/tools'=0A=
make -C  arch/parisc/kernel modules_install=0A=
make[1]: Entering directory =
`/usr/src/linux-2.4.18-pa56/arch/parisc/kernel'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory =
`/usr/src/linux-2.4.18-pa56/arch/parisc/kernel'=0A=
make -C  arch/parisc/mm modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/arch/parisc/mm'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/arch/parisc/mm'=0A=
make -C  arch/parisc/lib modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/arch/parisc/lib'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/arch/parisc/lib'=0A=
make -C  arch/parisc/hpux modules_install=0A=
make[1]: Entering directory `/usr/src/linux-2.4.18-pa56/arch/parisc/hpux'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory `/usr/src/linux-2.4.18-pa56/arch/parisc/hpux'=0A=
make -C  arch/parisc/math-emu modules_install=0A=
make[1]: Entering directory =
`/usr/src/linux-2.4.18-pa56/arch/parisc/math-emu'=0A=
make[1]: Nothing to be done for `modules_install'.=0A=
make[1]: Leaving directory =
`/usr/src/linux-2.4.18-pa56/arch/parisc/math-emu'=0A=
cd /lib/modules/2.4.18-pa56; \=0A=
mkdir -p pcmcia; \=0A=
find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} =
pcmcia=0A=
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.18-pa56; =
fi=0A=
depmod: *** Unresolved symbols in =
/lib/modules/2.4.18-pa56/kernel/drivers/scsi/ppa.o=0A=
depmod: 	outsb=0A=
depmod: 	outsl=0A=
depmod: 	insb=0A=
depmod: 	insl=0A=
make: *** [_modinst_post] Error 1=0A=

------=_NextPart_000_0080_01C23260.DFA6B950--
