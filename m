Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1942348A0
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Dec 2003 17:07:31 -0700 (MST)
Message-ID: <3FF21386.2060008@tiscali.be>
Date: Wed, 31 Dec 2003 00:08:38 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] LD_PROFILE?
References: <20031230234237.GM27911@systemhalted>
In-Reply-To: <20031230234237.GM27911@systemhalted>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	parisc-linux@lists.parisc-linux.org, Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

no ?

I test it on testdrive sep170 with libc release 2.2.5-11.5 and  binutils release 2.12.90.0.1-4 (I trust purely Debian woody 3.0)

hth,
	Joel

Carlos O'Donell wrote:
> Did this work before? :)
> 
> firin:/# LD_PROFILE=libc.so.6 ls
> Segmentation fault
> 
> c.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
