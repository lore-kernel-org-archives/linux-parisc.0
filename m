From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] kernel BUG at mm/mmap.c:1990
Date: Mon, 11 Dec 2006 20:14:09 -0500
Message-ID: <20061212011409.GD4044__14369.3972648636$1416624230$gmane$org@athena.road.mcmartin.ca>
References: <200612112338.13980.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612112338.13980.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 11, 2006 at 11:38:13PM +0100, Helge Deller wrote:
> Maybe someone has an idea ?
> 
> The "adjtimex02" test from the Linux Test Project (http://ltp.sf.net) seems to pass all test, but triggers a kernel BUG in mm/mmap.c:1990 when exiting.
> strace is attached below.
> 

iirc this only bites on 32bit kernels.

This is what Jeff is referring to:

/*
 * Testcase reduced from ltp, adjtimex02
 *
 * 1) adjtimex(2) fails with errno set to EFAULT if buf does
 *	   not point to writable memory
 */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/timex.h>

int
main()
{
	int x;
	struct timex *buffp = (struct timex *) -1;

	/* Check whether we are root */
	if (geteuid() != 0) {
		fprintf(stderr, "This needs to run as root.\n");
		return(-1);
	}
	
	/* Call adjtimex(2) */
	x = adjtimex(buffp);

	return x;
}


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
