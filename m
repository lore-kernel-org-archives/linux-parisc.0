Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A2814830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 10:39:05 -0600 (MDT)
Date: Wed, 18 Jun 2003 18:38:55 +0200
Message-ID: <3ED4C8B6000076B3@ocpmta1.freegates.net>
In-Reply-To: <200306181512.h5IFCOSE015736@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Dave,

Sorry for delay (even with my speedy b2k, it takes some time for optimizing
this stuff :-) ).

> The optimization level affects inlining and as a result the size of
> functions.  There has been a lot of discussion on the gcc lists related
> to problems with inlining with the new tree inliner in 3.3, particularly
> in C++ code.  So, the problem should be looked at even if there is a
> work around.  The first step is to determine whether this is gcc or
> binutils problem (i.e., we need to know if the size of the stub table
> has overflowed or if gcc has miscalculated an offset).

Finaly, here we are:

a) The same bad result with -O2 and today cvs binutils :-(
# as --version

GNU assembler 2.14.90 20030618
Copyright 2002 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
This assembler was configured for a target of `hppa-linux'.

# as -o t.o ChFi3d_Builder_CnCrn.s-O2
ChFi3d_Builder_CnCrn.s-O2: Assembler messages:
ChFi3d_Builder_CnCrn.s-O2:146240: Error: Field out of range [-262144..262143]
(-290528).

b) the pre-asm around line 146240:
[...]
 146234 .LBB15456:   
 146235         copy %r4,%r19
 146236         ldo 7216(%r22),%r22
 146237         addl %r22,%r30,%r22
 146238 .LBE15456:
 146239         ftest
 146240         b .L6999
 146241         stw %r23,0(%r22)
 146242         stw %r0,0(%r22)
 146243         stw %r1,-12(%r30)
 146244         bl .+8,%r1
 146245         addil L'.L6999-$PIC_pcrel$0+4,%r1  
 146246         ldo R'.L6999-$PIC_pcrel$0+8(%r1),%r1
 146247         bv %r0(%r1)
 146248         ldw -12(%r30),%r1
 146249 .L7131:

[...]

(iirc b .L6999 means branch _b_ack to label .L6999 
if yes here is also text around this location:
[...]

  29378 .L6999:
  29379         .loc 1 1000 0   
  29380         ldil L'-16384,%r20
  29381         .loc 1 1001 0
  29382         ldil L'-16384,%r22
  29383         .loc 1 1000 0
  29384         ldo 7208(%r20),%r20
  29385         .loc 1 1001 0
  29386         ldil L'-16384,%r23
  29387         .loc 1 1000 0
  29388         addl %r20,%r30,%r20
  29389         .loc 1 1001 0
  29390         ldo 6308(%r22),%r22
  29391         .loc 1 1000 0
  29392         ldw 0(%r20),%r20
  29393 .LBE4386:
[...])

It is well a stub table pb?

If not I will procede next step tomorrow :-)

Thanks again for your attention and patience,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
