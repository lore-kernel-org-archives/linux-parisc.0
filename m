From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Fri, 22 Apr 2005 18:04:03 +0200
Message-ID: <420889870001E83F@mail-4-bnl.tiscali.it>
References: <20050422063649.GB13389@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050422063649.GB13389@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> Date: Fri, 22 Apr 2005 00:36:49 -0600
> From: Grant Grundler <grundler@parisc-linux.org>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] head.S: a small typo
> 
> 
> On Thu, Apr 21, 2005 at 08:39:13AM +0200, Joel Soete wrote:
> > -       ssm             0,0
> > +       ssm             0, %r0
> 
> Joel,
> Amusing you should just fix one...
> 
Just investigate one file at  a time ;-)

> grundler <509>pwd
> /usr/src/linux-2.6/arch/parisc/kernel
> grundler <510>fgrep ssm *.S | fgrep 0,0 | wc -l
> 337
> 
Do you want I prepare other patches too ?

> Caveat: 334 of those are in perf_asm.S which isn't functional.
> 
> I'm not inclined to change the remaining three since the assembler
> obviously accepts it.
Yes curiously?

> 
> > PS: is there some insterest in some white space cleanup in those *.S
> 
> Hrm...not from me.
> My priorities are:
> o getting pa8800 stable (latest kernels still occasionally segfaults.)
Isn't it related to the generic pb encounter elsewhere?
(all my system 32bit mainly make from time to time panic: that was in fac=
t
what I was trying to study, when interruptions are enabled and disabled (=
PSW
I bit if I well understand?)...) 

> o get MPT/Fusion driver working on parisc (HPMCs on IOC reset)
> o MSI support on parisc.
> o stable ad1889 (workstation audio)
> o FX-E support (ok, that's wishful thinking now...)
> 
Ah you finaly found some doc ?

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
