Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Java and SSH 
In-Reply-To: Message from "marc " <marc@centraltx.com>
   of "Wed, 29 May 2002 11:04:58 CDT." <200205291104.AA315359834@mail.centraltx.com>
References: <200205291104.AA315359834@mail.centraltx.com> 
Date: Wed, 29 May 2002 14:13:34 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020529201334.8C23C482A@dsl2.external.hp.com>
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
> `apt-cache search ssh` returns nothing.
> Any other ideas?

verify you have non-us in your /etc/apt/sources.list.
Something like:
deb http://non-us.debian.org/debian-non-US unstable/non-US main contrib non-free


grundler <515>dpkg -l ssh
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  ssh            3.0.2p1-9      Secure rlogin/rsh/rcp replacement (OpenSSH)


grant
