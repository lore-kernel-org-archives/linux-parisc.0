From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] gcc instrument-function on parisc?
Date: Tue, 18 Apr 2006 16:28:13 +0100
Message-ID: <IXXCB1$DA3AB156FC2925CAA26A8737245EC4CD@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 "Parisc List" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

I tried to use this example of gcc instrumentation:
<http://www-128.ibm.com/developerworks/linux/library/l-graphvis/?ca=3Ddgr=
-lnxw18Graphviz>

I try to rebuild its trivial test.c as mentioned:
test.c
::::::::::::::
#include <stdio.h>

int main()
{
        printf("Hello World\n");
        return 0;
}

# gcc -g -finstrument-functions test.c instrument.c -o test

# more trace.txt
E0x20e3e
X0x20e3e

but this is not the main() address (gdb shows 0x1067c).

OTOH I find this comment in gcc-4.0 info:
`-finstrument-functions'
     Generate instrumentation calls for entry and exit to functions.
     Just after function entry and just before function exit, the
     following profiling functions will be called with the address of
     the current function and its call site.  (On some platforms,
     `__builtin_return_address' does not work beyond the current
     function, so the call site information may not be available to the
     profiling functions otherwise.)

Is 'some platform' include parisc?

TIA for advise,
    Joel



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
