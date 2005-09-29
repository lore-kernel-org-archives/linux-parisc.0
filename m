From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa2 ccio patch
Date: Thu, 29 Sep 2005 19:21:38 -0400 (EDT)
Message-ID: <200509292321.j8TNLc60012238@hiauly1.hia.nrc.ca>
References: <20050929154308.GA29975@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050929154308.GA29975@colo.lackof.org> from "Grant Grundler" at
	Sep 29, 2005 09:43:08 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Yes and Yes. But my reading of the PA1.1 arch says it *only* has a 2-bit
> s field.

Oops, my mix up (fic/fdc confusion).  However, don't add sr0 to the
instruction.  Specifying %r0 instead of '0' is the issue.  Strictly,
the immediate form is only allowed in PA 2.0.  However, if the assembler
doesn't accept it let me know.

I'm going to take a crack at trying to fix PA 1.0 to 1.1 promotion
this weekend.  This is currently tied to the the lax matching used
with PA 1.0 instructions.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
