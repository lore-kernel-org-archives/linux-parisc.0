Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 22 Feb 2003 19:46:29 -0700
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] X problems...
Message-ID: <20030223024629.GA4464@dsl2.external.hp.com>
References: <20030220051506.GA10418@dsl2.external.hp.com> <3E54DBA200000169@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E54DBA200000169@ocpmta3.freegates.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Thu, Feb 20, 2003 at 06:05:34PM +0100, Joel Soete wrote:
> Do you think it could be now find into XFree86 kernel drivers?

I don't know. I was pretty sure the X11.org code had basic support
for parisc graphics cards. But I'm not sure it covered the latest
generation (FX[2456]). No clue is XFree86 picked those up or not.

BTW, in another email you noted the source was only supporting 2.2 kernel.
That makes sense to me since I didn't see the driver using
pci_dma* routines. Without using those routines, I don't expect
the code to work on any parisc machines.

grant
