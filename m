Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (dns.franken.de [193.175.24.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF580482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Mar 2002 02:32:01 -0700 (MST)
Date: Thu, 28 Mar 2002 10:31:51 +0100
From: Thomas Bogendoerfer <tsbogend@elvis.franken.de>
To: Christian Suder <csuder@cisco.com>
Cc: David Dougall <davidd@et.byu.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mozilla, etc.
Message-ID: <20020328093151.GA20881@elvis.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <Pine.LNX.4.33.0203272123310.1463-100000@lewis.et.byu.edu> <3CA2ADDB.4EE8AFA4@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CA2ADDB.4EE8AFA4@cisco.com>
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

On Wed, Mar 27, 2002 at 09:44:59PM -0800, Christian Suder wrote:
> since rcently you can get the mozilla package with a simple "apt-get install
> mozilla", so there is no need to go through the excercise of compiling it
> yourself (and it takes several hours on older HW - been there). However it
> still doesn't run, as far as I know because the threads are still far from

to get it running, you need to recompile it with -O optimizing level. The
default -O2 miscompiles mozilla. Ok, this will give you a more sane mozilla,
but it's still not accepting some of the mouse/keyboard events. No idea
why. But there is galeon, which uses mozillas rendering engine, which (also
compiled with -O) gives me a working web browser.

Thomas.
