From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] crash in mux_poll on K200/Kittyhawk (was: Hardware-List (fwd))
Date: Tue, 4 Sep 2007 16:18:21 -0600
Message-ID: <20070904221821.GW14130__40028.0528273017$1416624433$gmane$org@parisc-linux.org>
References: <20070828215632.R6291@saddam.controlq.com> <200709042213.25542.deller@gmx.de> <20070904172254.Q31055@saddam.controlq.com> <200709042344.30215.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rob@controlq.com,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Helge Deller <deller@gmx.de>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200709042344.30215.deller@gmx.de>
Resent-Message-ID: <4orI6.A.-_E._8d3GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Sep 04, 2007 at 11:44:29PM +0200, Helge Deller wrote:
> CONFIG_SMP=n  ignoring additional CPUs
> CPU: probe of 34 failed with error 1
> 
> Helge: ^^^^???

He's got a dual-CPU machine and has boted an SMP kernel.  So device 34
(the second CPU) gets an -EBUSY.

> Kernel Fault: Code=26 regs=2fd78600 (Addr=00000110)

Probably a null pointer offset ...

>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  0004ff0f 10370010 1012f7ac 103e7e84
> r04-07  0000000d 00000000 00000000 00000000
> r08-11  00000000 faf87e40 00000013 00000000
> r12-15  00030c4c 00000008 00000007 1013d4e0
> r16-19  2fd78240 103810b0 00000002 00000000
> r20-23  0000f000 c1b32767 1026b740 3e4cd8aa
> r24-27  0000002b 10383300 0000000d 10371010
> r28-31  00002000 103d3010 2fd78600 1012f7ac
> sr00-03  00000000 00000000 00000000 00000325
> sr04-07  00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 1026ba00 1026ba04
>  IIR: 48b50220    ISR: 00000000  IOR: 00000110
>  CPU:        0   CR30: 2fd78000 CR31: 10404000
>  ORIG_R28: 2fb84200
>  IAOQ[0]: mux_poll+0x2c0/0x2d4
>  IAOQ[1]: mux_poll+0x2c4/0x2d4
>  RP(r2): run_timer_softirq+0x124/0x1bc
> Kernel panic - not syncing: Kernel Fault
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
