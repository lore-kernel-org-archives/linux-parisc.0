From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sun, 18 Feb 2007 11:44:24 -0500 (EST)
Message-ID: <200702181644.l1IGiOir014616__6121.93587371639$1416624298$gmane$org@hiauly1.hia.nrc.ca>
References: <200702181445.l1IEjV7B012366@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702181445.l1IEjV7B012366@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Feb 18, 2007 09:45:31 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> (gdb) p/x $r20
> $2 = 0x4086221c
> (gdb) x/2x $r20
> 0x4086221c <.LC2+84>:   0x00000003      0x40df252f

Comparing the setup of this region of memory in /lib/libc.so.6
to that in a simple testcase, it seems that the value setup for
r19 is somehow wrong.  Surrounding values are similar to what
I see in the simple testcase:

#include <stdlib.h>
int
main ()
{
  exit (0);
}

Testcase:
(gdb) x/16x 0x4046221c
0x4046221c:     0x00000003      0x40465c6c      0x00000002      0x0000147c
0x4046222c:     0x00000014      0x00000007      0x00000017      0x403397cc
0x4046223c:     0x00000007      0x4032d0ac      0x00000008      0x0000c720
0x4046224c:     0x00000009      0x0000000c      0x6ffffffc      0x00010ec0

Segv case:
(gdb) x/16x $r20
0x4086221c <.LC2+84>:   0x00000003      0x40df252f      0x00000002      0x0000147c
0x4086222c <.LC2+100>:  0x00000014      0x00000007      0x00000017      0x407397cc
0x4086223c <.LC2+116>:  0x00000007      0x4072d0ac      0x00000008      0x0000c720
0x4086224c <.LC2+132>:  0x00000009      0x0000000c      0x6ffffffc      0x00010ec0

I think '3' in the preceeding location indicates the erronious value
is a PLTGOT value (i.e., we're looking at part of the relocated dynamic
section in /lib/libc.so.6).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
