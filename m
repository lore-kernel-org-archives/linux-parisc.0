Return-Path: <TestDrive@compaq.com>
Subject: FW: Some issues
Date: Wed, 11 Dec 2002 15:12:15 -0500
Message-ID: <9C422444DE99BC46B3AD3C6EAFC9711B0194EA6E@tayexc13.americas.cpqcorp.net>
From: "CSA Test Drive" <TestDrive@compaq.com>
To: "Garbee, Bdale" <bdale.garbee@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1

Here is some input on a Debian PA-RISC issue.

Thanks

Tim

-----Original Message-----
From: Torbjorn Granlund [mailto:tege@swox.com]
Sent: Monday, December 09, 2002 4:04 PM
To: CSA Test Drive
Subject: Some issues


1) Could you please set the clock of spe190?  It is 1.5h off.

2) The Debian HPPA box (spe170) seems to have alpha quality
software.  Specifically, the FCNV,UDW,DBL instruction is
apparently trapped, at least for certain input operand
values, and then incorrectly implemented.  (I base the
assupmtion that it is trapped not only on its incorrect
operation, but on its terrible performance and that kernel
time dominates any test program that contains the
instruction.)

Here is a test program that demonstrates the problems:

double ull2dbl (unsigned long long ull)
{
  return ull;
}
main ()
{
  int i;
  for (i =3D 500000; --i;)
    ull2dbl (0x8000000000000000ull);
  printf ("%f\n", ull2dbl (0x8000000000000000ull));
  return 0;
}

Compile using:
$ gcc -mpa-risc-2-0 ull2dbl.c -O
$ ./a.out=20
-9223372036854775808.000000

Correct output is 9223372036854775808, without the minus sign.
Without the -mpa-risc-2-0 switch, the program behaves correctly.
I have verified that the compiler output is indeed correct.

The program takes 2.7 seconds of kernel time!

--
Torbj=F6rn


--=-=-=--
