Return-Path: <ryan_bradetich@hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DD4F4854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 02:08:20 -0700 (MST)
Received: from 6-allhosts (unknown [10.0.230.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id D5DD92B10E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 02:08:16 -0700 (MST)
From: Ryan Bradetich <ryan_bradetich@hp.com>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1073466464.752.112.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Wed, 07 Jan 2004 02:07:46 -0700
Subject: [parisc-linux] LMBench results on for the C200 for HP-UX 10.20,
	Linux 2.4.24-pa0, and Linux 2.6.0-pa8
Reply-To: ryan_bradetich@hp.com
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello all,

Thought people might be intersted in the LMBench results between HP-UX
10.20, Linux 2.4 and Linux 2.6.  All tests were performed on the same 
hardware and not optomized in any way for the tests.

Thanks,

- Ryan


                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------


Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
vega      HP-UX B.10.20    hppa2.0-hp-hpux10.20  200
vega      HP-UX B.10.20    hppa2.0-hp-hpux10.20  200
vega      HP-UX B.10.20    hppa2.0-hp-hpux10.20  200
vega      Linux 2.6.0-p       hppa2.0-linux-gnu  200
vega      Linux 2.6.0-p       hppa2.0-linux-gnu  200
vega      Linux 2.6.0-p       hppa2.0-linux-gnu  200
vega      Linux 2.4.24-       hppa2.0-linux-gnu  200
vega      Linux 2.4.24-       hppa2.0-linux-gnu  200
vega      Linux 2.4.24-       hppa2.0-linux-gnu  200

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork
exec sh  
                             call  I/O stat clos TCP   inst hndl proc
proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ----
---- ----
vega      HP-UX B.10.20  200 0.83      26.1 36.0 200.6 7.97 30.2 1905
5220 19.K
vega      HP-UX B.10.20  200 0.83      24.5 36.0 147.4 7.92 30.0 1910
5133 19.K
vega      HP-UX B.10.20  200 0.83      24.3 36.3 145.0 7.90 29.9 1924
5258 19.K
vega      Linux 2.6.0-p  200 1.46 2.45 14.4 19.3 150.3 5.65 28.9 5353
21.K 66.K
vega      Linux 2.6.0-p  200 1.44 2.43 14.4 18.1       5.63 28.9 5344
21.K 65.K
vega      Linux 2.6.0-p  200 1.46 2.45 14.4 18.1 149.8 5.65 28.8 5492
23.K 65.K
vega      Linux 2.4.24-  200 1.37 2.80 14.7 18.9 148.2 4.96 29.2 10.K
42.K 111K
vega      Linux 2.4.24-  200 1.37 2.80 14.7 18.9 148.0 4.97 29.2 11.K
42.K 111K
vega      Linux 2.4.24-  200 1.37 2.80 14.7 18.9 148.2 4.97 29.0 11.K
42.K 111K

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K
16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ -------
-------
vega      HP-UX B.10.20 9.110   16.3   43.0  421.0  391.6   178.4  
427.5
vega      HP-UX B.10.20 9.510  279.0   19.5   23.1  394.9   168.5  
429.3
vega      HP-UX B.10.20 9.230   10.1 1678.0  365.8  363.0    50.4  
428.4
vega      Linux 2.6.0-p 4.830   43.9  163.9   56.1  187.4    60.1  
189.0
vega      Linux 2.6.0-p 4.530   47.2  164.7   58.1  185.7    59.7  
187.3
vega      Linux 2.6.0-p 5.670   45.2  163.5   57.8  193.7    59.1  
190.1
vega      Linux 2.4.24- 2.120   42.5  159.7   52.6  181.0    54.2  
182.3
vega      Linux 2.4.24- 3.490   42.0  163.5   52.9  182.2    55.3  
184.7
vega      Linux 2.4.24- 3.410   42.6  159.6   52.0  182.1    54.9  
184.3

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
vega      HP-UX B.10.20 9.110  48.7 78.7 117.6 500.2 127.5 300.2 313.
vega      HP-UX B.10.20 9.510  47.0 65.6 115.0 464.2 166.3 734.1 284.
vega      HP-UX B.10.20 9.230  47.9 77.5 112.4 506.4 127.1 325.6 300.
vega      Linux 2.6.0-p 4.830  36.9 53.3  80.7 235.8 109.6 251.7 490.
vega      Linux 2.6.0-p 4.530  31.7 53.5 140.2 230.2 108.0 286.3 469.
vega      Linux 2.6.0-p 5.670  36.6 54.0 143.1 232.5 107.9 283.5 483.
vega      Linux 2.4.24- 2.120  57.1 46.4  73.5 226.9  93.5 300.2 9958
vega      Linux 2.4.24- 3.490  60.7 46.3  73.2 238.7  97.0 299.6 9957
vega      Linux 2.4.24- 3.410  52.8 46.4  73.4 234.9  92.4 304.5 9958

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot   
Page	
                        Create Delete Create Delete  Latency Fault  
Fault 
--------- ------------- ------ ------ ------ ------  ------- -----  
----- 
vega      HP-UX B.10.20  14.1K 8403.4  20.8K 8474.6  7834.1K  24.1  
10.7K
vega      HP-UX B.10.20  13.9K 8333.3  20.8K 8474.6  7857.6K  25.6  
10.7K
vega      HP-UX B.10.20  13.9K 8333.3  20.8K 8474.6  7817.5K  29.9  
10.7K
vega      Linux 2.6.0-p  381.4   95.2 1097.7  225.4    78.0K 2016.   
30.0
vega      Linux 2.6.0-p  378.9   95.2 1262.6  226.3    77.1K 2117.   
30.0
vega      Linux 2.6.0-p  376.5   94.9 1273.9  223.9    76.5K 2049.   
30.0
vega      Linux 2.4.24-  361.1  117.2 1087.0  228.3    72.8K 1619.   
28.0
vega      Linux 2.4.24-  361.4  117.2 1634.0  229.9    73.4K 1638.   
29.0
vega      Linux 2.4.24-  361.3  116.8 1319.3  232.2    73.3K 1638.   
28.0

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem  
Mem
                             UNIX      reread reread (libc) (hand) read
write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ----
-----
vega      HP-UX B.10.20 168. 102. 88.1  103.0  137.6   79.1   63.7 122.
102.3
vega      HP-UX B.10.20 179. 99.5 97.7  101.4  136.3   85.0   64.1 121.
104.7
vega      HP-UX B.10.20 180. 102. 108.  103.2  136.2   82.2   63.7 122.
102.8
vega      Linux 2.6.0-p 19.4 19.9 5.65   31.4  246.4  126.0  129.4 249.
215.2
vega      Linux 2.6.0-p 19.5 20.2 5.67   31.4  245.8  125.9  129.4 249.
214.8
vega      Linux 2.6.0-p 19.4 20.2 5.86   31.4  245.6  125.8  129.4 249.
214.6
vega      Linux 2.4.24- 19.6 19.8 9.02   32.0  246.7  125.8  129.5 249.
215.3
vega      Linux 2.4.24- 19.6 19.7 9.50   31.7  246.4  126.0  129.4 249.
215.1
vega      Linux 2.4.24- 19.6 19.8 9.40   35.5  246.2  125.9  129.4 249.
214.9

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
vega      HP-UX B.10.20   200  15.0   15.0  539.0    No L1 cache?
vega      HP-UX B.10.20   200  15.0   15.0  592.3    No L1 cache?
vega      HP-UX B.10.20   200  15.0   15.0  581.0    No L1 cache?
vega      Linux 2.6.0-p   200  15.0   15.0  284.7    No L1 cache?
vega      Linux 2.6.0-p   200  15.0   15.0  284.6    No L1 cache?
vega      Linux 2.6.0-p   200  15.0   15.0  284.7    No L1 cache?
vega      Linux 2.4.24-   200  15.0   15.0  284.8    No L1 cache?
vega      Linux 2.4.24-   200  15.0   15.0  284.6    No L1 cache?
vega      Linux 2.4.24-   200  15.0   15.0  284.8    No L1 cache?
