From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Sat, 12 Mar 2005 18:37:15 -0500 (EST)
Message-ID: <200503122337.j2CNbF3p026289@hiauly1.hia.nrc.ca>
References: <200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 5, 2005 03:33:20 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Another thing that I need to figure out is the cause of the libstdc++
> fails:
> 
> hiauly6 4.0.0:
> FAIL: 27_io/basic_filebuf/sgetn/char/1-in.cc execution test

This fail is caused by a bug in ioctl when using a 32-bit kernel.
I've attached a little test program below that demonstrates the problem.
sgetn.txt can be found in libstdc++-v3/testsuite/data/sgetn.txt but
I think any file will do.  num is still 0 after the ioctl call.

> gsyprf11 4.1.0:
> FAIL: 22_locale/messages/members/char/1.cc execution test
> FAIL: 22_locale/messages/members/char/2.cc execution test
> FAIL: 22_locale/messages/members/char/wrapped_env.cc execution test
> FAIL: 22_locale/messages/members/char/wrapped_locale.cc execution test
> FAIL: 22_locale/messages_byname/named_equivalence.cc execution test

These are a result of configuring GCC with --disable-nls.  It's
a minor configuration issue.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/ioctl.h>
int
main ()
{
  int fd, result;
  int num = 0;

  fd = open ("sgetn.txt", O_RDONLY);
  result = ioctl (fd, FIONREAD, &num);
  printf ("num = %d\n\n", num);
  return 0;
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
