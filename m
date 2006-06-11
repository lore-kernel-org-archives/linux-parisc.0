From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 17:56:56 -0400 (EDT)
Message-ID: <200606112156.k5BLuvQe011929@hiauly1.hia.nrc.ca>
References: <119aab440606061830peac8e3ah7030b831881e6f76@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606061830peac8e3ah7030b831881e6f76@mail.gmail.com> from
	"Carlos O'Donell" at Jun 6, 2006 09:30:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> You've implemented almost exactly what glibc does for pthreads.
> However, glibc uses nanosleep without any adverse effects.

Are you sure?  The libgomp test libgomp.fortran/reduction6.f90
times out.  It's using pthread_mutex_lock and pthread_mutex_unlock
for locking (there's no futex implementation for parisc-linux).

I see with top:

top - 13:30:57 up 7 days, 22:52,  3 users,  load average: 0.00, 0.00, 0.00
Tasks:  73 total,   1 running,  72 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.2% us,  0.3% sy,  0.0% ni, 99.3% id,  0.2% wa,  0.0% hi,  0.0% si
Mem:   8227376k total,  8025664k used,   201712k free,   489404k buffers
Swap:  1367032k total,        0k used,  1367032k free,  3775216k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND

 ...
 7430 dave      15   0  8076  988  768 S    0  0.0   0:00.05 reduction6.xg
 7431 dave      16   0  8076  988  768 S    0  0.0   0:00.00 reduction6.xg
 7432 dave      19   0  8076  988  768 S    0  0.0   0:00.00 reduction6.xg
 7433 dave      20   0  8076  988  768 S    0  0.0   0:00.00 reduction6.xg
 ...

strace indicates that the reduction6.xg processes are mainly calling
sched_yield(), and occassionally nanosleep().

The program doesn't timeout under hpux.  I killed the program after 50m
on linux.  It appears that we are deadlocking on linux.  The time on
a relatively slow hpux system is:

# time ./reduction6.xg

real    0m0.047s
user    0m0.030s
sys     0m0.010s

It appears that the hpux built application never sleeps or calls
sched_yield.  Under linux, I see after running a bit the following
backtrace in nanosleep:

Program received signal SIGINT, Interrupt.
0x00032310 in nanosleep ()
(gdb) bt
#0  0x00032310 in nanosleep ()
#1  0x0003189c in __pthread_acquire (spinlock=0x191030) at spinlock.c:716
#2  0x000319d4 in __pthread_alt_unlock (lock=0xbff00d4c) at spinlock.c:527
#3  0x0002ef18 in __pthread_mutex_unlock (mutex=<value optimized out>)
    at mutex.c:199
#4  0x00015388 in *_gfortran_st_write_done (dtp=0xbff00aa8)
    at ../../../gcc/libgfortran/io/transfer.c:2424
#5  0x000105ac in MAIN__ ()
    at /home/dave/gcc-4.2/gcc/libgomp/testsuite/libgomp.fortran/reduction6.f90:10
#6  0x00011e58 in main (argc=<value optimized out>, argv=<value optimized out>)
    at ../../../gcc/libgfortran/fmain.c:18

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
