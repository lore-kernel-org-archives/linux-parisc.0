Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DB5C4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 18:59:26 -0700 (MST)
Date: Sun, 21 Dec 2003 18:59:25 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] can't open /dev/input/mice on c3000?
Message-ID: <20031222015925.GC26083@colo.lackof.org>
References: <20031221054605.GA14026@colo.lackof.org>
	<200312211432.54995.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200312211432.54995.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Dec 21, 2003 at 02:32:54PM +0100, Helge Deller wrote:
> Works for me on the c3k without problems (HP (SILITEK) USB Mouse).

cool - thanks for committing -pa3.

> I assume you are missing some .config entries:

I've unpacked the 2.6.0-pa3 I had uploaded to ftp.parisc-linux.org.
	ftp://ftp.parisc-linux.org/kernels/c3000/boot/config-2.6.0-pa3

(full tar ball is at kernels/c3000/2.6.0-pa3.tgz)

Doesn't look I'm missing the option.
I suspect I just need to "modeprobe mousedev" or whatever it's called.

> #
> # Input device support
> #
> CONFIG_INPUT=y
> 
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=y
> CONFIG_INPUT_MOUSEDEV_PSAUX=y
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768

CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1600
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=1200

> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_TSDEV is not set
> CONFIG_INPUT_EVDEV=y
> # CONFIG_INPUT_EVBUG is not set
> 
> #
> # Input I/O drivers
> #
> # CONFIG_GAMEPORT is not set
> CONFIG_SOUND_GAMEPORT=y
> CONFIG_SERIO=y
> CONFIG_SERIO_SERPORT=y

CONFIG_SOUND_GAMEPORT=y
CONFIG_SERIO=m
CONFIG_SERIO_SERPORT=m

> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PARKBD is not set
> CONFIG_HP_SDC=y
> # CONFIG_HIL_MLC is not set
> # CONFIG_SERIO_PCIPS2 is not set
> 
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ATKBD is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_HIL_OLD is not set
> CONFIG_INPUT_MOUSE=y
> # CONFIG_MOUSE_PS2 is not set

CONFIG_MOUSE_PS2=m

KEYBOARD and MOUSE are also both =y.

thanks,
grant
