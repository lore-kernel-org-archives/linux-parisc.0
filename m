Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DC24482A
	for <parisc-linux@parisc-linux.org>; Thu, 28 Mar 2002 10:17:20 -0700 (MST)
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building cvs 2.4.18 
In-Reply-To: Message from Andrew Shugg <andrew@neep.com.au>
   of "Thu, 28 Mar 2002 18:13:25 +0800." <20020328181323.A6833@neep.com.au>
References: <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com> <jeremyd@apptechsys.com> <20020326063217.50AB1482C@dsl2.external.hp.com> <20020327220901.A315@neep.com.au> <andrew@neep.com.au> <20020328070207.990A8482A@dsl2.external.hp.com>  <20020328181323.A6833@neep.com.au> 
Date: Thu, 28 Mar 2002 10:17:20 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020328171720.8DC24482A@dsl2.external.hp.com>
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

Andrew Shugg wrote:
> I assume you mean c3000/firewall ?

No. I really meant lxr8000:
grundler <503>ls -l kernels/*/firewall
-rwxr-xr-x    1 grundler users        4912 Jan  1 21:39 kernels/a500/firewall*
-rwxr-xr-x    1 grundler users        4950 Mar 27 23:01 kernels/lxr8000/firewall*
-rwxr-xr-x    1 grundler users        5096 Jan 12 22:03 kernels/ob500/firewall*

I basically run the same firewall on all three machines with localized tweaks.


> Thanks, always interested to see how other people approach firewalling.

agreed - but this isn't just my own personal creatation. I've gotten
input from other folks who actaully know what they are doing.
(thanks to neuro, rbrad, lamont, et al).

grant
