Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (firewall.pflash.com [207.19.136.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80D11482A
	for <parisc-linux@parisc-linux.org>; Sat, 12 Jan 2002 08:16:17 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: "Peter Lavender" <plaven@bigpond.net.au>
Subject: Re: [parisc-linux] bogomips?
Date: Sat, 12 Jan 2002 09:16:18 -0600
References: <005601c19b59$d9645370$090ba8c0@winnie> <OE60SJBsBrwvvIfPvhi000088a7@hotmail.com>
In-Reply-To: <OE60SJBsBrwvvIfPvhi000088a7@hotmail.com>
MIME-Version: 1.0
Cc: "parisc" <parisc-linux@parisc-linux.org>
Message-Id: <02011209161801.01008@localhost.localdomain>
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

Hmmm....
I don't know if this is the intended operation or not (probably a question 
for the Linux tree dudes), but...

Kenneth's 486 reports at about 1/2 the clock speed (also notice the lack of a 
cpu MHz line in the report).

This Celeron reports at about 2* the clock speed. (Kernel 2.4.17)

If memory (mine) serves, my P-II system reported at appox. bogomips == cpu 
clock.  I don't recall what my Pentium or 386 system reported and have never 
had a 486.

I think I noticed the change in the relationship between bogomips and cpu 
clock early in kernel 2.2.x (while I was running the P-II system) - perhaps 
something has crept in from the Linux tree that is having this effect.

Mike

[mszick@localhost /proc]$ cat ./cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 6
model name      : Celeron (Mendocino)
stepping        : 5
cpu MHz         : 467.737
cache size      : 128 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov
pat pse36 mmx fxsr
bogomips        : 930.61
 
[mszick@localhost /proc]$

On Saturday 12 January 2002 05:35 am, you wrote:
> Hmm, don't know.
>
> My little 486DX4 100MHz, 12MB RAM:
> /proc# cat ./cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 4
> model           : 8
> model name      : 486 DX/4
> stepping        : 0
> fdiv_bug        : no
> hlt_bug         : no
> sep_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 1
> wp              : yes
> flags           : fpu vme
> bogomips        : 49.66
>
> /proc#
>
>
> regards,
>
> Kenneth
>
> ----- Original Message -----
> From: "Peter Lavender" <plaven@bigpond.net.au>
> To: "parisc" <parisc-linux@parisc-linux.org>
> Sent: Saturday, January 12, 2002 12:10 PM
> Subject: [parisc-linux] bogomips?
>
> > Hi everyone,
> >
> > What's a 715/64 equate to in terms of intel arches?
> >
> > Here's my p90 with 48meg of ram:
> > Calibrating delay loop... 35.84 BogoMIPS
> >
> > and my 715/64 with 128 meg of ram:
> > Calibrating delay loop... 63.69 BogoMIPS
> >
> > Thanks,
> >
> > Pete
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
