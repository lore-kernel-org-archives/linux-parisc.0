Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id F13D04829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 06:34:06 -0600 (MDT)
Date: Mon, 5 Aug 2002 14:34:04 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19 tree merged in.
Message-ID: <20020805123404.GW7040@charite.de>
References: <1028503560.977.15.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1028503560.977.15.camel@beavis>
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

On Sun, Aug 04, 2002 at 05:25:59PM -0600, Ryan Bradetich wrote:
> Hello parisc-linux hackers,
> 
> The merge upto linux 2.4.19 was just committed into the parisc-linux
> cvs tree.  This kernel boots fine on my 712 and C200.

For me, it doesn't even BUILD!

(I build it on the box itself 712/80, gecko):

make[3]: Entering directory /usr/src/linux/arch/parisc/math-emu'
make[3]: Nothing to be done for modules_install'.
make[3]: Leaving directory /usr/src/linux/arch/parisc/math-emu'
cd /usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0; \
mkdir -p pcmcia; \
find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{}
pcmcia
if [ -r System.map ]; then /sbin/depmod -ae -F System.map -b
/usr/src/linux/debian/tmp-image -r 2.4.19-pa0; fi
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/block/loop.o
depmod:         __down_Re9269c59
depmod:         flush_kernel_dcache_page_Re8500931
depmod:         __down_interruptible_R56f0c46c
depmod:         grab_cache_page_Rb8766631
depmod:         register_blkdev_Rd300b725
depmod:         fput_R3d1d1a12
depmod:         $$remI
depmod:         kmem_cache_free_R891f2686
depmod:         $$remU
depmod:         kmalloc_R93d4cfe6
depmod:         blksize_size_R2f30b4b6
depmod:         do_generic_file_read_Rce441edc
depmod:         memset
depmod:         __free_pages_R4d8ebf0c
depmod:         register_disk_R2a459389
depmod:         $$divI
depmod:         refile_buffer_Reea9d23d
depmod:         $$divU
depmod:         kernel_thread_R7e9ebb05
depmod:         lcopy_to_user_R9495ad99
depmod:         generic_make_request_R9c66707e
depmod:         blk_ioctl_Re7800428
depmod:         unlock_page_R7859638c
depmod:         flush_signals_R013d45f8
depmod:         printk_Rdd132261
depmod:         fget_R5396ec14
depmod:         bh_cachep_Rdcc0bb37
depmod:         zone_table_R74ddb3f9
depmod:         blk_queue_make_request_R93ad7aa7
depmod:         tq_disk_R5373dbb6
depmod:         sprintf_R1d26aa98
depmod:         lcopy_from_user_R709cd167
depmod:         daemonize_Rd66a354a
depmod:         $$mulI
depmod:         exit_files_Rb894776d
depmod:         memcpy
depmod:         blk_size_Ra2e0a082
depmod:         kfree_R037a0cba
depmod:         kmem_cache_alloc_R75810956
depmod:         schedule_timeout_Rd62c833f
depmod:         __up_R67ea47fd
depmod:         __run_task_queue_R3889b11c
depmod:         strncpy_R328a05f1
depmod:         is_read_only_R740274ca
depmod:         _alloc_pages_R5fc0da8d
depmod:         invalidate_bdev_R78bde981
depmod:         set_blocksize_Rc75d857c
depmod:         unregister_blkdev_Reac1c4af
depmod:         set_device_ro_Rdc036ebb
depmod:         blk_dev_R66c70949
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/cdrom/cdrom.o
depmod:         register_sysctl_table_R3f9a7ec6
depmod:         unregister_sysctl_table_Ra973a840
depmod:         $$remI
depmod:         kmalloc_R93d4cfe6
depmod:         proc_dointvec_R2f04908a
depmod:         memset
depmod:         $$divI
depmod:         lcopy_to_user_R9495ad99
depmod:         printk_Rdd132261
depmod:         sprintf_R1d26aa98
depmod:         lcopy_from_user_R709cd167
depmod:         check_disk_change_R11d4076d
depmod:         $$mulI
depmod:         memcpy
depmod:         kfree_R037a0cba
depmod:         proc_dostring_R272d14f4
depmod:         strcpy_Re914e41e
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/char/lp.o
depmod:         __down_interruptible_R56f0c46c
depmod:         kmalloc_R93d4cfe6
depmod:         register_chrdev_R18f7b46f
depmod:         unregister_chrdev_Rc192d491
depmod:         $$divI
depmod:         schedule_R01000e51
depmod:         $$divU
depmod:         lcopy_to_user_R9495ad99
depmod:         printk_Rdd132261
depmod:         jiffies_R0da02d67
depmod:         sprintf_R1d26aa98
depmod:         lcopy_from_user_R709cd167
depmod:         $$mulI
depmod:         simple_strtoul_R20000329
depmod:         interruptible_sleep_on_timeout_R134602fd
depmod:         kfree_R037a0cba
depmod:         boot_cpu_data_Rc81f4886
depmod:         __up_R67ea47fd
depmod:         strncmp_R84b183ae
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/char/n_hdlc.o
depmod:         tty_hung_up_p_Raabff69e
depmod:         tty_register_ldisc_R212858d6
depmod:         n_tty_ioctl_R2efb9ad9
depmod:         __pollwait_Rdbb4d91a
depmod:         add_wait_queue_Rde917559
depmod:         kill_fasync_R0bea745a
depmod:         kmalloc_R93d4cfe6
depmod:         memset
depmod:         schedule_R01000e51
depmod:         lcopy_to_user_R9495ad99
depmod:         __wake_up_Rf0f2f792
depmod:         printk_Rdd132261
depmod:         interruptible_sleep_on_R52b04435
depmod:         lcopy_from_user_R709cd167
depmod:         memcpy
depmod:         kfree_R037a0cba
depmod:         remove_wait_queue_Rd435d44b
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/hil/hilkbd.o
depmod:         disable_irq_Ra44762a4
depmod:         request_irq_Ra25b351e
depmod:         unregister_parisc_driver_R74db4b32
depmod:         printk_Rdd132261
depmod:         free_irq_Rf20dabd8
depmod:         register_parisc_driver_R56e5494c
depmod:         register_ps2_keybfuncs_R50f75b19
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/input/input.o
depmod:         mod_timer_R1f13d309
depmod:         register_chrdev_R18f7b46f
depmod:         unregister_chrdev_Rc192d491
depmod:         printk_Rdd132261
depmod:         jiffies_R0da02d67
depmod:         del_timer_Rfc62f16d
depmod:         sprintf_R1d26aa98
depmod:         try_inc_mod_count_R133c9d8f
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/input/keybdev.o
depmod:         kmalloc_R93d4cfe6
depmod:         memset
depmod:         printk_Rdd132261
depmod:         kbd_ledfunc_Rfa67cc5f
depmod:         keyboard_tasklet_R28aa0faa
depmod:         kfree_R037a0cba
depmod:         __tasklet_schedule_Rf397b9aa
depmod:         handle_scancode_Rd3d6a2f1
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.19-pa0/kernel/drivers/input/mousedev.o
depmod:         __pollwait_Rdbb4d91a
depmod:         add_wait_queue_Rde917559
depmod:         kill_fasync_R0bea745a
depmod:         kmalloc_R93d4cfe6
depmod:         fasync_helper_Rf75cd16e
depmod:         memset
depmod:         $$divI
depmod:         schedule_R01000e51
depmod:         lcopy_to_user_R9495ad99
depmod:         __wake_up_Rf0f2f792
depmod:         printk_Rdd132261
depmod:         $$mulI
depmod:         kfree_R037a0cba
depmod:         remove_wait_queue_Rd435d44b
depmod:         add_mouse_randomness_R70507c97

etc.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
This signature was added just to have one. ;-)
