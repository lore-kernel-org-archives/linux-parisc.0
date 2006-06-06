From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 22:26:16 -0400 (EDT)
Message-ID: <200606060226.k562QGsd009687@hiauly1.hia.nrc.ca>
References: <200606060220.k562KRc2009433@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606060220.k562KRc2009433@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jun 5, 2006 10:20:26 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> You might explore ways to reduce the modules's (e.g., limit inlining).
> You might also try compiling with the -mlong-calls options.  This forces
> GCC to use the "bve" instruction for calls in PA 2.0 compilations.  The
> call setup using bve is slightly longer but there are no distance
> limitations.  There's also a PA 1.x variant using "ble".  What's unclear
> to me is whether the kernel loader has support for the relocations used
> in these sequences.

Just thinking, the problem might be going the other way.  If so, reorganzing
the sections used for functions called from the kernel might help.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
