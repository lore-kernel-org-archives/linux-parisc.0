Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (ns1.au.network4.net [203.25.143.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 297F3482A
	for <parisc-linux@parisc-linux.org>; Thu, 28 Mar 2002 03:13:32 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id SAA06892
	for parisc-linux@parisc-linux.org; Thu, 28 Mar 2002 18:13:29 +0800
Date: Thu, 28 Mar 2002 18:13:25 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building cvs 2.4.18
Message-ID: <20020328181323.A6833@neep.com.au>
References: <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com> <jeremyd@apptechsys.com> <20020326063217.50AB1482C@dsl2.external.hp.com> <20020327220901.A315@neep.com.au> <andrew@neep.com.au> <20020328070207.990A8482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020328070207.990A8482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Mar 28, 2002 at 12:02:07AM -0700
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

Quoth Grant Grundler:
> sorry - that should be kernels/a500/
> or kernels/lxr8000/firewall is a newer version of the same thing.

ncftp /kernels > dir */firewall
-r--r--r--   1 grundler ftpadmin       4912 Jan  2 05:57 a500/firewall
-rwxr-xr-x   1 grundler ftpadmin       5113 Mar 10 07:44 c3000/firewall


I assume you mean c3000/firewall ?

Thanks, always interested to see how other people approach firewalling.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
