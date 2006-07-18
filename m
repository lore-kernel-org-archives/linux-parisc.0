From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Tue, 18 Jul 2006 23:51:05 +0800
Message-ID: <44BD0369.3090905@tausq.org>
References: <119aab440607172040gf1209cp52131893cea42460@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607172040gf1209cp52131893cea42460@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos O'Donell wrote:
> I was looking at our tst-printfsz failures in glibc, and I noticed
> some very cute code in vfprintf.c. The code uses alloca to create a
> specs structure, and then using certain know addresses decides if the
> stack grows down or up.
> 
> Does this look right? Anyone care to review if this actually works
> with a newer GCC on hppa?

I tried this with both old (gcc-3.[34]) and new gcc (gcc-4.[01]) and i 
don't think this works....

tausq@riot:~$ cat alloca.c
#include <alloca.h>
#include <stdio.h>

int main(int argc, char **argv)
{
         int *old;
         int *ptr = alloca(100 * sizeof(int));

         old = ptr;

         ptr = alloca(100 * sizeof(int));

         printf("ptr = %p\nold = %p\n&old[100] = %p\n", ptr, old, 
&old[100]);
         return 0;
}
tausq@riot:~$ gcc-4.1 -Wall -o alloca alloca.c; ./alloca
ptr = 0xc04ca590
old = 0xc04ca3d0
&old[100] = 0xc04ca560

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
