Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 1F4F548AC
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 06:33:01 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] can't open /dev/input/mice on c3000?
Date: Sun, 21 Dec 2003 14:32:54 +0100
References: <20031221054605.GA14026@colo.lackof.org>
In-Reply-To: <20031221054605.GA14026@colo.lackof.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312211432.54995.deller@gmx.de>
Cc: Grant Grundler <grundler@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 21 December 2003 06:46, Grant Grundler wrote:
> xserver can't open /dev/input/mice and it's not clear to me why not.
> I have a USB Logitech "intellimouse" that seems to work fine
> with 2.4.23 kernels.  2.6.0-pa3 (pre-release) finds the USB mouse.

Works for me on the c3k without problems (HP (SILITEK) USB Mouse).

I assume you are missing some .config entries:
#
# Input device support
#
CONFIG_INPUT=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_TSDEV is not set
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input I/O drivers
#
# CONFIG_GAMEPORT is not set
CONFIG_SOUND_GAMEPORT=y
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
CONFIG_HP_SDC=y
# CONFIG_HIL_MLC is not set
# CONFIG_SERIO_PCIPS2 is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ATKBD is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_HIL_OLD is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
