Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEB69482D
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 17:45:35 -0700 (MST)
Date: Sun, 9 Feb 2003 15:56:56 -0800
From: Randolph Chung <tausq@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030209235656.GA31429@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <20030209031014.GD19683@dsl2.external.hp.com> <20030209122913.G27544@parcelfarce.linux.theplanet.co.uk> <20030209191441.GA21938@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209191441.GA21938@dsl2.external.hp.com>
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

> I've not done or seen any lmbench perf results recently but before hpux

well, we can fix that... :) Here are the numbers for a 2x440Mhz A500 running 
2.4.20-pa24 SMP.

btw, if you look at
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-April/015984.html
we are only 2-3x slower than hpux :-)

I'm a bit confused about the "mmap latency" numbers. why are they so
high?

Related to this, thibaut and I were experimenting with running dbench on
two A500s today running identical kernels, but one is 2x440MHz and one
is 2x550MHz. The 550MHz is almost 10x faster. Is that expected?
Memory/disk configurations (3GB RAM in 440MHz, 2.5GB in 550MHz, etc) are 
not exactly the same, but I wouldn't have expected them to differ by that much.

randolph

                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------


Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
ios       Linux 2.4.20-        hppa64-linux-gnu  440

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec sh  
                             call  I/O stat clos TCP   inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- ----
ios       Linux 2.4.20-  440 0.73 1.85 10.2 11.8 110.8 2.17 16.9 17.K 41.K 85.K

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
ios       Linux 2.4.20- 5.630 5.1500 4.9900 9.0800   23.4    52.1   175.8

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
ios       Linux 2.4.20- 5.630  20.4 48.4  89.2 172.5 114.1 351.5 1000

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page	
                        Create Delete Create Delete  Latency Fault   Fault 
--------- ------------- ------ ------ ------ ------  ------- -----   ----- 
ios       Linux 2.4.20-  130.0   80.0  509.9  180.0  3120.0K 603.4    58.0

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
ios       Linux 2.4.20- 49.1 81.0 33.6   74.0  268.4  201.8  168.8 260. 250.9

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
ios       Linux 2.4.20-   440  20.0   20.0  220.0    No L1 cache?
