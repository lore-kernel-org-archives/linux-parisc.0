Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D0AAB4846
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Jun 2002 11:34:10 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 30 Jun 2002 19:33:43 +0200
MIME-Version: 1.0
Message-Id: <200206301931.58043.deller@gmx.de>
Content-Type: text/plain;
  charset="us-ascii"
Subject: [parisc-linux] HOWTO: Using HIL keyboard and HIL mouse on PARISC
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

starting with the PARISC CVS kernel 2.4.18-pa45 I've switched the kernel 
configuration to use the new HIL drivers by default.
The new HIL drivers were written by Brian S. Julin and I mostly only did some
bugfixing, cleanups and re-integration/re-organization  into our CVS kernel.

Features of the new HIL drivers are:
1. support for HIL mice,
2. support for HIL tablets
3. support for HIL keyboards
4. based on the Linux Input driver model !

Since the new HIL drivers use the standard Linux input interface, 
HIL devices can now be used and set up in the same way as it's done
with USB devices on intel platforms.
For further documentation on the Linux input interface please see:
http://cvs.parisc-linux.org/linux/Documentation/input/input.txt?rev=HEAD&content-type=text/vnd.viewcvs-markup


HOWTO use the new HIL drivers on PA-RISC:
---------------------------------------------------------------
1. Please ensure you have the 2.4.18-pa45 (or higher) kernel source.
If you're using pre-built kernel binaries, please skip the following step.

2. Use the default kernel configuration 
 (e.g. delete your .config file and do a "make menuconfig" or "make oldconfig").
If you use your own kernel configuration check at least the following kernel options:
CONFIG_INPUT=y
CONFIG_INPUT_KEYBDEV=y
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_EVDEV=y

CONFIG_INPUT_SERIO=y

CONFIG_HIL=y
CONFIG_HP_SDC=y
CONFIG_HIL_MLC=y
CONFIG_HP_SDC_MLC=y
CONFIG_HIL_KBD=y
CONFIG_HIL_PTR=y

The CONFIG_HIL_KBD_BASIC option has to be DISABLED !!

3. Check that the following device files are available:
	/dev/input/mice
	/dev/input/mouseX
	/dev/input/eventX
where X is any number. 
If those files aren't present yet, create them as root (!!) with the commands:
	cd /dev
	./MAKEDEV input

4. Configure gpm with the following two /etc/gpm.conf options:
	device=/dev/input/mice
	type=imps2

5. Configure XFree86. 
Sample /etc/X11/XF86Config-4 configuration options are:
Section "InputDevice"
        Identifier      "HIL Keyboard"
        Driver          "keyboard"
        Option          "CoreKeyboard"
EndSection
Section "InputDevice"
        Identifier      "HIL Mouse"
        Driver          "mouse"
        Option          "CorePointer"
        Option          "Device"                "/dev/input/mice"
        Option          "Protocol"              "ImPS/2"
        Option          "ZAxisMapping"          "4 5"
EndSection
Section "ServerLayout"
        Identifier      "Default Layout"
        Screen          "Default Screen"
        InputDevice     "HIL Keyboard"
        InputDevice     "HIL Mouse"
EndSection

6. Reboot your system with the new kernel and enjoy.
HIL keyboards, mice and tablets should be automatically detected.

Have fun,
Helge
