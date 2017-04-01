From: John David Anglin <dave.anglin@bell.net>
Subject: unshare (CLONE_NEWUTS)
Date: Sat, 1 Apr 2017 12:08:28 -0400
Message-ID: <74D018A3-5DD0-44EB-8D05-CEF787666249@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-28--492883039
Cc: Helge Deller <deller@gmx.de>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-28--492883039
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

We don't seem to support unshare (CLONE_NEWUTS):

dave@mx3210:~/unshare$ ./unshare
warning: unshare (CLONE_NEWUTS) failed: Operation not permitted
dave@mx3210:~/unshare$ su
Password: 
mx3210:/home/dave/unshare# ./unshare
warning: unshare (CLONE_NEWUTS) failed: Invalid argument

This appears to cause a couple of glibc tests on trunk to fail.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-28--492883039
Content-Disposition: attachment;
	filename=unshare.c
Content-Type: application/octet-stream;
	name="unshare.c"
Content-Transfer-Encoding: 7bit

#define _GNU_SOURCE
#include <sched.h>
#include <stdio.h>
#include <unistd.h>
int
main (void)
{
  if (unshare (CLONE_NEWUTS) != 0)
    printf ("warning: unshare (CLONE_NEWUTS) failed: %m\n");
  return 0;
}

--Apple-Mail-28--492883039--
