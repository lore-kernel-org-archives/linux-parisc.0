From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Sat, 13 Aug 2005 08:40:28 -0500
Message-ID: <1123940428.5037.2.camel@mulgrave>
References: <20050812180551.GA32609@colo.lackof.org>
	<200508130000.j7D00oKW005186@hiauly1.hia.nrc.ca>
	<20050813050211.GE32609@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050813050211.GE32609@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-08-12 at 23:02 -0600, Grant Grundler wrote:
> I expect this is the difference...I need to use the same g++ version.
> Does someone want to hack a small test program that consumes
> stack space until it bombs out becuase of the ulimit?

Here's a test program that does this:

#include <stdio.h>

char *stack_base_estimate;

void
recurse(void)
{
	char a[256];

	memset(a, '\0', sizeof(*a));
	printf("Estimating stack consumed 0x%lx\n",
	       (unsigned long)(a - stack_base_estimate));
	recurse();
}

int
main(int argc, char *argv[])
{
	char b;

	stack_base_estimate = &b;
	printf("Estimating stack base at 0x%p\n", stack_base_estimate);
	recurse();
	return 0;
}
		
But the results are as expected (on 2.6.13-rc6-pa1):

jejb@raven> ulimit -a
core file size        (blocks, -c) 0
data seg size         (kbytes, -d) unlimited
file size             (blocks, -f) unlimited
max locked memory     (kbytes, -l) unlimited
max memory size       (kbytes, -m) unlimited
open files                    (-n) 1024
pipe size          (512 bytes, -p) 8
stack size            (kbytes, -s) 8192
cpu time             (seconds, -t) unlimited
max user processes            (-u) unlimited
virtual memory        (kbytes, -v) unlimited
jejb@raven> a.out
Estimating stack base at 0x0xc0114548
Estimating stack consumed 0x80
[...]
Estimating stack consumed 0x7fefc0
Estimating stack consumed 0x7ff100
Segmentation fault

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
