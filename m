Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA17454
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 15:45:30 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911242246.OAA31733@opus.allegro.com>
Subject: Re: itmr rollover in delay loop
To: frowand@cup.hp.com (Frank Rowand)
Date: Wed, 24 Nov 1999 14:46:17 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199911241936.LAA19634@xsvr4.cup.hp.com> from "Frank Rowand" at Nov 24, 1999 11:36:25 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> 
> >> Look at the loop.  What we do is basically
> >> 
> >>       cr16 = mfctl(16);
> >>       while(((cr16+loops)-mfctl(16))>0);
> >
> >You definitely don't want to do the above!
> >
> >Even ignoring the possibility of an interrupt that takes us away
> >for awhile, there's the simple possibility that cr16 might
> >roll over during your loop.
> 
> Careful use of unsigned variables fixes the problem.  The easiest way to
> explain this is by a small sample program:
...

 
Actually, unsigned integers cause the problem, as seen below.

I'd been assuming cr16 and mfctl were uint32, not int32, hence my concern
about a possible bug.  (I don't have easy access to the source code)


NOTE: with "int32 cr16" and "int32 mfctl (int crnum);" I don't
see any problems.


Assumptions:
   cr16 is a uint32  (note: better to use than "unsigned long int")
   mfctl is a uint32 function
   loops is a reasonable value 


The loop ending will be *missed* if the precise
value of CR16:    original_cr16 + loops
happens to be missed (again, using uint32).  This can easily happen if CR16 is
ticking faster than the clock (which is allowed by the
architecture) *or* can happen if an interrupt occurs shortly
before CR16 hits the final expected value.

Note that the unsigned arithmetic means that the subtraction in
the "while" control will always be > 0 except for the precise
time when cr16 = original_cr16 + loops.

Here's sample code demonstrating the problem, along with
sample output.

(the following should loop 5 times...but it loops far more!)

Startup: cr16 = 0x1e241, loops = 5, cr16 + loops = 0x1e246
  (loop, cr16 = 0x   1e242), ((cr16 + loops) - mfctl(16)) = 0x       4)
  (loop, cr16 = 0x   1e243), ((cr16 + loops) - mfctl(16)) = 0x       3)
  (loop, cr16 = 0x   1e244), ((cr16 + loops) - mfctl(16)) = 0x       2)
  (loop, cr16 = 0x   1e245), ((cr16 + loops) - mfctl(16)) = 0x       1)
   (extra tick)
  (loop, cr16 = 0x   1e247), ((cr16 + loops) - mfctl(16)) = 0xffffffff)
  (loop, cr16 = 0x   1e248), ((cr16 + loops) - mfctl(16)) = 0xfffffffe)
  (loop, cr16 = 0x   1e249), ((cr16 + loops) - mfctl(16)) = 0xfffffffd)
  (loop, cr16 = 0x   1e24a), ((cr16 + loops) - mfctl(16)) = 0xfffffffc)
  (loop, cr16 = 0x   1e24b), ((cr16 + loops) - mfctl(16)) = 0xfffffffb)
  (loop, cr16 = 0x   1e24c), ((cr16 + loops) - mfctl(16)) = 0xfffffffa)
  (loop, cr16 = 0x   1e24d), ((cr16 + loops) - mfctl(16)) = 0xfffffff9)
  (loop, cr16 = 0x   1e24e), ((cr16 + loops) - mfctl(16)) = 0xfffffff8)
  (loop, cr16 = 0x   1e24f), ((cr16 + loops) - mfctl(16)) = 0xfffffff7)
  (loop, cr16 = 0x   1e250), ((cr16 + loops) - mfctl(16)) = 0xfffffff6)
  (loop, cr16 = 0x   1e251), ((cr16 + loops) - mfctl(16)) = 0xfffffff5)
  (loop, cr16 = 0x   1e252), ((cr16 + loops) - mfctl(16)) = 0xfffffff4)
  (loop, cr16 = 0x   1e253), ((cr16 + loops) - mfctl(16)) = 0xfffffff3)
oops: we've looped too many times!

-----------------------------cut here for source code-------------------------
unsigned long cr16;
unsigned long simulated_cr16;
unsigned long loops;

/***************************************************************/
unsigned long mfctl (int crnum)

      /* ticks once per call ... sometimes twice :) */

   {

   simulated_cr16++;

         /* To demonstrate the problem, let's always make it */
         /* tick more than once at *exactly* the worst time... */

   if ((cr16 + loops) == simulated_cr16)
      {
      simulated_cr16++;
      printf ("   (extra tick)\n");
      }

   return simulated_cr16;

   } /* end mfctl proc */
/***************************************************************/

main() {

   int
      actual_loops;


   simulated_cr16 = 123456;   /* actual value irrelevant */

   cr16 = mfctl (16);         /* every call to mfctl(16) causes a simulated tick

   loops = 5;                 /* desired number of loops */
   actual_loops = 0;          /* track number we've actually done */

   printf ("Startup: cr16 = 0x%x, loops = %d, cr16 + loops = 0x%x\n",
                  cr16, loops, (cr16 + loops));

   while (((cr16 + loops) - mfctl (16)) > 0)
      {
      printf ("  (loop, cr16 = 0x%8x), ((cr16 + loops) - mfctl(16)) = 0x%8x)\n",
                  simulated_cr16,
                  ((cr16 + loops) - simulated_cr16));

      if (actual_loops++ > (loops + 10))
         {
         printf ("oops: we've looped too many times!\n");
         exit (1);
         }
      }                          /* while loop */

   printf ("\nExited normally from delay loop.  At exit:\n");
   printf ("cr16 = 0x%8x, ((cr16 + loops) - mfctl(16)) = 0x%8x)\n",
                  simulated_cr16,
                  ((cr16 + loops) - simulated_cr16));

   } /* end main proc */
/***************************************************************/
-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
