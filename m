Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org,
	grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] resolv.conf 
In-Reply-To: Message from "marc " <marc@centraltx.com>
   of "Sat, 07 Sep 2002 15:55:22 CDT." <200209071555.AA34406894@mail.centraltx.com>
References: <200209071555.AA34406894@mail.centraltx.com> 
Date: Sat, 07 Sep 2002 15:55:09 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020907215509.1B52A482A@dsl2.external.hp.com>
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

"marc " wrote:
> do I need to create a resolv.conf file? Sounds easy enough.

DHCP will normally do that for you.
If you are manually configuring NICs, then yes.
DHCP sets up my home system like this:

grundler@c3k:~$ cat /etc/resolv.conf
search attbi.com
nameserver 216.148.227.68
nameserver 204.127.202.4


grant
