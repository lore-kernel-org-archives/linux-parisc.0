Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD9001D8A.dip.t-dialin.net [217.0.29.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B5FA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 04:36:58 -0700 (MST)
Subject: Re: [parisc-linux] vmware question?
From: andi <andi@fischlustig.de>
To: chenhp@hpsgnsw.sgp.hp.com
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3C3F9C83.850FFD03@hpsgnsw.sgp.hp.com>
References: <3C3F9C83.850FFD03@hpsgnsw.sgp.hp.com>
Date: 11 Jan 2002 12:36:44 +0100
Message-Id: <1010749004.4093.2.camel@cube>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

On Sat, 2002-01-12 at 03:16, chenhp@hpsgnsw.sgp.hp.com wrote:
> Hi,
> I'm wondering to know if vmware can work on PA-Linux ?

no this cannot work since it runs only i386 code on i386. It does not
emulate a cpu. "bochs" however is a project that should run on pa-linux,
but it is awfully slow (unusable for me)

andi
