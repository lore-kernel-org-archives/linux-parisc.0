Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA05298
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 00:37:25 -0600
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sat, 12 Jun 1999 01:42:13 EDT.
             <3761F335.ADA76678@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 12 Jun 1999 00:32:23 -0600
Message-ID: <22030.929169143@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <3761F335.ADA76678@thepuffingroup.com>you write:
  > This is a multi-part message in MIME format.
  > > Then search for $CODE$ in the resulting /tmp/BLAH.  We'll work backwards 
  > from
  > > what you find.
  > 
  > The offending files are:
  > 
  > ipl_c.o:     file format elf32-hppa
[ ... ]

  >   4 $CODE$        00000210  00000000  00000000  000002b0  2**3
  >                   CONTENTS, ALLOC, LOAD, RELOC, CODE
  >   5 $CODE$        000001f8  00000000  00000000  000004c0  2**3
  >                   CONTENTS, ALLOC, LOAD, RELOC, CODE
  >   6 $CODE$        000003d8  00000000  00000000  000006b8  2**3
  >                   CONTENTS, ALLOC, LOAD, RELOC, CODE
OK.  This is actually enough to identify the problem.

This is one of those stupid problems that will go away when we revamp the tools
to do ELF in a more traditional fashion -- in particular dumping all the dumb
HP names for spaces/subspaces and sticking with standard names.

The problem is in the assembler's handling of .nsubspa.  It is not honoring the
$CODE$ -> .text translation for that case.

in gas/tc-hppa.c::pa_subspace there should be code like this:

     /* If this is an existing subspace, then we want to use the
         segment already associated with the subspace.

         FIXME NOW!  ELF BFD doesn't appear to be ready to deal with
         lots of sections.  It might be a problem in the PA ELF
         code, I do not know yet.  For now avoid creating anything
         but the "standard" sections for ELF.  */
      if (create_new)
        section = subseg_force_new (ss_name, 0);
      else if (ssd)
        section = ssd->ssd_seg;
      else if (alias)
        section = subseg_new (alias, 0);
      else if (!alias && USE_ALIASES)
        {
          as_warn (_("Ignoring subspace decl due to ELF BFD bugs."));
          demand_empty_rest_of_line ();
          return;
        }
      else
        section = subseg_new (ss_name, 0);


You'll note the FIXME NOW!.  It's about 5 years old :(  Though it will be
zapped as we drop the $CODE$ nonsense.


Anyway I think you may be able to fix this bug by changing the subseg_force_new
call to look something like:

  subseg_force_new (alias ? alias : ss_name, 0);


Though I'm a little confused.  I thought y'all were dropping the existing ELF
stuff -- I would strongly recommend it.  We're not even planning to keep the
existing elf32-hppa stuff building in gas/binutils as we work on the rewrite.
You're working with a totally dead and unsupported toolchain at this point.

jeff
