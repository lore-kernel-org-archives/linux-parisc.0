From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] rcu torture test panics on 2-way pa8800
Date: Sun, 22 Jan 2006 11:43:39 -0700
Message-ID: <20060122184339.GA26201@colo.lackof.org>
References: <20060122071308.GA8592@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060122071308.GA8592@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 22, 2006 at 12:13:08AM -0700, Grant Grundler wrote:
> Hi,
> I accidentally include RCU_TORTURE_TEST=y in the 2.6.16-rc1-pa2
> kernels I was building and it worked fine on two out of three
> of the rp3440 (pa8800 CPU) boxes I'm banging on.
...
> Got the following panic on the 2-core 800Mz box:

FYI.

One of the 4-way 800Mhz rp3440's ran rcu torture test overnight:
ioz:/usr/src/linux-2.6# w
 10:27:57 up 10:46,  1 user,  load average: 9.01, 9.01, 9.00
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
root     ttyS1    -                23:45    0.00s  0.73s  0.04s w
ioz:/usr/src/linux-2.6# uname -a
Linux ioz 2.6.16-rc1-pa1 #3 SMP Thu Jan 19 17:26:22 PST 2006 parisc64 GNU/Linux


top - 10:27:33 up 10:45,  1 user,  load average: 9.01, 9.02, 9.00
Tasks:  78 total,   9 running,  69 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.0% us, 99.8% sy,  0.0% ni,  0.2% id,  0.0% wa,  0.0% hi,  0.0% si
Mem:   2053212k total,   976424k used,  1076788k free,   162632k buffers
Swap:        0k total,        0k used,        0k free,   482212k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND           
  135 root      39  19     0    0    0 R 67.6  0.0 318:58.94 rcu_torture_rea    
  129 root      39  19     0    0    0 R 50.2  0.0 320:48.46 rcu_torture_rea    
  130 root      39  19     0    0    0 R 50.2  0.0 317:37.93 rcu_torture_rea    
  128 root      39  19     0    0    0 R 48.3  0.0 317:52.39 rcu_torture_rea    ...

something is clearly working differently on the 2-way (single socket)
machine. I'm inclined to believe it's a clue about L2 cache at this point.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
