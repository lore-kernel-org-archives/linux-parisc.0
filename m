From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Looking at vfprintf.c and alloca.
Date: Mon, 17 Jul 2006 23:40:22 -0400
Message-ID: <119aab440607172040gf1209cp52131893cea42460@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 "Randolph Chung" <randolph@tausq.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I was looking at our tst-printfsz failures in glibc, and I noticed
some very cute code in vfprintf.c. The code uses alloca to create a
specs structure, and then using certain know addresses decides if the
stack grows down or up.

Does this look right? Anyone care to review if this actually works
with a newer GCC on hppa?

   1601     size_t nspecs = 0;
   1602     size_t nspecs_max = 32;     /* A more or less arbitrary
start value.  */
   1603     struct printf_spec *specs
   1604       = alloca (nspecs_max * sizeof (struct printf_spec));

...
   1636     for (f = lead_str_end; *f != L_('\0'); f = specs[nspecs++].next_fmt)
   1637       {
   1638         if (nspecs >= nspecs_max)
   1639           {
   1640             /* Extend the array of format specifiers.  */
   1641             struct printf_spec *old = specs;
   1642
   1643             nspecs_max *= 2;
   1644             specs = alloca (nspecs_max * sizeof (struct printf_spec));
   1645
   1646             if (specs == &old[nspecs])
   1647               /* Stack grows up, OLD was the last thing allocated;
   1648                  extend it.  */
   1649               nspecs_max += nspecs_max / 2;
   1650             else
   1651               {
   1652                 /* Copy the old array's elements to the new space.  */
   1653                 memcpy (specs, old, nspecs * sizeof (struct
printf_spec));
   1654                 if (old == &specs[nspecs])
   1655                   /* Stack grows down, OLD was just below the new
   1656                      SPECS.  We can use that space when the new space
   1657                      runs out.  */
   1658                   nspecs_max += nspecs_max / 2;
   1659               }
   1660           }

I didn't expect alloca's behaviour to be so explicitly defined.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
