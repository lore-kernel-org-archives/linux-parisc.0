Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9571482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 23:41:38 -0700 (MST)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 781CEBC45
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 23:41:37 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed; boundary="=-gqczsLiozeWrux9wGBjI"
Date: 14 Jan 2002 23:41:37 -0700
Message-Id: <1011076897.23556.3.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] LMBench on SMP A500
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

--=-gqczsLiozeWrux9wGBjI
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Parisc-linux hackers,

I ran the lmbench mark sweet against an dual-processor A500.  I have
attached the results of the benchmark for people to review.

I am not convinced of the validity of the benchmark because the
following message repeatedly showed up in dmesg:


do_page_fault() pid=22449 command='lat_sig' type=15 address=0x40019000
vm_start = 0x40019000, vm_end = 0x4001a000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Not tainted
r00-03  0000000000000000 fffffffffffff000 0000000000011f3b
0000000040019000
r04-07  00000000bff00410 00000000bff001c8 0000000000027a32
0000000000000003
r08-11  0000000000027a72 0000000000000000 00000000000cea08
00000000000cf148
r12-15  0000000000000000 00000000000cafe8 00000000ffffffff
0000000000000000
r16-19  0000000000000000 00000000000b9e9c 0000000000000000
0000000000000001
r20-23  000000000000004e 00000000400cf460 0000000000000000
0000000000000008
r24-27  0000000000000000 0000000000000000 0000000000027b4c
0000000000027870
r28-31  0000000000000000 0000000000000000 00000000bff00500
00000000400cf46b
sr0-3   00000000002bcf00 00000000002bcf00 0000000000000000
00000000002bcf00
sr4-7   00000000002bcf00 00000000002bcf00 00000000002bcf00
00000000002bcf00

but I wanted to throw the results out for discussion.

Thanks,

- Ryan



--=-gqczsLiozeWrux9wGBjI
Content-Disposition: attachment; filename=lmbench.rbrad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1

                 L M B E N C H  2 . 0   S U M M A R Y
                 ------------------------------------


Basic system parameters
----------------------------------------------------
Host                 OS Description              Mhz
                                                   =20
--------- ------------- ----------------------- ----
gsyprf11. Linux 2.4.17-        hppa64-linux-gnu  443
gsyprf11. Linux 2.4.17-        hppa64-linux-gnu  443
gsyprf11. Linux 2.4.17-        hppa64-linux-gnu  443

Processor, Processes - times in microseconds - smaller is better
----------------------------------------------------------------
Host                 OS  Mhz null null      open selct sig  sig  fork exec =
sh =20
                             call  I/O stat clos TCP   inst hndl proc proc =
proc
--------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ---- ---- =
----
gsyprf11. Linux 2.4.17-  443 0.71 1.38 6.81 8.42  80.2 2.06 16.0 17.K 37.K =
74.K
gsyprf11. Linux 2.4.17-  443 0.71 1.39 6.77 8.42  80.6 2.06 16.0 17.K 37.K =
74.K
gsyprf11. Linux 2.4.17-  443 0.71 1.39 6.79 8.42  80.3 2.06 16.0 17.K 37.K =
74.K

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------
Host                 OS 2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                        ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ----- ------ ------ ------ ------ ------- -------
gsyprf11. Linux 2.4.17- 5.640 5.4400 4.6900 6.1000   18.3    30.2    93.0
gsyprf11. Linux 2.4.17- 5.430 5.4100 5.0300 6.9200   21.2    30.6    92.9
gsyprf11. Linux 2.4.17- 5.570 5.3800 5.0400 5.6200   19.4    30.0    94.3

*Local* Communication latencies in microseconds - smaller is better
-------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
gsyprf11. Linux 2.4.17- 5.640  26.2 37.1             107.5       4977
gsyprf11. Linux 2.4.17- 5.430  31.6 37.1             108.4       4977
gsyprf11. Linux 2.4.17- 5.570  27.1 37.8             107.0       4932

File & VM system latencies in microseconds - smaller is better
--------------------------------------------------------------
Host                 OS   0K File      10K File      Mmap    Prot    Page=09
                        Create Delete Create Delete  Latency Fault   Fault=20
--------- ------------- ------ ------ ------ ------  ------- -----   -----=20
gsyprf11. Linux 2.4.17-   40.0   10.0  270.0   50.0  1480.0K 550.0       =20
gsyprf11. Linux 2.4.17-   40.0   10.0  270.0   60.0  1480.0K 557.9    14.0
gsyprf11. Linux 2.4.17-   40.0   10.0  280.0   60.0  1480.0K 550.0    20.0

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Me=
m
                             UNIX      reread reread (libc) (hand) read wri=
te
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- ---=
--
gsyprf11. Linux 2.4.17- 51.3 81.0 68.5   78.5  483.7  204.9  206.5 483. 455=
.0
gsyprf11. Linux 2.4.17- 51.3 81.0 68.8   78.5  483.7  200.3  204.9 488. 458=
.9
gsyprf11. Linux 2.4.17- 51.3 81.0 68.6   78.5  483.7  195.9  198.8 483. 440=
.1

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
---------------------------------------------------
Host                 OS   Mhz  L1 $   L2 $    Main mem    Guesses
--------- -------------  ---- ----- ------    --------    -------
gsyprf11. Linux 2.4.17-   443

--=-gqczsLiozeWrux9wGBjI--
