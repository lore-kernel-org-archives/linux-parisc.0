Return-Path: <rollei@tiscalinet.it>
Received: from smtp0.libero.it (smtp0.libero.it [193.70.192.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88B524891
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 02:42:47 -0700 (MST)
Sender: multix@dsl2.external.hp.com
Message-ID: <3FFBD4DF.ECB0ABBC@tiscalinet.it>
Date: Wed, 07 Jan 2004 10:43:59 +0100
From: Riccardo <rollei@tiscalinet.it>
MIME-Version: 1.0
To: ryan_bradetich@hp.com
Subject: Re: [parisc-linux] LMBench results on for the C200 for HP-UX 10.20,
	Linux 2.4.24-pa0, and Linux 2.6.0-pa8
References: <1073466464.752.112.camel@laptop.bradetich.net>
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: rollei@tiscalinet.it
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Ryan Bradetich wrote:
> 
> Hello all,
> 
> Thought people might be intersted in the LMBench results between HP-UX
> 10.20, Linux 2.4 and Linux 2.6.  All tests were performed on the same
> hardware and not optomized in any way for the tests.
Yes, very interesting. I'm using gentoo with a 2.4 kernel and felt the
box sooo slow sometimes while other times it seems reasonable.
For example doing setiathome crunching linux is 40% slower. Or
compilation is awfully slow (big projects like gcc 3.2.2 can take 2-3
times the time on hp-ux 10.20).

It seems that in some "traditional" unix areas HP-UX is faster while in
other it is slower.


> ----------------------------------------------------------------
> Host                 OS  Mhz null null      open selct sig  sig  fork
> exec sh
>                              call  I/O stat clos TCP   inst hndl proc
> proc proc
> --------- ------------- ---- ---- ---- ---- ---- ----- ---- ---- ----
> ---- ----
> vega      HP-UX B.10.20  200 0.83      26.1 36.0 200.6 7.97 30.2 1905
> 5220 19.K
> vega      HP-UX B.10.20  200 0.83      24.5 36.0 147.4 7.92 30.0 1910
> 5133 19.K
> vega      HP-UX B.10.20  200 0.83      24.3 36.3 145.0 7.90 29.9 1924
> 5258 19.K
> vega      Linux 2.6.0-p  200 1.46 2.45 14.4 19.3 150.3 5.65 28.9 5353
> 21.K 66.K
> vega      Linux 2.6.0-p  200 1.44 2.43 14.4 18.1       5.63 28.9 5344
> 21.K 65.K
> vega      Linux 2.6.0-p  200 1.46 2.45 14.4 18.1 149.8 5.65 28.8 5492
> 23.K 65.K
> vega      Linux 2.4.24-  200 1.37 2.80 14.7 18.9 148.2 4.96 29.2 10.K
> 42.K 111K
> vega      Linux 2.4.24-  200 1.37 2.80 14.7 18.9 148.0 4.97 29.2 11.K
> 42.K 111K
> vega      Linux 2.4.24-  200 1.37 2.80 14.7 18.9 148.2 4.97 29.0 11.K
> 42.K 111K
HP-UX fork is fast! linux 2.6 seems to bring some relief here. I always
marvel how fast HP-UX is when responding to a telnet login.
Instantaneus. Probably fork() speed compensates the lower latency linux
has in other areas.

 

> 
> *Local* Communication latencies in microseconds - smaller is better
> -------------------------------------------------------------------
> Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
>                         ctxsw       UNIX         UDP         TCP conn
> --------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
> vega      HP-UX B.10.20 9.110  48.7 78.7 117.6 500.2 127.5 300.2 313.
> vega      HP-UX B.10.20 9.510  47.0 65.6 115.0 464.2 166.3 734.1 284.
> vega      HP-UX B.10.20 9.230  47.9 77.5 112.4 506.4 127.1 325.6 300.
> vega      Linux 2.6.0-p 4.830  36.9 53.3  80.7 235.8 109.6 251.7 490.
> vega      Linux 2.6.0-p 4.530  31.7 53.5 140.2 230.2 108.0 286.3 469.
> vega      Linux 2.6.0-p 5.670  36.6 54.0 143.1 232.5 107.9 283.5 483.
> vega      Linux 2.4.24- 2.120  57.1 46.4  73.5 226.9  93.5 300.2 9958
> vega      Linux 2.4.24- 3.490  60.7 46.3  73.2 238.7  97.0 299.6 9957
> vega      Linux 2.4.24- 3.410  52.8 46.4  73.4 234.9  92.4 304.5 9958

seems that for AF_UNIX and TCP pipes 2.42. UDP is almost the half than
2.6

 
> *Local* Communication bandwidths in MB/s - bigger is better
> -----------------------------------------------------------
> Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem
> Mem
>                              UNIX      reread reread (libc) (hand) read
> write
> --------- ------------- ---- ---- ---- ------ ------ ------ ------ ----
> -----
> vega      HP-UX B.10.20 168. 102. 88.1  103.0  137.6   79.1   63.7 122.
> 102.3
> vega      HP-UX B.10.20 179. 99.5 97.7  101.4  136.3   85.0   64.1 121.
> 104.7
> vega      HP-UX B.10.20 180. 102. 108.  103.2  136.2   82.2   63.7 122.
> 102.8
> vega      Linux 2.6.0-p 19.4 19.9 5.65   31.4  246.4  126.0  129.4 249.
> 215.2
> vega      Linux 2.6.0-p 19.5 20.2 5.67   31.4  245.8  125.9  129.4 249.
> 214.8
> vega      Linux 2.6.0-p 19.4 20.2 5.86   31.4  245.6  125.8  129.4 249.
> 214.6
> vega      Linux 2.4.24- 19.6 19.8 9.02   32.0  246.7  125.8  129.5 249.
> 215.3
> vega      Linux 2.4.24- 19.6 19.7 9.50   31.7  246.4  126.0  129.4 249.
> 215.1
> vega      Linux 2.4.24- 19.6 19.8 9.40   35.5  246.2  125.9  129.4 249.
> 214.9

traditional pipe, af_unix and TCP are impressive for hp-ux. Really up to
ten times the bandwidth?. But memory is clear an advantage for linux.


Thanks for the testing.

-R
