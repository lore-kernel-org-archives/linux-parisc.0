Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA24566
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 08:30:19 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 27 Oct 2000 14:31:51 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA22587;
	Sat, 28 Oct 2000 01:26:02 +1100
Date: Sat, 28 Oct 2000 01:26:02 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com, Drepper@milano.cup.hp.com,
        Ulrich@milano.cup.hp.com
Subject: Re: [parisc-linux] __FUNCTION__ revisited
In-Reply-To: <200010261954.MAA22459@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0010280103510.20748-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 26 Oct 2000, Grant Grundler wrote:

> 	DBG_RUN_SG("%s() DONE %d mappings\n", __FUNCTION__, n_mappings);
> 
> The output I get looks like "() DONE 16 mappings".
> No complaints from compiler or linker.

Here's a weird datapoint.

cat > xxx.c <<EOF
#include <stdio.h>

#define DEBUG_SBA_RUN_SG

#ifdef DEBUG_SBA_RUN_SG
#define DBG_RUN_SG(x...)       printf(x)
#else
#define DBG_RUN_SG(x...)
#endif


int foo (int i)
{
  DBG_RUN_SG("%s() DONE %d mappings\n", __FUNCTION__, i);
  return i;
}

int main (void)
{
  return foo (0);
}
EOF
hppa-linux-gcc -S -O2 -o xxx.s xxx.c

shows that __FUNCTION__ is being translated as an empty string.  The
really weird bit is that if you remove "#include <stdio.h>", everything is
OK!

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
