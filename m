Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B547482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Apr 2002 23:42:47 -0700 (MST)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 2D785BD02
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Apr 2002 23:42:46 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 01 Apr 2002 23:42:46 -0700
Message-Id: <1017729766.31935.8.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] LM Bench results on the Same C200 between HP-UX 10.20 and
 parisc-linux 2.4.18-pa11
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

Hello parisc-linux hackers,


Here are the LM Bench Mark results I recently ran on my C200+.  The
HP-UX 10.20 bits are a couple of years old and not current on patches.

The 2.4.18-pa11 box is running debian unstable and is current.

Neither OS was tuned for this bench mark, but but OS were run on the
same box with the Same hardware configuration.


Hopefully these results someone will find interesting.....

- Ryan



                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------


Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
vega      HP-UX B.10.20    hppa2.0-hp-hpux10.20  200
vega      HP-UX B.10.20    hppa2.0-hp-hpux10.20  200
vega      Linux 2.4.18-       hppa2.0-linux-gnu  200
vega      Linux 2.4.18-       hppa2.0-linux-gnu  200

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec sh  
                             call  I/O stat clos TCP   inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- ----
vega      HP-UX B.10.20  200 0.83      25.9 37.9 160.1 8.15 30.2 1855 5224 19.K
vega      HP-UX B.10.20  200 0.82      26.0 40.3 157.5 8.11 30.2 1827 5185 19.K
vega      Linux 2.4.18-  200 1.46 2.89 15.8 18.7 151.5 5.01 29.1 12.K 35.K 102K
vega      Linux 2.4.18-  200 1.46 2.86 15.9 18.7 151.9 5.01 28.9 12.K 35.K 101K

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
vega      HP-UX B.10.20 9.020   11.4  452.3  361.5  347.0   173.1   399.6
vega      HP-UX B.10.20 9.010  279.5   24.9   31.0  357.2    49.7   286.8
vega      Linux 2.4.18- 2.760   42.3  158.1   51.2  177.9    53.3   181.2
vega      Linux 2.4.18- 3.460   42.3  158.8   52.7  180.2    53.9   180.5

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
vega      HP-UX B.10.20 9.020  64.4 79.2 119.4 554.9 126.8 411.2 309.
vega      HP-UX B.10.20 9.010  46.9 82.7 116.2 614.5 128.4 290.3 289.
vega      Linux 2.4.18- 2.760  28.9 47.7  77.4 187.6  98.5 273.0 425.
vega      Linux 2.4.18- 3.460  32.4 49.1  77.7 192.5  98.6 273.6 434.

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page	
                        Create Delete Create Delete  Latency Fault   Fault 
--------- ------------- ------ ------ ------ ------  ------- -----   ----- 
vega      HP-UX B.10.20  12.8K 8403.4  22.2K 8403.4  7807.8K  20.7   10.7K
vega      HP-UX B.10.20  13.2K 8403.4  22.2K 8333.3  7749.9K  37.2   10.7K
vega      Linux 2.4.18-  185.2   33.2  601.0   78.3    35.7K 2181.    26.0
vega      Linux 2.4.18-  185.9   33.1  606.4   78.8    10.0K 2166.    25.0

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
vega      HP-UX B.10.20 165. 101. 40.4  102.8  136.2   87.9   65.1 119. 101.9
vega      HP-UX B.10.20 177. 103. 67.8  103.5  138.4   86.4   63.9 121. 101.4
vega      Linux 2.4.18- 19.7 20.0 18.8   35.3  240.3  125.3  127.8 239. 196.6
vega      Linux 2.4.18- 19.7 20.0 36.5   30.9  240.0  126.1  127.7 240. 196.8

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
vega      HP-UX B.10.20   200  15.0   15.0  518.6    No L1 cache?
vega      HP-UX B.10.20   200  15.0   15.0  519.0    No L1 cache?
vega      Linux 2.4.18-   200  15.0   15.0  287.2    No L1 cache?
vega      Linux 2.4.18-   200  15.0   15.0  286.7    No L1 cache?
