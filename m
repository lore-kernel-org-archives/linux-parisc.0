Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA25962
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 18:38:16 -0600
Received: from buttafuoco.org (p2.buttafuoco.net [192.1.3.2])
	by p2.buttafuoco.net (8.9.3/8.9.3) with ESMTP id UAA20357
	for <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 20:38:00 -0400
Sender: jim@p2.buttafuoco.net
Message-ID: <39EE4267.4E4B96B8@buttafuoco.org>
Date: Wed, 18 Oct 2000 20:37:59 -0400
From: Jim Buttafuoco <jim@buttafuoco.org>
Reply-To: jim@buttafuoco.org
MIME-Version: 1.0
To: PARISC-LINUX Mailing List <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=UTF-8
Subject: [parisc-linux] netboot a 9000/710
List-ID: <linux-parisc.vger.kernel.org>

I have 2 9000/710 diskless workstations that seem to be working.  Now I
would like to get them to netboot.  I have downloaded rbootd and
compilied and configured (images are in /u03/hp/rbootd) it.  I have also
downloaded the latest Image and nfsroot files.

The rbootd seems to get a request (debug output at end of email) but the
systems doesn't see any boot devices after the "search" is complete.
What am I doing wrong,  is the procedure documented anywhere???

Thanks
Jim

>cat /etc/rbootd.conf
08:00:09:25:dd:7b            LINUX

>ls /u03/hp/rbootd/
LINUX            <<--- This is the kernel image I downloaded.  I didn't
know what else to do with it...


DEBUG OUTPUT
----------------------------------------------------
<<< 17:23:11.063816   Addr: 08:00:09:25:dd:7b   Intf: eth0
        802.2 LLC: DSAP:f8 SSAP:f8 CTRL:300
        HP Ext:    DXSAP:608 SXSAP:609
        Boot Request: (Send Server ID)
                RetCode:0 SeqNo:0 SessID:ffff Vers:2
                Machine Type: HPS700
                File Name (0): <>

<<< 17:26:06.884908   Addr: 08:00:09:25:dd:7b   Intf: eth0
        802.2 LLC: DSAP:f8 SSAP:f8 CTRL:300
        HP Ext:    DXSAP:608 SXSAP:609
        Boot Request: (Send Server ID)
                RetCode:0 SeqNo:0 SessID:ffff Vers:2
                Machine Type: HPS700
                File Name (0): <>
