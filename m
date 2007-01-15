From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Mon, 15 Jan 2007 01:08:26 +0100
Message-ID: <7d01f9f00701141608t3af1fab5nd8819dea889cf956__33127.5820419707$1416624262$gmane$org@mail.gmail.com>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>
	<200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
	<20070110222146.GD29244@colo.lackof.org> <45A7D875.9050309@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Joel Soete" <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45A7D875.9050309@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I got one of those traps again today trying to boot git head on my rp3440:

Configuring network interfaces...done.
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
sh (pid 625): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111001100001111 Not tainted
r00-03  000000ff0804f30f 000000004060a340 0000000000000068 00000000fb199c10
r04-07  00000000405fd340 000000007eb24190 00000000000ded34 00000000000ded34
r08-11  0000000000000000 00000000000f2508 0000000000000000 0000000000000008
r12-15  0000000000000000 0000000000000000 00000000000f1f28 0000000000000001
r16-19  00000000000dd534 00000000000ad800 00000000000efa18 0000000000000000
r20-23  0000000000000000 0000000000000803 0000000000000000 000000007eb242b0
r24-27  0000000000000068 00000000fb199c10 000000000000001f 00000000405fd340
r28-31  0000000044c4f7c5 000000007eb242a0 000000007eb24480 00000000fb199c10
sr00-03  00000000002b2800 0000000000000000 00000000002b2800 00000000002b2800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402e62b0 00000000402e62b4
 IIR: 0f3692a8    ISR: 00000000002b2800  IOR: 00000000fb199c10
 CPU:        0   CR30: 000000007eb24000 CR31: 00000000405b4000
 ORIG_R28: 00000000405fd340
 IAOQ[0]: pa_memcpy+0x78/0x2b0
 IAOQ[1]: pa_memcpy+0x7c/0x2b0
 RP(r2): 0x68
Backtrace:

/etc/init.d/rc: line 77:   625 Segmentation fault      $@
Initializing random number generator...done.
tg3: eth0: Link is up at 1000 Mbps, full duplex.
tg3: eth0: Flow control is off for TX and off for RX.

That seems to have killed the boot process, I didn't get a login prompt

On 1/12/07, Joel Soete <soete.joel@scarlet.be> wrote:
>
>
> Grant Grundler wrote:
> > On Tue, Jan 09, 2007 at 09:05:33PM -0500, John David Anglin wrote:
> >> I think all the hung processes aren't being scheduled.  strace shows
> >> nothing and evertime I attach with gdb the processes are always at
> >> exactly the same place.  It's killing the thread manager process that
> >> crashes the system.  The others can be killed.
> >
> > Running "make -j4" on a 2-way machine with 2.6.20-rc3, top shows
> > processes being scheduled only on CPU 0. CPU 1 is always idle.
> > This was reproducible with 2.6.20-rc[23] on a500 and rp3440.
> the same with 2.6.20-rc4 with 32bit smp kernel on a d380.
>
> > I've verified this bug doesn't exist on 2.6.17-pa6.
> > I need to retest with something more recent (ie 2.6.19).
> >
> mmm, some time ago it was easy to grab those src thanks to "Source Tarballs" but today how may I grab it from git?
>
>
> Tia,
>         Joel
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>


-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
