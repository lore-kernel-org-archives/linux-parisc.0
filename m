Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (ns1.au.network4.net [203.25.143.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DB4D482A
	for <parisc-linux@parisc-linux.org>; Thu, 28 Mar 2002 18:08:45 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id JAA09612
	for parisc-linux@parisc-linux.org; Fri, 29 Mar 2002 09:08:26 +0800
Date: Fri, 29 Mar 2002 09:08:24 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building cvs 2.4.18
Message-ID: <20020329090821.R888@neep.com.au>
References: <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com> <jeremyd@apptechsys.com> <20020326063217.50AB1482C@dsl2.external.hp.com> <20020327220901.A315@neep.com.au> <andrew@neep.com.au> <20020328070207.990A8482A@dsl2.external.hp.com> <20020328181323.A6833@neep.com.au> <andrew@neep.com.au> <20020328171720.8DC24482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020328171720.8DC24482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Mar 28, 2002 at 10:17:20AM -0700
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
> Andrew Shugg wrote:
> > I assume you mean c3000/firewall ?
> 
> No. I really meant lxr8000:
> grundler <503>ls -l kernels/*/firewall
> -rwxr-xr-x    1 grundler users        4912 Jan  1 21:39 kernels/a500/firewall*
> -rwxr-xr-x    1 grundler users        4950 Mar 27 23:01 kernels/lxr8000/firewall*
> -rwxr-xr-x    1 grundler users        5096 Jan 12 22:03 kernels/ob500/firewall*

Okay.  I think we're not looking on the same systems, somehow.  =)

[guinness:~]$ !nc
ncftp ftp.parisc-linux.org
NcFTP 3.0.0 beta 14 (June 25, 1998) by Mike Gleason.
Connecting to 192.25.206.7...
ProFTPD 1.2.0pre10 Server (Debian) [dsl2.external.hp.com]
Welcome to the PA RISC/Linux project archive!

You appear to be anonymous@ns1.au.network4.net
The local time is: Thu Mar 28 18:03:06 2002

Please report any problems to ftpmaster@ftp.parisc-linux.org
Anonymous access granted, restrictions apply.
Logged in to ftp.parisc-linux.org.
ncftp / > dir kernels/*/firewall
-r--r--r--   1 grundler ftpadmin       4912 Jan  2 05:57 kernels/a500/firewall
-rwxr-xr-x   1 grundler ftpadmin       5113 Mar 10 07:44 kernels/c3000/firewall
ncftp / >

There's only the one ftp server, isn't there?

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
