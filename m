Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop5.phnx.uswest.net (mail.phnx.uswest.net [206.80.192.5])
	by dsl2.external.hp.com (Postfix) with SMTP id 1F4BE4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 21:37:31 -0700 (MST)
Date: Wed, 21 Mar 2001 21:35:41 -0700
Message-ID: <20010321213541.A6912@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: alan@linuxcare.com.au
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] new g++ debs and oddities...
List-ID: <linux-parisc.vger.kernel.org>

So I've been playing with taggart's new g++ debs. definitely work a lot
better than the old ones, but still seeing some weird behavior:

1. i'm compiling apt, and got a problem with undefined symbols for
things like Hashes::Add(). Now, Hashes::Add is an inline method defined
in hashes.h .... moving that to a non-inlined method in the .cc resolves
the undefined symbol problem... seems like a compiler bug?

I'm compiling with -g -O0 -DHAVE_CONFIG_H -D_REENTRANT -fno-rtti -fpermissive

2. I'm getting a lot of warnings like this that weren't there with 2.97.
Not sure what the deal is yet:

/home/randolph/cvs/apt/build/include/apt-pkg/configuration.h: In member
   function `int Configuration::FindI(std::basic_string<char,
   std::char_traits<char>, std::allocator<char> >, bool) const':
   /home/randolph/cvs/apt/build/include/apt-pkg/configuration.h:75: warning: choosing 
   `int Configuration::FindI(const char*, int) const' over `int
   Configuration::FindI(std::basic_string<char, std::char_traits<char>, 
   std::allocator<char> >, bool) const'
/home/randolph/cvs/apt/build/include/apt-pkg/configuration.h:75: warning:
   because worst conversion for the former is better than worst conversion for
   the latter

Ideas?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
