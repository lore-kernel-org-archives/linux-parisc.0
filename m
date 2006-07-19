From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Tue, 18 Jul 2006 23:22:30 -0400 (EDT)
Message-ID: <200607190322.k6J3MU58016184@hiauly1.hia.nrc.ca>
References: <200607181151.53069.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607181151.53069.mszick@morethan.org> from "Michael S. Zick"
	at Jul 18, 2006 11:51:52 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> For the case of gcc-4.2, stack-grows down...

Is this for hppa?  The stack should never grow downward.

> ptr = 0xbfea1fc0
> old = 0xbfea2160
> &old[100] = 0xbfea22f0
> 
> In both the cases (up/down) &old[100] has an offset of
> 400 bytes (correct).

You have to take into account the preferred stack boundary
into account when determining the delta between alloca allocations.

The HP runtime specifies 64 bytes (i.e., cache aligned) for
the preferred stack boundary in the 32-bit runtime.  The stack
boundary is 8 bytes.  This is the minimum alignment that the
hardware needs except for the infamous ldcw instruction.  The
preferred stack boundary could have been 8 bytes.  However,
changing it now would be an ABI change...

HP probably recognized that 64-byte alignment didn't help performance
much, so they relaxed the 64-bit alignment to 16 bytes.  In the 64-bit
runtime, some types are 16-byte aligned.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
