From: Richard Walter <richard@richardwalter.de>
Subject: [parisc-linux] kernel 2.6.15-pa1 and 2.6.15.1-pa4 fault on HIL
	keyboard event
Date: Thu, 26 Jan 2006 21:22:47 +0100
Message-ID: <200601262122.47507.richard@richardwalter.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

when I touch any key of my HIL keyboard, the kernels mentioned above fail 
immediately.

The machine in question is a HP9000 735/125 running Gentoo Linux, using 
gcc-3.3.6, binutils-2.16.1 and glibc-2.3.4.20040808-r1.

If dmesg -n 7 was issued (obviously by an ssh session) or I press a key before 
the rc scripts run, then I get an output like
http://www.richardwalter.de/Backtrace%202.6.15_p1%20on%20keyboard%20event%20second%20try
and the machine does not move any further.

The kernel sources are hppa-sources-2.6.15_p1 from portage, the .config file 
is
http://www.richardwalter.de/.config
the System.map is
http://www.richardwalter.de/System.map.bz2
and the resulting vmlinux looks like this one
http://www.richardwalter.de/vmlinux.bz2
(I compressed the latter two for bandwith-limited people)

I have been able to locate the crash to the file
sftp://root@10.0.0.254/usr/src/linux/drivers/input/input.c
in the function
void input_event(struct input_dev *dev, unsigned int type, unsigned int code, 
int value)
to the line 182 which says
			if (handle->open)

Unfortunately I have not been able to locate the source of this error.

If it is of help, I also inspected the CPU instruction on adress 0c681093, 
according to gdb it says 
ldw -c(r3),r19

I have experienced the similar problem on 2.6.15.1-pa4, but did not intercept 
it to the same depth. Up to now, I could not test any post-2.6.15.x-kernels, 
and the pre-2.6.15-kernels in portage did not have that problem.

Thanks for help
	HPRichard
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
