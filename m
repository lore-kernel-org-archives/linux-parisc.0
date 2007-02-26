From: Roland McGrath <roland@redhat.com>
Subject: Re: [parisc-linux] Re: NPTL for hppa-linux is not backwards
	compatible with Linuxthreads.
Date: Sun, 25 Feb 2007 22:45:58 -0800 (PST)
Message-ID: <20070226064558.714C0180067__3021.80991643599$1416624317$gmane$org@magilla.sf.frob.com>
References: <119aab440702251847u29687878mff8770653cccbb35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org,
 libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: Carlos O'Donell's message of  Sunday,
	25 February 2007 21:47:38 -0500
	<119aab440702251847u29687878mff8770653cccbb35@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I did a couple of tests and I verified that I have no words to spare.
> Adding an extra "int __pad" forces the structure to grow by 8 bytes
> due to the "long long" alignment requirements.

Just reorder the fields so that the 32-bit fields are all in groups of 2 or 4.
All that should matter is that the padding word is one of the first four so
you can detect the old initializer data, and that __mutex is the 6th
member so the PTHREAD_COND_INITIALIZER text works out to be warning-free.
In fact, that doesn't really matter since the initializer contents are all
zero regardless of spelling.  If need be, you can add a new first union
member not called __data, with a layout that makes PTHREAD_COND_INITIALIZER
happy. 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
