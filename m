Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop5.phnx.uswest.net (mail.phnx.uswest.net [206.80.192.5])
	by dsl2.external.hp.com (Postfix) with SMTP id 200F64A19
	for <parisc-linux@parisc-linux.org>; Sun, 11 Mar 2001 22:05:44 -0700 (MST)
Date: Sun, 11 Mar 2001 22:04:01 -0700
Message-ID: <20010311220401.Z18113@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: "Alan Modra" <alan@linuxcare.com.au>
Cc: "Jes Sorensen" <jes@linuxcare.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
Reply-To: Randolph Chung <randolph@tausq.org>
References: <d3y9ub6222.fsf@lxplus015.cern.ch> <Pine.LNX.4.21.0103121551380.23407-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0103121551380.23407-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Mon, Mar 12, 2001 at 03:55:51PM +1100
List-ID: <linux-parisc.vger.kernel.org>

> Yeah, I figured Randolph was probably not compiling pehc glibc.  When we
> do the next merge, we'll need to add an hppa-linux specific version of
> pt-initfini.c

you are right, of course. i was building from Debian's glibc 2.2.2
package. taggart said he's going to rebuild 2.2.1 from pehc cvs, so i'll
wait for him to do that.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
