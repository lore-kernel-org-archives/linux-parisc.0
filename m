Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id JAA19455
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 09:36:05 -0500
Received: (from neufeld@localhost)
	by caliban.physics.utoronto.ca (8.9.2/8.8.8) id JAA14215
	for hppa-linux@thepuffingroup.com; Thu, 18 Mar 1999 09:35:58 -0500 (EST)
Date: Thu, 18 Mar 1999 09:35:58 -0500 (EST)
From: Christopher Neufeld <neufeld@physics.utoronto.ca>
Message-Id: <199903181435.JAA14215@caliban.physics.utoronto.ca>
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Gateway instructions
List-ID: <linux-parisc.vger.kernel.org>

   Hello folks,

   I'm wondering if anybody's got a handle on how gateway instructions
are supposed to work. The instruction is designed to allow jumps into the
kernel, with privilege promotion, without invoking the cost of an
interrupt, by branching into a page and then taking on the privilege
level of the page. The only safety check seems to be in the "B" bit,
which would appear to prohibit the target of such a jump being, itself,
another jump.
   How does this work, now? Is the target of the gateway instruction
intended to be simply a vector table of other jumps, preceded by some
non-branch instruction which forms the taget of the gateway? After all,
if I am permitted to choose my entry point into a kernel function, I can
do bad things, at the very least crash the kernel, but also probably
subvert it quite easily. Access control seems to be limited to the page,
not forbidding jumps into other parts of the code within the same page.
And what is the "B" bit in the processor status supposed to do in all
this?
   Is there a misprint in the book (or a misunderstanding on my part)? If
the "B" bit produces an exception when the target of the gateway is _not_
another jump, then I can see how this can be easily constructed into a
vector table into kernel functions without compromising security.


-- 
 Christopher Neufeld                   neufeld@physics.utoronto.ca
 Home page:  http://caliban.physics.utoronto.ca/neufeld/Intro.html
 "Don't edit reality for the sake of simplicity"
