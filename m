Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.southpole.se (unknown [213.212.2.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2BDD482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 04:09:22 -0600 (MDT)
From: Jakob Sandgren <jakob@southpole.se>
Date: Thu, 19 Jul 2001 12:09:11 +0200
To: parisc-linux@lists.parisc-linux.org
Cc: Anders Nystrom <andesr@southpole.se>
Message-ID: <20010719120911.C6908@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Installation success on C200
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I would just like to report that we have installed the 0.9.1 distro on
a C200 without any problems at all! It defaulted to the 32bit kernel,
we will try to build a new kernel with 64 bit support.

Great work with the distribution!! 

Some minor(?) bugs discovered so far:
* After the reboot during the last stage of installation we got a
  corrupted filesystem and some files ended up in lost+found.
* cat /proc/interupts gives an oops and hangs the system
* cat /dev/dsp gives an oops and hangs the system

A question;
during boot the firmware complains about that the memory is not
installed for "optimal performance". Do anyone know what to do about
this?


Let me know if someone would like to use this machine for autobuiling
etc, it has 512MB RAM and a good access to the Internet. 

/Jakob
-- 
Jakob Sandgren                  South Pole AB
Phone:  +46 8 51420420          Gelbjutarvägen 5
Fax:    +46 8 51420429          SE - 17148 Solna 
e-mail: jakob@southpole.se      www.southpole.se
