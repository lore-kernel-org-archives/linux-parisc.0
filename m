Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Dark Fiber <dfiber@mega-tokyo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] netbooting kernel 
In-Reply-To: Message from Dark Fiber <dfiber@mega-tokyo.com>
   of "Sat, 23 Mar 2002 23:21:44 GMT." <5.1.0.14.2.20020323231259.02e2cd68@mail.mega-tokyo.com>
References: <5.1.0.14.2.20020323231259.02e2cd68@mail.mega-tokyo.com> 
Date: Sat, 23 Mar 2002 20:50:57 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020324035057.6CE674837@dsl2.external.hp.com>
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

Dark Fiber wrote:
> i did a sea lan and get a p0 reference;
> P0     LAN.192.168.1.1.3.254    192.168.1.1   100/Full Dx
> 
> (192.168.1.1 being my router, .1.10 is my freebsd box).

You router is responding to the bootp query.
Is this the box that will provide the "LIF" image?

> doing a direct connect from my c200 to my pc (freebsd 4.5) and doing a
> "sea lan" gets no result.

Are you using a cross-over cable?
A regular LAN cable won't work for direct (point-to-point) connect.

grant
