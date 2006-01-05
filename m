From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re:[parisc-linux] Re: init pause() on some systems but not all?
Date: Thu,  5 Jan 2006 10:22:36 +0100
Message-ID: <ISM4PO$E2049D32F139939E93037B953A98A7B7@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "soete.joel" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Max,
> 
> > Hi Joel & PA,
> > 
> > I also have the same, or at least similar problem on my c3700
> > (2.6.15-rc1-pa1, 2.6.15-rc5-pa3, debian/testing):
> 
> Thanks for feedback ;-)
> 
> Just a small uptade about 2.5.15-pa1 kernel: the pb is still there ;-/
> 
> For what is the very frustating situation, I just view alive the pb occ=
uring
> on all my testing systems (b2k, d380, b180, n4k): all were clean, early=
 this
> morning when daily cron job started, then after a few moment init() fal=
l in
> pause() but very hard to tack some picture of process runing on all tho=
se
> sytem at this very moment :<(
> 

Could it be that you installed ckrootkit dpkg on your system?

I trace more closely daily cron behaviour (loging a top -b -d 1) and:
- just one second before init fall in pause():
top - 07:42:14 up 17 min, 3 users, load average: 1.82, 2.13, 1.38
Tasks: 70 total, 2 running, 68 sleeping, 0 stopped, 0 zombie
Cpu(s): 4.5% us, 79.5% sy, 15.2% ni, 0.0% id, 0.0% wa, 0.0% hi, 0.9% si
Mem: 255260k total, 252612k used, 2648k free, 109220k buffers
Swap: 517480k total, 0k used, 517480k free, 26856k cached

PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ WCHAN COMMAND
4012 root 35 10 2904 1712 440 R 91.2 0.7 0:03.87 intr_chec chkproc
3882 root 16 0 2904 1328 1020 R 9.1 0.5 0:07.69 read top
1 root 16 0 2292 808 664 S 0.0 0.3 0:41.79 select init
2 root 34 19 0 0 0 S 0.0 0.0 0:00.00 ksoftirqd ksoftirqd

- just next sec:
top - 07:42:15 up 17 min, 3 users, load average: 1.82, 2.13, 1.38
Tasks: 70 total, 2 running, 68 sleeping, 0 stopped, 0 zombie
Cpu(s): 3.7% us, 78.9% sy, 17.4% ni, 0.0% id, 0.0% wa, 0.0% hi, 0.0% si
Mem: 255260k total, 251592k used, 3668k free, 109224k buffers
Swap: 517480k total, 0k used, 517480k free, 26864k cached

PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ WCHAN COMMAND
3882 root 16 0 2904 1328 1020 R 9.1 0.5 0:07.79 read top
3030 root 25 10 3776 2304 1112 S 1.8 0.9 0:03.55 pipe_wait chkrootki
1 root 16 0 2292 808 664 S 0.0 0.3 0:41.79 pause init
2 root 34 19 0 0 0 S 0.0 0.0 0:00.00 ksoftirqd ksoftirqd

I disable all cron (anacron & cron) on a system (b2k), reboot it and laun=
ched
chrootkit manualy and the pb shows up quickly around:
[...]
Searching for anomalies in shell history files... nothing found
Checking `asp'... not infected
Checking `bindshell'... not infected
Checking `lkm'... chkproc: nothing detected
Checking `rexedcs'... not found
Checking `sniffer'... lo: not promisc and no packet sniffer sockets
eth0: not promisc and no packet sniffer sockets
eth1: not promisc and no packet sniffer sockets
Checking `w55808'... not infected
Checking `wted'... chkwtmp: nothing deleted
Checking `scalper'... not infected
Checking `slapper'... not infected
[...]

This pkg is installed on all my systems but on the system on which the pb=

doesn't occure, it was a bit differently configured (run on demand not da=
ily
croned).

Given those info, I hope to progress a bit (more) ;-)

hth,
   Joel
=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
