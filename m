Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA16133
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Sep 1999 22:45:03 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37D343BD.35EFA01A@uswest.net>
Date: Sun, 05 Sep 1999 22:31:57 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------F11139E0A376D7FCBF126122"
Subject: [parisc-linux] drivers/video/Config.in patch
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------F11139E0A376D7FCBF126122
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Hackers:

I've successfully booted my C200 with the Image-199900705 from
puffin.external.hp.com.  Now I am working on getting the cvs source to
compile so I can add to the project.

I haven't seen many patches posted to this list, so please let me know
if I didn't package the patch correctly. (I did a diff -c).

Just a small patch to get the make xconfig to work.

-Ryan


--------------F11139E0A376D7FCBF126122
Content-Type: text/plain; charset=us-ascii;
 name="Config.in.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Config.in.patch"

*** drivers/video/Config.in.orig	Sun Sep  5 22:24:19 1999
--- drivers/video/Config.in	Sun Sep  5 22:22:22 1999
***************
*** 182,188 ****
  	   "$CONFIG_FB_VIRGE" = "m" -o "$CONFIG_FB_CYBER" = "m" -o \
  	   "$CONFIG_FB_VALKYRIE" = "m" -o "$CONFIG_FB_PLATINUM" = "m" -o \
             "$CONFIG_FB_IGA" = "m" -o "$CONFIG_FB_MATROX" = "m" -o \
!            "$CONFIG_FB_CT65550" = "m" -o "$CONFIG_FB_PM2" = "m" -o
             "$CONFIG_FB_HP700" = "m" ]; then
  	define_bool CONFIG_FBCON_CFB8 m
        fi
--- 182,188 ----
  	   "$CONFIG_FB_VIRGE" = "m" -o "$CONFIG_FB_CYBER" = "m" -o \
  	   "$CONFIG_FB_VALKYRIE" = "m" -o "$CONFIG_FB_PLATINUM" = "m" -o \
             "$CONFIG_FB_IGA" = "m" -o "$CONFIG_FB_MATROX" = "m" -o \
!            "$CONFIG_FB_CT65550" = "m" -o "$CONFIG_FB_PM2" = "m" -o \
             "$CONFIG_FB_HP700" = "m" ]; then
  	define_bool CONFIG_FBCON_CFB8 m
        fi

--------------F11139E0A376D7FCBF126122--
