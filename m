Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gw-nl5.philips.com (unknown [212.153.235.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D8334853
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Apr 2003 06:49:40 -0600 (MDT)
From: joachim.weller@philips.com
To: =?iso-8859-1?Q?J=F6rg_Benndorf?= <joerg.benndorf@t-online.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] cannot install (shellutils)
Message-ID: <OF67C87243.4AA56CF6-ONC1256D17.0044AF0F@diamond.philips.com>
Date: Tue, 29 Apr 2003 14:50:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Joerg,

>>When installing debian on a hp-9000 712/80 the below warning shows up:
>>
>>"file:/instmnt/pool/main/s/shellutils/shellutils=5F2.0.11-11=5Fhppa.deb w=
as
corrupt"
>><continue>
>>"Couldn't download shellutils" <continue>

>Umm as I install successfuly 3.0r0 (and iirc in the list somebody else=20
reach
>to intall 3.0r1), I do suspect that the pb should be somewhere in the way
>you proceded to burn your cdrom.

>First of all, check the md5sum checksum of the image you download (very=20
usefull
>for big files).
If the downloaded image shows correct md5sum, I would recommend checking=20
your
burned CDROM for equal md5sum:
dd if=3D/dev/cdrom bs=3D8192|md5sum

change "/dev/cdrom" to your correct cdrom device and don't interrupt,
this may take considerable time without showing any activity, depending
on the drive speed.

Sometimes, not all cdrom raw discs are recognized well in all
drives. Changing manufacturer/type may help.

A way to prove that the cdrom drive in question reads your burned cdrom
correctly, might be to attach the drive to a (linux) pc with scsi IF and
run the same command there. Older drives tend to accumulate dust in the
optical path, wich might cause reading problems as well, and sometimes
are not well designed for modern cdrom raw material. Maybe you can
attach a more recent scsi drive to your hp-9000.
=20
hth,
      Joachim


Joachim Weller

Philips Medizin Systeme Boeblingen GmbH
Cardiac and Monitoring Systems (CMS) /New Product Engineering=20
Phone: {+49|0}-7031-463-1891
Fax:   {+49|0}-7031-463-2112
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F
Gesch=E4ftsf=FChrer: Dr. Werner Haas, David Russell, Wolfgang Strenzl=20
(Sprecher)
Sitz der Gesellschaft: B=F6blingen Registergericht B=F6blingen Reg.-Nr. HRB=
=20
5187=20
Hewlett-Packard Str. 2, D 71034 Boeblingen      -GERMANY-
