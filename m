Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 125EA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jan 2002 08:54:53 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA02006
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jan 2002 09:54:46 -0600
Date: Fri, 25 Jan 2002 09:54:46 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <2F1E6AB90ECAD311943700A0C9E3B15407888693@xatl03.atl.hp.com>
Message-ID: <Pine.LNX.4.21.0201250940350.1690-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] g++ problem with `std' namespace
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

I seem to have run into a problem with GCC on parisc-linux which the
script below will demonstrate.  I get an "`fread' undeclared in namespace
`std'" error.  The example works fine on four other architectures, but
they all have gcc 2.95.x while my parisc box has gcc 3.0.x.  Is this a
parisc problem, a gcc problem, or a coder problem?

Regards,

- Greg


#!/bin/sh
cat >foo.cc <<EOF
#include <stdio.h>

class FOO
{
public:
  FOO(void);
  int read(char *, int);

  FILE *fd;
};

FOO::FOO(void)
{
  fd = stdin;
}

int FOO::read(char *buf, int size)
{
  return std::fread(buf, size, 1, fd);
}
      
int main(int argc, char **argv)
{
  FOO foo;
  char buf[512];

  foo.read(buf, 512);

  return 0;
}
EOF
g++ foo.cc
