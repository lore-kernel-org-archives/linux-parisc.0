Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82E6149E4
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 08:48:47 -0600 (MDT)
Message-Id: <200110051448.KAA12495@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Cc: jurijus@theophys.kth.se
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Fri, 05 Oct 2001 10:48:37 -0400
Sender: jurij@mail.lokmail.net
Subject: [parisc-linux] Bug digest [long]
List-ID: <linux-parisc.vger.kernel.org>

Hi!

This is an effort to clean up the bug database. Some of the bugs were
filed long ago, so there is a need to update the status on them. I was
able to check out some, but there are still quite a lot of them. It would
be very nice, if people (especially, authors) would quickly look through 
the list and update the status. Also feel free to pick some bug from 
the "Bugs, which can be checked" section and test, whether it is still
present, with the latest kernel/binutils/gcc/glibc.

Also, how does one change a status of the bug? Do You need some special
powers to do so?

===========================================================================
Bugs, which probably can be closed (subject to author's approval)

Author: Came from an old todo list

57     SMP support - Interrupt Distribution (even CPU loading) w/CONFIG_SMP.
       Seems like it is working (or at least, supposed to), according to
       mailing lists. 

Author: Grant Grundler

75     lba_device_present() not implemented.
       Inspection of linux/arch/parisc/kernel/lba_pci.c shows, that
       lba_device_present() is implemented and used.
110    1 sec per 24 hours drift between RTC and kernel.
       Well, I've seen machines doing worse things than that. I think
       such drift is acceptable. If needed, one can run
       ntpdate/hwclock periodically, as suggested in original bug report.

Author: Ryan Bradetich

86     palo sets 'console=tty0', but output still goes to serial console
       instead of STI. This was reported for 712/80. I have such a machine
       and haven't seen any such problems with recent kernels.

Author: Matthew Wilcox

121    User fault on kernel space handler infinite loop. Process, causing
       the fault does not get killed.
       Haven't seen any such behaviour with latest kernels. Anyone?
135    Kernel panic doing two simultaneous compiles on 712. 
       Kernel build with "make -j 2" completed without problems. Is it
       enough?

Author: Thomas Marteau

137    Messages in the mailing list archives do not display dates (is this
       the correct interpretation?). Seems like everything fine with dates
       now.

Author: dannf@dannf.org

139    python and python2 says: "math.sqrt(2.0) == 0.0".
       Tested it with python-base 1.5.2-16, libc6 2.2.3-9. Everything
       works correctly now. 
===========================================================================
Bugs, which are likely to be still open

Author: Came from an old todo list.

63     Kernel debugger (KWDB) not implemented.
       There are a lot of #ifdef CONFIG_KWDB in the sources,
       but I remeber hearing somewhere, that it is not quite
       functional yet. I might be wrong though.

Author: Matthew Wilcox

35     A lot of things to implement in Documentation/parisc/unwritten.
       As far as I can tell, most of the stuff is still unimplemented.
82     710 SCSI and LAN are not working.
       710 might be working with latest PCXS fixes, but no one has reported 
       a success yet. Someone with a 710 might check this out.

Author: Randolph Chung

41     Unimplemented asm checksum routines. Still not implemented. Some
       of the routines (all?) are mentioned in bug #35. Maybe, they
       should be merged?

Author: R. Scholz

146    STI-Console not working with Coral Graphics Card on 715/100

Author: Paul Bame

124    siginfo_t 32-bit != 64-bit requiring lots of work
       This is likely to be still open.

Author: Matt Taggart

138    palo can't figure out whether kernel is narrow or wide. Temporary
       workaround is append 32 or 64 to the end of the kernel file name.
       Is it still open?       

===========================================================================
Bugs, which can be checked more or less easily
(and everyone is encouraged to do so)

Author: Came from an old todo list.

66     Not setting CONFIG_GSC_PS2 in the config causes kernel build
       to fail with undefined references to kbd_read_status,
       kbd_write_command and kbd_write_output.

Author: Paul Bame

88     libgcc.a __udivdi3 uses floating-pt instructions, clash with 
       -mdisable-fpregs
102    The second (actually the first) SCSI controller on C3000 doesn't work.
       Someone with such a machine should probably check it.
142    drivers/net/dmfe.c won't compile as module -- possible gcc bug.
143    aic7xxx.c won't compile with 64-bit kernel.

Author: Richard Hirst

98     64-bit cross-linker does not include millicode functions 
       (shown as undefined by nm).

Author: Matther Wilcox

114    __builtin_cos undefined with g77. Should be in libgcc.a?
127    dl-addr fails. As I understand, it's about failed glibc test.
128    posix/glob-test fails. Another glibc test failure?
129    linuxthreads/ex15 fails. And another one?
       Probably it's a good idea to keep a list of failed tests from the
       latest glibc CVS builds.

Author: Grant Grundler 

132    PPP causes trap 15. Workaround: add "nobsdcomp" and "nodeflate" to
       /etc/ppp/peers/uunet. Now should probably work without any
       workarounds.

Author: Peter Mottram

134    Installation of 0.9 release crashes on C110 with serial console.
       0.9.2 was a major improvement, compared to 0.9. Anyone with such
       a machine care to check this?

Author: Kevin Carson

141    Problem with A2840B keyboard during installation of 0.9.1 release
       on a C160 with STI console. Keyboard does not produce any input,
       once the installation program has started. Other keyboard worked
       fine. Anybody with this combination of hardware willing to check?

===========================================================================
All other bugs (unknown status, irreproducible, uncheckable, unknown
how to check, etc.). Some feedback from authors would be great.

Author: Came from the old todo list

46     Create an IO tree to support multiple I/O MMUs.
62     64-bit kernel - Do the right thing with macro elf_check_arch().
       Anybody knows, what the "right thing" is? :-). Was it done
       already? The referenced posts are not very enlightening.

Author: Matthew Wilcox

37     STI console does not display early enough.
92     Machine sometimes won't boot after interacting with IPL and editing 
       the load options.
119    long double is 64 bit. Some glibc tests fail since they assume
       128 bit for long double on hppa.

Author: Paul Bame

123    ntpdate -b fails to set sub-second clock. Apparently, ntpdate problem.

Author: Grant Grundler

130    iosapic allocs extra EIR bit for shared IRQ line. Harmless, according
       to the original bug report.

Author: Richard Hirst

136    The installer leaves the kernel in /boot/vmlinux-2.4.0, but a
       kernel upgrade, via 
       dpkg -i kernel-image-2.4.0-pa30-32sti_2.4.0_hppa.deb
       will leave the new kernel in /boot/vmlinux-2.4.0-pa30.
       Either /etc/palo.conf needs to get updated to reference the
       new kernel, or we need to use symlinks in /boot, and the symlink
       needs updating.
145    store iplboot in /usr/lib/palo/iplboot on non-hppa systems?

Author: Randolph Chung

140    IDE support. It is not a bug :-), just Randolph volunteering
       to do something about it.

===========================================================================

Best regards,

Jurij.
