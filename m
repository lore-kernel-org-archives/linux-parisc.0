From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 22:20:26 -0400 (EDT)
Message-ID: <200606060220.k562KRc2009433@hiauly1.hia.nrc.ca>
References: <200606051845.54924.kmh@sonic.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kmh@sonic.net (Kai Holthaus)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606051845.54924.kmh@sonic.net> from "Kai Holthaus" at Jun 5,
	2006 06:45:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Module quickcam, symbol qc_proc_init is out of range for PCREL22F relocation
> =46ATAL: Error inserting quickcam (/lib/modules/2.6.16-pa11/misc/quickcam.k=
> o):=20

I believe that this has come up before.  The out of range
PCREL22F relocation implies that the module has a "b,l" instruction
(call) whose target can't be reached.  The maximum branch distance
for the "b,l" instruction is ~ 8 MB, so the module must be quite
large.

You might explore ways to reduce the modules's (e.g., limit inlining).
You might also try compiling with the -mlong-calls options.  This forces
GCC to use the "bve" instruction for calls in PA 2.0 compilations.  The
call setup using bve is slightly longer but there are no distance
limitations.  There's also a PA 1.x variant using "ble".  What's unclear
to me is whether the kernel loader has support for the relocations used
in these sequences.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
