Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (ns1.au.network4.net [203.25.143.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8169E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Mar 2002 05:18:12 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id UAA07245
	for parisc-linux@lists.parisc-linux.org; Thu, 28 Mar 2002 20:18:02 +0800
Date: Thu, 28 Mar 2002 20:18:00 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mozilla, etc.
Message-ID: <20020328201757.B6833@neep.com.au>
References: <20020327151405.2397A482F@dsl2.external.hp.com> <Pine.LNX.4.33.0203272123310.1463-100000@lewis.et.byu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0203272123310.1463-100000@lewis.et.byu.edu>; from davidd@et.byu.edu on Wed, Mar 27, 2002 at 09:27:11PM -0700
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

Quoth David Dougall:
> PS: is there any hope of a jre on parisc-linux?

I would say definitely, after this recent press release from the Apache
Software Foundation:

  http://www.apache.org/foundation/news.html

(linking to)

  http://www1.internetwire.com/iwire/release_html_b1?release_id=39838

"ASF reaches agreement with Sun Microsystems to allow open source Java
implementations."

What I _think_ this means (after reading through the full article) is
that we're going to see fully open, 100%-approved Java implementations
running natively in Linux and other alternative operating systems in the
near future.  I don't know what the current issues (if any) are with
building the jdk1.1 or jdk1.2 packages under linux-hppa, but I would
hope that following this announcement HP will (somehow) be able to
assist in getting a production-ready JRE into linux-hppa.

(Caveat: I could have this all wrong of course.)

Once HPUX binary compatibility is working properly the HPUX JRE could
probably be used as well, but if there's a comparable native solution I
don't know if many people will go to that effort.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
