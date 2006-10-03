From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] check_ivt panic / binutils
Date: Mon, 2 Oct 2006 22:11:36 -0400 (EDT)
Message-ID: <200610030211.k932BbeR023905@hiauly1.hia.nrc.ca>
References: <1159837799.5737.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1159837799.5737.7.camel@localhost.localdomain> from "Jeff
	Bailey" at Oct 2, 2006 09:09:59 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I bisected the binutils CVS until I found the failure point.  It seems
> that with 2006-04-30 I don't get the check_ivt failure (although the
> kernel does die immediately after e100 is initialised), but at
> 2006-05-01, I get the check_ivt failure.

It's not at all obvious why you think this is a binutils bug.

>  IIR: 0e60109c    ISR: 0000000000000000  IOR: 0000000100000000

$ disasm 0x0e60109c
   0:   0e 60 10 9c     ldw 0(r19),ret0

> r16-19  00000000f00003b0 00000000f000024c 00000000f0002b4c 0000000100000000

The r19 value is the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
