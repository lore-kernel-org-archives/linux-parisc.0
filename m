Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F8C2485F
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 07:26:16 -0700 (MST)
Subject: Re: [parisc-linux] evms-0.9.1 && hppa (follow ...)
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OF0AD397FF.17ED40BE-ONC1256B75.004D4BB9@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Thu, 7 Mar 2002 15:32:31 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
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

Hello Grant,

Thanks a lot.

I am not quiet sure to be absolutely right but for a first test, I only
change "user_parms->buffer_address" by "tmp.buffer_address"
and the system does not anymore crashes:

--ldev_mgr: scsi: Channel =3D 0, Id =3D 6, Lun =3D 0, Capacity =3D 17773524
--ldev_mgr: scsi: Channel =3D 0, Id =3D 3, Lun =3D 0, Capacity =3D 4194685
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp7pp.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp8; io_size=3D271570960.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp8; rc=3D0.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp9; rc=3D0.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp10.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp11.
evms_vgscan(267): unaligned access to 0x00022efe at ip=3D0x40207d8f
--ldev_mgr: unrecognized device major : 58

--ldev_mgr: unrecognized device major : 9
--ldev_mgr: found SCSI major : 66 - searching for disks
--ldev_mgr: scsi: major name =3D sd
--ldev_mgr: scsi: number of real devices =3D 0


--ldev_mgr: found SCSI major : 65 - searching for disks
--ldev_mgr: scsi: number of real devices =3D 0
--ldev_mgr: found SCSI major : 8 - searching for disks
--ldev_mgr: scsi: major name =3D sd
--ldev_mgr: scsi: number of real devices =3D 3
--ldev_mgr: scsi: Channel =3D 0, Id =3D 5, Lun =3D 0, Capacity =3D 17773524
--ldev_mgr: scsi: Channel =3D 0, Id =3D 6, Lun =3D 0, Capacity =3D 17773524
--ldev_mgr: scsi: Channel =3D 0, Id =3D 3, Lun =3D 0, Capacity =3D 4194685
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp7pp.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp8; io_size=3D271570960.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp8; rc=3D0.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp9; rc=3D0.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp10.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp11.

As you can see it is not yes perfect because: "evms_vgscan(267): unaligned
access to 0x00022efe at ip=3D0x40207d8f"
and also logs a lot of data page fault:

Mar  7 14:56:03 palinux kernel: do_page_fault() pid=3D267 command
=3D'evms_vgscan' type=3D15 address=3D0x00000000
Mar  7 14:56:03 palinux kernel:
Mar  7 14:56:03 palinux kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Mar  7 14:56:03 palinux kernel: PSW: 00000000000001101111111100001111 Not
tainted
Mar  7 14:56:03 palinux kernel: r00-03  00000000 40070db4 4020910b faf00a80
Mar  7 14:56:03 palinux kernel: r04-07  4008572c 00000000 00000000 00024b00
Mar  7 14:56:03 palinux kernel: r08-11  40240174 000c0e10 000cdc20 000cdae0
Mar  7 14:56:03 palinux kernel: r12-15  00000000 000cdc30 00000000 00000000
Mar  7 14:56:03 palinux kernel: r16-19  00000000 000b2408 00017800 4008572c
Mar  7 14:56:03 palinux kernel: r20-23  40027392 40084dc4 4005f750 4023fc94
Mar  7 14:56:03 palinux kernel: r24-27  00000000 40070db4 00000009 00021b78
Mar  7 14:56:03 palinux kernel: r28-31  00000004 4022b7d4 faf00c40 4020910b
Mar  7 14:56:03 palinux kernel: sr0-3   000003c7 000003c7 00000000 000003c7
Mar  7 14:56:03 palinux kernel: sr4-7   000003c7 000003c7 000003c7 000003c7
Mar  7 14:56:03 palinux kernel:
Mar  7 14:56:03 palinux kernel: IASQ: 000003c7 000003c7 IAOQ: 4005f79b
4005f79f
Mar  7 14:56:03 palinux kernel:  IIR: 0ca01086    ISR: 000003c7  IOR:
00000000
Mar  7 14:56:03 palinux kernel:  CPU:        0   CR30: 16568000 CR31:
10398000
Mar  7 14:56:03 palinux kernel:  ORIG_R28: 00000000

But that is in user space and there gdb (or ddd) will help me.
I will transmit your discover to Kevin it will certainly also help for
i386.

Humm ... have you an idea why this problem did not appears for this i386 or
ppc (the two official supported till now)?

Thanks again for great help,
  Joel

PS: about "getting stack unwinds for problems like this would be really
nice...(hint hint)"
is there somewhere something like which could be modified to hppa (I do not
have a wide skill in programing in user space and none in kernel space, so
I am not sure to be helpfull)



                                                                           =
                                          =20
                    Grant Grundler                                         =
                                          =20
                    <grundler@dsl2.extern        To:     "Jo=EBl Soete" <js=
o@europay.com>                              =20
                    al.hp.com>                   cc:     parisc-linux@lists=
.parisc-linux.org                         =20
                                                 Subject:     Re: [parisc-l=
inux] evms-0.9.1 && hppa (follow ...)     =20
                    06-03-02 11:19 PM                                      =
                                          =20
                                                                           =
                                          =20
                                                                           =
                                          =20




"=3D?iso-8859-1?Q?Jo=3DEBl_Soete?=3D" wrote:

>           printk(KERN_ERR "--evms: %s, %s call, ckp7p: io_sector_offset
> =3D%llu.\n", __FILE__ , __FUNCTION__, io_sector_offset );
>           user_buffer_ptr =3D user_parms->buffer_address;
>           printk(KERN_ERR "--evms: %s, %s call, ckp7pp.\n", __FILE__ ,
> __FUNCTION__ );
....

> So it seems to failled on the assignement: "user_buffer_ptr =3D
> user_parms->buffer_address;" . That is over my understanding without much
> help. Any idea ?

Could it be that "user_parms->buffer_address" should really be
"tmp->buffer_address"?

Just wondering if the copy_from_user() higher up in the code means
arg points to something in userspace. getting stack unwinds
for problems like this would be really nice...(hint hint)

grant






**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
