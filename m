Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AF844841
	for <parisc-linux@parisc-linux.org>; Sat,  8 Nov 2003 14:11:16 -0700 (MST)
Message-ID: <3FAD5C01.7040302@tiscali.be>
Date: Sat, 08 Nov 2003 21:11:29 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
 do_page_fault?]
References: <3F969FFE00005DB3@ocpmta2.freegates.net> <3FACE5A4.7070003@tiscali.be> <20031108155247.GC21080@systemhalted>
In-Reply-To: <20031108155247.GC21080@systemhalted>
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

Well it seems that i reach to reproduce: just after a fresh reboot:

I first export LD_LIBRARY_PATH=/usr/lib/debug
then launch gdb with "handle all nostop" and "handle all pass" (as 
recommended in a previous mail),
(gdb) file /usr/bin/evolution
(gdb) run

all start fine until I point a mail to preview it in the preview's window.
Then a child process failled, so Ctrl-C in gdb and bt:
#0  0x4172005c in __pthread_sigsuspend () from /lib/libpthread.so.0
#1  0x4171fde0 in __pthread_wait_for_restart_signal ()
    from /lib/libpthread.so.0
#2  0x4172181c in __pthread_alt_lock () from /lib/libpthread.so.0
#3  0x4171e480 in pthread_mutex_lock () from /lib/libpthread.so.0
#4  0x41a7226c in free () from /lib/libc.so.6
#5  0x41993654 in g_free () from /usr/lib/libglib-2.0.so.0
#6  0x413453e0 in gtk_tooltips_new () from /usr/lib/libgtk-x11-2.0.so.0
#7  0x41345c68 in gtk_tooltips_set_tip () from /usr/lib/libgtk-x11-2.0.so.0
#8  0x407a6768 in bonobo_ui_toolbar_item_set_tooltip ()
    from /usr/lib/libbonoboui-2.so.0
#9  0x407a12fc in bonobo_ui_sync_status_new () from 
/usr/lib/libbonoboui-2.so.0
#10 0x4079bfb0 in bonobo_ui_sync_state () from /usr/lib/libbonoboui-2.so.0
#11 0x407963a0 in bonobo_ui_engine_get_view () from 
/usr/lib/libbonoboui-2.so.0
#12 0x407966b4 in bonobo_ui_engine_get_view () from 
/usr/lib/libbonoboui-2.so.0
#13 0x40796d10 in bonobo_ui_engine_update () from 
/usr/lib/libbonoboui-2.so.0
#14 0x40793b5c in bonobo_ui_engine_xml_set_prop ()
    from /usr/lib/libbonoboui-2.so.0
#15 0x40898dfc in _ORBIT_skel_small_Bonobo_UIContainer_setAttr ()
    from /usr/lib/libbonobo-2.so.0
#16 0x40b05174 in ORBit_c_stub_invoke () from /usr/lib/libORBit-2.so.0
#17 0x4089d6c4 in Bonobo_UIContainer_setAttr () from 
/usr/lib/libbonobo-2.so.0
#18 0x4078dc84 in bonobo_ui_component_set_prop ()
    from /usr/lib/libbonoboui-2.so.0
#19 0x4078db8c in bonobo_ui_component_set_prop ()
    from /usr/lib/libbonoboui-2.so.0
#20 0x41ecbf08 in mail_disable_stop ()
    from /usr/lib/evolution/1.4/components/libevolution-mail.so
#21 0x41ecb074 in mail_call_main ()
    from /usr/lib/evolution/1.4/components/libevolution-mail.so
#22 0x41ec9a00 in mail_msg_wait_all ()
    from /usr/lib/evolution/1.4/components/libevolution-mail.so
#23 0x419b5044 in g_vsnprintf () from /usr/lib/libglib-2.0.so.0
#24 0x4198c904 in unblock_source () from /usr/lib/libglib-2.0.so.0
#25 0x4198ddcc in g_main_context_dispatch () from /usr/lib/libglib-2.0.so.0
#26 0x4198e1c0 in g_main_context_dispatch () from /usr/lib/libglib-2.0.so.0
#27 0x4198eb70 in g_main_loop_run () from /usr/lib/libglib-2.0.so.0
#28 0x40881490 in bonobo_main () from /usr/lib/libbonobo-2.so.0
#29 0x0009deb8 in main ()
#30 0x41a1146c in __libc_start_main () from /lib/libc.so.6
#31 0x00022e10 in _start ()
----------><----------

At the console, I could always capture:

request_module[net-pf-10]: fork failed, errno 1
evolution (pid 879): Protection id trap (code 27)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  00000000 103b7524 1015352c 00282b28
r04-07  00000000 00000000 00000001 11f27da0
r08-11  00000000 00000001 13084548 fffffff2
r12-15  419ee608 419ee718 419345a8 419345a8
r16-19  419ee608 419345a8 00000070 1371d000
r20-23  00000000 00000002 00282b2e 00000000
r24-27  11f27da0 00000000 10d0b520 10304010
r28-31  00000000 10314a60 130845c0 101532c8
sr0-3   00000000 00000000 00000000 00000003
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10153658 1015365c
  IIR: 0ed4d240    ISR: 00000003  IOR: 00282b2e
  CPU:        0   CR30: 13084000 CR31: 103a8000
  ORIG_R28: 419345a8

----------><----------

while I can still see processes:
$ ps -ef | grep evol
root       869   863  8 17:15 pts/2    00:00:35 /usr/bin/evolution
root       875     1  0 17:16 ?        00:00:02 
/usr/lib/evolution/1.4/evolution-wombat 
--oaf-activate-iid=OAFIID:GNOME_Evolution_Wombat_InterfaceCheck 
--oaf-ior-fd=25
root       877     1  0 17:16 ?        00:00:02 
/usr/lib/evolution/1.4/evolution-alarm-notify 
--oaf-activate-iid=OAFIID:GNOME_Evolution_Calendar_AlarmNotify_Factory 
--oaf-ior-fd=27
root       879   869  0 17:16 pts/2    00:00:00 [evolution] <defunct>

----------><----------

Unfortunately:
# gdb program 879
GNU gdb 5.3-debian
Copyright 2002 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain 
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "hppa-linux".
Attaching to process 879
ptrace: Operation not permitted.
/root/879: No such file or directory.

----------><----------

Once again if I re-launch prgm, I do get any more the pb?

What do you think?

Thanks for help,
	Joel

PS1: I would try to see if can can reproduce it (just after a fresh 
reboot) on my b2k (Monday only)

PS2: Just as remainder, it is a fresh 'apt-get dist-upgrade' unstable 
debian runing on a c110 model with a merged kernel of mine 
2.4.23-pre9-pa13 (which, else where, seems to run perfectly in 32 and 64 
bits even in SMP mode on some L :) )


Carlos O'Donell wrote:
> On Sat, Nov 08, 2003 at 12:46:28PM +0000, Joel Soete wrote:
> 
>>More and more strange behaviour:
>>
>>after my weekly apt-get dist-upgrade i relaunch evolution,
>>it hang again at the same point with usual message:
>>evolution (pid 2999): Protection id trap (code 27)
>>[..]
>>
>>But if I launch it a second time no more pb???
>>
>>Very strange isn't it?
> 
> 
> Not at all! Anything is possible with some imagination :)
> If it's repeatable then we can catch it. Stick evolution under gdb and
> remember to preload a debugging libc and catch it when it crashes. Send
> the 'bt full' back to the list for analysis.
> 
> c.
> 
