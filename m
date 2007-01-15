From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Mon, 15 Jan 2007 01:20:05 +0100
Message-ID: <7d01f9f00701141620r4ca91b5cp242d3728afa0b01c__1927.90453224934$1416624263$gmane$org@mail.gmail.com>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>
	<200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
	<20070110222146.GD29244@colo.lackof.org> <45A7D875.9050309@scarlet.be>
	<7d01f9f00701141608t3af1fab5nd8819dea889cf956@mail.gmail.com>
	<7d01f9f00701141616y4e7726w4b7b59af0d270940@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Joel Soete" <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701141616y4e7726w4b7b59af0d270940@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

One last crash dump before I give up trying to boot this kernel:

VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: <0>------------[ cut here ]------------
Badness at arch/parisc/kernel/smp.c:353
Backtrace:
 [<000000004014b324>] irq_exit+0x6c/0x78
 [<00000000401150c0>] do_cpu_irq_mask+0x1b8/0x358
 [<000000004017e9e8>] __get_free_pages+0x48/0xc8
 [<0000000040111c38>] flush_data_cache+0x28/0x38
 [<000000004015da98>] flush_workqueue+0xb0/0x108
 [<00000000401109ac>] free_initmem+0x7c/0x318
 [<000000004010347c>] ret_from_kernel_thread+0x24/0x40

272k freed
Write protecting the kernel read-only data: 466k
INIT: version 2.86 booting
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
sh (pid 361): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111011000001111 Not tainted
r00-03  000000ff0804f60f 000000004060a340 0000000000000068 00000000fb2efc10
r04-07  00000000405fd340 000000007f320190 00000000000ded34 00000000000ded34
r08-11  00000000000ded34 00000000000ded34 0000000000000000 0000000000000008
r12-15  0000000000000000 0000000000000000 00000000001099e8 0000000000000001
r16-19  00000000000dd534 00000000000ad800 0000000000109c58 0000000000000000
r20-23  0000000000000000 0000000000000803 0000000000000000 000000007f3202b0
r24-27  0000000000000068 00000000fb2efc10 000000000000001f 00000000405fd340
r28-31  0000000044c4f6ed 000000007f3202a0 000000007f320480 00000000fb2efc10
sr00-03  000000000005c800 0000000000000000 000000000005c800 000000000005c800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402e62b0 00000000402e62b4
 IIR: 0f3692a8    ISR: 000000000005c800  IOR: 00000000fb2efc10
 CPU:        0   CR30: 000000007f320000 CR31: 00000000405b4000
 ORIG_R28: 00000000405fd340
 IAOQ[0]: pa_memcpy+0x78/0x2b0
 IAOQ[1]: pa_memcpy+0x7c/0x2b0
 RP(r2): 0x68
Backtrace:

/etc/init.d/rc: line 77:   361 Segmentation fault      $@
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
sh (pid 378): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 00000000405ff340 000000004020a128 000000000010e058
r04-07  00000000405fd340 000000007f2c8190 0000000000000018 0000000000000001
r08-11  0000000000000000 000000007f358280 000000007f72f5c0 000000007f45f400
r12-15  0000000000000000 000000000010e008 000000007f2c8190 00000000405dde60
r16-19  0000000000000000 0000000000000000 00000000000ded34 000000007f2c8000
r20-23  0000000000000001 ffffffffffffffea 00000000001ed1d6 0000000006fd155b
r24-27  0000000000000004 000000007f45a8ee 000000007f2c8190 00000000405fd340
r28-31  ffffffffffffffea 000000007f2c84f0 000000007f2c85c0 000000007f72f5b5
sr00-03  000000000006f000 0000000000000000 0000000000000000 000000000006f000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401bbb24 00000000401bbb28
 IIR: 0c76d2c0    ISR: 000000000006f000  IOR: 000000000010e058
 CPU:        0   CR30: 000000007f2c8000 CR31: 00000000405b4000
 ORIG_R28: 000000007f2c8480
 IAOQ[0]: filldir64+0x18c/0x1b8
 IAOQ[1]: filldir64+0x190/0x1b8
 RP(r2): call_filldir+0x90/0x120
Backtrace:

/etc/init.d/rc: line 77:   378 Segmentation fault      $@
Activating swap:swapon on /dev/sda2
Adding 2000084k swap on /dev/sda2.  Priority:-1 extents:1 across:2000084k
.
Will now check root file system:fsck 1.40-WIP (14-Nov-2006)
[/sbin/fsck.ext3 (1) -- /] fsck.ext3 -a -C0 /dev/sda3
/dev/sda3: clean, 19465/2198880 files, 202145/4393777 blocks
.
EXT3 FS on sda3, internal journal
Setting the system clock again..
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
System Clock set. Local time: Mon Jan 15 00:22:05 UTC 2007.
Cleaning up ifupdown...



On 1/15/07, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> On 1/15/07, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> > I got one of those traps again today trying to boot git head on my rp3440:
> >
> > Configuring network interfaces...done.
> >       _______________________________
> >      < Your System ate a SPARC! Gah! >
> >       -------------------------------
> >              \   ^__^
> >               \  (xx)\_______
> >                  (__)\       )\/\
> >                   U  ||----w |
> >                      ||     ||
> > sh (pid 625): Protection id trap (code 27)
> >
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00001000000001001111001100001111 Not tainted
> > r00-03  000000ff0804f30f 000000004060a340 0000000000000068 00000000fb199c10
> > r04-07  00000000405fd340 000000007eb24190 00000000000ded34 00000000000ded34
> > r08-11  0000000000000000 00000000000f2508 0000000000000000 0000000000000008
> > r12-15  0000000000000000 0000000000000000 00000000000f1f28 0000000000000001
> > r16-19  00000000000dd534 00000000000ad800 00000000000efa18 0000000000000000
> > r20-23  0000000000000000 0000000000000803 0000000000000000 000000007eb242b0
> > r24-27  0000000000000068 00000000fb199c10 000000000000001f 00000000405fd340
> > r28-31  0000000044c4f7c5 000000007eb242a0 000000007eb24480 00000000fb199c10
> > sr00-03  00000000002b2800 0000000000000000 00000000002b2800 00000000002b2800
> > sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >
> > IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402e62b0 00000000402e62b4
> >  IIR: 0f3692a8    ISR: 00000000002b2800  IOR: 00000000fb199c10
> >  CPU:        0   CR30: 000000007eb24000 CR31: 00000000405b4000
> >  ORIG_R28: 00000000405fd340
> >  IAOQ[0]: pa_memcpy+0x78/0x2b0
> >  IAOQ[1]: pa_memcpy+0x7c/0x2b0
> >  RP(r2): 0x68
> > Backtrace:
> >
> > /etc/init.d/rc: line 77:   625 Segmentation fault      $@
> > Initializing random number generator...done.
> > tg3: eth0: Link is up at 1000 Mbps, full duplex.
> > tg3: eth0: Flow control is off for TX and off for RX.
> >
> > That seems to have killed the boot process, I didn't get a login prompt
>
> I don't know if that's related but it seems that 1 out of 2 boot
> attempts the kernel doesn't get past the startup of INIT and freezes
> there. I don't think this is my 'ldap' bug because this box is
> properly configured to avoid it. Something else is happening I
> suppose....
>
> HTH
>
> --
> Thibaut VARENE
> http://www.parisc-linux.org/~varenet/
>


-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
