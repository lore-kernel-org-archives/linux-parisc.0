From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 23:22:13 -0700
Message-ID: <20040716062213.GJ546@tausq.org>
References: <20040715215015.GO32326@parcelfarce.linux.theplanet.co.uk>
	<200407152226.i6FMQVK4029018@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200407152226.i6FMQVK4029018@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> However, when GCC tries to remap the PCH file to this location, it
> sometimes fails.  This is currently a fatal error (i.e., it does not
> fallback as described above).  This needs looking at.  Almost all
> the libstdc++ tests failed in the last build that I did.  I think if
> it successfully loads the PCH file and finds that it's not valid,
> it does fallback.

do you mean that, when the pch file is created, it was mmaped to some
address, and that address is written to the file. when the pch file is
read later on for another compile, it tries to mmap it to the same
location, and if it cannot, then it fails?

there's obviously a performance penalty, but is this an option (not very
sure it will work, but i think it might)?

1. mmap the file to addr1, where addr1 is any address returned by the
   kernel
2. do a MAP_PRIVATE anonymous mmap to the desired location addr2 (this 
   is more likely to be honoured by the kernel....)
3. memcpy the data from addr1 to addr2

obviously this assumes you are not changing the pch data...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
