Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA22938
	for <parisc-linux@puffin.external.hp.com>; Sun, 8 Oct 2000 20:59:53 -0600
Date: Sun, 8 Oct 2000 20:00:48 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
Message-ID: <20001008200047.B639@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Subject: [parisc-linux] file locking problems?
List-ID: <linux-parisc.vger.kernel.org>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii

Hi all,

I'm seeing some weird behavior with file locking on my hppa box:

update-passwd (a Debian package) makes a call to lckpwdf. That fails
with an "Invalid argument" message. It looks like lckpwdf internally uses
fcntl() locking, so I tried that and it too fails with an "Invalid
argument" message.  This happens both on nfs and local ext2 fs.
Similar tests with flock() seems to work ok.

Any ideas? This is using dhd's latest glibc build. My testing program is
attached. I've verified that it works on ext2 fs on i386 and SPARC. Over
nfs it does give an error message (No locks available).

The test program I used is attached.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

--EVF5PPMfhYS0aIcm
Content-Type: text/x-csrc
Content-Disposition: attachment; filename="locktest.c"

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv)
{
        struct flock l;
        int fd;

        if ((fd = open("test.lck", O_CREAT|O_RDWR)) < 0)
        {
                perror("open");
                return -1;
        }
        memset(&l, 0, sizeof(l));
        l.l_type = F_RDLCK;
        if (fcntl(fd, F_SETLK, &l) < 0)
        {
                perror("fcntl");
                return -1;
        }
        close(fd);
        return 0;
}

--EVF5PPMfhYS0aIcm--
