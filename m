From: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: [parisc-linux] Re: Kernel 2.4.17-32-smp problem
Date: Sun, 24 Mar 2002 01:14:32 -0700
Message-ID: <20020324081432.82653483C__13783.5277979777$1416621178$gmane$org@dsl2.external.hp.com>
References: <Pine.LNX.4.33L2.0203231953470.13376-100000@eiger.apptechsys.com>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
To: Jeremy Drake <jeremyd@apptechsys.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Sat, 23 Mar 2002 20:03:00 PST." <Pine.LNX.4.33L2.0203231953470.13376-100000@eiger.apptechsys.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Jeremy Drake wrote:
> Recently, I ran apt-get upgrade, and it upgraded my kernel-image
> 2.4.17-32-smp.  I rebooted, and the box now crashes periodically.

Where you running an SMP kernel before?
(If so, which version?)

Normally I'd say get the latest (2.4.18 based) kernel.
But I know the SMP variant hangs on my A500 pretty quickly.
I haven't had a chance to debug this since I've been spending spare
cycle working on PA8700 support (bug workarounds in SBA code).

IIRC, the debian buildd machine is also a J5000 and runs a
non-SMP kernel for similar (same?) reason.

hth,
grant
