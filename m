Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA26971
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Aug 2000 09:38:37 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 24 Aug 2000 15:38:32 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 24 Aug 2000 15:37:59 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id KAA29872
	for parisc-linux@thepuffingroup.com; Thu, 24 Aug 2000 10:33:33 -0400
Date: Thu, 24 Aug 2000 10:33:33 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000824103333.C29677@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [torvalds@transmeta.com: linux-2.4.0-test7]
List-ID: <linux-parisc.vger.kernel.org>


Linus has actually started keeping alan-style changelogs.  so i'm going
to forward them here.

btw, what do people think about just pushing the current parisc-specific
pieces to Linus right now?  i know the kernel doesn't work terribly
well right now and we're going to want to change it a lot, but it would
ensure that people who go around changing all the architectures update
our stuff at the same time.

----- Forwarded message from Linus Torvalds <torvalds@transmeta.com> -----

Delivered-To: thepuffi-willy@thepuffingroup.com
X-Authentication-Warning: penguin.transmeta.com: torvalds owned process doing -bs
Date: 	Wed, 23 Aug 2000 19:55:28 -0700 (PDT)
From: Linus Torvalds <torvalds@transmeta.com>
To: Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-2.4.0-test7
Precedence: bulk
X-Mailing-List: 	linux-kernel@vger.kernel.org


test7:
 - pre1:
    - fix PCI resource bug that crept in in test6 due to the new
      requirements to handle multiple bus regions transparently
    - ll_rw_block documentation
    - sound driver module counting bugfix and cleanup (move to named
      initializers)
    - directory rename bug fix for busy directories (oops)
    - allow "init_new_context()" to fail - it can do so on some
      architectures when out of memory.
    - networking updates - TCP retransmission and ordering logic
    - fix strsep(). Not that anybody cared.
 - pre2:
    - fix modversions.h generation ("make -j dep" works now)
    - finish 64-bit VFS: getdents64 and fcntl64 (getdents64 also adds
      the "file type" to the readdir data - VFS layer change.  fcntl64
      allows 64-bit file locking)
    - Intel i810 watchdog driver and NS DP83810 network driver
    - dup2() cannot screw up the file table with threads any more.
 - pre3:
    - nfs_commit_rpcsetup() signed comparison bugfix and cleanup
    - sparc updates and TLB invalidation fix
    - networking updates (less verbose on the new reordering messages)
    - network driver Makefile cleanup
    - Fix segment copy on fork.
    - tsk->files race fixes: close-on-exec etc.
    - sound #define cleanups
    - fs/proc/array.c task_lock cleanup
 - pre4:
    - "USE_STANDARD_AS_RULE" - generic Rules.make as rule
    - arm update (arch/arm, asm-arm, drivers/acorn, Documentation/arm etc)
    - eicon ISDN driver update (big).
    - serial.c warnings removal.
    - compilation fixes under different configurations..
    - bounds checking for hpfs code page index.
    - sparc64 bugfix for atomic_dec_and_lock. Oops. And use flock64.
    - FAT missed the d_type thing from readdir.
    - fix tsk->files race fixes from -pre3 ("struct files_struct", not
      "struct file" and make sure to register the socket fs before we
      use a pointer to it)
    - ns558.c: don't leave the driver registered after a failed module
      load.  Either return success, or unregister the PCI driver. And
      don't leak IO port allocations.
    - USB OHCI controller fixes for oopses due to races..
    - usb updates
    - 3c59x driver update
    - VIA KX-133/KT-133 chipset detection and AGP bridge support
    - raid/raw-io cleanup: use generic_make_request instead of ll_rw_block.
    - Emu10k1 sound driver update
 - pre5
    - i2c-old compile fix. 
    - sparc updates (pte_pagenr cleanups)
    - make ipv6 loadable as a module together with CONFIG_INET_ECN
    - get rid of bdf_prm.b_un.age_super - it just confused the buffer aging
    - smbfs knows about nls and ascii mount options
    - small joystick driver updates
    - make sure to mark inode dirty after having changed the size!
    - hgafb documentation update
 - pre6
    - Pentium/MMX has a good IO-APIC
    - APIC detection (aka "try to boot the SMP kernel even on buggy UP
      boards that claim SMP.")
    - alpha time.c epoch calculations. Again.
    - report where the memory region information came from.
    - sparc updates
    - file locking: fix deadlock detection and EOVERFLOW
    - network bugfixes
    - md readahead was getting confused about bytes vs pages
    - DRM and AGP fixes
    - xircom_tulip.c: don't corrupt the timer list on suspend
    - PCI /proc interface buffer overrun fix
    - ISDN updates
    - DAC960 update
    - fork: get CLONE_PTRACE right (SIGSTOP the child)
 - pre7
    - block_all_signals()/unblock_all_signals() interface to allow drivers to
      react nicely to signals that happen to a process that owns driver data.
      Read: direct rendering lock handling.
    - ThunderLAN update (timer fixes, full-duplex, activity-led)
    - Fix NFS oops on removing negative dentry. Honour rsize for directory read.
    - usb updates
    - scheduler wakeup race fix.
    - move radio/tv cards to drivers/media, cleaning up drivers/char
    - move "input" layer to drivers/input, cleaning up drivers/usb
    - Cirrus SoundFusion CS4280/461x sound driver.
    - proper camera locking in usb/dc2xx.c
    - USB printer driver update (Printer Protocol 3 and timeout handling)
 - final
    - usbkbd.c syntax error fix. USB config messages change. pegasus update
    - digiboard driver update. Yes, people, it's still being used.
    - make elvtune not break any more now that "maxbomb" isn't used.
    - sparc updates
    - tunneling driver, aka "ethertap done right".
    - pcmcia/cs.c: only call the reset handle if valid.
    - net/sunrpc/sched.c: fix two rpc_wait_queue hangups
    - AMD Duron cpuid errata forward port
    - get_close_on_exec() only needs the read lock, not write lock
    - get rid of unnecessary kernel lock in fork()
    - MCA planar POS-register /proc support
    - drivers/media configuration fixup (menuconfig is happy again)

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
Please read the FAQ at http://www.tux.org/lkml/

----- End forwarded message -----

-- 
Revolutions do not require corporate support.
