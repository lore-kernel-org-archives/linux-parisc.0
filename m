Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13147
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 10:27:46 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14KklS-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Mon, 22 Jan 2001 10:28:22 -0700 (MST)
Message-Id: <m14KklS-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@thepuffingroup.com
Date: Mon, 22 Jan 2001 10:28:18 -0700
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] First benchmark results
List-ID: <linux-parisc.vger.kernel.org>


Executive summary:
    HP-UX is shown out-of-the-box, with no parameter adjustments which
    could help it show better in these benchmarks.

    HP-UX, a mature much-tuned kernel and Linux, a not fully functional
    and never tuned on HP hardware kernel, are competitive in a great
    many areas.  HP-UX is faster in some areas, and Linux is faster than
    HP-UX in fewer areas.  This portends a bright future for Linux on parisc!

    HPUX, is MUCH faster than Linux at fork/exec and pipe and unix/tcp
    socket bandwidths.  Note: Linux fork/exec got a
    lot faster with the recent cache-flushing changes.  Linux wins
    big on stat, open/close, file create/delete (sometimes > 100:1).

    Linux beats HPUX in the 2-process context-switch trials, but not
    in the 8 or 16-process trials.

    The 100MHz gecko is roughly 8x slower than the 400MHz C3000 on
    compute-bound benchmarks, re-emphasizing that MHz is not an entirely
    trustworthy performance predictor.

Caveats:
    HPUX was not optimized for this benchmark.  Changing the fs_async flag
    might make a huge improvement in the file-system-related performance.

    The "TCP conn" data should not be trusted at all.

    LOTS OF DATA IS OBSCURED and possibly MISREPRESENTED by this summary.
    The hoards of data upon which this summary is based is available
    at http://puffin.external.hp.com/~bame/lmbench-2beta1/results.

    c3k-hpux is an active in-use HPUX box with variable loads runing
    all the standard daemons therefore some benchmark results are slow.

    Lmbench 2beta1 by its name is clearly "beta" software (though it seems
    to work fine).  More info about lmbench: http://www.bitmover.com/lmbench

    Some test programs on Linux still require manual intervention.

Key:
    c3k-j09-3	C3000 Pre-cache-flushing (Jan 9) kernel 32-bit Linux
    c3k-j19-3	C3000 Post-cache-flushing (Jan 19) kernel 32-bit Linux
    712-100	100MHz 9000/712 (gecko) Jan 19 Linux
    c3k-hpux	C3000 HPUX 10.20 (*** an active in-use system ***)


                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------
		 (Alpha software, do not distribute)

Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                    
--------- ------------- ----------------------- ----
c3k-j19-6 Linux 2.4.0-t      parisc64-linux-gnu  400
712-100   Linux 2.4.0-t        parisc-linux-gnu  100
c3k-j09-3 Linux 2.4.0-t        parisc-linux-gnu  400
c3k-j19-3 Linux 2.4.0-t        parisc-linux-gnu  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400
c3k-hpux  HP-UX B.10.20    hppa2.0-hp-hpux10.20  400

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec sh  
                             call  I/O stat clos TCP   inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- ----
c3k-j19-6 Linux 2.4.0-t  400 0.85 1.48 8.74   10    90 2.44   18 2513  13K  61K
712-100   Linux 2.4.0-t  100 3.07 5.10   44   47   249   12   72 5651  41K 229K
c3k-j09-3 Linux 2.4.0-t  400 0.77 1.34 8.35 8.96    63 2.31   14  11K 115K 433K
c3k-j19-3 Linux 2.4.0-t  400 0.76 1.32 8.12 8.88    61 2.26   14 1674  11K  53K
c3k-hpux  HP-UX B.10.20  400 0.34        21   25    55 3.42   12  699 1873 9950
c3k-hpux  HP-UX B.10.20  400 0.33        21   25    54 3.42   12  699 1876 9946
c3k-hpux  HP-UX B.10.20  400 0.33        21   25    55 3.42   12  698 1866 6678
c3k-hpux  HP-UX B.10.20  400 0.33        21   25    55 3.42   12  700 1871 6715

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
c3k-j19-6 Linux 2.4.0-t 1.870 1.8800 1.5800     25     84      29      97
712-100   Linux 2.4.0-t    23    156    617    175    625     179     627
c3k-j09-3 Linux 2.4.0-t 1.420 1.4400 1.2400     22     83      27      95
c3k-j19-3 Linux 2.4.0-t 1.360 1.3000 1.1500     22     82      27      95
c3k-hpux  HP-UX B.10.20 3.760 3.6500    273    119    288      92     184
c3k-hpux  HP-UX B.10.20 3.760 3.6800 3.7500 3.7000     32 6.31000      60
c3k-hpux  HP-UX B.10.20 3.760 3.6300 3.5100 3.5600     13 6.84000      64
c3k-hpux  HP-UX B.10.20 4.320 3.7700 3.6300 3.7000     10 5.92000      51

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
c3k-j19-6 Linux 2.4.0-t 1.870    10   19    29   144    38   218  208
712-100   Linux 2.4.0-t    23    43   84   153         260       1032
c3k-j09-3 Linux 2.4.0-t 1.420    21   49    41          36           
c3k-j19-3 Linux 2.4.0-t 1.360 9.501   19    28          36       8.2M
c3k-hpux  HP-UX B.10.20 3.760    20   22    42    93    39   103 2.0M
c3k-hpux  HP-UX B.10.20 3.760    19   22    41    93    39   101 2.0M
c3k-hpux  HP-UX B.10.20 3.760    19   21    41    93    39   101 2.0M
c3k-hpux  HP-UX B.10.20 4.320    19   21    41    93    39   102 2.0M

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page	
                        Create Delete Create Delete  Latency Fault   Fault 
--------- ------------- ------ ------ ------ ------  ------- -----   ----- 
c3k-j19-6 Linux 2.4.0-t     11 2.9577     35 7.4666     1944            20
712-100   Linux 2.4.0-t     78     11    184     20     3546            42
c3k-j09-3 Linux 2.4.0-t 9.0001 1.0000    170 3.0000 174.2860           937
c3k-j19-3 Linux 2.4.0-t 9.0001 1.0000     28 3.0000     1423              
c3k-hpux  HP-UX B.10.20   1123    598   1694    598 191.8620 6.480    5504
c3k-hpux  HP-UX B.10.20   1123    598   1754    598 181.1960 6.880    5738
c3k-hpux  HP-UX B.10.20   1136    598   1724    598 184.6730 4.232    5418
c3k-hpux  HP-UX B.10.20   1123    598   1724    598 185.1890 4.300    5475

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
c3k-j19-6 Linux 2.4.0-t   47   49   39     73    514    196    201  505   432
712-100   Linux 2.4.0-t 7.35 6.61 6.13     12     69     34     26   69    52
c3k-j09-3 Linux 2.4.0-t   47   49   41     76    509    195    199  509   430
c3k-j19-3 Linux 2.4.0-t   48   49   42     76    513    193    200  504   430
c3k-hpux  HP-UX B.10.20  406  528  298    490    391    164    163  503   452
c3k-hpux  HP-UX B.10.20  402  537  315    506    509    207    208  504   467
c3k-hpux  HP-UX B.10.20  407  537  312    508    509    207    206  494   467
c3k-hpux  HP-UX B.10.20  406  538  311    505    509    205    209  499   467

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
c3k-j19-6 Linux 2.4.0-t   400 7.503 7.5030    184    No L1 cache?
712-100   Linux 2.4.0-t   100    22     22    223    No L1 cache?
c3k-j09-3 Linux 2.4.0-t   400
