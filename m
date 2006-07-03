From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Back to "BUG: soft lockup detected on CPU#0" [Was:
 N4k also ran 7days
 my stress test: k 2.6.17-pa3 + gcc-3.3 [followup]]
Date: Mon, 03 Jul 2006 19:39:10 +0000
Message-ID: <44A9725E.50900@tiscali.be>
References: <449D1F9D.3080604@tiscali.be> <44A65C24.7000708@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44A65C24.7000708@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
> Hello all,
> 
> Same success with k 2.6.17-pa3 compiled also with gcc-3.3 and same tests.
> 
> # uname -a
> Linux patst006 2.6.17-pa3-n4kmp #2471 SMP Fri Jun 23 15:39:23 CEST 2006 
> parisc64 GNU/Linux
> 
> This doesn't yet include Jejb's do_gettimeofday() patch.
> 
> top - 13:06:57 up 7 days, 20:47,  3 users,  load average: 6.63, 6.47, 6.82
> Tasks:  84 total,   4 running,  80 sleeping,   0 stopped,   0 zombie
> Cpu0  : 10.6% us, 89.4% sy,  0.0% ni,  0.0% id,  0.0% wa,  0.0% hi,  
> 0.0% si
> Cpu1  : 75.0% us,  6.7% sy,  0.0% ni,  0.0% id,  0.0% wa,  0.0% hi, 
> 18.3% si
> Mem:   4113812k total,  3859048k used,   254764k free,   496240k buffers
> Swap:   250872k total,        4k used,   250868k free,   287936k cached
> Change delay from 1.0 to:
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  P WCHAN     
> COMMAND
> 18375 root      21  -4  3524 1020  816 R   97  0.0   0:02.05 0 intr_chec 
> tar
> 18381 root      21  -4 15320  13m 2756 R   77  0.3   0:01.06 1 intr_chec 
> cc1
>  1095 gkrellmd  15   0  5256 1488 1108 S   17  0.0   1925:59 1 select    
> gkrellmd
> 18371 root      21  -4 25064  22m 2852 R    6  0.6   0:02.34 1 intr_retu 
> cc1
> 28865 root      16   0  2976 1436 1096 R    3  0.0 300:37.48 0 184467440 
> top
> [snip]
> 
> I am now curious to rebuild exactely the same src/config with gcc-4.1?
> 
Well, only few hours:

top - 22:48:32 up  9:46,  5 users,  load average: 5.37, 6.23, 6.51
Tasks:  77 total,   1 running,  76 sleeping,   0 stopped,   0 zombie
Cpu0  :  1.0% us,  7.5% sy,  0.0% ni,  6.0% id, 85.4% wa,  0.0% hi,  0.0% si
Cpu1  :  1.0% us, 14.5% sy,  0.0% ni,  0.0% id, 66.5% wa,  0.0% hi, 18.0% si
Mem:   4114224k total,  3924572k used,   189652k free,   473008k buffers
Swap:   250872k total,        4k used,   250868k free,   334900k cached

BUG: soft lockup detected on CPU#0!
Backtrace:
  [<00000000101122b0>] dump_stack+0x18/0x28
  [<0000000010171b50>] softlockup_tick+0x128/0x158
  [<00000000101518f0>] run_local_timers+0x28/0x38
  [<0000000010152660>] update_process_times+0x58/0xd8
  [<000000001011cb98>] smp_do_timer+0x70/0x80
  [<00000000101134cc>] timer_interrupt+0xdc/0x1e0
  [<0000000010171cf4>] handle_IRQ_event+0x74/0xd0
  [<0000000010171e0c>] __do_IRQ+0xbc/0x268
  [<0000000010113e04>] do_cpu_irq_mask+0x114/0x1e0
  [<0000000010104074>] intr_return+0x0/0x1c

I will so now apply jejb's do_gettimeofday() patch and see.

Joel

> 
> Joel Soete wrote:
> 
>> Hello all,
>>
>> There was a very first hypothesis that I wanted to get rid: this 
>> testing n4k could have some hw broken?
>>
>> As I don't have access to fine hp diagnostics (iirc passwd requested) 
>> and I remember that some old kernel seems to works fine, I tried to 
>> re-compile 2.6.8.1 + latest kyle's patches. Well, it failed to rebuild 
>> with default gcc (4.1 right now) but succeded with gcc-3.3.
>>
>> Finaly, this kernel builded as smp 64bit ran 7days continioulsy 
>> without any failure of any kind my 2 stress test loop:
>> one stressing a bit io
>> # while true ; do nice -n -4 tar -xspf linux-2.6.11-pa4.tar; nice -n 
>> -4 rm -rf linux-2.6.11-pa4; date; done
>>
>> another to stress a bit cpu
>> # while true ; do make clean ; make oldconfig ; nice -n -4 make -j2 
>> vmlinux 2>&1 | tee -a /var/logs/k-loop; done
>>
>> # grep "LD      vmlinux" k-loop | wc -l
>> 495
>>
>> # uname -a
>> Linux patst006 2.6.8.1 #1 SMP Fri Jun 16 12:59:31 CEST 2006 parisc64 
>> GNU/Linux
>>
>> top - 14:32:29 up 7 days, 56 min,  4 users,  load average: 5.42, 5.49, 
>> 5.70
>> Tasks:  80 total,   4 running,  76 sleeping,   0 stopped,   0 zombie
>> Cpu0  : 71.7% us, 12.4% sy,  0.0% ni,  0.0% id,  0.0% wa,  0.0% hi, 
>> 15.9% si
>> Cpu1  : 93.9% us,  6.1% sy,  0.0% ni,  0.0% id,  0.0% wa,  0.0% hi,  
>> 0.0% si
>> Mem:   4107192k total,  3809232k used,   297960k free,   651624k buffers
>> Swap:   250872k total,    10596k used,   240276k free,   286312k cached
>> Change delay from 1.0 to:
>>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  P 
>> WCHAN     COMMAND
>> 27806 root      21  -4 15772  12m 5320 R   97  0.3   0:01.66 1 
>> intr_chec cc1
>> 27741 root      21  -4 19168  17m 5320 R   70  0.4   0:13.19 0 
>> intr_chec cc1
>>   984 gkrellmd  16   0  5196 1256 3156 S   17  0.0   1036:51 0 
>> select    gkrellmd
>> 16937 root      17   0  2912 1376 2616 R   11  0.0 320:52.43 0 
>> 63        top
>> 27800 root      15  -4  3452 1024 2440 R    3  0.0   0:01.00 1 
>> 611521008 tar
>>     1 root      16   0  2316  700 2096 S    0  0.0   5:34.89 1 
>> select    init
>>
>> I am well aware that's not perfect test (there are better 'stress') 
>> but at least make me a bit more confident in hw ;-)
>>
>> Cheers,
>>     Joel
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
>>
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
