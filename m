From: Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] Re: Kernel 2.4.17-32-smp problem
Date: Sun, 24 Mar 2002 09:33:16 -0800 (PST)
Message-ID: <Pine.LNX.4.33L2.0203240928550.13376-100000__17721.8599165373$1416621178$gmane$org@eiger.apptechsys.com>
References: <20020324081432.82653483C@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: <parisc-linux@parisc-linux.org>, <debian-hppa@lists.debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020324081432.82653483C@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 24 Mar 2002, Grant Grundler wrote:

> Jeremy Drake wrote:
> > Recently, I ran apt-get upgrade, and it upgraded my kernel-image
> > 2.4.17-32-smp.  I rebooted, and the box now crashes periodically.
>
> Where you running an SMP kernel before?
> (If so, which version?)

I was running 2.4.17-32-smp before.  It just updated a debian package of
the same kernel version.  I had no problems with the old one, other than
the fact that it seems to ignore cpu0.  All processor time goes to cpu1
and cpu0 gets a ton of idle.

>
> Normally I'd say get the latest (2.4.18 based) kernel.
> But I know the SMP variant hangs on my A500 pretty quickly.
> I haven't had a chance to debug this since I've been spending spare
> cycle working on PA8700 support (bug workarounds in SBA code).

When the box crashed both times, I was checking out the cvs tree :)

>
> IIRC, the debian buildd machine is also a J5000 and runs a
> non-SMP kernel for similar (same?) reason.
>
> hth,
> grant
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

-- 
Paranoia doesn't mean the whole world isn't out to get you.
