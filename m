From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Fri, 21 Apr 2006 16:30:08 -0400 (EDT)
Message-ID: <200604212030.k3LKU8Fh003614@hiauly1.hia.nrc.ca>
References: <200604212013.k3LKDAbx003500@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604212013.k3LKDAbx003500@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Apr 21, 2006 04:13:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>     101112c4:   e8 1f 1f df     b,l,n 101112b8 <_read_lock+0x8>,r0
>     101112c8:   0f 48 10 9c     ldw 4(r26),ret0  <== exception here
> 
> r26 contains 0x105d62a8 according to Joel's message.  There isn't
> a branch in the delay slot.  The exception just occurs in the delay
> slot of a branch.  It's not obvious to me what caused the exception.

Correction, r26 contained 0x000000001051d040.  I also just noticed
that the branch is nullified (N=1 in PSW).  Just guessing, but I think
this is a timer interruption (soft lockup).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
