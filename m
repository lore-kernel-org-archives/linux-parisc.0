Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 850C5483E
	for <parisc-linux@parisc-linux.org>; Sun, 19 Oct 2003 17:14:10 -0600 (MDT)
Date: Sun, 19 Oct 2003 19:10:15 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was: do_page_fault?]
Message-ID: <20031019231015.GH8642@systemhalted>
References: <3F8A272E00000550@ocpmta3.freegates.net> <3F91ACEC.1010504@tiscali.be> <3F92AD98.3030104@tiscali.be> <3F92EAB4.7070802@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F92EAB4.7070802@tiscali.be>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Oct 19, 2003 at 07:49:08PM +0000, Joel Soete wrote:
> Hi pa,
> 
> Please apologies, I forget to mentioned an important matter:
> with 2.6.0-test-pa1 it is not anymore a do_page_fault() but:
> evolution (pid 2454): Protection id trap (code 27) 

Do not wrap lines like this. 
 
> YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI 
>                            PSW: 00000000000001000000000000001111 Not 
> tainted                                                       r00-03 

You should really run evolution through gdb. Remember to use "handle all
nostop" and "handle all pass".

c.
