From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Broken scheduler?
Date: Fri, 19 Jan 2007 07:52:57 +0100
Message-ID: <JC3SG9$08664EC660BE72CA9D6A1C1EACA6B93C__10266.5862221786$1416624265$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "T-Bone" <T-Bone@parisc-linux.org>
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

> On 1/17/07, Joel Soete <soete.joel@scarlet.be> wrote:
> > > Hi pa-ckers
> > >
> > [snip]
> > >
> > > That's with git head (+ tausq's cache patch
> > is it that stuff: <http://parisc-linux.org/~tausq/cache.diff.txt>
> >
> > I test that on b2k running 32bit up kernel but failled to boot???
> 
> It only works on pa8800 cpus so far.
> 
> > > + kyle's sysinfo patch +
> > oops I trusted it was merged now???
> 
> No it's not.
> 
> Greetings
> 
Ok so I took the src tree:
author	Kyle McMartin <kyle@parisc-linux.org>
	Tue, 16 Jan 2007 05:10:29 +0000 (00:10 -0500)
committer	Kyle McMartin <kyle@parisc-linux.org>
	Tue, 16 Jan 2007 05:10:29 +0000 (00:10 -0500)
commit	c1dba753187a1af52c1938450044be53da50de4d
tree	04c348f72c54168b7c649ab146709e6ccaa1e44e
parent	34ad633b0f9d004e2400124d9f56b83a6e16f6a1

and just revert previously mentioned commit
(http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommitdiff;h=3De5e5673f828623e58a401862b33173591faaeaff)

which indeed help to boot this kernel configure 32bit smp for the d380 an=
d
also 64bit smp for n4k (not more smp since a long time).

That said, unfortunately nothing seems to be scheduled on cpu1:
e.g make -j 4 vmlinux on d380
top - 13:39:51 up 18 min,  2 users,  load average: 3.29, 2.04, 1.39
Tasks:  99 total,   5 running,  94 sleeping,   0 stopped,   0 zombie
Cpu0  : 81.6%us, 14.9%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  3.5%si,  0=
.0%st
Cpu1  :  0.0%us,  0.0%sy,  0.0%ni, 99.1%id,  0.0%wa,  0.9%hi,  0.0%si,  0=
.0%st
Mem:    255028k total,   113996k used,   141032k free,    14940k buffers
Swap:   385552k total,        0k used,   385552k free,    47672k cached
Change delay from 1.0 to: 
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  P WCHAN    
COMMAND                                                   
 4681 root      25   0  7232 3544 2004 R   24  1.4   0:00.39 0 intr_chec =
cc1 
                                                      
 4677 root      25   0  8280 4140 2012 R   21  1.6   0:00.73 0 intr_chec =
cc1 
                                                      
 4676 root      25   0  8244 3948 2020 R   18  1.5   0:00.85 0 intr_chec =
cc1 
                                                      
 4673 root      22   0  8416 4160 2012 R   17  1.6   0:00.72 0 intr_chec =
cc1 
                                                      
 3360 jso       16   0  2908 1292  996 R    9  0.5   1:00.72 0 fd_instal =
top 
                                                      
 2078 gkrellmd  15   0  4388 1248 1000 S    8  0.5   1:31.38 0 select gkr=
ellmd
                                                  

Thanks,
    Joel

> -- 
> Thibaut VARENE
> http://www.parisc-linux.org/~varenet/
> 
> ---=0AScarlet One - Combinez l'ADSL avec la telephonie fixe illimitee e=
t epargnez 400 euros=0Ahttp://www.scarlet.be =0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
