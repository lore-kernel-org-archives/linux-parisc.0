Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 76DB0482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Feb 2002 12:21:10 -0700 (MST)
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 3 Feb 2002 20:15:13 +0100
MIME-Version: 1.0
Message-Id: <200202032015.13091.deller@gmx.de>
Subject: [parisc-linux] SOLVED: HIL keyboard problems
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

Hi list,

I've found a solution for the problem with the not-working "i" and "o"
keys on HIL keyboards and X11.

Just grab the files
ftp://ftp.parisc-linux.org/XFree86/HILkeyb/hp
ftp://ftp.parisc-linux.org/XFree86/HILkeyb/hp.lst
and store both to /etc/X11/xkb/rules

Then change your keyboard definition section in
/etc/X11/XF86Config-4 to contain the following lines

        Option          "XkbRules"      "hp"
        Option          "XkbModel"      "hphil"        
	Option          "CustomKeycodes" "yes"

and maybe:
       Option          "XkbLayout"     "de"
with "de" replaced for your language in case you have
a non-US keyboard.
btw, the CustomKeycodes = yes option does the real trick here.

Alternately you may also fetch my XF86Config-4
from ftp://ftp.parisc-linux.org/XFree86/HILkeyb/XF86Config-4
and just change the Screen-section to match your display.
Please note: My XF86Config-4 is configured to use a Microsoft 
compatible serial mouse on /dev/ttyS1 (serial port 2). 
The HIL mouse is still not supported!

Regards,
Helge
