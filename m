Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id B646F482A
	for <parisc-linux@parisc-linux.org>; Fri, 29 Mar 2002 00:53:55 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id cdjgmaaa for parisc-linux@parisc-linux.org; Fri, 29 Mar 2002 00:52:58 -0700
Date: Thu, 28 Mar 2002 23:53:30 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020329075330.GC26353@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] c3k lmbench results
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

As they say, benchmarks can be used to show most anything you want... so
these may be of limited usefulness, but anyway...

Here are some lmbench results on a c3000 machine. Only the c3k-new
numbers below are "new". The other ones are included for comparison,
based on Paul Bame's posting in Jan 2001:
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-January/010801.html

I was mostly interested in seeing how things have changed in the last
year or so. Of course, Paul and I ran benchmarks on different C3000
machines, so take the numbers with a grain of salt...

That said, the numbers for c3k-new below are for a 400MHz C3000 running
2.4.18-pa6 (32-bit kernel). It has 2G of RAM and a 10krpm Seagate ST118202LC 
drive connected to a sym53c896 controller. The system is connected to a
lightly loaded local network.

As I mentioned above, the c3k-old and c3k-hpux numbers are from Paul's
earlier posting. c3k-old is the c3k-j19-3 numbers.

Just for kicks, there are also numbers for a ia64 HP i2000 Itanium
workstation (labeled "ia64"). The i2000 is a SMP system with 2x800MHz
CPUs, 2G RAM, and a 10krpm Quantum drive connected to a qla1280
controller. lmbench is not a SMP benchmark though, so the numbers are
really for a single 800Mhz processor....

In general the parisc-linux numbers seem to have remained constant. I'm not 
sure what happened with the File/VM numbers though. The biggest
improvement I think is that many more things now work out of the box. We
still seem to be having some problems with the signals tests, but
otherwise the test runs much better than it used to.

Key:
    c3k-old	C3000 parisc-linux 1/19/2001 kernel
    c3k-new     C3000 parisc-linux 2.4.18-pa6 kernel
    c3k-hpux	C3000 HPUX 10.20 (*** an active in-use system ***)
    ia64        i2000 ia64-linux 2.4.17 kernel


                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------
		 (Alpha software, do not distribute)

Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
c3k-old   Linux 2.4.0-t        parisc-linux-gnu  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-new   Linux 2.4.18-       hppa2.0-linux-gnu  400
ia64       Linux 2.4.17                  ia64    800


Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec sh  
                             call  I/O stat clos TCP   inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- ----
c3k-old   Linux 2.4.0-t  400 0.76 1.32 8.12 8.88    61 2.26   14 1674  11K  53K
c3k-hpux  HP-UX B.10.20  400 0.34        21   25    55 3.42   12  699 1873 9950
c3k-hpux  HP-UX B.10.20  400 0.33        21   25    54 3.42   12  699 1876 9946
c3k-hpux  HP-UX B.10.20  400 0.33        21   25    55 3.42   12  698 1866 6678
c3k-hpux  HP-UX B.10.20  400 0.33        21   25    55 3.42   12  700 1871 6715
c3k-new   Linux 2.4.18-  400 0.70 1.26 6.78 7.46  62.0 2.18 14.7 3030 9459 27.K
ia64      Linux 2.4.17   800 0.56 0.81 2.89 4.69  38.3 1.07 3.52 381. 1559 7058


Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
c3k-old   Linux 2.4.0-t 1.360 1.3000 1.1500     22     82      27      95
c3k-hpux  HP-UX B.10.20 3.760 3.6500    273    119    288      92     184
c3k-hpux  HP-UX B.10.20 3.760 3.6800 3.7500 3.7000     32 6.31000      60
c3k-hpux  HP-UX B.10.20 3.760 3.6300 3.5100 3.5600     13 6.84000      64
c3k-hpux  HP-UX B.10.20 4.320 3.7700 3.6300 3.7000     10 5.92000      51
c3k-new   Linux 2.4.18- 1.260 1.2100 1.0400   20.2   84.6    27.4    97.3
ia64       Linux 2.4.17 6.350 9.5200   35.7   18.4   42.7    19.4    69.7


*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
c3k-old   Linux 2.4.0-t 1.360 9.501   19    28          36       8.2M
c3k-hpux  HP-UX B.10.20 3.760    20   22    42    93    39   103 2.0M
c3k-hpux  HP-UX B.10.20 3.760    19   22    41    93    39   101 2.0M
c3k-hpux  HP-UX B.10.20 3.760    19   21    41    93    39   101 2.0M
c3k-hpux  HP-UX B.10.20 4.320    19   21    41    93    39   102 2.0M
c3k-new   Linux 2.4.18- 1.260  12.7 19.2  29.4  57.4  35.6  80.0 143.
ia64       Linux 2.4.17 6.350  17.1 32.0  44.1  73.2  60.0 104.6 111.


File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page	
                        Create Delete Create Delete  Latency Fault   Fault 
--------- ------------- ------ ------ ------ ------  ------- -----   ----- 
c3k-old   Linux 2.4.0-t 9.0001 1.0000     28 3.0000     1423              
c3k-hpux  HP-UX B.10.20   1123    598   1694    598 191.8620 6.480    5504
c3k-hpux  HP-UX B.10.20   1123    598   1754    598 181.1960 6.880    5738
c3k-hpux  HP-UX B.10.20   1136    598   1724    598 184.6730 4.232    5418
c3k-hpux  HP-UX B.10.20   1123    598   1724    598 185.1890 4.300    5475
c3k-new   Linux 2.4.18-  102.5   42.5  392.2   81.8    15.2K 695.2    11.0
ia64       Linux 2.4.17   89.8   26.4  195.2   57.7   5460.0 1.298    4.00000


*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
c3k-old   Linux 2.4.0-t   48   49   42     76    513    193    200  504   430
c3k-hpux  HP-UX B.10.20  406  528  298    490    391    164    163  503   452
c3k-hpux  HP-UX B.10.20  402  537  315    506    509    207    208  504   467
c3k-hpux  HP-UX B.10.20  407  537  312    508    509    207    206  494   467
c3k-hpux  HP-UX B.10.20  406  538  311    505    509    205    209  499   467
c3k-new   Linux 2.4.18- 47.8 48.9 82.3   74.0  472.9  205.2  207.5 472. 474.7
ia64       Linux 2.4.17 600. 464. 315.  267.9  160.7  428.4  106.8 161. 222.2


Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
c3k-old   Linux 2.4.0-t   400 7.503 7.5030    184    No L1 cache?
c3k-new   Linux 2.4.18-   400 7.502 7.5020  184.8    No L1 cache?
ia64       Linux 2.4.17   800 3.786   27.8  244.1

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
