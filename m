From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sun, 12 Mar 2006 10:56:22 -0500 (EST)
Message-ID: <200603121556.k2CFuMBG015820@hiauly1.hia.nrc.ca>
References: <200603121527.k2CFRcig015476@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603121527.k2CFRcig015476@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 12, 2006 10:27:38 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> >  84c:   e8 40 01 f0     b,l 94c <frame_dummy>,rp
> >  850:   08 00 02 40     nop
> 
> I just noticed that r19 is not restored after the call to frame_dummy.
> It's clobbering r19.

You know, this function is a real hack.  Part of it comes from
crti.o, part from GCC's crtstuff.c and part from crtn.o.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
