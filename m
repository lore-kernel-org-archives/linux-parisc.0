Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD9055A1C.dip.t-dialin.net [217.5.90.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94A58482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 05:42:09 -0700 (MST)
Subject: Re: [parisc-linux] Problem with threads..
From: andi <andi@fischlustig.de>
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20011229012436.4586cb54.csuder@cisco.com>
References: <20011229012436.4586cb54.csuder@cisco.com>
Date: 29 Dec 2001 13:42:17 +0100
Message-Id: <1009629737.2955.3.camel@cube>
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

On Sat, 2001-12-29 at 10:24, Christian Suder wrote:
> Hello,
> 
> the pan newsreader does not want to work on parisc platforms (neither the ones from the debian archive nor a version compiled from scratch). Digging a little bit I found the application hangs at pthread_mutex_lock and similar calls. Tried with various kernel versions over the last couple of months, never worked. Known issue ?

I can confirm the problem here on my 712/60. DirectFB (www.directfb.org)
does not work either and hangs during first pthread_mutex_lock().

andi
