Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 413174833
	for <parisc-linux@parisc-linux.org>; Mon,  1 Apr 2002 23:49:02 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ubvhmaaa for parisc-linux@parisc-linux.org; Mon, 1 Apr 2002 23:48:10 -0700
Date: Mon, 1 Apr 2002 22:48:55 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020402064855.GA469@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] and more lmbench results
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

while we are on the subject, posting these per Grant's request:

gsyprf10 == Quad 500MHz PIII Xeon 768M RAM
pippin == Dual 800Mhz ia64 2G RAM
legolas == 400MHz c3000 parisc 2G RAM


                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------


Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
gsyprf10  Linux 2.4.18-       i686-pc-linux-gnu  500
gsyprf10  Linux 2.4.18-       i686-pc-linux-gnu  500
pippin     Linux 2.4.17                  pippin  800
legolas   Linux 2.4.18-                 legolas  399

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec sh  
                             call  I/O stat clos TCP   inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- ----
gsyprf10  Linux 2.4.18-  500 0.66 1.15 3.98 6.11  63.1 1.79 5.42 500. 1695 5942
gsyprf10  Linux 2.4.18-  500 0.66 1.12 4.01 6.26  57.9 1.82 5.42 501. 1698 6003
pippin     Linux 2.4.17  800 0.56 0.81 2.89 4.69  38.3 1.07 3.52 381. 1559 7058
legolas   Linux 2.4.18-  399 0.70 1.26 6.78 7.46  62.0 2.18 14.7 3030 9459 27.K

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
gsyprf10  Linux 2.4.18- 3.360   11.9   43.1   18.6   45.7    19.4    54.4
gsyprf10  Linux 2.4.18- 3.540   12.1   43.1   19.4   46.2    19.4    46.8
pippin     Linux 2.4.17 6.350 9.5200   35.7   18.4   42.7    19.4    69.7
legolas   Linux 2.4.18- 1.260 1.2100 1.0400   20.2   84.6    27.4    97.3

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
gsyprf10  Linux 2.4.18- 3.360  14.8 35.6  80.7 123.3  98.1 151.3 227.
gsyprf10  Linux 2.4.18- 3.540  14.7 35.3  80.5 123.0  98.4 150.1 225.
pippin     Linux 2.4.17 6.350  17.1 32.0  44.1  73.2  60.0 104.6 111.
legolas   Linux 2.4.18- 1.260  12.7 19.2  29.4  57.4  35.6  80.0 143.

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page	
                        Create Delete Create Delete  Latency Fault   Fault 
--------- ------------- ------ ------ ------ ------  ------- -----   ----- 
gsyprf10  Linux 2.4.18-   62.2   10.3  174.5   31.2   4049.0 1.448 5.00000
gsyprf10  Linux 2.4.18-   62.2   10.3  174.6   31.2   3924.0 1.437 5.00000
pippin     Linux 2.4.17   89.8   26.4  195.2   57.7   5460.0 1.298 4.00000
legolas   Linux 2.4.18-  102.5   42.5  392.2   81.8    15.2K 695.2    11.0

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
gsyprf10  Linux 2.4.18- 227. 220. 99.3  207.0  280.1  185.3  160.1 280. 214.3
gsyprf10  Linux 2.4.18- 218. 221. 106.  206.4  280.1  185.2  160.2 280. 214.3
pippin     Linux 2.4.17 600. 464. 315.  267.9  160.7  428.4  106.8 161. 222.2
legolas   Linux 2.4.18- 47.8 48.9 82.3   74.0  472.9  205.2  207.5 472. 474.7

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
gsyprf10  Linux 2.4.18-   500 6.001   36.0  212.1
gsyprf10  Linux 2.4.18-   500 6.002   36.0  212.1
pippin     Linux 2.4.17   800 3.786   27.8  244.1
legolas   Linux 2.4.18-   399 7.502 7.5020  184.8    No L1 cache?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
