Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E9B94A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 10:44:04 -0700 (MST)
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Alan Modra <alan@linuxcare.com.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes 
In-Reply-To: Your message of "Thu, 22 Feb 2001 17:00:50 GMT."
             <20010222170050.B4660@linuxcare.com>
References: <20010222130359.F1129@linuxcare.com> <Pine.LNX.4.21.0102230011340.14557-100000@front.linuxcare.com.au>  <20010222170050.B4660@linuxcare.com> 
Date: Thu, 22 Feb 2001 10:44:02 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14Vzmc-0007Zm-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

I thought I'd write a pipe test program for laughs.  Don't run this
unless you want to cry -- it locks up my machine (both narrow
and wide kernels) after not very many trials, though 'ping' still works.
On a wide kernel, a TOC caught it in __down_interruptible but that
could be normal.

	-P


#include <stdio.h>
#include <unistd.h>

#define READ 0
#define WRITE 1
#define SIZE 4096

int
main(int argc, char *argv[])
{
    int p[2];
    char data[SIZE];
    char rdbuf[SIZE];
    int i;
    int pid;

    if (pipe(p) != 0)
    {
	perror("pipe");
	return 3;
    }

    for (i = 0; i < SIZE; i++)
    {
	data[i] = rand() & 0xff;
    }

    if ((pid = fork()) < 0)
    {
	perror("fork");
	return 3;
    }

    for(i = 0; i < 10000; i++)
    {
	int sendoffset = rand() % SIZE;
	int sendsize = rand() % (SIZE - sendoffset);
	int wr, rd;

	/* Don't bother sending 0 bytes */
	if (sendoffset == SIZE - 1)
	    continue;

	if (pid > 0)
	{
	    wr = write(p[WRITE], data + sendoffset, sendsize);
	    printf("%d: write(data + %d, %d) = %d\n",
		i, sendoffset, sendsize, wr);
	    if (wr != sendsize)
	    {
		fprintf(stderr, "write returns %d expected %d\n", wr, sendsize);
		if (wr < 0)
			perror("write");
	    }
	}
	else
	{
	    rd = read(p[READ], rdbuf, sendsize);
	    printf("%d: read(%d) = %d\n", i, sendsize, rd);
	    if (rd != sendsize)
	    {
		fprintf(stderr, "read returns %d expected %d\n", rd, sendsize);
		if (rd < 0)
		    perror("read");
	    }

	    if (memcmp(data + sendoffset, rdbuf, rd) != 0)
	    {
		fprintf(stderr, "readback compare failed\n");
	    }
	}
    }
}
