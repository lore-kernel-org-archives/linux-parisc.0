Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 13 Aug 2003 11:53:40 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030813175340.GF18794@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030811043457.GA5653@dsl2.external.hp.com>
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

On Sun, Aug 10, 2003 at 10:34:57PM -0600, Grant Grundler wrote:
> This started out as an issue with glxinfo program in xfree86.

I've built a full set of xfree86-4.2.1-9 hppa debs with gcc 3.3.1.
(last ones in "testing" are 4.2.1-6 and built with gcc 3.0.1 IIRC)

Public URL	http://gsyprf11.external.hp.com/hppa/xfree86-4.2.1-9/
HP Internal 	http://debian.cup.hp.com/parisc/xfree86-4.2.1-9/

The bits seem to run fine on my c3k...but xpdf still fails:

grundler <513>xpdf -cmap dino31.pdf 
Error: Unresolved inheritance operation
grundler <514>
...
grundler <516>dpkg -l xlibs
Desired=Unknown/Install/Remove/Purge/Hold
|
Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err:
uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  xlibs          4.2.1-9        X Window System client libraries

*sigh*.
Do I need to restart X11 or something?

grant
