Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id LAA32038
	for <hppa-linux@sod.res.cmu.edu>; Tue, 23 Mar 1999 11:12:51 -0500
Received: (from neufeld@localhost)
	by caliban.physics.utoronto.ca (8.9.2/8.8.8) id LAA02124
	for hppa-linux@thepuffingroup.com; Tue, 23 Mar 1999 11:12:33 -0500 (EST)
Date: Tue, 23 Mar 1999 11:12:33 -0500 (EST)
From: Christopher Neufeld <neufeld@physics.utoronto.ca>
Message-Id: <199903231612.LAA02124@caliban.physics.utoronto.ca>
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] GCC and static branch prediction
List-ID: <linux-parisc.vger.kernel.org>

   Hi,

   A few of us were discussing recently a way to take advantage of static
branch prediction in the PA-RISC architecture. The problem is that there
is no ANSI C construct for specifying whether a branch is likely taken,
or likely not taken.
   I wonder, though, if we can't maybe throw something together which
would work "well enough".

   What I'm thinking of is getting a couple of assembly NOPs (ones which
are not usually output by gcc / gas), and making macros for them to
inline the assembly into a C function.


[ ... do some stuff ... ]
if (error) {
	PARISC_BRANCH_LIKELY_TAKEN; /* i.e. usually don't enter the if() */
	[ ... do some more stuff ... ]
}
[ ... do some more stuff ... ]


or,


while (locked(ptr)) {
	do_other_things();

}
PARISC_BRANCH_LIKELY_TAKEN;  /* i.e. usually repeat the loop */


Now, if we can make an insn pattern which matches the noop to the branch
which came just before it, we can get the optimizer to produce the
correct static branch prediction on the preceding operation (and also,
while it's optimizing, delete the NOP). For other architectures, the
macros are defined away, and the macros need only be used in places where
we really need the extra boost (preferably only in the arch/parisc
directories, imagine Linus' face if we started dropping these macros all
over the kernel!).

   As I see it, there are a few things to worry about. Unrolling loops;
if(){}else{} clauses where the optimizer changes the sense of the test
for reasons known to itself, resulting in pessimized static branch
settings; correct interpretation of nested, optimized branches; any glue
code which is stuck on at the beginning and end of asm() statements which
may not be discarded even when the asm() consists solely of a NOP;
probably many others.


   Any thoughts?


-- 
 Christopher Neufeld                   neufeld@physics.utoronto.ca
 Home page:  http://caliban.physics.utoronto.ca/neufeld/Intro.html
 "Don't edit reality for the sake of simplicity"
