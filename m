Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8B2D4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Feb 2003 05:20:57 -0700 (MST)
Received: from esvir03nok.nokia.com (esvir03nokt.ntc.nokia.com [172.21.143.35])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h16CNam24188
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Feb 2003 14:23:36 +0200 (EET)
Date: Thu, 6 Feb 2003 14:20:53 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ksoftirqd in 2.4.20-pa23
Message-ID: <20030206122053.GX7503@aurinko.ntc.nokia.com>
References: <20030206102122.GW7503@aurinko.ntc.nokia.com> <9A2A64BE-39C6-11D7-8ABC-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <9A2A64BE-39C6-11D7-8ABC-0030656F07A2@esiee.fr>
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

On Thu, Feb 06, 2003 at 12:31:58PM +0100, ext Thibaut VARENE wrote:
> parisc-linux.org/faq

Well, duh, too long since I updated my local copy of that, it seems.

OK - the box doesn't have the physical HIL port anyway... do I need newer 
tools or can I rebuild the kernel with the Debian packaged tools, and can 
I expect it to work without HIL support (on a C240)? Already pulled 
/cvs/linux-2.4.20-pa23.tar.gz ... 

> On jeudi, fév 6, 2003, at 11:21 Europe/Paris, Nahkola Mikko wrote:
> >Why is ksoftirqd_CPU0 taking almost all the free CPU time? Sure, it's
> >nice 19, but still... and I don't remember having that on 2.4.18 nor on


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
