Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 455864829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 12:27:35 -0700 (MST)
Message-ID: <3E89E824.8020404@gmx.at>
Date: Tue, 01 Apr 2003 21:27:32 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: knaresh@india.hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PDC console problem.
References: <3E89DBF4.102AC68A@india.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello again!

There are two drivers, but they depend.

Int arch/parisc/kernel driver implements the kernel "printk()" (the
internal kernel console). This driver has NO device name, as it
cannot be access as /dev/ttyB0. BUT: This driver is register under
the name "ttyB0" to be selected as preferred device on the kernel
paramter line with "console=ttyB0".

The drivers/char driver is the full PDC serial console driver as a
TTY driver (like all the other serial drivers). This driver is
registers as MAJOR 11, MINOR 0 driver in the TTY interface and
supports fully TTY functionality (althogh some routines are dummy,
e.g. you cannot change the BAUD RATE, etc...).
The low lever routione (printing out a character, polling the keyboard)
are implemented in the first mentioned driver..

The third driver play a role is the "/dev/console" tty driver, which
assosiates the two drivers above as console driver. So the kernel
paramter line also assigns the "/dev/ttyB0" as the driver behind the
"/dev/console". And this driver is running bidirectional.

So commig to your simulator. I do not know this, but perhaps you
have simple a problem with the timing here. My PDC console drive
is in opposite to other typical TTY drivers running in POLLING
mode. The PDC interface does not support a interrupt-like handling.
So the PDC driver polls all 30ms (as far as I remember) if a key
was pressed on the PDC console. My be, the time progress has
other properties on the simulator ....

Christoph



Naresh wrote:
> Hi,
> 
> I am trying to boot PA-Linux off a PA-RISC simulator. I am facing a
> problem with the PDC console. On my first attempt, I saw the message
> asking me to switch the console. So I  turned the PDC console config
> option on ( the serial mux option was turned off). I added the parameter
> 'console=ttyB0' in 'palo.conf'. I created the device file '/dev/ttyB0'
> with major/minor = 11/0 on my ramdisk. With this, the kernel boots up on
> the simulator all the way upto the sash ( Stand-alone shell) prompt. I
> can even see the prompt. But, the problem is that this console doesnt
> seem to be accepting input from the keyboard. It is kind of like in a
> locked state.
> 
> I was going through some of the FAQ and the mailing list archive and
> understand that the PDC console is not a full blown console and can only
> display output. Is is true that the PDC console cannot accept keyboard
> input? Or am I missing something?
> 
> I also see that there are 2 versions of the PDC console driver :
> 'arch/parisc/kernel/pdc_cons.c' and 'drivers/char/pdc_console.c'. Both
> use the device ttyB. From what I understand, the former is used before
> any of the serial drivers are initialized during boot, and has only
> write capability. The latter is the full-blown console driver (though I
> am not sure if it has write capability). Is my understanding correct?
> 
> I am using the source tarball 'palo-latest.tar.gz' from the parisc-linux
> cvs respository and cross-compiling this on an x86 box.
> 
> Regards,
> Naresh.
> 
> PS: My "init" process is 'sash' and I also have a '/dev/console' device
> ( major=5 minor=1) on my ramdisk. The Serial driver config option is on
> and I can see it being initialized in the boot path after the PDC
> console.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
