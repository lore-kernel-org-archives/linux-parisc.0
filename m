From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Fri, 1 Jul 2005 15:43:17 +0200
Message-ID: <42BAE7C3000026F9@mail-5-bnl.tiscali.it>
References: <42BD1604.4050403@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BD1604.4050403@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Helo Dave and all,

Just a small update with some success ;-)

for remind:
(with gcc-3.3)
    o 2.6.9-rc2-pa1 with default compile option '-mdisable-fpregs' works
fine on my b180 (stress test ok)

    o the same 2.6.9-rc2-pa1 without this option (i.e. new default) crash=
ed
on stress test (about 2h test)
    o the later 2.6.9-rc2-pa13 (without '-mdisable-fpregs' by default) cr=
ashed
also.

good news with gcc-4.0 (debian pakage) and '-mfixed-range=3Dfr6-fr21,fr27=
-fr31'

    o 2.6.9-rc2-pa1 seems to works as fine as with original option
    o 2.6.9-rc2-pa13 the same 

(just have to backport some small stuff to  reach to compile kernels)

I apply my stress test (tar loops + kernel build loops) during a full day=

for each one without any pb ;-)

I can now try a step forward: 2.6.10-pa + gcc-4.0, ...

Thanks,
    Joel

> 
> 
> John David Anglin wrote:
> >>mmm do I well understand that to force gcc to on;y use fr4-f5 and fr2=
2-fr26
> >>(as do __muldi3), I had to use option:
> >>cflags-y        +=3D -mfixed-range=3Dfr6-fr21,fr27-fr28
> > 
> > 
> > Close, I used the change below.
> mmm I definetely have to go back to elementary school (4 + 28 -1 =3D 31=
 and
> not 28, my bad !!!)
> 
> >  This seems to build and check ok.
> Ok I will try to rebuild libgcc2 and kernel with same options.
> 
> Btw 2.6.12-pa1 already build and boot fine with above mentioned options=
.
> Anyway still hanging after 44 min of stress test.
> 
> So imho 2 first thinks to do:
> 	o apply the right 'fixed-range' option
> 	o apply 2.6.12.1 patch
> 
> > I don't know if it would be possible to cut back another register or
not.
> > If I was going to try, I would add fr26 to the fixed list.
> > 
> If still not work, the 3rd test I will do ;-)
> 
> I will advise.
> 
> Thanks again,
>      Joel
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
