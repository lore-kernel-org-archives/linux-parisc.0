Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA13871
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 13:16:51 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 4559D59C
	for <parisc-linux@thepuffingroup.com>; Fri,  3 Mar 2000 11:17:53 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id LAA02399 for <parisc-linux@thepuffingroup.com>; Fri, 3 Mar 2000 11:19:26 -0800 (PST)
Message-Id: <200003031919.LAA02399@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 03 Mar 2000 11:19:25 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] Upgrading System Firmware
List-ID: <linux-parisc.vger.kernel.org>


------- Forwarded Message

Subject: Upgrading System Firmware
To: grundler@cup.hp.com (Grant Grundler)
Date: Fri, 03 Mar 2000 12:10:30 MST

Grant,

You could forward this on to the puffin mail list ?

Thanks,
Mike

============= Upgrading System Firmware ============


Grant asked if another HP person could answer the question about
upgrading firmware.

All systems that support field upgradable firmware (flash ROMs) are 
available from the HP support web page.

Point your browser at 
    http://us-support.external.hp.com/

At some point you will need to register to get access to the firmware
update files.  It's free.

Once you have registered, from the main page select
    1) Maintenance and Support

>From this page, select
    2) Patching - Individual Patches

>From this page, select
    3) Firmware Patches

And from this page
    4) Select CPU patches checkbox and click Show Patches button

You will see the list of all firmware patches.

Note that what you will get is basically a shar file with a LIF volume
inside the shar.  You can dd this LIF image to DAT and boot the dat tape
to update, or you can put the LIF image on a bootp or install_bootp server
and update from the network.

Regards,
Mike King
king@fc.hp.com

------- End of Forwarded Message
