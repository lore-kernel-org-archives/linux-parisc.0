Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA31735
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Aug 1999 16:00:08 -0600
Date: Tue, 10 Aug 1999 14:58:55 -0700 (PDT)
From: Kevin Vajk <kvajk@ricochet.net>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] utssys?
In-Reply-To: <19990807153154.C11586@mencheca.ch.genedata.com>
Message-ID: <Pine.LNX.4.10.9908101340240.979-100000@sophia.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Sat, 7 Aug 1999, Matthew Wilcox wrote:

> Can anyone tell me what the utssys() system call does?  There's no manual
> page for it.

It takes 3 arguments; a pointer, and two ints.

The second int is the request type.  If an unknown request type is
passed in, it returns EFAULT.
If the request does something like sets the hostname, the first int
passed in is the number of bytes in the hostname.
If the request does something like gets the hostname, the first int
passed in is the size of the character buffer for it to put the answer in.
Otherwise it's ignored.

type=0 gets the utsname (see sys/utsname.h).  first int is ignored.
type=1 is obsolete; it returns EFAULT
I don't know what type=2 does.
type=3 sets utsname.nodename, if you're root
type=4 sets the hostname, if you're root
type=5 gets the hostname
type=6 sets utsname.sysname, if you're root
type=7 is undocumented; it's only used during OS updates.  Just return EFAULT.


Here's an example of using utssys() to get the system's hostname:

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <syscall.h>
int main(argc,argv)
int argc; char *argv[];
{
    char buf[2048];
    memset(buf, 0, sizeof(buf));
    /*  utssys(buf, sizeof(buf), 5);  */
    if( syscall( SYS_UTSSYS, buf, sizeof(buf)-1, 5 ) == -1 ) {
        perror("utssys");
        exit(1);
    }
    printf("Hostname = \"%s\"\n", buf);
    exit(0);
}

- Kevin Vajk
  <kvajk@cup.hp.com>
