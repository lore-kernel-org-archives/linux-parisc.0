From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] running gcc testsuite triggers ongoing page faults
Date: Sun, 11 Jan 2004 15:49:44 -0500 (EST)
Message-ID: <200401112049.i0BKnihs000770__30758.5858776749$1416623122$gmane$org@hiauly1.hia.nrc.ca>
References: <16385.5227.153358.397944@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <16385.5227.153358.397944@gargle.gargle.HOWL> from "Matthias
	Klose" at Jan 11, 2004 10:16:27 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I think I did see this first with gcc-3.3 from 20031229. Running the
> 3.3 testsuite (gcc) doesn't terminate. Instead, I see expect eating
> all CPU time, together with syslogd and klogd. /var get's filled with
> log messages in kern.log, syslog and debug.
> 
> The machine is a A500, kernel from the archives (kernel-image-2.4.21-64-smp_pa7.3)

I've had similar problems on gsyprf11, but recent kernels seem to be
better.  I believe that this is more likely on SMP kernels and we have
never had a stable one on gsyprf11.  You can kill expect and GCC will
move on to the next suite.  I haven't seen this on the C3750.

This definitely isn't a GCC problem.  The problem never occurs under
hpux.  It's probably some kind of timing or locking issue that just
happens to get tweaked by a particular test.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
