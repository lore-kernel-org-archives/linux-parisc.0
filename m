Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 345004829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 09:56:11 -0600 (MDT)
Date: Wed, 25 Sep 2002 17:56:08 +0200
Message-ID: <3D8F011400000BEB@ocpmta2.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Failure when compile 2.4.19-pa20
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

Hi all,

I got USB part of .config from debian-configs/32 (I work on a b180) and try
to compile 2.4.19-pa20 but it failled:

`gcc -print-libgcc-file-name` /usr/src/linux-2.4.19/arch/parisc/lib/lib.a
/usr/src/linux-2.4.19/lib/lib.a  \
        --end-group \
        -o vmlinux
drivers/usb/usbdrv.o: In function `hidinput_hid_event':
drivers/usb/usbdrv.o(.text.hidinput_hid_event+0x80): undefined reference
to `input_event'
drivers/usb/usbdrv.o(.text.hidinput_hid_event+0xb0): undefined reference
to `input_event'
drivers/usb/usbdrv.o: In function `.L951':
drivers/usb/usbdrv.o(.text.hidinput_hid_event+0xfc): undefined reference
to `input_event'
drivers/usb/usbdrv.o: In function `.L939':
drivers/usb/usbdrv.o(.text.hidinput_hid_event+0x13c): undefined reference
to `input_event'
drivers/usb/usbdrv.o: In function `.L959':
drivers/usb/usbdrv.o(.text.hidinput_hid_event+0x174): undefined reference
to `input_event'
drivers/usb/usbdrv.o(.text.hidinput_hid_event+0x1ac): more undefined references
to `input_event' follow
drivers/usb/usbdrv.o: In function `hidinput_connect':
drivers/usb/usbdrv.o(.text.hidinput_connect+0x16c): undefined reference to
`input_register_device'
drivers/usb/usbdrv.o: In function `hidinput_disconnect':
drivers/usb/usbdrv.o(.text.hidinput_disconnect+0x10): undefined reference
to `input_unregister_device'
make: *** [vmlinux] Error 1

Well, I do not need USB for this HW so I will remove for next try.

HTH,

Joel
