Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B4AA14831
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Apr 2003 19:15:06 -0600 (MDT)
Date: Sat, 19 Apr 2003 18:12:56 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030420011256.GC25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] floating point calling convention on pa
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

Hi all,

I'm trying to understand the FP argument passing convention on 32-bit
palinux... I don't think I have it quite right. Can anyone comment on
the following?

1) float-type arguments
   float add(float a, float b, float c, float d)
        a -> fr4L
        b -> fr5L
        c -> fr6L
        d -> fr7L
        retval = fr4L

   If >4 arguments, the rest are passed on the stack
   starting at sp-52 in the caller's frame

2) double-type arguments
   double add(double a, double b, double c, double d)
        a -> fr5
        b -> fr7
        c -> sp-56 in caller frame
        d -> sp-64 in caller frame
        retval = fr4

   Is it correct that the high-order 32-bit of fr5 is in fr5L
   and the lower bits in fr5R?

3) What happens when you have a mix argument function? e.g.
   double foo(int a, float b, double c)

        a -> r26
        b -> fr5L
        c -> fr7
        retval = fr4

   I don't quite understand the logic here :) What happens when
   there are more and they need to go on the stack? What's the 
   arrangement?

I've looked through the SOM 32-bit runtime but (at least to me)
it doesn't talk about this very clearly. I've been experimenting with
gcc -S but I'd rather get a definitive answer :)

Also, for passing structures by value to functions, is this correct?
a) if sizeof(struct) <= 4, pass in register
b) if sizeof(struct) <= 8), pass in even-numbered register pairs 
c) if sizeof(struct) > 8, pass a pointer and callee will copy the
   structure?

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
