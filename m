Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christian Suder <csuder@cisco.com>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] [Q] on EISA support 
In-Reply-To: Message from Christian Suder <csuder@cisco.com>
   of "Thu, 27 Dec 2001 10:49:58 PST." <3C2B6D56.1000507@cisco.com>
References: <4.3.2.7.2.20011227103742.02a018e8@mira-sjc5-9.cisco.com>  <3C2B6D56.1000507@cisco.com> 
Date: Thu, 27 Dec 2001 12:59:30 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011227195930.446D54861@dsl2.external.hp.com>
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

Christian Suder wrote:
> the entry is in the .config file. I'll try -pa27 later, there seem to be 
> some issues with the -pa25 in general,

Yes - I broke dino (PCI) support in -pa25 when I re-enabled c3000 machines.
I might have also broke EISA support but don't think so.
Thomas fixed that in -pa26 (or pa27?).
Go back to -pa24 or forward to the latest.
parisc-linux-cvs mail archives might tell you what you want to know.

grant
