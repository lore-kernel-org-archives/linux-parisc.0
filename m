Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (lt200001.hrz.uni-oldenburg.de [134.106.156.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A2C94887
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 08:47:27 -0600 (MDT)
Date: Sun, 30 Sep 2001 16:45:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: shm cache flush bug?
Message-ID: <20010930164501.A9970@solo.franken.de>
References: <200109300638.AAA13665@udlkern.fc.hp.com> <20010930143928.B6355@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010930143928.B6355@solo.franken.de>; from tsbogend@alpha.franken.de on Sun, Sep 30, 2001 at 02:39:28PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 30, 2001 at 02:39:28PM +0200, Thomas Bogendoerfer wrote:
> [...]

forgot my test program.

Thomas.


#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>

#define SHMSIZE 32768*32

int main (int argc, char *argv[])
{
	int keyid;
	unsigned char *buf;
	int i;

	if ((keyid = shmget (IPC_PRIVATE, SHMSIZE, (SHM_R|SHM_W|IPC_CREAT))) == -1) {
		perror ("shmget");
		exit (1);
	}

	if ((buf = shmat (keyid, NULL, 0)) == ((void *)-1)) {
		perror ("shmat buf");
		exit (1);
	}

	printf ("filling buffer (%p)\n",buf);
	for (i = 0; i < SHMSIZE; i++) {
		buf[i] = i & 255;
		if (*(volatile unsigned char *)&buf[i] != (i & 255)) {
			printf ("failed at %d\n",i);
			exit (1);
		}
	}
	printf ("read back from original buffer (%p)\n",buf);
	for (i = 0; i < SHMSIZE; i++) {
		if (*(volatile unsigned char *)&buf[i] != (i & 255)) {
			printf ("failed at %d: is %02x should be %02x\n",i,*(volatile unsigned char *)&buf[i],i&255);
		}
	}
	shmdt (buf);
	shmctl (keyid, IPC_RMID, NULL);
	printf ("TEST passed\n");
	return 0;
}


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
