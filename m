From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Sat, 5 Mar 2005 16:53:23 -0500 (EST)
Message-ID: <200503052153.j25LrOQW014375@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Mar 5, 2005 03:33:20 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > I think we have somehow broken __cffc.  I did a binutils build
> > > yesterday and various ld tests are now failing.  These are tests
> > > that compare function pointers.
> > 
> > I didn't feed anything new into debian-glibc. All my patches have always
> > strived to keep __cffc working, if I messup the function pointer
> > comparison I get a slew of glibc testsuite failures which I always
> > patchup by making sure __cffc works :)
> 
> I haven't touched fptr.c either, although there is a change in GCC
> 4.0 with respect to canonicalization.  I'm using the debian glibc,
> 2.3.2.ds1-20, on the system on which I noticed this problem.

Ok, ld is broken in the binutils CVS head.
__canonicalize_funcptr_for_compare doesn't load the correct address
for _GLOBAL_OFFSET_TABLE_ in shared libraries.  It loads the address
used by main.  As a result, it thinks the plabel for the function
has been resolved ;(

The testcase is:

foo.c:

extern void bar (void);
typedef void (*func_t)(void);
int
foo (func_t f)
{
  return f == bar;
}

bar.c:

void bar (void) {};
int
main ()
{
  if (!foo (bar))
    abort ();
  return 0;
}

gcc -g -fPIC -S foo.c
gcc -shared -fPIC -o foo.sl foo.o
gcc -c -g -w bar.c
gcc -o bar bar.o foo.sl

nm foo.sl
...
00010ab0 a _GLOBAL_OFFSET_TABLE_

nm bar
...
00020c54 d _GLOBAL_OFFSET_TABLE_

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
