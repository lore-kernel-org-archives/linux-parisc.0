Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C7AB4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 20:01:44 -0700 (MST)
Message-Id: <200212270301.gBR31bJQ001222@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Joke of the day for PA userspace hackers...
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Thu, 26 Dec 2002 22:01:37 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021227024941.GE8363@systemhalted> from "Carlos O'Donell" at Dec 26, 2002 09:49:41 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> parisc,
> 
> Two programmers are seated at a bar hacking on PARISC,
> when Joe turns to Jill and says:
> 
> Joe:  "I tried calling the function by it's address"
> Jill: "Just lop off the first 2 bits."
> Joe:  "Hey! It worked?! What did that do?"
> Jill: "I don't know, but it's a clever fix, without a changelog,
>        that I keep seeing in debian binutils and gdb code"
> 
> *ba dump ching*
> 
> Function descriptors :)

Won't work on hppa64 :))  Our ctor/dtor pointers are not function pointers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
