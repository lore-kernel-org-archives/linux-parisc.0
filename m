From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] lmbench results for A500-44 SMP
Date: Thu, 7 Oct 2004 21:18:50 -0700
Message-ID: <20041008041849.GH14151@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

First entry is for 2.4.20-pa24 SMP
Second entry is for 2.6.9-rc3-pa3 SMP, with a cache flushing patch

Machine is a 440MHz a500 with 5GB of RAM.

In general our performance seems to have dropped a bit :(

randolph

                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------


Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
ios       Linux 2.4.20-        hppa64-linux-gnu  440
ios       Linux 2.6.9-r        hppa64-linux-gnu  440

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec sh  
                             call  I/O stat clos TCP   inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- ----
ios       Linux 2.4.20-  440 0.73 1.85 10.2 11.8 110.8 2.17 16.9 17.K 41.K 85.K
ios       Linux 2.6.9-r  440 0.77 1.19 13.2 15.4  71.4 2.23 11.1 2590 10.K 33.K

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
ios       Linux 2.4.20- 5.630 5.1500 4.9900 9.0800   23.4    52.1   175.8
ios       Linux 2.6.9-r  13.0   12.7   12.2   23.2  110.9    62.5   179.0

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
ios       Linux 2.4.20- 5.630  20.4 48.4  89.2 172.5 114.1 351.5 1000
ios       Linux 2.6.9-r  13.0  73.8 48.2 144.5 209.0 252.3 250.2     

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page	
                        Create Delete Create Delete  Latency Fault   Fault 
--------- ------------- ------ ------ ------ ------  ------- -----   ----- 
ios       Linux 2.4.20-  130.0   80.0  509.9  180.0  3120.0K 603.4    58.0
ios       Linux 2.6.9-r   93.0   67.0  302.9  165.0    95.1K 732.1    42.0

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
ios       Linux 2.4.20- 49.1 81.0 33.6   74.0  268.4  201.8  168.8 260. 250.9
ios       Linux 2.6.9-r 224. 328. 183.  283.6  264.2  184.3  155.0 256. 233.1

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
ios       Linux 2.4.20-   440  20.0   20.0  220.0    No L1 cache?
ios       Linux 2.6.9-r   440  23.0   22.0  233.0    No L1 cache?
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
