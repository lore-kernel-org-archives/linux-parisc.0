From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Thu, 30 Dec 2010 10:56:41 -0500
Message-ID: <20101230155640.GA7058@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20101229042346.GA973@hiauly1.hia.nrc.ca> <1293634281.2803.4.camel@fuzzy>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1293634281.2803.4.camel@fuzzy>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 29 Dec 2010, James Bottomley wrote:

> > Dec 26 12:30:57 mx3210 kernel: INEQUIVALENT ALIASES 0x402a7000 and 0x402a6000 in file libc-2.11.2.so
> > 
> > This is with 2.6.36.2 and your two patches on a SMP kernel.  I've also seen
> > these messages with a similar UP build in the gcc guality tests.  These
> > check debug info with gdb.
> 
> Yes, I still don't know why, but fortunately the one above is the same
> one I see, which only occurs when the system goes down.  I suspect
> something is specifying a fixed offset for the library mappings which
> violates our 4MB equivalency rule.

Attached is an application that triggers similar errors:

Dec 29 23:27:02 mx3210 kernel: INEQUIVALENT ALIASES 0x11000 and 0x12000 in file example.exe

If I was to guess, I think the problem is likely caused by the brk system
calls from popen:

...
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40001000
mprotect(0x40518000, 1413120, PROT_READ|PROT_WRITE) = 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40002000
mprotect(0x40518000, 1413120, PROT_READ|PROT_EXEC) = 0
munmap(0x40185000, 24154)               = 0
brk(0)                                  = 0x13000
brk(0x34000)                            = 0x34000
pipe2([3, 4], O_CLOEXEC)                = 0
clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40000a68) = 3035
close(3)                                = 0
...

It's hard to debug because gdb needs to attach.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="example.c"

/* { dg-do run { xfail *-*-* } } */
/* { dg-options "-g" } */

#define GUALITY_DONT_FORCE_LIVE_AFTER -1

#ifndef STATIC_INLINE
#define STATIC_INLINE /*static*/
#endif

#include "guality.h"

#include <assert.h>

/* Test the debug info for the functions used in the VTA
   presentation at the GCC Summit 2008.  */

typedef struct list {
  struct list *n;
  int v;
} elt, *node;

STATIC_INLINE node
find_val (node c, int v, node e)
{
  while (c < e)
    {
      GUALCHK (c);
      GUALCHK (v);
      GUALCHK (e);
      if (c->v == v)
	return c;
      GUALCHK (c);
      GUALCHK (v);
      GUALCHK (e);
      c++;
    }
  return NULL;
}

STATIC_INLINE node
find_prev (node c, node w)
{
  while (c)
    {
      node o = c;
      c = c->n;
      GUALCHK (c);
      GUALCHK (o);
      GUALCHK (w);
      if (c == w)
	return o;
      GUALCHK (c);
      GUALCHK (o);
      GUALCHK (w);
    }
  return NULL;
}

STATIC_INLINE node
check_arr (node c, node e)
{
  if (c == e)
    return NULL;
  e--;
  while (c < e)
    {
      GUALCHK (c);
      GUALCHK (e);
      if (c->v > (c+1)->v)
	return c;
      GUALCHK (c);
      GUALCHK (e);
      c++;
    }
  return NULL;
}

STATIC_INLINE node
check_list (node c, node t)
{
  while (c != t)
    {
      node n = c->n;
      GUALCHK (c);
      GUALCHK (n);
      GUALCHK (t);
      if (c->v > n->v)
	return c;
      GUALCHK (c);
      GUALCHK (n);
      GUALCHK (t);
      c = n;
    }
  return NULL;
}

struct list testme[] = {
  { &testme[1],  2 },
  { &testme[2],  3 },
  { &testme[3],  5 },
  { &testme[4],  7 },
  { &testme[5], 11 },
  { NULL, 13 },
};

int
main (int argc, char *argv[])
{
  int n = sizeof (testme) / sizeof (*testme);
  node first, last, begin, end, ret;

  GUALCHKXPR (n);

  begin = first = &testme[0];
  last = &testme[n-1];
  end = &testme[n];

  GUALCHKXPR (first);
  GUALCHKXPR (last);
  GUALCHKXPR (begin);
  GUALCHKXPR (end);

  ret = find_val (begin, 13, end);
  GUALCHK (ret);
  assert (ret == last);

  ret = find_prev (first, last);
  GUALCHK (ret);
  assert (ret == &testme[n-2]);

  ret = check_arr (begin, end);
  GUALCHK (ret);
  assert (!ret);

  ret = check_list (first, last);
  GUALCHK (ret);
  assert (!ret);
}

--BOKacYhQ+x31HxR3
Content-Type: application/x-gunzip
Content-Disposition: attachment; filename="example.exe.gz"
Content-Transfer-Encoding: base64

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
iOCb7uk5eMWhMYd3E9PK/wWdMzZfvVQAAA==

--BOKacYhQ+x31HxR3--
