Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 929174875
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 09:18:58 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17UqYJ-00010V-00
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 11:17:19 -0400
Date: Wed, 17 Jul 2002 11:17:19 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Toolchain testing.
Message-ID: <20020717151719.GB3602@systemhalted>
References: <20020717150837.GA3602@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020717150837.GA3602@systemhalted>
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

> 
> Note:
> I have modified the control files for all three pieces of
> the toolchain. This was done with extreme care. The three
> pieces of the toolchain now allow for much finer-grained
> compile time options that can be eventually set by 
> dpkg-buildpackage (or a magical dpkg-compile... or an 
> enhanced dpkg-architecture ... or whatever)
> 

Another note, I have looked at dpkg-cross.

c.
