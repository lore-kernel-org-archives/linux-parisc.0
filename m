From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Mon, 8 Jan 2007 14:31:20 +0100
Message-ID: <7d01f9f00701080531j1f464ebav3b3024beaa814c29__31219.2013291225$1416624257$gmane$org@mail.gmail.com>
References: <7d01f9f00701051834l4766fe0aya242c808bffbc407@mail.gmail.com>
	<200701061818.l06II9wm002956@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701061818.l06II9wm002956@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 1/6/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > After another attempt I could eventually log in again and thought this
> > "wasn't much" (so to speak). Then after a few more hours I realized
> > the loadavg on the machine was abnormally high. A sshd process was
> > taking 100% of CPU time. I tried to kill it (with SIGTERM first,
> > twice), and as it wouldn't terminate I issued a SIGKILL, which had the
> > very nice effect of taking down the whole machine, spitting endless
> > regdumps on the console (see the last dump of the following log).
> >
> > The console log / short story is here:
> > http://www.pateam.org/archive/dumps/sshd-code27
>
> This appears to be the same problem as I'm having killing hung
> java processes.  When I went in this morning to reboot the machine,
> it was looping endlessly at the same spot.  It had some hung java
> processes and I had tried to do a "shutdown -r +0".  I'm seeing
> this with 32bit UP kernel, so I don't think using a UP kernel is
> a workaround.
>
> I'd look at the dumps for the protection id traps.  Possibly,
> there might be a clue there as to what went wrong.

It's possible this bug has been there for a longer time than first
tought: here's what happened on my B180 running 2.6.8.1 and debian
sarge:

       _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
sshd (pid 5877): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111110100001111 Not tainted
r00-03  00000000 103d0c40 10176cb0 2755ef40
r04-07  00000001 0007c7b0 000000c9 2755ef40
r08-11  00000000 0007c7b8 00000001 fffffff2
r12-15  0006bad8 00068cdc 0004d800 0006a4dc
r16-19  00068cdc 0006a4dc 0006b4dc 00000001
r20-23  00000001 00000003 0007c7b6 2755ef4e
r24-27  00000000 00000001 2232ff00 10309010
r28-31  00000001 00000004 1dad4140 10176aa0
sr0-3   00000000 000030d8 00000000 000030da
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10176d84 10176d88
 IIR: 0ed3d240    ISR: 000030da  IOR: 0007c7b6
 CPU:        0   CR30: 1dad4000 CR31: 10360000
 ORIG_R28: 0006a4dc
 IAOQ[0]: sys_poll+0x1f4/0x218
 IAOQ[1]: sys_poll+0x1f8/0x218
 RP(r2): sys_poll+0x120/0x218
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
              \  (xx)\_______
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
sshd (pid 29561): Protection id trap (code 27)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111110000001111 Not tainted
r00-03  00000000 103d0c40 10176cb0 204e0dc0
r04-07  00000001 0007c778 000000c9 204e0dc0
r08-11  00000000 0007c780 00000001 fffffff2
r12-15  0006bad8 00068cdc 0004d800 0006a4dc
r16-19  00068cdc 0006a4dc 0006b4dc 00000001
r20-23  00000001 00000003 0007c77e 204e0dce
r24-27  00000000 00000001 1f46c800 10309010
r28-31  00000001 00000004 13d8c140 10176aa0
sr0-3   00000000 00004ea1 00000000 00004ea3
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10176d84 10176d88
 IIR: 0ed3d240    ISR: 00004ea3  IOR: 0007c77e
 CPU:        0   CR30: 13d8c000 CR31: 10360000
 ORIG_R28: 0006a4dc
 IAOQ[0]: sys_poll+0x1f4/0x218
 IAOQ[1]: sys_poll+0x1f8/0x218
 RP(r2): sys_poll+0x120/0x218


[varenet@greg ~]$ dpkg -l ssh
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  ssh            3.8.1p1-8.sarg Secure rlogin/rsh/rcp replacement (OpenSSH)
[varenet@greg ~]$ uname -a
Linux greg 2.6.8.1-pa11 #1 Thu Oct 28 15:02:44 CEST 2004 parisc GNU/Linux


HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
