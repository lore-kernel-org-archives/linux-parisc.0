Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 092CA4866
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Oct 2003 09:31:51 -0600 (MDT)
Date: Fri, 3 Oct 2003 16:31:48 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.0-test6-pa6 on b2k finaly crash
In-Reply-To: <3F5CB6FB0000CBFC@ocpmta1.freegates.net>
Message-ID: <Pine.LNX.4.58.0310031624140.12322@sal.ucc.ie>
References: <3F5CB6FB0000CBFC@ocpmta1.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 3 Oct 2003, Joel Soete wrote:

> I am also happy that with 2.6.0-test6-pa6 b2k crash because it is a long
> time that I try to obtain a relevant info (even toc do not help until now).

You mean to be able to track down the serial console bug?

> And here is the full boot messages:

[removed dmesg output]

Similar to my output.

> PS: kernel was build with 'make defconfig' configuration and gcc:
> palinux:~# gcc --version
> gcc (GCC) 3.3.2 20030908 (Debian prerelease)

Same here.

I was wondering whether it was just me (wrong config) or the 2.6 wasn't
working on C3k in general. Then I read on the mailing lists archive that
the serial console is not working for the C3k.

For that reason I was never able to test/run a 2.5/2.6 kernel, since
I don't have a STIcon (no graphics card).
Well, I think you can just compile no console at all and it will use a
dummy console AFAIK, but never tried that (not brave enough). Would you
be able to run 2.6 in that case?

Thanks
  Max
