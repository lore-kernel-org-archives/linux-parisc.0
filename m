Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 10 Mar 2003 09:31:47 -0700
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] trouble loading from netinst ISO on B2000
Message-ID: <20030310163147.GA12389@dsl2.external.hp.com>
References: <20030310015353.95148.qmail@web12501.mail.yahoo.com> <20030310151559.37375.qmail@web12501.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030310151559.37375.qmail@web12501.mail.yahoo.com>
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

On Mon, Mar 10, 2003 at 07:15:59AM -0800, Derek Engelhaupt wrote:
> Well all efforts have failed.  I now tried to use an internal drive in
> the B2000 totally bypassing the card and the array with the same results.
> It still won't load PALO.  The whole install goes well, but no PALO.

The last sentence doesn't agree with what you wrote earlier.

The above sounds like you are trying to boot from the wrong disk.
AFAIK, the debian install does not change the primary/secondary boot
path to point to the disk you installed on. Interrupt the boot
process and direct the primary (firmware) boot to try different disks.

> Is there a newer version of PALO that isn't on the 2.4.20-32 release
> that I could try?

This has nothing to do with palo version.
If PALO failed to load the kernel, then we could talk about PALO
versions.

> Then I get an error saying PALO won't load and then dumps me all the way
> back to the "choose a language" screen.

This sounds more like a bug in the installer scripts.
I suggest trying to work around it by going into the shell
and running palo by hand.  PALO HowTo is here:
	http://en.tldp.org/HOWTO/PA-RISC-Linux-Boot-HOWTO/palo.html

grant
