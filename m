From: ja2morri@csclub.uwaterloo.ca (James A. Morrison)
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: 24 Mar 2005 08:27:24 -0500
Message-ID: <kfhwtrx2myr.fsf@csclub.uwaterloo.ca>
References: <20050324130751.GK2485@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050324130751.GK2485@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Randolph Chung <randolph@tausq.org> writes:

> i've been looking at the extreme slowness of ext3 during some workloads.
> came across this bit of code... not that it will make any difference,
> but i wonder if we can make gcc a bit smarter?
> 
> given this bit of C code:
> 
> static inline int test_bit(int nr, const void * addr)
> {
> 	const unsigned char *ADDR = (const unsigned char *) addr;
> 	return (ADDR[nr >> 3] >> (nr & 7)) & 1;
> }
> 
> int proc1(int nr, int foo)
> {
> 	int ret;
> 	char *buf1, *buf2;
> 
> 	if (test_bit(nr, buf1))
> 		return 0;
> 
> 	if (foo)
> 		ret = 1;
> 	else
> 		ret = !test_bit(nr, buf2);
> 	return ret;
> }
> 
> int proc2(int nr, int foo)
> {
> 	char *buf1, *buf2;
> 
> 	if (test_bit(nr, buf1))
> 		return 0;
> 
> 	if (foo)
> 		return 1;
> 	else
> 		return !test_bit(nr, buf2);
> }
> 

 GCC 4 already produces the same code for these functions*.  Attached is the
final_cleanup dumb of an O2 build of this file.

 * I only checked that the assembly was the exact same on ia64, but the
tree dumps only differ in the names of the ret variable.

-- 
Thanks,
Jim

http://www.student.cs.uwaterloo.ca/~ja2morri/
http://phython.blogspot.com
http://open.nit.ca/wiki/?page=jim

;; Function proc1 (proc1)

proc1 (nr, foo)
{
  int D.1253;
  const unsigned char * D.1249;
  char * buf2;
  char * buf1;
  int ret;

<bb 0>:
  D.1249 = (const unsigned char *) (long unsigned int) (nr >> 3);
  D.1253 = nr & 7;
  if (((int) *((const unsigned char *) buf1 + D.1249) >> D.1253 & 1) != 0) goto <L10>; else goto <L2>;

<L10>:;
  ret = 0;
  goto <bb 5> (<L7>);

<L2>:;
  if (foo != 0) goto <L11>; else goto <L4>;

<L11>:;
  ret = 1;
  goto <bb 5> (<L7>);

<L4>:;
  ret = ((int) *(D.1249 + (const unsigned char *) buf2) >> D.1253 & 1) == 0;

<L7>:;
  return ret;

}



;; Function proc2 (proc2)

proc2 (nr, foo)
{
  int D.1291;
  const unsigned char * D.1287;
  char * buf2;
  char * buf1;
  int D.1239;

<bb 0>:
  D.1287 = (const unsigned char *) (long unsigned int) (nr >> 3);
  D.1291 = nr & 7;
  if (((int) *((const unsigned char *) buf1 + D.1287) >> D.1291 & 1) != 0) goto <L9>; else goto <L2>;

<L9>:;
  D.1239 = 0;
  goto <bb 5> (<L6>);

<L2>:;
  if (foo != 0) goto <L10>; else goto <L4>;

<L10>:;
  D.1239 = 1;
  goto <bb 5> (<L6>);

<L4>:;
  D.1239 = ((int) *(D.1287 + (const unsigned char *) buf2) >> D.1291 & 1) == 0;

<L6>:;
  return D.1239;

}


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
