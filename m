Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA26943
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 07:42:29 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Oct 2000 13:44:00 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA19481;
	Fri, 27 Oct 2000 00:43:42 +1100
Date: Fri, 27 Oct 2000 00:43:42 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: gcc-bugs@gcc.gnu.org
cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0010261922550.31251-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0010270024230.31251-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] testcase for hppa64 gcc bug
List-ID: <linux-parisc.vger.kernel.org>

Here is a distilled testcase for the hppa64 bug reported in
http://gcc.gnu.org/ml/gcc-bugs/2000-10/msg00511.html

extern void abort(void);

char p;

int f1 (char **);
int f2 (char *, char **);

char *f3 (char *a, char *b)
{
  char *c = 0;

  if (f1 (&b) != 0)
    goto out;

  /* hppa64 passes bogus value for b */
  f2 (b, &c);

out:
  return c;
}

int f1 (char **x)
{
  if (*x != &p)
    abort ();
  return 0;
}

int f2 (char *a, char **b)
{
  if (a != &p)
    abort ();
  *b += 1;
  return 0;
}

int main (void)
{
  if (f3 (0, &p) != (char *) 0 + 1)
    abort ();
  return 0;
}

-- 
Linuxcare.  Support for the Revolution.
