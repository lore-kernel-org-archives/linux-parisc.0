From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Thu, 18 Aug 2005 13:24:48 -0400 (EDT)
Message-ID: <200508181724.j7IHOnLq006926@hiauly1.hia.nrc.ca>
References: <ILFDUV$F78A20A99DD29674BBE529F42F203D92@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ILFDUV$F78A20A99DD29674BBE529F42F203D92@scarlet.be> from "Joel
	Soete" at Aug 18, 2005 06:01:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Well the system reboot fine but the same test as describe above make again the
> system hang after only 45min of test ;_(

Yah, my c3k is also hung.  It got through one GCC full build and check,
but hung last night in the second.

Randolph's patch only fixed a hang causes by a stack overflow when
catching SIGSEGV.  It's not going to fix anything that doesn't SEGV.

Note that my patch was to fix a glibc issue affecting signal handling.
It's doubtful that it would fix the hangs that you have been experiencing
with your stress test.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
