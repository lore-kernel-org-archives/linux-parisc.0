From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: strtold
Date: Sat, 7 Jan 2006 16:07:57 -0500
Message-ID: <20060107210757.GM17559@baldric.uwo.ca>
References: <200512261958.jBQJwex0017907@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512261958.jBQJwex0017907@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 26, 2005 at 02:58:40PM -0500, John David Anglin wrote:
> With libc6 2.3.5-8:
> 
> #include <stdlib.h>
> int
> main ()
> {
>   printf ("%Lf\n", strtold ("1", NULL));
>     return 0;
> }
> 
> dave@gsyprf11:~/gcc_test$ gcc -o ld1 ld1.c
> dave@gsyprf11:~/gcc_test$ ./ld1
> 0.000000

strtold will never work, gcc and libc have different sizes for long
double. This is probably a side-effect of this.

If we really want long double to work we need to do something like set
it to be the same as double.

128-bit long double is just going to be a pain, and I don't know how
well the 80-bit long double from IBM supports IEEE modes.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
