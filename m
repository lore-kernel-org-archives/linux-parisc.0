From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Expect defunct, kill -9 panics kernel?
Date: Sat, 10 Feb 2007 13:10:45 -0500 (EST)
Message-ID: <200702101810.l1AIAkeJ012821__4962.05831082097$1416624280$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702100916q504101b1xe99f65ff5945e712@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702100916q504101b1xe99f65ff5945e712@mail.gmail.com>
	from "Carlos O'Donell" at Feb 10, 2007 12:16:45 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Is this the usual behaviour you see?
> 
> 1. I run the gcc testsuite.
> 2. expect dies, leaving a defunct process.
> 3. Killing another expect panics the kernel.

It similar to the behavior that I see.  I don't usually see this
with expect though.  Possibly, this is because I use my own build
of expect linked tcl8.3.

I see this behavior quite consistently on my c3750 if I

1.  Run the gcc libjava testsuite.
2.  Usually, there a set of processes (e.g., Process_3) left running
    after the testsuite ends.  These processes are not defunct and
    load the processor.  I can kill all but the oldest thread.
3.  Killing the oldest thread panics the kernel.  Sometimes the system
    reboots.  However, the system often hangs doing endless panics.

I suspect a timing issue as the c3750 is the fastest processor that
I test on.  I don't see as many problems with the libjava testsuite
on slower hardware.  At one time, I thought this might be a 32 versus
64-bit issue, but I see the same problems running a 64-bit kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
