Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id A044D483D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 14:21:54 -0600 (MDT)
Message-ID: <75A9FEBA25015040A761C1F74975667D01442052@hplex4.hpl.hp.com>
From: "Boehm, Hans" <hans_boehm@hp.com>
To: "'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	"Boehm, Hans" <hans_boehm@hp.com>
Subject: RE: [parisc-linux] Program counter from sigcontext, constructors
Date: Fri, 25 Apr 2003 13:21:47 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Thanks.

It turns out the constructor issue does have a simple test case.  I assume the issues is with -fPIC code in a main program constructor?  With luck, this may only matter for my test case.  For any real use, this would be in a dynamic library.

Hans

spe170> cat constr.c
#include <stdio.h>

int x = 42;

int y;

void my_start(void) __attribute__ ((constructor));

main()
{
  printf("x, y = %d, %d \n", x, y);
  return 0;
}


void my_start(void)
{
  y = x;
}
spe170> cc -fPIC -g constr.c
spe170> ./a.out
Segmentation fault
spe170> cc -g constr.c
spe170> ./a.out
x, y = 42, 42
spe170>

> -----Original Message-----
> From: John David Anglin [mailto:dave@hiauly1.hia.nrc.ca]
> Sent: Friday, April 25, 2003 12:56 PM
> To: hans_boehm@hp.com
> Cc: carlos@baldric.uwo.ca; parisc-linux@lists.parisc-linux.org;
> hans_boehm@hp.com
> Subject: Re: [parisc-linux] Program counter from sigcontext,
> constructurs
> 
> 
> > > > 2) If I mark a C function as a constructor function, and 
> > > compile it with -fPIC, it seems to run before globals are 
> > > properly accessible.  The retrieval of the address of a 
> > > global through the global offset table seems to return a bad 
> > > address and the access faults.  Are there known issues in 
> > > this area?  (The offending function actually ends up in the 
> > > main program, if that matters.)
> 
> I'm not aware of any.  All the libstdc++ test pass and this involves
> running constructors in a shared library, so it would seem the PIC
> register and got table must be setup.  Function pointer 
> canonicalization
> involves accessing the got table in some situations.  This can happen
> in crtstuff.c which runs constructors.  Do you have a testcase?
> 
> It might be a linker issue.  There are some subtle issues with calling
> PIC code that's not in a shared library.
> 
> Dave
> -- 
> J. David Anglin                                  
> dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 
> 990-0752 (FAX: 952-6602)
> 
